import axios from "axios";
import OrderDetailCancelComponent from "./OrderDetailCancelComponent";
import OrderDetailMemberComponent from "./OrderDetailMemberComponent";
import { useParams } from "react-router-dom";
import { useEffect, useState } from "react";

function OrderDetailComponent() {

    const [order,setOrder]=useState({});
    const memberId=useParams().memberId;
    const productNo = useParams().productNo;
    const orderInfo = () =>{
        
        let url = "http://localhost:8100/soyo/delivery/orderInfo/"+memberId+"/"+productNo;

        axios({
            url,
            method : "get"
        }).then((response)=>{
            console.log(response);
            setOrder(response.data[0]);
        }).catch(()=>{
            console.log("ajax 통신 실패");
        });
    }

    useEffect(()=>{
        orderInfo();
    },[]);

    let refundComponent = null;
        if (order.cancelStatus === "환불완료") {
        refundComponent = (
            <OrderDetailCancelComponent
            refundDate={order.cancelDate}
            refundReason={order.cancelReason}
            />
        );
        }


    return (
        <div>
            <h2>결제내역 상세정보</h2>
            <br /><br />

            {/* 수평 정렬을 위한 Flexbox wrapper */}
            <div style={{ display: "flex", gap: "50px" }}>
                {/* 구매자 정보 */}
                <div style={{ marginLeft: "100px" }}>
                    <OrderDetailMemberComponent />
                </div>

                {/* 결제 정보 */}
                <div>
                    <h3>결제 정보</h3>
                    <table className="table"
                        style={{
                            width: "500px",
                            border: "1px solid black",
                            borderCollapse: "collapse",
                            marginTop: "30px"
                        }}
                    >
                        <tbody align="center">
                            <tr>
                                <th>주문 번호</th>
                                <td>{order.orderImpNo}</td>
                            </tr>
                            <tr>
                                <th>상품 이름</th>
                                <td>{order.productName}</td>
                            </tr>
                            <tr>
                                <th>가격</th>
                                <td>{order.productPrice}</td>
                            </tr>
                            <tr>
                                <th>결제 날짜</th>
                                <td>{order.orderDate}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <br /><br />
      
           <div style={{ marginLeft: "100px" }}>
            {refundComponent}
            </div>
        </div>
    );
}

export default OrderDetailComponent;