import { useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";
import axios from "axios";
import React from 'react';

function OrderListComponent(){

    let navigate = useNavigate();
    let [dataList, setDataList] = useState([]);

    const selectPayment = () =>{
        let url = "http://192.168.40.32:8100/soyo/delivery/payment";

        axios({
            url,
            method : "get",
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response)=>{
 
            setDataList(response.data);
        }).catch(()=>{
            console.log("ajax 통신 실패");
        });
    }
    const searchMember =()=>{
        let url = "http://192.168.40.32:8100/soyo/delivery/searchMember";

        const memberName = document.getElementById("searchInput").value;
        axios({
            url,
            method : "get",
            params : {
                memberName
            },
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response)=>{
            setDataList(response.data);
        }).catch(()=>{
            console.log("ajax 통신 실패");
        });
    }

    useEffect(() => {
        selectPayment(); 
    }, []);

    
    return(
        <div>
            <h2>구매내역</h2>

            <br /><br />

           <div style={{ display: "flex", 
                        justifyContent: "center",
                        }}>
           <input
                type="text"
                id="searchInput"
                placeholder="이름을 검색하세요"
                style={{ width: "600px", padding: "8px", fontSize: "16px" }}
                onKeyDown={(e) => {
                    if (e.key === "Enter") {
                    searchMember();
                    }
                }}
                /> &nbsp;
            <button 
            style={{ width: "60px", padding: "8px", fontSize: "16px" }}
            onClick={searchMember}>
                검색
            </button>
            </div>

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
                    {dataList.map((item, index) => (
                        <tr 
                        onClick={()=> navigate("/order/"+item.memberId+"/"+item.productNo)}
                        key={index} align="center">
                            <td>{item.orderDate}</td>
                            <td>{item.memberName}</td>
                            <td>{item.productName}</td>
                            <td>{item.productPrice.toLocaleString()}원</td>
                            <td>{item.cancelStatus}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

        </div>
    );
}
export default OrderListComponent