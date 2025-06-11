import { useMemo, useRef, useState, useEffect } from 'react';
import Quill from 'quill';
import ReactQuill from 'react-quill-new';
import 'react-quill-new/dist/quill.snow.css';
import './ProductEnrollFormComponent.css';
import ImageResize from 'quill-image-resize';
import { ImageActions } from '@xeger/quill-image-actions';
import { ImageFormats } from '@xeger/quill-image-formats';
import axios from 'axios';
import $ from 'jquery';

Quill.register('modules/ImageResize', ImageResize);
Quill.register('modules/imageActions', ImageActions);
Quill.register('modules/imageFormats', ImageFormats);

function ProductEnrollFormComponent() {
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


  const [productName, setProductName] = useState('');
  const [content, setContent] = useState('');
  const [productPrice, setProductPrice] = useState(0);
  const [productCategory, setProductCategory] = useState('');
  const [productCaption, setProductCaption] = useState('');
  const [productStock, setProductStock] = useState(0);

  const onChagecontent = (e) => {
    console.log(e)
    setContent(e)


  }

  // src 추출
  const srcArray = []

  // 최종 src url 저장할 곳
  const urlArray = []

  const gainSource = /(<img[^>]*src\s*=\s*[\"']?([^>\"']+)[\"']?[^>]*>)/g


  async function SaveBoard() {

    while (gainSource.test(content)) {
      console.log("이미지 있을때");
      let result = RegExp.$2;
      srcArray.push(result)
      console.log("srcArray 추가 : ", srcArray);

      const byteString = atob(result.split(",")[1]);

      const ab = new ArrayBuffer(byteString.length);
      const ia = new Uint8Array(ab);
      for (let i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
      }

      const blob = new Blob([ia], {
        type: "image/jpeg"
      });
      const file = new File([blob], "image.jpg");

      const formData = new FormData();
      formData.append("file", file);
      console.log('formData : ', formData);

      let url = "http://localhost:8100/soyo/product/fileUpload";

      await axios.post(
        url, formData,
        { headers: { 'content-type': 'multipart/form-data' } }
      ).then((response) => {
        if (response.data.success) {
          console.log("이미지 업로드 성공", response.data);
          urlArray.push(response.data.url);
          console.log("urlArray 에 추가", urlArray);
        } else {
          console.log(response);
          alert("이미지 저장 실패");
        }

      })
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

    let writeInform = {
      productPrice : productPrice,
      productName : productName,
      productSubCaption : endContent,
      imgList : urlArray,
      productStock : productStock
    }
    console.log(writeInform);

    let url = "http://localhost:8100/soyo/product/enrollForm"
    axios.post(url, writeInform).then((response) => {
      if (response.data.success) {
        console.log("업로드 성공");
        console.log("저장한 데이터 : ", response);

      } else {
        alert("업로드 실패");
      }
    })

  }

  // 이미지 썸네일용 함수(input 요소 가리기)
  useEffect(() => {
    $("#imgFile").hide();
    $("#product-thumbnail").off("click").on("click", () => {
      $("#imgFile").click();
    });
  }, [])

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


  const sizeBtns = document.querySelectorAll('.size-btn');
  sizeBtns.forEach(btn => {
    btn.addEventListener('click', function () {
      sizeBtns.forEach(b => b.classList.remove('active'));
      this.classList.add('active');
    });

  });



  // ------------------------UI------------------------
  return (
    <div>
      <div>
        <div style={{ width: '100%', height: '90vh' }}>
          <div style={{ width: '1000px', margin: 'auto', borderRadius: '19px' }}>

            <h2>상품 등록</h2>

            {/* ======== Subject ======== */}

            <div style={{ marginBottom: '20px', marginTop: '50px', fontSize: '20px', fontWeight: 'bold' }} >상품 썸네일</div>
            <div>
            </div>
            <br />
            <input
              type="file"
              id="imgFile"
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
                  <select id="selectTag" style={{ width: "30%", height: "40px" }}>
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
                    onChange={(e) => { setProductName(e.target.value) }}
                  ></input>

                  <br />
                  <input
                    className="price"
                    placeholder="가격을 입력하세요"
                    style={{ padding: '7px', marginBottom: '10px', width: '50%', heigth: "50px", border: '1px solid lightGray', fontSize: '15px' }}
                    onChange={(e) => { setProductPrice(e.target.value) }}
                    required
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
                    <button className="size-btn" data-size="S">S</button>
                    <button className="size-btn" data-size="M">M</button>
                    <button className="size-btn" data-size="L">L</button>
                  </div>

                  <hr />

                  <div className="quantity-selector">
                    <span className="quantity-label">재고 수량</span>
                  </div>

                  <input
                    type="number"
                    className="count"
                    placeholder="재고 수량을 입력해주세요"
                    required
                    min="0"
                    style={{ padding: '7px', marginBottom: '10px', width: '50%', border: '1px solid lightGray', fontSize: '15px' }}
                    onChange={(e) => {setProductStock(e.target.value)}}
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
              placeholder='상품 상세 설명을 입력하세요'
              onChange={onChagecontent}
              style={{ height: "600px" }}
            />
          </div>

          {/* ======== Button ======== */}

          <div style={{ float: 'right' }}>
            <button style={{ marginRight: '10px' }} >취소</button>
            <button
              onClick={() => {
                SaveBoard()
              }}
            >저장하기</button>
          </div>
        </div>
      </div>
    </div>
  )




}

export default ProductEnrollFormComponent;