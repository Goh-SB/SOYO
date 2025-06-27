import { useParams } from "react-router-dom";
import axios from "axios";
import { useState,useEffect } from "react";
import React from 'react';

function OrderDetailMemberComponent(){

    const [order,setOrder]=useState({});
    const orderNo= useParams().orderNo;
    const orderMember = () =>{
    
        let url = "http://192.168.40.32:8100/soyo/delivery/memberInfo/"+orderNo;

        axios({
            url,
            method : "get",
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response)=>{
            setOrder(response.data);
        }).catch(()=>{
            console.log("ajax 요청 실패");
        });
    }
    useEffect(()=>{
        orderMember();
    },[]);
    return(
    <div>
        <h3>구매자</h3> 
        
        <table className="table" 
        style={{ width: "500px" , 
                border: "1px solid black",
                borderCollapse: "collapse",
                marginTop:"30px",
            
                marginRight: "100px",
                    }}
        align="left">
         <tbody align="center">
                    <tr>
                        <th>구매자</th>
                        <td>{order.memberName}</td>
                    </tr>
                    <tr>
                        <th>구매자 번호</th>
                        <td>{order.phone}</td>
                    </tr>
                    <tr>
                        <th>수령인</th>
                        <td>{order.receiverName}</td>
                    </tr>
                    <tr>
                        <th>수령인 번호</th>
                        <td>{order.receiverPhone}</td>
                    </tr>
                    <tr>
                        <th>배송지명</th>
                        <td>{order.addressAlias}</td>
                    </tr>
                    <tr>
                        <th>배송지</th>
                        <td>{order.addressOther}</td>
                    </tr>
                     <tr>
                        <th>요청사항</th>
                        <td>{order.requestMsg}</td>
                    </tr>
                    <tr>
                        <th>총 가격</th>
                        <td>{order.totalPrice}</td>
                    </tr>
                </tbody>

        </table>
    </div>
    );
}
export default OrderDetailMemberComponent;