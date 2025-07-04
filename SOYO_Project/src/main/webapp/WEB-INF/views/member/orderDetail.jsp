<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주문 목록</title>
<style>

        
        /*
        div{
            border: 1px solid black;
            box-sizing: border-box;
        }
            */
        

        .container{
            width: 1200px;
            margin: auto;
        }

        #myTitle{
            width: 1200px;
            height: 120px;
            font-size: 40px;
            text-align: center;
            vertical-align: middle;
        }

        #content{
            width: 1200px;
            height: 1200px; /* 여기 조절하기 */
        }

        #content>div{
            float: left;
            display: block;
        }

        #left-Menu{
            width: 160px;
        }

        #left-MenuList{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
            font-size: 23px;
            height: 50px;
        }

        #left-MenuList li{
            margin-top: 5px;
            padding-left: 7px;
            
        }

        #left-MenuList li:hover{
            background-color: rgba(252, 206, 255, 0.821);
            border-top-right-radius: 25px;
            border-bottom-right-radius: 25px;
            border-bottom-left-radius: 5px;
            border-top-left-radius: 5px;
            width: 95%;
            
        }

        #left-MenuList a{
            text-decoration: none;
            color: gray;
            display: block;
            width: 95%;
            /* border: 1px solid lightgray; */
            
        }

        #myContent{
            width: 85%;
            min-height: 600px;
             /*border: 2px solid rgb(122, 64, 126);*/
            box-sizing: border-box;
            box-shadow: 0px 0px 2px 3px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        #order-List{
            height: 95%;
            
        }

        #order-List>ul{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
        }

        #order-List>ul>li{
            border: 2px solid rgb(225, 168, 255);
            padding: 10px;
            border-radius: 5px;
            margin: 20px;
        }

        /* 주문목록 */
        img{
            width: 140px;
            height: 140px;
            border-radius: 5px;
        }

        .product-name{
            width: 60%;
        }

        .product-menu{
            width: 15%;
        }

        .product-img{
            width: 25%;
            padding-top: 10px;
        }
        .review-Button {
		    text-align: right;
			background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
		}

        #page{

            text-align: center;
            margin-top: 20px;
        }


        /*주문목록*/
        .ordercontent{
            width: 100%;
            float: left;
        }

        .order-wrap{
            width: 100%;
            height: 100%;
        }

        .product-menu > button{
            width: 100%;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            background-color: rgba(175, 128, 219, 0.518);
        }

        td > button{
            width: 150px;
            height: 40px;
            cursor: pointer;
        }

        td > button:hover{
            background-color: rgba(126, 93, 158, 0.518);
        }
        
        a.order-link-button {
		    display: inline-block;
		    text-align: center;
		    text-decoration: none;
		    color: black;
		    background-color: rgba(175, 128, 219, 0.518);
		    border: none;
		    border-radius: 5px;
		    padding: 10px 20px;
		    font-family: inherit;
		    font-size: 14px;
		    width: 100%;
		    margin-top: 10px;
		}
		
		a.order-link-button:hover {
		    background-color: rgba(126, 93, 158, 0.518);
		}
		.review-modal {
			display: none;
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(0, 0, 0, 0.5);
			z-index: 10000;
			backdrop-filter: blur(5px);
		}

		.review-modal-content {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background: white;
			width: 500px;
			max-width: 90vw;
			border-radius: 16px;
			box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
			overflow: hidden;
			animation: modalSlideIn 0.3s ease-out;
		}

		@keyframes modalSlideIn {
			from {
				opacity: 0;
				transform: translate(-50%, -60%);
			}
			to {
				opacity: 1;
				transform: translate(-50%, -50%);
			}
		}

		.review-modal-header {
			background: linear-gradient(135deg, #7a8fd8 0%, #8a6bb3 100%);
			color: white;
			padding: 24px 32px;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}

		.review-modal-header h2 {
			margin: 0;
			font-size: 20px;
			font-weight: 500;
		}

		.review-close-btn {
			background: none;
			border: none;
			color: white;
			font-size: 35px;
			cursor: pointer;
			padding: 0;
			width: 35px;
			height: 32px;
			display: flex;
			align-items: center;
			justify-content: center;
			border-radius: 50%;
			transition: background-color 0.2s;
			margin-left: 5px;
		}

		.review-close-btn:hover {
			background-color: rgba(255, 255, 255, 0.2);
		}

		.review-modal-body {
			padding: 32px;
		}
		.review-button {
		    display: inline-block;
		    text-align: center;
		    text-decoration: none;
		    color: white;
			font-weight: bold;
		    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
		    border: none;
		    border-radius: 5px;
		    padding: 10px 20px;
		    font-family: inherit;
		    font-size: 14px;
		    width: 100%;
		    margin-top: 10px;
		}

.review-modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 10000;
	backdrop-filter: blur(5px);
}

.review-modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: white;
	width: 500px;
	max-width: 90vw;
	border-radius: 16px;
	box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	animation: modalSlideIn 0.3s ease-out;
}

@keyframes modalSlideIn {
	from {
		opacity: 0;
		transform: translate(-50%, -60%);
	}
	to {
		opacity: 1;
		transform: translate(-50%, -50%);
	}
}

.review-modal-header {
	background: linear-gradient(135deg, #7a8fd8 0%, #8a6bb3 100%);
	color: white;
	padding: 24px 32px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.review-modal-header h2 {
	margin: 0;
	font-size: 20px;
	font-weight: 500;
}

.review-close-btn {
	background: none;
	border: none;
	color: white;
	font-size: 35px;
	cursor: pointer;
	padding: 0;
	width: 35px;
	height: 32px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 50%;
	transition: background-color 0.2s;
	margin-left: 5px;
}

.review-close-btn:hover {
	background-color: rgba(255, 255, 255, 0.2);
}

.review-modal-body {
	padding: 32px;
}

.form-group {
	margin-bottom: 24px;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	font-weight: 600;
	color: #333;
	font-size: 17px;
	text-align: center;
}

.form-group input[type="text"],
.form-group textarea {
	width: 100%;
	padding: 12px 16px;
	border: 2px solid #e1e5e9;
	border-radius: 8px;
	font-size: 16px;
	transition: all 0.3s ease;
	box-sizing: border-box;
	font-family: inherit;
}

.form-group input[type="text"]::placeholder,
.form-group textarea::placeholder {
	font-size: 16px;
}

.form-group input[type="text"]:focus,
.form-group textarea:focus {
	outline: none;
	border-color: #7a8fd8;
	box-shadow: 0 0 0 3px rgba(122, 143, 216, 0.1);
}

.form-group textarea {
	resize: vertical;
	min-height: 100px;
}

/* 별점 스타일 */
.star-rating {
	display: flex;
	flex-direction: row-reverse;
	gap: 4px;
	justify-content: center;
}

.star-rating input[type="radio"] {
	display: none;
}

.star-rating .star {
	font-size: 32px;
	color: #ddd;
	cursor: pointer;
	transition: color 0.2s ease;
	user-select: none;
}

.star-rating .star:hover,
.star-rating .star:hover ~ .star,
.star-rating input[type="radio"]:checked ~ .star {
	color: #ffd700;
}

/* 버튼 영역 */
.review-modal-footer {
	display: flex;
	gap: 12px;
	justify-content: flex-end;
	margin-top: 32px;
}

.btn-cancel,
.btn-submit {
	padding: 12px 24px;
	border: none;
	border-radius: 8px;
	font-size: 14px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	min-width: 100px;
}

.btn-cancel {
	background-color: #f8f9fa;
	color: #6c757d;
	border: 2px solid #e9ecef;
}

.btn-cancel:hover {
	background-color: #e9ecef;
	border-color: #dee2e6;
}

.btn-submit {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
}

.btn-submit:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
}

.btn-submit:active {
	transform: translateY(0);
}


        
        /*
        div{
            border: 1px solid black;
            box-sizing: border-box;
        }
            */
        

        .container{
            width: 1200px;
            margin: auto;
        }
        

        #myTitle{
            width: 1200px;
            height: 120px;
            font-size: 40px;
            text-align: center;
            vertical-align: middle;
        }

        #content{
            width: 1200px;
        }

        #content>div{
            float: left;
            display: block;
        }

        #left-Menu{
            width: 160px;
        }

        #left-MenuList{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
            font-size: 23px;
            height: 50px;
        }

        #left-MenuList li{
            margin-top: 5px;
            padding-left: 7px;
            
        }

        #left-MenuList li:hover{
            background-color: rgba(252, 206, 255, 0.821);
            border-top-right-radius: 25px;
            border-bottom-right-radius: 25px;
            border-bottom-left-radius: 5px;
            border-top-left-radius: 5px;
            width: 95%;
            
        }

        #left-MenuList a{
            text-decoration: none;
            color: gray;
            display: block;
            width: 95%;
            /* border: 1px solid lightgray; */
            
        }

        #myContent{
            width: 85%;
             /*border: 2px solid rgb(122, 64, 126);*/
            box-sizing: border-box;
            box-shadow: 0px 0px 2px 3px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        #order-List{
            height: 95%;
            
        }

        #order-List>ul{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
        }

        #order-List>ul>li{
            border: 2px solid rgb(225, 168, 255);
            padding: 10px;
            border-radius: 5px;
            margin: 20px;
        }

        /* 주문목록 */

        .product-name{
            width: 60%;
        }

        .product-menu{
            width: 15%;
        }

        .product-img{
            width: 25%;
            padding-top: 10px;
        }
        .product-img>img{
            border-radius : 8px;
        	width : 150px;
        	height : 150px;
        }

        #page{

            text-align: center;
            margin-top: 20px;
        }


        /*주문목록*/
        .ordercontent{
            width: 100%;
            float: left;
        }

        .order-wrap{
            width: 100%;
            height: 100%;
        }

        .product-menu > button{
            width: 100%;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            background-color: rgba(175, 128, 219, 0.518);
        }

        td > button{
            width: 150px;
            height: 40px;
            cursor: pointer;
        }

        td > button:hover{
            background-color: rgba(126, 93, 158, 0.518);
        }
        
        .order-link-button {
		    display: inline-block;
		    text-align: center;
		    text-decoration: none;
		    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    		color: white;
		    border: none;
		    border-radius: 10px;
		    padding: 5px 10px;
		    font-family: inherit;
		    font-size: 14px;
		    width: 100%;
		    margin-top: 10px;
			margin-right: 10px;
			font-weight: bold;
			cursor: pointer;
		}
		
		.order-link-button:hover {
		    background-color: rgba(126, 93, 158, 0.518);
		}

		/* 리뷰 모달창 스타일 */
		.review-modal {
			display: none;
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(0, 0, 0, 0.5);
			z-index: 10000;
			backdrop-filter: blur(5px);
		}

		.review-modal-content {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background: white;
			width: 500px;
			max-width: 90vw;
			border-radius: 16px;
			box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
			overflow: hidden;
			animation: modalSlideIn 0.3s ease-out;
		}

		@keyframes modalSlideIn {
			from {
				opacity: 0;
				transform: translate(-50%, -60%);
			}
			to {
				opacity: 1;
				transform: translate(-50%, -50%);
			}
		}

		.review-modal-header {
			background: linear-gradient(135deg, #7a8fd8 0%, #8a6bb3 100%);
			color: white;
			padding: 24px 32px;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}

		.review-modal-header h2 {
			margin: 0;
			font-size: 20px;
			font-weight: 500;
		}

		.review-close-btn {
			background: none;
			border: none;
			color: white;
			font-size: 35px;
			cursor: pointer;
			padding: 0;
			width: 35px;
			height: 32px;
			display: flex;
			align-items: center;
			justify-content: center;
			border-radius: 50%;
			transition: background-color 0.2s;
			margin-left: 5px;
		}

		.review-close-btn:hover {
			background-color: rgba(255, 255, 255, 0.2);
		}

		.review-modal-body {
			padding: 32px;
		}

		.form-group {
			margin-bottom: 24px;
		}

		.form-group label {
			display: block;
			margin-bottom: 8px;
			font-weight: 600;
			color: #333;
			font-size: 17px;
            text-align: center;
		}

		.form-group input[type="text"],
		.form-group textarea {
			width: 100%;
			padding: 12px 16px;
			border: 2px solid #e1e5e9;
			border-radius: 8px;
			font-size: 16px;
			transition: all 0.3s ease;
			box-sizing: border-box;
			font-family: inherit;
		}

		.form-group input[type="text"]::placeholder,
		.form-group textarea::placeholder {
			font-size: 16px;
		}

		.form-group input[type="text"]:focus,
		.form-group textarea:focus {
			outline: none;
			border-color: #7a8fd8;
			box-shadow: 0 0 0 3px rgba(122, 143, 216, 0.1);
		}

		.form-group textarea {
			resize: vertical;
			min-height: 100px;
		}

		/* 별점 스타일 */
		.star-rating {
			display: flex;
			flex-direction: row-reverse;
			gap: 4px;
            justify-content: center;
		}

		.star-rating input[type="radio"] {
			display: none;
		}

		.star-rating .star {
			font-size: 32px;
			color: #ddd;
			cursor: pointer;
			transition: color 0.2s ease;
			user-select: none;
		}

		.star-rating .star:hover,
		.star-rating .star:hover ~ .star,
		.star-rating input[type="radio"]:checked ~ .star {
			color: #ffd700;
		}

		.review-modal-footer {
			display: flex;
			gap: 12px;
			justify-content: flex-end;
			margin-top: 32px;
		}

		.btn-cancel,
		.btn-submit {
			padding: 12px 24px;
			border: none;
			border-radius: 8px;
			font-size: 14px;
			font-weight: 600;
			cursor: pointer;
			transition: all 0.3s ease;
			min-width: 100px;
		}

		.btn-cancel {
			background-color: #f8f9fa;
			color: #6c757d;
			border: 2px solid #e9ecef;
		}

		.btn-cancel:hover {
			background-color: #e9ecef;
			border-color: #dee2e6;
		}

		.btn-submit {
			background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
			color: white;
			box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
		}

		.btn-submit:hover {
			transform: translateY(-2px);
			box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
		}

		.btn-submit:active {
			transform: translateY(0);
		}
		
		.paging-area {
			margin-top: 30px;
			text-align: center;
		}

		.pagination {
			display: inline-flex;
			list-style: none;
			gap: 5px;
		}

		.page-item {
			display: inline-block;
		}

		.page-link {
			display: block;
			padding: 8px 12px;
			text-decoration: none;
			color: #495057;
			border: 1px solid #dee2e6;
			border-radius: 4px;
			transition: all 0.2s ease;
		}

		.page-link:hover {
			background-color: #e9ecef;
		}

		.page-item.active .page-link {
			background-color: #495057;
			color: white;
			border-color: #495057;
		}

		.page-item.disabled .page-link {
			color: #adb5bd;
			pointer-events: none;
			background-color: #f8f9fa;
		}
		.container {
    width: 1200px;
    margin: auto;
    font-size: 18px; /* 전체 기본 폰트 크기 업 */
}

#myTitle {
    font-size: 48px; /* 타이틀 크기 업 */
}

#left-MenuList {
    font-size: 25px; /* 메뉴 글자 크기 업 */
}

.order-link-button {
    font-size: 16px; /* 버튼 글자 크기 업 */
}

.review-modal-header h2 {
    font-size: 24px; /* 모달 제목 크기 업 */
}

.form-group label {
    font-size: 20px; /* 리뷰 폼 라벨 크기 업 */
}

.form-group input[type="text"],
.form-group textarea {
    font-size: 18px; /* 입력창 폰트 업 */
}

.star-rating .star {
    font-size: 36px; /* 별 크기 업 */
}

.btn-cancel,
.btn-submit {
    font-size: 16px; /* 모달 버튼 크기 업 */
}

.page-link {
    font-size: 16px; /* 페이징 링크 글자 크기 업 */
}

#order-List > ul > li {
    font-size: 18px; /* 주문목록 글자 크기 업 */
}

body{
        background-color: #f8f9fa;
    }

    .container {
        width: 1200px;
        margin: auto;
    }

    #content::after {
        content: "";
        display: block;
        clear: both;
    }

    #title{
        text-align: center;
        height: 63px;
        font-size: 20px;
        background: linear-gradient(135deg, #f3e8f9 0%, #e7dcf4 100%);
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        color: #7e4f8b85;
        font-weight: bold;
    }

    .fontspan{
        display: inline-block;
        padding-top: 10px;
        margin: auto;
        font-size: 25px;
    }

    #myContent{
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        margin: 50px;
        border-radius: 15px;
        background-color: white;
        width: 970px;
        margin-left: 30px;
        margin-top: 40px;
    }

    #content {
        width: 1500px;
        margin-top: 30px;
    }

    #content > div {
        float: left;
        display: block;
    }

    .myWishList {
        width: 600px;
        min-height: 500px;
        border-bottom-left-radius: 15px;
        border-bottom-right-radius: 15px;
        padding-top: 15px;
    }

    .productImg {
        width: 75px;
        height: 75px;
    }

    .wishTable {
        width: 800px;
        margin: 50px;
        margin-top: 80px;
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

    .pagination {
        justify-content: center;
        width: 100%;
        height: 50px;
        text-align: center;
		padding-left: 250px;
		margin-left: 40px;
    }

    .addressForm{
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        border: 2px solid lightgrey;
        border-radius: 15px;
        width: 900px;
        padding: 8px;
        margin: auto;
        margin-bottom: 20px;
        transition: transform 0.4s ease;
        margin-left: 40px;
    }

    .addressForm:hover {
        border: 2px solid rgb(105, 105, 255);
        transform: translateY(-2px);
    }

    .addBtn{
        height: 30px;
        display: block;
        margin-left: 40px;
        margin-bottom: 15px;
        border-radius: 9px;
        width: 200px;
        border: none;
        cursor: pointer;
        background-color: white;
        border: 1px solid rgb(247, 213, 255);
        color: #7e4f8b85;
    }

    .addBtn:hover{
        box-shadow: 0 2px 10px rgba(251, 230, 255, 0.817);
        background-color: rgb(247, 213, 255);
        color: #7e4f8b85;
    }

    .addrSpan{
        margin: 8px;
        margin-left: 15px;
    }

    .btnset{
        margin-left: 680px;
        margin-bottom: 10px;
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

    .btnsetButton:hover{
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .addrtitle{
        font-weight: bold;
        font-size: 17px;
        color: #442a4be2;
    }

    .addrDetail{
        border: 2px solid rgba(211, 211, 211, 0.362);
        border-radius: 5px;
        margin-bottom: 15px;
        margin-top: 15px;
        margin-left: 10px;
        margin-right: 10px;
        padding: 10px;
        padding-bottom: 15px;
    }


        /* 모달창 디자인 */
    
    #editModal {
        width: 400px;
        height: 730px;
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: white;
        border: 1px solid #ccc;
        z-index: 9999;
        box-shadow: 0 2px 10px rgba(0,0,0,0.3);
        border-radius: 15px;
    }

    .modalLabel{
        box-sizing: border-box;
        font-size: 16px;
        text-align: left;
        color: #442a4be2;
    }

    .modalInput{
        box-sizing: inherit;
        width: 300px;
        height: 40px;
        padding: 5px;
        border-radius: 9px;
        border: none;
        box-shadow: 0 2px 7px rgba(0,0,0,0.1);
        margin-top: 2px !important;
        margin-bottom: 30px !important;
    }

    #aa {
        padding-bottom: 30px;
        padding-top: 12px;
    }

    .modalbtn{
        width: 90px;
        height: 30px;
        background-color: aliceblue;
        border: none;
        border-radius: 9px;
    }

    .btnSubmit{
        width: 300px;
        height: 30px;
        border-radius: 5px;
        border: none;
        background-color: aliceblue;
        margin-bottom: 30px !important;
    }

    .modalTitle{
        background-color: rgb(252, 232, 255);
        border-top-right-radius: 15px;
        border-top-left-radius: 15px;
        height: 60px;
        padding-top: 16px;
        font-size: 23px;
        color: #442a4be2;
    }

    .titleSpan{
        margin-top: 20px;
    }

    #left-Menu{
        margin-top: 40px;
        margin-left: 20px;
    }
		
		
</style>
</head>
<body>

		<script
			  src="https://code.jquery.com/jquery-3.3.1.min.js"
			  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			  crossorigin="anonymous">
	    </script>
	<!-- 모달 창 -->
	<div id="refundModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); z-index:9999;">
	    <div style="background:white; width:400px; padding:20px; border-radius:10px; margin:150px auto; position:relative;">				
	        <div style="text-align:right; margin-top:20px;">
	        	<input type="text" id="imp_uid" placeholder="주문번호 입력" required>
				<input type="text" id="reason" placeholder="취소 사유" required>
	        	<button onclick="closeModal()">취소</button>
	            <button onclick="cancelPay()" style="margin-right:10px;">환불하기</button>
	        </div>
	    </div>
	</div>
	<jsp:include page="../common/menubar.jsp" />
        
	<div class="container">
<br>
        <div class="" id="content">
			<div id="left-Menu">
                <jsp:include page="../member/leftMenu2.jsp" />
            </div>
            <div class="" id="myContent">
				<div id="title"><span class="fontspan">OrderDetail</span></div>
                <div id="aa">
                        <div class="myWishList">
                            <c:choose>
                                <c:when test="${not empty requestScope.result}">
                                    
                                    <c:forEach var="p" items="${requestScope.result}">
                                        <div class="addressForm">
                                            <div class="addrDetail" style="overflow: hidden;">
												<div style="width: 200px; float: left;">
													<img src="http://192.168.40.32:8100/soyo/resources/product_upfile/${p.productChange}" alt="">
												</div>

												<div style="margin-left: 210px;">
													<div style="margin-bottom: 10px;">
														<br>
														<div>상품명: ${p.productName}</div>
														<div>
															<span id="total-price">
																가격 : <fmt:formatNumber value="${p.productPrice}" type="number" groupingUsed="true" />원
															</span>
														</div>
													</div>

													<!-- 버튼을 오른쪽에 고정 -->
													<div style="text-align: right;">
														<button class="review-button" style="width: 150px; cursor: pointer;" type="button" onclick="openReviewModal('${p.productNo}', '${p.productName}')">
															리뷰 작성
														</button>
													</div>
												</div>
											</div>
                                            
                                            <!-- 삭제 버튼-->
                                            
                                        </div>
                                    </c:forEach>
                                </c:when>
                                    <c:otherwise>
                                        <div style="height: 500px; text-align: center;" >
                                            <span style="margin-left: 350px; color: gray; font-size: 20px;">
                                                등록된 주문이 없습니다.
                                            </span>
                                            <br>
                                        </div>
                                    </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    	<div id="reviewModal" class="review-modal">
		<div class="review-modal-content">
			<div class="review-modal-header">
				<h2>리뷰 작성</h2>
				<button class="review-close-btn" onclick="closeReviewModal()">&times;</button>
			</div>
			<div class="review-modal-body">
				<form id="reviewForm">
					<div class="form-group">
						<label for="reviewTitle">리뷰 제목</label>
						<input type="text" id="reviewTitle" name="reviewTitle" placeholder="리뷰 제목을 입력해주세요" required>
					</div>
					
					<div class="form-group">
						<label for="reviewContent">리뷰 내용</label>
						<textarea id="reviewContent" name="reviewContent" placeholder="상품에 대한 솔직한 리뷰를 작성해주세요" rows="5" required></textarea>
					</div>
					
					<div class="form-group">
						<label>별점</label>
						<div class="star-rating">
							<input type="radio" id="star5" name="rating" value="5">
							<label for="star5" class="star">★</label>
							<input type="radio" id="star4" name="rating" value="4">
							<label for="star4" class="star">★</label>
							<input type="radio" id="star3" name="rating" value="3">
							<label for="star3" class="star">★</label>
							<input type="radio" id="star2" name="rating" value="2">
							<label for="star2" class="star">★</label>
							<input type="radio" id="star1" name="rating" value="1">
							<label for="star1" class="star">★</label>
						</div>
					</div>
					
					<div class="review-modal-footer">
						<button type="button" class="btn-cancel" onclick="closeReviewModal()">취소</button>
						<button type="submit" class="btn-submit">리뷰 등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
    <br>
    <jsp:include page="../common/footer.jsp" />
   <script>

    function copyImpUid(orderNo) {
        document.getElementById("imp_uid").value = orderNo;
        alert("주문번호가 복사되었습니다!");
    }

    function openModal() {
        document.getElementById("refundModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("refundModal").style.display = "none";
    }

    function confirmRefund() {
        closeModal();
        alert("전체 환불 처리가 진행됩니다.");
        // 실제 환불 로직을 여기에 추가할 수 있음 (예: fetch, form 제출 등)
    }

	function cancelPay() {
		
		const impUid = document.querySelector("#imp_uid").value;
		const reason = document.querySelector("#reason").value;
		
		  jQuery.ajax({
			  url: "${pageContext.request.contextPath}/soyo/cancelPayment",
		    type: "POST",
		    contentType: "application/json",
		    data: JSON.stringify({ imp_uid: impUid, reason: reason }),
		    dataType: "json",
		    success: function (response) {
		    	  if (response.success) {
		    	    alert("✅ 환불 성공!");
		    	    location.href = "/soyo";
		    	  } else {
		    	    alert("❌ 환불 실패: " + response.message);
		    	  }
		    	},
		    error: function (xhr, status, error) {
		    	console.error("에러 상태코드:", xhr.status);
		    	  console.error("서버 응답:", xhr.responseText);
		    	  alert("❌ 오류 발생: " + xhr.responseText);
		    }
		  });
		  
		  console.log("imp_uid:", impUid);
		}

        // 리뷰 모달창 관련 함수들
        let currentProductNo = null;

        function openReviewModal(productNo, productName) {
            console.log('openReviewModal called with productNo:', productNo);
            console.log('openReviewModal called with productName:', productName);
            console.log('productNo type:', typeof productNo);
            
            if (!productNo || productNo === 'null' || productNo === 'undefined') {
                alert('상품 번호를 찾을 수 없습니다. 관리자에게 문의해주세요.');
                console.error('productNo is invalid:', productNo);
                return;
            }
            
            currentProductNo = parseInt(productNo);
            console.log('currentProductNo set to:', currentProductNo);
            
            // 모달창 제목에 상품명 표시
            const modalTitle = document.querySelector('.review-modal-header h2');
            if (modalTitle && productName) {
                modalTitle.textContent = "리뷰 작성 - " + productName;
            }
            
            document.getElementById("reviewModal").style.display = "block";
            // 모달창이 열릴 때 폼 초기화
            document.getElementById("reviewForm").reset();
        }

        function closeReviewModal() {
            document.getElementById("reviewModal").style.display = "none";
            currentProductNo = null;
        }

        // 페이지 로드 시 리뷰 폼 제출 이벤트 리스너 추가
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('reviewForm').addEventListener('submit', function(e) {
                e.preventDefault();

                const title = document.getElementById('reviewTitle').value.trim();
                const content = document.getElementById('reviewContent').value.trim();
                const rating = document.querySelector('input[name="rating"]:checked');

                if (!title) {
                    alert('리뷰 제목을 입력해주세요.');
                    return;
                }

                if (!content) {
                    alert('리뷰 내용을 입력해주세요.');
                    return;
                }

                if (!rating) {
                    alert('별점을 선택해주세요.');
                    return;
                }

                if (!currentProductNo) {
                    alert('상품 정보를 찾을 수 없습니다.');
                    return;
                }

                const reviewData = {
                    reviewTitle: title,
                    reviewContent: content,
                    rating: parseInt(rating.value),
                    productNo: currentProductNo
                };

                $.ajax({
                    url: '${pageContext.request.contextPath}/review/insert',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(reviewData),
                    success: function(response) {
                        if (response.success) {
                            alert('리뷰가 등록되었습니다!');
                            closeReviewModal();
                            location.reload();
                        } else {
                            alert('리뷰 등록 실패: ' + response.message);
                        }
                    },
                    error: function(xhr) {
                        console.error('서버 오류:', xhr.responseText);
                        alert('서버 오류가 발생했습니다.');
                    }
                });
            });

            // 모달창 외부 클릭 시 닫기
            document.getElementById('reviewModal').addEventListener('click', function(e) {
                if (e.target === this) {
                    closeReviewModal();
                }
            });
        });
	</script>
</body>
</html>