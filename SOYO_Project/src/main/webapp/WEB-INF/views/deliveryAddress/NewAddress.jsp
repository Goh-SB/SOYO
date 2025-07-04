<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 등록</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
        .container {
        width: 1200px;
        margin: auto;
    }

    body{
        background-color: #f8f9fa;
    }

    #content::after {
        content: "";
        display: block;
        clear: both;
    }

    #myTitle {
        width: 1200px;
        height: 120px;
        font-size: 40px;
        text-align: center;
        vertical-align: middle;
        line-height: 120px;
    }

    #content {
        width: 1200px;
    }

    #myContent{
        margin-bottom: 50px;
    }

    #content > div {
        float: left;
        display: block;
    }


    .myWishList {
        width: 800px;
        min-height: 500px;
    }

    .pageBtn {
        width: 30px;
        height: 30px;
        text-decoration: none;
        border: 1px solid black;
        border-radius: 9px;
        color: cadetblue;
        background-color: lightgrey;
        display: inline-block;
        text-align: center;
        line-height: 30px;
    }

    .inputStyle{
        width: 300px;
        height: 40px;
        border: none;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        padding: 5px;
        margin: 10px;
    }

    .addressTable{
        width: 600px;
        text-align: center;
        margin: auto;
        margin-top: 60px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        border: 2px solid lightgray;
        background-color: rgb(252, 244, 255);
        padding: 40px;
        margin-bottom: 50px;
        border-radius: 15px;
    }

    .btnsetButton{
        margin-left: 10px;
        width: 70px;
        height: 30px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 9px;
        cursor: pointer;
    }

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

<br><br><br>

<div class="container">
<br>
        <div id="content">
            <div id="left-Menu">
                <jsp:include page="../member/leftMenu.jsp" />
            </div>

            <div id="myContent">
                <div>

                    <div class="myWishList">
                        <form action="../deliveryAddress/newDeliveryAddress" method="post" align="center">
                            <table class="addressTable">
                                <tr>
                                    <th>
                                        <span>배송지 등록</span>
                                    </th>
                                </tr>
                                <tr>
                                    <td><input name="addressName" type="text" class="inputStyle" placeholder="배송지 이름" maxlength="10" required></td>
                                    
                                </tr>
                                <tr>
                                    <td><input type="text" name="receiverName" placeholder="수령인" class="inputStyle" maxlength="4" required></td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="receiverPhone" oninput="this.value = this.value.replace(/[^0-9]/g, '')" class="inputStyle" maxlength="11" placeholder="- 없는 전화번호" required></td>
                                </tr>
                                <tr>
                                    <td><input name="addressOther" type="text" class="inputStyle"  id="address" class="updateInput"  name="address" maxlength="66" placeholder="주소" required></td>
                                </tr>
                                <tr>
                                    <td><input type="button" style="margin: 5px;" class="btnSubmit btnsetButton" onClick="execDaumPostcode()" value="주소검색"></td>
                                </tr>
                                <tr>
                                    <td><input name="addressDetail" type="text" class="inputStyle" id="addressDetail" placeholder="상세주소" maxlength="66"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <button class="btnsetButton" type="submit">등록하기</button>
                                        <button style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);" class="btnsetButton" type="reset">초기화</button>
                                    </td>              
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                
                <!-- 페이지네이션은 필요 시 주석 해제 -->
                <%-- 
                <div class="pagination">
                    <c:choose>
                        <c:when test="${pi.currentPage > 1}">
                            <a href="?page=${pi.currentPage - 1}" class="pageBtn">&lt;</a>
                        </c:when>
                        <c:otherwise>
                            <span class="pageBtn">&lt;</span>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="i">
                        <c:choose>
                            <c:when test="${i == pi.currentPage}">
                                <span class="pageBtn" style="background-color: azure;">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="?page=${i}" class="pageBtn">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${pi.currentPage < pi.maxPage}">
                            <a href="?page=${pi.currentPage + 1}" class="pageBtn">&gt;</a>
                        </c:when>
                        <c:otherwise>
                            <span class="pageBtn">&gt;</span>
                        </c:otherwise>
                    </c:choose>
                </div>
                --%>
            </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
<script>
    
    function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById("address").value = data.roadAddress;
        }
    }).open();
    }
</script>
</body>
</html>