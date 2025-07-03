import { useMemo, useRef, useState, useEffect } from 'react';
import Quill from 'quill';
import ReactQuill from 'react-quill-new';
import 'react-quill-new/dist/quill.snow.css';
import './ProductEnrollFormComponent.css';
import { ImageActions } from '@xeger/quill-image-actions';
import { ImageFormats } from '@xeger/quill-image-formats';
import axios from 'axios';
import $ from 'jquery';
import { useNavigate, useParams } from 'react-router-dom';
import DOMPurify from 'dompurify';
import React from 'react';


Quill.register('modules/imageActions', ImageActions);
Quill.register('modules/imageFormats', ImageFormats);

function ProductDetailComponent() {

  let productNo = useParams().productNo;

  const modules = {
    toolbar: [
      [{ 'font': [] }],
      [{ 'header': [1, 2, 3, 4, 5, 6, false] }],



      ['bold', 'italic', 'underline', 'strike', 'blockquote', 'code-block'],        // toggled buttons
      ['link', 'image'],

      [{ 'align': [] }, { 'color': [] }, { 'background': [] }],       // dropdown with defaults from theme

      [{ 'list': 'ordered' }, { 'list': 'bullet' }],
      [{ 'indent': '-1' }, { 'indent': '+1' }],          // outdent/indent

    ],
    ImageResize: {
      parchment: Quill.import('parchment')
    }
  }

  let navigate = useNavigate();

  const [productName, setProductName] = useState('');
  const [content, setContent] = useState('');
  const [productPrice, setProductPrice] = useState(0);
  const [productCategory, setProductCategory] = useState('남성');
  const [productStock, setProductStock] = useState(0);
  const [productSize, setProductSize] = useState('M');
  const [tag, setTag] = useState([]);
  const [productCaption, setProductCaption] = useState('');
  const [productSubTag, setProductSubTag] = useState([]);
  const [productTag, setProductTag] = useState('outer');

  const sizes = ['S', 'M', 'L'];
  const subTag = ['자켓', '셔츠', '조끼', '도포', '저고리', '드레스', '원피스', '악세사리', '크롭티', '시스루', '맨투맨'
    , '후드', '코트', '치마', '바지', '댕기', '부채', '키링', '그립톡', '목걸이', '팔찌', '반지'
    , '허리띠', '모던한복', '남녀공용', '데일리한복', '스트릿한복', '여름한복', '겨울한복', '사계절용'];

  const tagSelector = (e) => {
    setProductCategory(e.target.value);
  }

  // console.log(productSize)
  // console.log(content)
  const onChagecontent = (e) => {
    // console.log(e)
    setContent(e)

  }

  // src 추출
  const srcArray = []

  // 최종 src url 저장할 곳
  const urlArray = []

  const gainSource = /(<img[^>]*src\s*=\s*[\"']?([^>\"']+)[\"']?[^>]*>)/g

  async function SaveBoard() {

    while (gainSource.test(content)) {
      console.log("이미지 발견");
      let result = RegExp.$2;
      srcArray.push(result);
      console.log("srcArray 추가 : ", srcArray);

      // 새로 추가된 이미지(이미 base64 인코딩된 경우)
      if (result.startsWith("data:") && result.indexOf(",") !== -1) {
        const base64Str = result.split(",")[1];
        let byteString;
        try {
          byteString = atob(base64Str);
        } catch (e) {
          console.error("Base64 디코딩 오류: ", e);
          continue;
        }

        const ab = new ArrayBuffer(byteString.length);
        const ia = new Uint8Array(ab);
        for (let i = 0; i < byteString.length; i++) {
          ia[i] = byteString.charCodeAt(i);
        }

        const blob = new Blob([ia], { type: "image/jpeg" });
        const file = new File([blob], "image.jpg");
        const formData = new FormData();
        formData.append("file", file);
        console.log("formData: ", formData);

        let uploadUrl = "http://192.168.40.32:8100/soyo/product/fileUpload";

        await axios
          .post(uploadUrl, formData, {
            headers: {
              "content-type": "multipart/form-data",
              Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
          })
          .then((response) => {
            if (response.data.success) {
              console.log("이미지 업로드 성공", response.data);
              urlArray.push(response.data.url);
              console.log("urlArray 에 추가", urlArray);
            } else {
              console.log(response);
              alert("이미지 저장 실패");
            }
          });
        console.log("최종 formdata: ", formData);
      } else {
        // 기존 이미지인 경우, 그대로 urlArray에 추가
        console.log("기존 이미지 발견, 그대로 유지:", result);
        urlArray.push(result);
      }
    }


    let endContent = content;

    if (srcArray.length > 0) {
      console.log("실행은 됬는데..");
      for (let i = 0; i < srcArray.length; i++) {
        console.log("실행중" + i + "번째 실행");
        let replace = endContent.replace(srcArray[i], urlArray[i])
        endContent = replace
        console.log("바뀌었나 테스트 : ", endContent);
      }
    }
    console.log("endContent : ", endContent);


    const data = new FormData();


    let thumbnail = document.querySelector("#thumbnail");
    let subThumbnail = document.querySelector("#subThumbnail");
    data.append("productNo", productNo);
    data.append("productCaption", productCaption);
    data.append("productPrice", productPrice);
    data.append("productName", productName);
    data.append("productSubCaption", endContent);
    data.append("productStock", productStock);
    data.append("productSize", productSize);
    data.append("productCategory", productCategory);
    data.append("productTag", productTag)
    productSubTag.forEach((tag) => {
      data.append("productSubTag", tag);
    });

    thumbnail.files.length && data.append('thumbnail', thumbnail.files[0]);
    subThumbnail.files.length && data.append('subThumbnail', subThumbnail.files[0]);

    // console.log("최종본 : ", data);

    // console.log("이거이거", thumbnail.files.length)
    // console.log("productPrice", productPrice)
    // console.log("productName", productName)
    // console.log("productSubCaption", endContent)
    // console.log("productStock", productStock)
    // console.log("productSize", productSize)
    // console.log("productCategory", productCategory)
    // console.log("imageList", urlArray)
    // console.log("productTag", productTag);
    // console.log('subThumbnail', subThumbnail.files.length);
    // console.log("productSubTag", productSubTag);

    let url = "http://192.168.40.32:8100/soyo/product/update";
    axios({
      url,
      method: "post",
      data: data,
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
      }
    }).then((response) => {
      console.log(response.data);
      alert(response.data);
      navigate("/product/list");
    }).catch()

  } // 이미지 태그 반복문 종료


  // 이미지 썸네일용 함수(input 요소 가리기)
  useEffect(() => {
    $("#thumbnail").hide();
    $("#subThumbnail").hide();

    $("#product-thumbnail").off("click").on("click", () => {
      $("#thumbnail").click();
    });

    $("#product-subThumbnail").off("click").on("click", () => {
      $("#subThumbnail").click();
    })
    loadContent();
    tagfunc();

  }, [productSize, productSubTag]);

  const loadContent = () => {
    // 상품 정보 불러오기 함수
    let url = "http://192.168.40.32:8100/soyo/product/detail/" + productNo;
    axios({
      url,
      method: "get",
      headers: {
        Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
      }
    }).then((response) => {

      // console.log(response.data)
      setContent(response.data.result.productSubCaption);
      document.querySelector("#product-thumbnail").src = `http://192.168.40.32:8100/soyo/resources/product_upfile/${response.data.result.productChange}`;
      document.querySelector("#product-subThumbnail").src = `http://192.168.40.32:8100/soyo/resources/product_upfile/${response.data.result.productSubChange}`;
      setProductName(response.data.result.productName);
      setProductPrice(response.data.result.productPrice);
      setProductCategory(response.data.result.productCategory);
      setProductTag(response.data.result.productTag);
      setProductSubTag(response.data.list);
      setProductCaption(response.data.result.productCaption);


      // 사이즈별 재고를 불러오는 함수
      url = "http://192.168.40.32:8100/soyo/product/detail/size";
      axios({
        url,
        method: "get",
        params: {
          productNo,
          productSize
        },
        headers: {
          Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
        }
      }).then((response) => {
        // console.log(response.data.productStock);
        document.querySelector("#productStock").value = response.data.productStock;
      }).catch(() => {
        console.log("재고 수량 통신 실패");
      })

    }).catch();

  }


  // 이미지 미리보기용 스테이트 변수
  let [imgUrl, setImgUrl] = useState(null);
  let [subUrl, setSubUrl] = useState(null);

  //console.log(upfile.files.length);
  const loadImg = (e) => {
    // console.log(e.target.files[0].name)
    // 이미지 미리보기용 src 속성을 만드는 함수

    if (e.target.files[0] == null) {
      setImgUrl(null);
    } else {
      setImgUrl(URL.createObjectURL(e.target.files[0]));

    }
  }
  const loadSubImg = (e) => {
    // console.log(e.target.files[0].name)
    // 이미지 미리보기용 src 속성을 만드는 함수

    if (e.target.files[0] == null) {
      setSubUrl(null);
    } else {
      setSubUrl(URL.createObjectURL(e.target.files[0]));
    }
  }

  const tagfunc = () => {
    const tagLib = subTag.map((item, index) => {

      return (
        <label className="form-check-label" key={index}>
          <input type="checkbox" className="form-check-input" value={item}
            checked={productSubTag.includes(item)}
            onChange={subTagChange} />
          {item}
        </label>
      );
    })
    setTag(tagLib);
  };

  const subTagChange = (e) => {
    const val = e.target.value;
    if (e.target.checked == true) {
      setProductSubTag((pro) => [...pro, val]);
    } else {
      setProductSubTag((pro) => pro.filter((tag) => tag !== val))
    }
  }



  // ------------------------UI------------------------
  return (
    <div>
      <div>
        <div style={{ width: '100%', height: '90vh' }}>
          <div style={{ width: '1000px', margin: 'auto', borderRadius: '19px' }}>

            <h2>상품 상세 조회</h2>

            {/* ======== Subject ======== */}

            <div style={{ marginBottom: '20px', marginTop: '50px', fontSize: '20px', fontWeight: 'bold', display: 'flex', gap: '260px', marginLeft: '50px' }} >

              <span>상품 썸네일</span>
              <span>상품 서브썸네일</span>
            </div>
            <br />
            <input
              type="file"
              id="thumbnail"
              required
              onChange={(e) => { loadImg(e) }}>
            </input>

            <input
              type="file"
              id="subThumbnail"
              required
              onChange={(e) => { loadSubImg(e) }}>
            </input>
          </div>



          <div>
            <div className="product-container" style={{ position: "relative" }}>
              <div className="row" id="product-form">
                <div id="product-img-form">
                  <img src={imgUrl} width="300" height="400" id="product-thumbnail" border="1px solid lightGray" />
                  <img src={subUrl} width="300" height="400" id="product-subThumbnail" border="1px solid lightGray" />
                </div>
                <div className="col s12 m6">
                  <select id="selectTag" style={{ width: "30%", height: "40px" }}
                    value={productCategory}
                    onChange={(e) => { tagSelector(e) }}>
                    <option value="남성">남성</option>
                    <option value="여성">여성</option>
                    <option value="아동">아동</option>
                    <option value="악세사리">악세사리</option>
                  </select>

                  <br /><br />

                  <input
                    className="Subject"
                    placeholder="상품명을 입력해 주세요"
                    style={{ padding: '7px', marginBottom: '10px', width: '100%', height: "60px", border: '1px solid lightGray', fontSize: '24px' }}
                    required
                    id="productName"
                    value={productName}
                    onChange={(e) => { setProductName(e.target.value) }}
                  ></input>

                  <br />
                  <input
                    className="price"
                    placeholder="가격을 입력하세요"
                    style={{ padding: '7px', marginBottom: '10px', width: '50%', heigth: "50px", border: '1px solid lightGray', fontSize: '15px' }}
                    onChange={(e) => { setProductPrice(e.target.value) }}
                    required
                    value={productPrice}
                    id="productPrice"
                    type="number"
                    min="0"
                    step="100"
                  >
                  </input>

                  <div id="tag-area">
                    <div id="tag-01-area">
                      <select id="tag-01" onChange={(e) => { setProductTag(e.target.value) }}
                        value={productTag}>
                        <option value="outer">외투</option>
                        <option value="top">상의</option>
                        <option value="bottom">하의</option>
                        <option value="acc">패션잡화</option>
                      </select>
                    </div>

                    <div id="tag-02-area">
                      {tag}

                    </div>
                  </div>


                  <hr />

                  <div className="size-selector">
                    <div className="size-selector-row">
                      <h6 style={{ marginBottom: "15px" }}>&nbsp;&nbsp;사이즈 선택</h6>
                    </div>
                    {sizes.map(size => (
                      <button
                        key={size}
                        className={`size-btn ${productSize === size ? 'active' : ''}`}
                        onClick={() => { setProductSize(size) }}
                        data-size={size}>
                        {size}
                      </button>
                    ))}
                  </div>

                  <hr />

                  <div className="quantity-selector">
                    <span className="quantity-label">재고 수량</span>
                  </div>

                  <input
                    type="number"
                    className="count"
                    placeholder="재고가 없습니다."
                    required
                    min="0"
                    id="productStock"
                    style={{ padding: '7px', marginBottom: '10px', width: '50%', border: '1px solid lightGray', fontSize: '15px' }}
                    onChange={(e) => { setProductStock(e.target.value) }}
                  >
                  </input>

                </div>
              </div>
            </div>
          </div>

          <br />

          <div align="center">
            <input id="product-caption" type="text" placeholder="주 내용을 입력하세요"
              value={productCaption}
              onChange={(e) => { setProductCaption(e.target.value) }} />
          </div>

          <br />

          <div style={{ height: '650px' }}>

            {/* ======== Quill ======== */}

            <ReactQuill
              modules={modules}
              value={content}
              placeholder='상품 상세 설명을 입력하세요'
              onChange={onChagecontent}
              style={{ height: "600px" }}

            />
          </div>

          {/* ======== Button ======== */}

          <div style={{ float: 'right' }}>
            <button style={{ marginRight: '10px' }}
              onClick={() => { navigate("/product/list") }}
            >취소
            </button>
            <button
              onClick={() => {
                SaveBoard()
              }}
            >수정하기</button>
          </div>
        </div>
      </div>
    </div>
  )




}

export default ProductDetailComponent;
