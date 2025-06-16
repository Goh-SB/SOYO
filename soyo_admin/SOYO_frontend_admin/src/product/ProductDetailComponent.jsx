import { useMemo, useRef, useState, useEffect } from 'react';
import Quill from 'quill';
import ReactQuill from 'react-quill-new';
import 'react-quill-new/dist/quill.snow.css';
import './ProductEnrollFormComponent.css';
import { ImageActions } from '@xeger/quill-image-actions';
import { ImageFormats } from '@xeger/quill-image-formats';
import axios from 'axios';
import $ from 'jquery';
import { useNavigate,useParams } from 'react-router-dom';
import DOMPurify from 'dompurify';

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

  const sizes = ['S', 'M', 'L'];

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

    let uploadUrl = "http://localhost:8100/soyo/product/fileUpload";

    await axios
      .post(uploadUrl, formData, {
        headers: { "content-type": "multipart/form-data" },
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
    console.log("이거이거", thumbnail.files.length)
    console.log("productPrice", productPrice)
    console.log("productName", productName)
    console.log("productSubCaption", endContent)
    console.log("productStock", productStock)
    console.log("productSize", productSize)
    console.log("productCategory", productCategory)
    console.log("imageList", urlArray)

    data.append("productNo", productNo);
    data.append("productPrice", productPrice);
    data.append("productName", productName);
    data.append("productSubCaption", endContent);
    data.append("productStock", productStock);
    data.append("productSize", productSize);
    data.append("productCategory", productCategory);
    if (thumbnail.files.length > 0) {
      data.append("thumbnail", thumbnail.files[0]);
    }
    urlArray.forEach(url => {
      data.append("imageList", url);
    });


    console.log("최종본 : ", data);

    let url = "http://localhost:8100/soyo/product/update";
    axios({
      url,
      method : "post",
      data : data
    }).then((response) => {
      console.log(response.data);
      alert(response.data);
      navigate("/product/list");
    }).catch()




  } // 이미지 태그 반복문 종료




  // 이미지 썸네일용 함수(input 요소 가리기)
  useEffect(() => {
    $("#thumbnail").hide();
    $("#product-thumbnail").off("click").on("click", () => {
      $("#thumbnail").click();
    });

    // 상품 정보 불러오기 함수
    let url = "http://localhost:8100/soyo/product/detail/" + productNo;
    axios({
        url,
        method : "get"
    }).then((response) => {

         // console.log(response.data)
            setContent(response.data.productSubCaption);
            document.querySelector("#product-thumbnail").src = `http://localhost:8100/soyo/resources/product_upfile/${response.data.productChange}`;
            setProductName(response.data.productName);
            setProductPrice(response.data.productPrice);
            setProductCategory(response.data.productCategory);

            // 사이즈별 재고를 불러오는 함수
            url = "http://localhost:8100/soyo/product/detail/size";
            axios({
              url,
              method : "get",
              params : {
                productNo,
                productSize

              } 
            }).then((response) => {
              // console.log(response.data.productStock);
              document.querySelector("#productStock").value = response.data.productStock;
            }).catch(() => {
              console.log("재고 수량 통신 실패");
            })
        
    }).catch();


  }, [productSize])

  // 이미지 미리보기용 스테이트 변수
  let [imgUrl, setImgUrl] = useState(null);
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





  // ------------------------UI------------------------
  return (
    <div>
      <div>
        <div style={{ width: '100%', height: '90vh' }}>
          <div style={{ width: '1000px', margin: 'auto', borderRadius: '19px' }}>

            <h2>상품 상세 조회</h2>

            {/* ======== Subject ======== */}

            <div style={{ marginBottom: '20px', marginTop: '50px', fontSize: '20px', fontWeight: 'bold' }} >상품 썸네일</div>
            <div>
            </div>
            <br />
            <input
              type="file"
              id="thumbnail"
              required
              onChange={(e) => { loadImg(e) }}>
            </input>
          </div>



          <div className="container">
            <div className="product-container" style={{ position: "relative" }}>
              <div className="row">
                <div className="col s12 m6">
                  <img src={imgUrl} width="400" height="400" id="product-thumbnail" border="1px solid lightGray" />
                </div>
                <div className="col s12 m6">
                  <select id="selectTag" style={{ width: "30%", height: "40px" }}
                    value={productCategory}
                    onChange={(e) => { tagSelector(e)  }}>
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

                  <div>
                    <select id="">
                      <option value=""></option>
                    </select>
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
            onClick={ () => {navigate("/product/list")}} 
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
