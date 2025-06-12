import { useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";
import axios from "axios";

function OrderListComponent(){

    let navigate = useNavigate();
    let [dataList, setDataList] = useState([]);

    const selectPayment = () =>{
        let url = "http://localhost:8100/soyo/delivery/payment";

        axios({
            url,
            method : "get"
        }).then((response)=>{
            console.log(response);
            setDataList(response.data);
        }).catch(()=>{
            console.log("ajax 통신 실패");
        });
    }
    return(
        <div>
            <h2>구매내역</h2>

            <br /><br />

            <table className="table list-table table-hover">
                <thead>
                    <tr align="center">
                        <th width="100px">결제날짜</th>
                        <th width="150px">이름</th>
                        <th width="200px">구매상품</th>
                        <th width="200px">가격</th>
                        <th width="200px">비고</th>
                    </tr>
                </thead>
                <tbody>
                    <tr align="center">
                        <td>2025-06-12</td>
                        <td>홍길동</td>
                        <td>화이트 반팔 티셔츠</td>
                        <td>12900</td>
                        <td>환불처리</td>
                    </tr>
                </tbody>
            </table>

        </div>
    );
}
export default OrderListComponent