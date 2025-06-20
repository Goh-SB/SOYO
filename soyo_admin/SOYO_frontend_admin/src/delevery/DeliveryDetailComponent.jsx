import { useState, useEffect } from "react";
import { useNavigate, useParams } from "react-router-dom";
import axios from "axios";
import DeliveryProductDetailComponent from "./DeliveryProductDetailComponent";
import React from 'react';

function DeliveryDetailComponent(){

    // 실행할 구문
    const [delivery,setDelivery]=useState({

        status:''
    });
    const orderNo= useParams().orderNo;
    let navigate = useNavigate();

    useEffect(() => {
    deliveryDetail(); // 딱 한 번만 실행
    }, []); 

    const deliveryDetail = ()=> {

       let url = "http://192.168.40.32:8100/soyo/delivery/info/" + orderNo;

        axios({
            url,
            method: "get"

        }).then((response) => {

            setDelivery(response.data); 
              
        }).catch(() => {
            console.log("ajax 요청 실패");
        });
    }


    return(
        <div>
            <h2>배송정보 상세 조회</h2>

            <br /><br />

                 

            <div align="center">
            
            <table className="table" 
                   style={{ width: "500px" , 
                            border: "1px solid black",
                            borderCollapse: "collapse",
                            marginTop:"30px",
                            marginLeft:"150px",
                            marginRight: "100px",
                             }}
                   align="left">
                <tbody align="center">
                    <tr>
                        <th>수령인</th>
                        <td>{delivery.receiverName}</td>
                    </tr>
                    <tr>
                        <th>주문번호</th>
                        <td>{delivery.orderImpNo}</td>
                    </tr>
                    <tr>
                        <th>배송지</th>
                        <td>
                         
                            {delivery.addressOther}
                        </td>
                    </tr>
                    <tr>
                        <th>배송완료일</th>
                        <td>{delivery.deliveryDate}</td>
                    </tr>
                    <tr>
                        <th>요청사항</th>
                        <td>{delivery.requestMsg}</td>
                    </tr>
                </tbody>
            </table>

            <img src={  delivery.orderStatus == '배송전'
            ? '/img/배송전1.png'
            : delivery.orderStatus == '배송중'
            ? '/img/배송중1.png'
            : '/img/배송완료.png'
            }
            alt="배송 상태 트럭"
            style={{ width: '700px'}}
            />      
            </div>

            <br /><br />

            <h2>배송상품</h2>
            <br /><br />

            <DeliveryProductDetailComponent/>


                
            
        </div>

        
    );

}
export default DeliveryDetailComponent;