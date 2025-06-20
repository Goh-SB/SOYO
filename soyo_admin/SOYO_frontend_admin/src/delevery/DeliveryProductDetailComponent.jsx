import { useState, useEffect } from "react";
import { useNavigate, useParams } from "react-router-dom";
import axios from "axios";
import React from 'react';

function DeliveryProductDetailComponent(){

    const [product, setProduct] = useState([]);
    const orderNo= useParams().orderNo;

    const totalPrice = product.reduce((sum, item) => {
        return sum + (item.productPrice * item.productCount);
        }, 0);
    useEffect(() => {
    cartProduct(); // 딱 한 번만 실행
    }, []); 
    const cartProduct = ()=>{

        let url = "http://192.168.40.32:8100/soyo/delivery/product/" + orderNo;

        axios({
            url,
            method:"get"
        }).then((response)=>{
            console.log(response.data);
            setProduct(response.data); 
        }).catch(()=>{
            console.log("ajax 요청 실패");
        });
    }

    return(
        <div>
            <table className="table">
                <thead>
                   <tr align="center">
                        <th width="250px">이미지</th>   
                        <th width="600px">상품명</th>
                        <th width="130px">구매수량</th>
                        <th>가격</th>                       
                   </tr>
                </thead>
                <tbody>
                {product.map((item, index) => (
                    <tr align="center" key={index}>
                    <td width="250px">
                        <img
                        src={item.productImage || "/img/no-image.png"}
                        width="100"
                        alt="상품 이미지"
                        />
                    </td>
                    <td width="600px">{item.productName}</td>
                    <td width="130px">{item.productCount}</td>
                    <td>{item.productPrice}원</td>
                    </tr>
                ))}
                </tbody>
            </table>

            <h3 align="right"
            style={{ marginRight: "20px", marginTop : "30px" }}
            >
            결제금액 : {totalPrice.toLocaleString()}원
            </h3>
        </div>
    );
}
export default DeliveryProductDetailComponent;