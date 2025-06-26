<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOYO AI - 상품 추천</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    @font-face {
        font-family: 'NEXON Lv2 Gothic';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

  body {
    font-family: 'Roboto', 'Noto Sans KR', sans-serif;
    background: linear-gradient(135deg, #e3f0ff 0%, #f9f9f9 100%);
    margin: 0;
    padding: 0;
    min-height: 100vh;
  }
  
  .container {
    max-width: 750px;
    margin: 48px auto;
    margin-top: 150px;
    margin-bottom: 80px;
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 8px 32px 0 rgba(60, 80, 180, 0.10), 0 1.5px 6px 0 rgba(60, 80, 180, 0.08);
    padding: 40px 32px 32px 32px;
    display: flex;
    flex-direction: column;
    align-items: center;
    transition: box-shadow 0.2s;
  }
  .container:hover {
    box-shadow: 0 12px 40px 0 rgba(60, 80, 180, 0.16), 0 2px 8px 0 rgba(60, 80, 180, 0.10);
  }
  h2 {
    text-align: center;
    color: #2d3a5a;
    font-weight: 700;
    margin-top: 10px;
    margin-bottom: 18px;
    letter-spacing: 1px;
    font-family: 'NEXON Lv2 Gothic';
  }
  .tags {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    grid-template-rows: repeat(6, auto);
    gap: 12px 10px;
    margin-bottom: 18px;
    justify-items: center;
    align-items: center;
  }
  .tags label {
    width: 100%;
    min-width: 120px;
    max-width: 100%;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    background: #f5f7fa;
    border-radius: 22px;
    padding: 7px 0;
    cursor: pointer;
    font-size: 1em;
    color: #3a4a6b;
    box-shadow: 0 1px 2px rgba(60, 80, 180, 0.04);
    transition: background 0.2s, color 0.2s;
    border: 1.5px solid #e3eafc;
    margin: 0;
    white-space: normal;
    overflow: visible;
    text-overflow: unset;
    word-break: keep-all;
  }
  .tags input[type="checkbox"] {
    margin-right: 9px;
    accent-color: #4a90e2;
  }
  .tags label:hover, .tags input[type="checkbox"]:checked + label {
    background: #e3f0ff;
    color: #1976d2;
    border-color: #b6d0f7;
  }
  .ai-input {
    width: 100%;
    margin-bottom: 18px;
  }
  #aiText {
    width: 100%;
    padding: 13px 16px;
    border-radius: 8px;
    border: 1.5px solid #e3eafc;
    margin-top: 10px;
    font-size: 1.08em;
    background: #f5f7fa;
    transition: border 0.2s;
    outline: none;
    box-sizing: border-box;
  }
  #aiText:focus {
    border-color: #4a90e2;
    background: #e3f0ff;
  }
  #recommendBtn {
    width: 100%;
    background: linear-gradient(90deg, #1976d2 0%, #64b5f6 100%);
    color: #fff;
    border: none;
    border-radius: 8px;
    padding: 15px 0;
    font-size: 1.15em;
    font-weight: 500;
    cursor: pointer;
    margin-bottom: 18px;
    box-shadow: 0 2px 8px 0 rgba(60, 80, 180, 0.08);
    letter-spacing: 1px;
    transition: background 0.2s, box-shadow 0.2s;
  }
  #recommendBtn:hover {
    background: linear-gradient(90deg, #1565c0 0%, #42a5f5 100%);
    box-shadow: 0 4px 16px 0 rgba(60, 80, 180, 0.13);
  }
  #recommendResult {
    display: none;
  }
  
  .ai-modal-bg {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0; top: 0; right: 0; bottom: 0;
    width: 100vw; height: 100vh;
    background: rgba(44, 62, 80, 0.25);
    justify-content: center;
    align-items: center;
    transition: background 0.2s;
  }
  .ai-modal-bg.active {
    display: flex !important;
    outline: 4px solid #1976d2;
  }
  .ai-modal {
    display: flex !important;
    padding: 20px 20px 20px 20px !important;
    flex-direction: column !important;
    align-items: center !important;
    justify-content: flex-start !important;
    background: #fff !important;
    border: 3px solid #1976d2 !important;
    min-width: 600px !important;
    min-height: 200px !important;
    color: #000 !important;
    z-index: 2000 !important;
    position: relative !important;
    box-shadow: 0 8px 32px 0 rgba(60, 80, 180, 0.25) !important;
    max-height: none !important;
    overflow: visible !important;
  }
  .ai-modalContent-scroll {
    max-height: 70vh;
    overflow-y: auto;
    width: 100%;
  }
  @keyframes modalPop {
    0% { transform: scale(0.92); opacity: 0; }
    100% { transform: scale(1); opacity: 1; }
  }
  .modal-close {
    position: absolute;
    top: 16px; right: 20px !important;
    background: none;
    border: none;
    font-size: 2.5em;
    color: #888;
    cursor: pointer;
    transition: color 0.2s;
    z-index: 10;
  }
  .modal-close:hover {
    color: #1976d2;
  }
  @media (max-width: 600px) {
    .container {
      max-width: 98vw;
      padding: 18px 4vw 24px 4vw;
    }
    .tags {
      grid-template-columns: repeat(3, 1fr);
      grid-template-rows: repeat(10, auto);
      gap: 10px 6px;
    }
    .tags label {
      width: 100%;
      min-width: 0;
      max-width: 100%;
      height: 40px;
      font-size: 0.98em;
      padding: 6px 0;
      display: flex;
      align-items: center;
      justify-content: center;
      white-space: normal;
      overflow: visible;
      text-overflow: unset;
      word-break: keep-all;
    }
    #recommendBtn {
      font-size: 1em;
      padding: 12px 0;
    }
  }
  .logo-ani-wrap {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 18px;
  }
  .logo-ani-outer {
    width: 100px;
    height: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
  }
  .logo-ani-rotate {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    background: radial-gradient(circle at 60% 40%, #fff 60%, #e6d6f3 100%);
    box-shadow: 0 0 24px 8px #e6d6f3, 0 0 40px 0 #c8a2c8aa;
    position: absolute;
    left: 0; top: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1;
    animation: rotateCircle 2.5s linear infinite;
    border: 4px solid #f8e6ff55;
    
    box-shadow: 0 0 24px 8px #e6d6f3, 0 0 40px 0 #c8a2c8aa, 0 0 0 12px #f8e6ff22;
  }
  .logo-ani-rotate::before {
    content: '';
    position: absolute;
    left: 10px; top: 10px;
    width: 80px; height: 80px;
    border-radius: 50%;
    border: 2px dashed #c8a2c8aa;
    opacity: 0.5;
    z-index: 2;
  }
  .logo-ani-img {
    width: 60px;
    height: 60px;
    object-fit: contain;
    position: relative;
    z-index: 3;
    filter: drop-shadow(0 2px 8px #c8a2c855);
    background: transparent;
    border-radius: 50%;
    box-shadow: 0 0 0 4px #fff, 0 0 16px 0 #e6d6f3;
  }
  @keyframes rotateCircle {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }
    .guide-btn {
    position: absolute;
    top: 24px;
    right: 32px;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    text-align: center;
    justify-content: center;
    background: #f5f7fa;
    border: 1.5px solid #c8a2c8;
    font-size: 1.08em;
    color: #a678b4;
    font-family: 'NEXON Lv2 Gothic', 'Noto Sans KR', sans-serif;
    cursor: pointer;
    box-shadow: 0 1px 4px 0 #c8a2c822;
    transition: background 0.2s, color 0.2s;
    z-index: 20;
    }
  .guide-btn:hover {
    background: #e6d6f3;
    color: #fff;
    border-color: #a678b4;
  }
  .guide-btn .guide-icon {
    font-size: 1.3em;
    margin-right: 0px;
    color: #a678b4;
    font-weight: bold;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  .guide-modal-bg {
    display: none;
    position: fixed;
    z-index: 3000;
    left: 0; top: 0; right: 0; bottom: 0;
    width: 100vw; height: 100vh;
    background: rgba(44, 62, 80, 0.18);
    justify-content: center;
    align-items: center;
  }
  .guide-modal-bg.active {
    display: flex;
  }
  .guide-modal {
    background: #fff;
    border-radius: 16px;
    box-shadow: 0 8px 32px 0 #c8a2c855;
    padding: 36px 32px 28px 32px;
    min-width: 320px;
    max-width: 95vw;
    min-height: 120px;
    max-height: 90vh;
    overflow-y: auto;
    position: relative;
    text-align: center;
    font-family: 'NEXON Lv2 Gothic', 'Noto Sans KR', sans-serif;
    color: #7a4fa3;
    font-size: 1.13em;
    animation: modalPop 0.18s cubic-bezier(.4,2,.6,1) 1;
  }
  .guide-modal-close {
    position: absolute;
    top: 16px; right: 18px;
    background: none;
    border: none;
    font-size: 2.2em;
    color: #a678b4ad;
    cursor: pointer;
    transition: color 0.2s;
    z-index: 10;
  }
  .guide-modal-close:hover {
    color: #c8a2c8;
  }
  .product-card {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: #f8faff;
    border-radius: 14px;
    box-shadow: 0 4px 18px 0 rgba(60, 80, 180, 0.10);
    padding: 32px 28px 24px 28px;
    margin: 0 auto;
    max-width: 600px;
    min-width: 220px;
    min-height: 320px;
    gap: 12px;
  }
  .product-card img {
    display: block;
    margin: 0 auto 10px auto;
    max-width: 180px;
    border-radius: 10px;
    box-shadow: 0 2px 8px #e3eafc;
  }
  .product-card h4 {
    margin: 0 0 6px 0;
    font-size: 1.18em;
    font-weight: 700;
    color: #2d3a5a;
    text-align: center;
  }
  .product-card .price {
    font-size: 1.08em;
    font-weight: 600;
    color: #1976d2;
    margin-bottom: 6px;
    text-align: center;
  }
  .product-card .caption {
    color: #666;
    font-size: 0.98em;
    margin: 8px 0 0 0;
    text-align: center;
    min-height: 32px;
  }
  .product-card .go-btn {
    margin-top: 14px;
    padding: 10px 22px;
    border-radius: 8px;
    background: linear-gradient(90deg, #1976d2 0%, #64b5f6 100%);
    color: #fff;
    border: none;
    font-size: 1.08em;
    font-weight: 500;
    cursor: pointer;
    box-shadow: 0 2px 8px 0 rgba(60, 80, 180, 0.08);
    transition: background 0.2s, box-shadow 0.2s;
    display: block;
  }
  .product-card .go-btn:hover {
    background: linear-gradient(90deg, #1565c0 0%, #42a5f5 100%);
    box-shadow: 0 4px 16px 0 rgba(60, 80, 180, 0.13);
  }
</style>
</head>
<body>

<jsp:include page="../common/menubar.jsp" />

<div class="container" style="position:relative;">
  <button class="guide-btn" id="guideBtn">
    <span class="guide-icon">?</span>
  </button>
  <div class="logo-ani-wrap">
    <div class="logo-ani-outer">
      <div class="logo-ani-rotate"></div>
      <img src="/soyo/resources/images/real-soyo-logo-resize.png" alt="SOYO 로고" class="logo-ani-img" />
    </div>
  </div>
  <h2>SOYO AI - 상품 추천</h2>
  <form id="tagForm" autocomplete="off">
    <div class="tags">
      <label><input type="checkbox" name="tags" value="자켓">자켓</label>
      <label><input type="checkbox" name="tags" value="셔츠">셔츠</label>
      <label><input type="checkbox" name="tags" value="조끼">조끼</label>
      <label><input type="checkbox" name="tags" value="도포">도포</label>
      <label><input type="checkbox" name="tags" value="저고리">저고리</label>
      <label><input type="checkbox" name="tags" value="드레스">드레스</label>
      <label><input type="checkbox" name="tags" value="원피스">원피스</label>
      <label><input type="checkbox" name="tags" value="악세사리">악세사리</label>
      <label><input type="checkbox" name="tags" value="크롭티">크롭티</label>
      <label><input type="checkbox" name="tags" value="시스루">시스루</label>
      <label><input type="checkbox" name="tags" value="맨투맨">맨투맨</label>
      <label><input type="checkbox" name="tags" value="후드">후드</label>
      <label><input type="checkbox" name="tags" value="코트">코트</label>
      <label><input type="checkbox" name="tags" value="치마">치마</label>
      <label><input type="checkbox" name="tags" value="바지">바지</label>
      <label><input type="checkbox" name="tags" value="댕기">댕기</label>
      <label><input type="checkbox" name="tags" value="부채">부채</label>
      <label><input type="checkbox" name="tags" value="키링">키링</label>
      <label><input type="checkbox" name="tags" value="그립톡">그립톡</label>
      <label><input type="checkbox" name="tags" value="목걸이">목걸이</label>
      <label><input type="checkbox" name="tags" value="팔찌">팔찌</label>
      <label><input type="checkbox" name="tags" value="반지">반지</label>
      <label><input type="checkbox" name="tags" value="허리띠">허리띠</label>
      <label><input type="checkbox" name="tags" value="모던한복">모던한복</label>
      <label><input type="checkbox" name="tags" value="남녀공용">남녀공용</label>
      <label><input type="checkbox" name="tags" value="여름한복">여름한복</label>
      <label><input type="checkbox" name="tags" value="겨울한복">겨울한복</label>
      <label><input type="checkbox" name="tags" value="사계절용">사계절용</label>
      <label><input type="checkbox" name="tags" value="데일리한복">데일리한복</label>
      <label><input type="checkbox" name="tags" value="스트릿한복">스트릿한복</label>
    </div>
    <div class="ai-input">
      <input type="text" id="aiText" placeholder="예) 댕기 있는 한복 추천해줘, 여름에 입기 좋은 여자 바지 추천해줘">
    </div>
    <button type="submit" id="recommendBtn">알맞는 상품 추천받기</button>
  </form>
  <div id="recommendResult"></div>
  <!-- 모달 영역 -->
  <div class="ai-modal-bg" id="ai-modal-bg">
    <div class="ai-modal">
      <button class="modal-close" id="ai-modalClose" title="닫기">&times;</button>
      <div class="ai-modalContent-scroll" id="ai-modalContent"></div>
    </div>
  </div>
  <!-- 안내 모달 -->
  <div class="guide-modal-bg" id="guideModalBg">
    <div class="guide-modal">
      <button class="guide-modal-close" id="guideModalClose" title="닫기">&times;</button>
      <div style="margin-top:10px; margin-bottom:10px; font-size:1.18em; font-weight:600; color:#a678b4;">SOYO AI - 안내</div>
      <div style="margin-bottom:10px; line-height:1.7;">
        SOYO AI가 당신에게 맞는 상품을 추천해드립니다.<br><br><hr style="margin:10px 0; border:1px solid #c8a2c8;"><br>
        태그를 선택하거나,<br>직접 어떤 상품을 원하시는 지 적어주세요.
      </div>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp" />

<script>
  // 추천 결과를 모달에 직접 렌더링하는 함수
  function numberWithCommas(x) {
    if (x == null) return '';
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }
  function renderRecommendModal(product) {
    let html = '';
    if (product) {
      html += '<h4 style="margin-bottom:10px; font-size:1.2em; font-weight:600; text-align:center;">SOYO AI - 상품 추천</h4>';
      html += '<div class="product-card">';
      html += '<img src="http://192.168.40.32:8100/soyo/resources/product_upfile/' + product.productChange + '" alt="' + product.productName + '">';
      html += '<h4>' + product.productName + '</h4>';
      html += '<div class="price">' + numberWithCommas(product.productPrice) + '원</div>';
      html += '<div class="caption">' + (product.productCaption || '') + '</div>';
      html += '<button class="go-btn" onclick="window.location.href=\'/soyo/product/productDetail?no=' + product.productNo + '\'">추천 상품 바로가기</button>';
      html += '</div>';
    } else {
      html = '<div style="text-align:center; color:#888;">추천할 상품이 없습니다.</div>';
    }
    $("#ai-modalContent").html(html);
    $("#ai-modal-bg").addClass("active");
  }

  $("#recommendBtn").click(function() {
    var tags = [];
    $("input[name='tags']:checked").each(function() {
      tags.push($(this).val());
    });
    var text = $("#aiText").val();
    var allTags = ["자켓","셔츠","조끼","도포","저고리","드레스","원피스","악세사리","크롭티","시스루","맨투맨","후드","코트","치마","바지","댕기","부채","키링","그립톡","목걸이","팔찌","반지","허리띠","모던한복","남녀공용","데일리한복","스트릿한복","여름한복","겨울한복","사계절용"];
    allTags.forEach(function(tag){
      if(text.includes(tag) && !tags.includes(tag)) tags.push(tag);
    });
    if(tags.length === 0) {
      alert("최소 1개 이상의 태그를 선택하거나 입력해주세요.");
      return;
    }
    $.ajax({
      url: "${pageContext.request.contextPath}/ai/recommend",
      type: "POST",
      data: { tags: tags },
      traditional: true,
      dataType: "json",
      success: function(data) {
        renderRecommendModal(data.product);
      },
      error: function() {
        $("#ai-modalContent").html("<div style='color:red;'>추천 결과를 불러오지 못했습니다.</div>");
        $("#ai-modal-bg").addClass("active");
      }
    });
  });
  
  $("#tagForm").on("submit", function(e) {
    e.preventDefault();
    $("#recommendBtn").click();
  });

  $("#ai-modalClose").on("click", function() {
    $("#ai-modal-bg").removeClass("active");
    $("#ai-modalContent").html("");
  });
  
  $("#ai-modal-bg").on("click", function(e) {
    if(e.target === this) {
      $("#ai-modal-bg").removeClass("active");
      $("#ai-modalContent").html("");
    }
  });
  
  // 안내 모달
  $("#guideBtn").on("click", function() {
    $("#guideModalBg").addClass("active");
  });
  $("#guideModalClose, #guideModalBg").on("click", function(e) {
    if(e.target === this || e.target === document.getElementById("guideModalClose")) {
      $("#guideModalBg").removeClass("active");
    }
  });
</script>
</body>
</html>