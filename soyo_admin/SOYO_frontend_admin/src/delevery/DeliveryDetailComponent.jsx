import { useParams, useNavigate } from 'react-router-dom';
import { useEffect, useState } from 'react';
import axios from 'axios';

function DeliveryDetailComponent(){

    // 실행할 구문
    const [delivery,setDelivery]=useState({});
    const orderNo= useParams().orderNo;
    let navigate = useNavigate();

    useEffect(() => {
        deliveryDetail();
    }, []);

    const deliveryDetail = ()=>{

       let url = "http://localhost:8100/soyo/delivery/" + orderNo;

        axios({
            url,
            method: "get"

        }).then((response) => {
            console.log(response.data);
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
                            marginLeft:"150px",
                            marginRight: "100px",
                             }}
                   align="left">
                <tbody align="center">
                    <tr>
                        <th>이름</th>
                        <td>{delivery.receiverName}</td>
                    </tr>
                    <tr>
                        <th>주문번호</th>
                        <td>{delivery.orderImpNo}</td>
                    </tr>
                    <tr>
                        <th>배송지</th>
                        <td>
                            {delivery.addressName}
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

            

             <table className="table" 
                   style={{ width: "800px" , 
                            border: "1px solid black",
                            borderCollapse: "collapse",
                            padding:"30px"
                             }}
                   align="rights">
                <tbody align="center">
                    <tr>
                        <th>이름</th>
                        <td>홍길동</td>
                    </tr>
                    <tr>
                        <th>주문번호</th>
                        <td>123123</td>
                    </tr>
                    <tr>
                        <th>배송지</th>
                        <td>배송중학교</td>
                    </tr>
                    <tr>
                        <th>배송완료일</th>
                        <td>2025-06-09</td>
                    </tr>
                </tbody>
            </table>
            
            </div>

            <br /><br />

            <h2>배송상품</h2>
            <br /><br />
            <table className="table">
                <thead>
                   <tr align="center">
                        <th width="250px">이미지</th>   
                        <th width="600px">상품명</th>
                        <th width="130px">상품 사이즈</th>
                        <th width="130px">구매수량</th>
                        <th>가격</th>                       
                   </tr>
                </thead>
                <tbody>
                   <tr align="center">
                        <th width="250px">이미지1</th>
                        <th width="600px">상품명1</th>
                        <th width="130px">상품 사이즈1</th>
                        <th width="130px">구매수량1</th>
                        <th>가격1</th>                       
                   </tr>
                    <tr align="center">
                        <th width="250px">이미지1</th>
                        <th width="600px">상품명1</th>
                        <th width="130px">상품 사이즈1</th>
                        <th width="130px">구매수량1</th>
                        <th>가격1</th>                       
                   </tr>
                </tbody>
            </table>

        </div>
    );

}
export default DeliveryDetailComponent;