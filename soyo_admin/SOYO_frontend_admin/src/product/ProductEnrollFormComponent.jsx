import React, { useState, useEffect, useRef } from 'react';
import Quill from 'quill';
import ReactQuill from 'react-quill-new';
import 'react-quill-new/dist/quill.snow.css';
import './ProductEnrollFormComponent.css';
import ImageResize from 'quill-image-resize';
import { ImageActions } from '@xeger/quill-image-actions';
import { ImageFormats } from '@xeger/quill-image-formats';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

Quill.register('modules/ImageResize', ImageResize);
Quill.register('modules/imageActions', ImageActions);
Quill.register('modules/imageFormats', ImageFormats);

function ProductEnrollFormComponent() {
  const modules = {
    toolbar: [
      [{ 'font': [] }],
      [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
      ['bold', 'italic', 'underline', 'strike', 'blockquote', 'code-block'],
      ['link', 'image'],
      [{ 'align': [] }, { 'color': [] }, { 'background': [] }],
      [{ 'list': 'ordered' }, { 'list': 'bullet' }],
      [{ 'indent': '-1' }, { 'indent': '+1' }],
    ],
    ImageResize: {
      parchment: Quill.import('parchment')
    }
  };

  const navigate = useNavigate();
  const thumbnailRef = useRef(null);
  const subThumbnailRef = useRef(null);

  const [product, setProduct] = useState({
    name: '',
    price: 0,
    category: '남성',
    stock: 0,
    size: 'M',
    caption: '',
    tag: 'outer'
  });
  const [content, setContent] = useState('');
  const [productSubTag, setProductSubTag] = useState([]);
  const [imgUrl, setImgUrl] = useState(null);
  const [subUrl, setSubUrl] = useState(null);

  const sizes = ['S', 'M', 'L'];
  const subTag = ['자켓', '셔츠', '조끼', '도포', '저고리', '드레스', '원피스', '악세사리', '크롭티', '시스루', '맨투맨'
    , '후드', '코트', '치마', '바지', '댕기', '부채', '키링', '그립톡', '목걸이', '팔찌', '반지'
    , '허리띠', '모던한복', '남녀공용', '데일리한복', '스트릿한복', '여름한복', '겨울한복', '사계절용'];

  const handleProductChange = (e) => {
    const { name, value } = e.target;
    setProduct(prev => ({ ...prev, [name]: value }));
  };
  
  const handleSizeChange = (size) => {
    setProduct(prev => ({ ...prev, size: size }));
  };

  const onChagecontent = (value) => {
    setContent(value);
  };

  const subTagChange = (e) => {
    const { value, checked } = e.target;
    if (checked) {
      setProductSubTag(prev => [...prev, value]);
    } else {
      setProductSubTag(prev => prev.filter(tag => tag !== value));
    }
  };

  async function SaveBoard() {
    const srcArray = [];
    const urlArray = [];
    const gainSource = /(<img[^>]*src\s*=\s*["']?([^>"']+)["']?[^>]*>)/g;
    let match;

    while ((match = gainSource.exec(content)) !== null) {
        const base64Src = match[2];
        if (!base64Src.startsWith('data:image')) continue;

        srcArray.push(base64Src);
        
        const byteString = atob(base64Src.split(",")[1]);
        const ab = new ArrayBuffer(byteString.length);
        const ia = new Uint8Array(ab);
        for (let i = 0; i < byteString.length; i++) {
            ia[i] = byteString.charCodeAt(i);
        }
        const blob = new Blob([ia], { type: "image/jpeg" });
        const file = new File([blob], `image_${Date.now()}.jpg`);
        
        const formData = new FormData();
        formData.append("file", file);

        try {
            const response = await axios.post(
                "http://192.168.40.32:8100/soyo/product/fileUpload",
                formData,
                {
                    headers: {
                        'content-type': 'multipart/form-data',
                        Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
                    }
                }
            );
            if (response.data.success) {
                urlArray.push(response.data.url);
            } else {
                alert("이미지 저장 실패");
                return; 
            }
        } catch (error) {
            console.error("Image upload failed:", error);
            alert("이미지 업로드 중 오류가 발생했습니다.");
            return;
        }
    }

    let endContent = content;
    srcArray.forEach((src, i) => {
        endContent = endContent.replace(src, urlArray[i]);
    });

    const data = new FormData();
    data.append("productCaption", product.caption);
    data.append("productPrice", product.price);
    data.append("productName", product.name);
    data.append("productSubCaption", endContent);
    data.append("productStock", product.stock);
    data.append("productSize", product.size);
    data.append("productCategory", product.category);
    data.append("productTag", product.tag);
    productSubTag.forEach(tag => data.append("productSubTag", tag));
    urlArray.forEach(url => data.append("imageList", url));

    if (thumbnailRef.current.files[0]) {
        data.append("thumbnail", thumbnailRef.current.files[0]);
    }
    if (subThumbnailRef.current.files[0]) {
        data.append("subThumbnail", subThumbnailRef.current.files[0]);
    }

    try {
        const response = await axios.post(
            "http://192.168.40.32:8100/soyo/product/enrollForm",
            data,
            {
                headers: {
                    Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
                }
            }
        );
        alert(response.data);
        navigate("/product/list");
    } catch (error) {
        console.error("Form submission failed:", error);
        alert("상품 등록 중 오류가 발생했습니다.");
    }
  }

  const loadImg = (e) => {
    if (e.target.files && e.target.files[0]) {
      setImgUrl(URL.createObjectURL(e.target.files[0]));
    } else {
      setImgUrl(null);
    }
  };

  const loadSubImg = (e) => {
    if (e.target.files && e.target.files[0]) {
      setSubUrl(URL.createObjectURL(e.target.files[0]));
    } else {
      setSubUrl(null);
    }
  };

  return (
    <div>
      <div className="product-enroll-form-container">
        <div className="form-wrapper">
          <h2>상품 등록</h2>
          <div className="thumbnail-header">
            <span>상품 썸네일</span>
            <span>상품 서브썸네일</span>
          </div>
          <br />
          <input
            type="file"
            ref={thumbnailRef}
            required
            onChange={loadImg}
            style={{ display: 'none' }}
          />
          <input
            type="file"
            ref={subThumbnailRef}
            required
            onChange={loadSubImg}
            style={{ display: 'none' }}
          />
          <div>
            <div className="product-container">
              <div className="row" id="product-form">
                <div id="product-img-form">
                  <img src={imgUrl} width="300" height="400" id="product-thumbnail" alt="Thumbnail Preview" onClick={() => thumbnailRef.current.click()} />
                  <img src={subUrl} width="300" height="400" id="product-subThumbnail" alt="Sub-thumbnail Preview" onClick={() => subThumbnailRef.current.click()} />
                </div>
                <div className="col s12 m6">
                  <select name="category" value={product.category} onChange={handleProductChange} style={{ width: "30%", height: "40px" }}>
                    <option value="남성">남성</option>
                    <option value="여성">여성</option>
                    <option value="아동">아동</option>
                    <option value="악세사리">악세사리</option>
                  </select>
                  <br /><br />
                  <input
                    name="name"
                    className="Subject"
                    placeholder="상품명을 입력해 주세요"
                    required
                    onChange={handleProductChange}
                    value={product.name}
                  />
                  <br />
                  <input
                    name="price"
                    className="price"
                    placeholder="가격을 입력하세요"
                    required
                    type="number"
                    min="0"
                    step="100"
                    onChange={handleProductChange}
                    value={product.price}
                  />
                  <div id="tag-area">
                    <div id="tag-01-area">
                      <select name="tag" value={product.tag} onChange={handleProductChange}>
                        <option value="outer">외투</option>
                        <option value="top">상의</option>
                        <option value="bottom">하의</option>
                        <option value="acc">패션잡화</option>
                      </select>
                    </div>
                    <div id="tag-02-area">
                      {subTag.map((item, index) => (
                        <label className="form-check-label" key={index}>
                          <input type="checkbox" className="form-check-input" value={item} onChange={subTagChange} />
                          {item}
                        </label>
                      ))}
                    </div>
                  </div>
                  <hr />
                  <div className="size-selector">
                    <h6>&nbsp;&nbsp;사이즈 선택</h6>
                    {sizes.map(size => (
                      <button
                        key={size}
                        className={`size-btn ${product.size === size ? 'active' : ''}`}
                        onClick={() => handleSizeChange(size)}
                        type="button"
                      >
                        {size}
                      </button>
                    ))}
                  </div>
                  <hr />
                  <div className="quantity-selector">
                    <span className="quantity-label">재고 수량</span>
                  </div>
                  <input
                    name="stock"
                    type="number"
                    className="count"
                    placeholder="재고 수량을 입력해주세요"
                    required
                    min="0"
                    onChange={handleProductChange}
                    value={product.stock}
                  />
                </div>
              </div>
            </div>
          </div>
          <br />
          <div align="center">
            <input 
              name="caption" 
              id="product-caption" 
              type="text" 
              placeholder="주 내용을 입력하세요" 
              onChange={handleProductChange} 
              value={product.caption}
            />
          </div>
          <br />
          <div style={{ height: '1100px' }}>
            <ReactQuill
              modules={modules}
              placeholder='상품 상세 설명을 입력하세요'
              onChange={onChagecontent}
              style={{ height: "1000px" }}
            />
          </div>
          <div className="form-buttons">
            <button type="button" onClick={() => navigate("/product/list")}>
              취소
            </button>
            <button type="button" onClick={SaveBoard}>
              저장하기
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default ProductEnrollFormComponent;
