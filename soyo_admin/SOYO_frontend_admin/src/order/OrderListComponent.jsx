import { useNavigate,Link } from "react-router-dom";
import { useState, useEffect } from "react";
import axios from "axios";
import React from 'react';

function OrderListComponent() {

    let navigate = useNavigate();
    let [dataList, setDataList] = useState([]);
    let [pageList, setPageList] = useState([]);
    let [cpage, setCpage] = useState(1);

    const selectPayment = () => {
        let url = "http://192.168.40.32:8100/soyo/delivery/payment";

        axios({
            url,
            method: "get",
            params: {
                cpage
            },
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response) => {

            setState(response.data);


        }).catch(() => {
            console.log("ajax 통신 실패");
        });
    }
    const setState = (data) => {
        
            let trArr = data.list.map((item, index) => {
                return(
                <tr
                    onClick={() => navigate("/order/" + item.orderNo)}
                    key={index} align="center">
                    <td>{item.orderDate}</td>
                    <td>{item.memberName}</td>
                    <td>{item.receiverName}</td>
                    <td>{item.totalPrice.toLocaleString()}원</td>
                    <td>{item.orderStatus}</td>
                </tr>
                )
                
            }
        )
        setDataList(trArr);

         const linkArr = [];

        if (cpage == 1) {
            linkArr.push(
                <Link key="prev" className="btn btn-outline-info btn-sm">
                    &lt;
                </Link>
            );
        } else {
            linkArr.push(
                <Link key="prev" className="btn btn-info btn-sm"
                    to="/order/list" onClick={() => { setCpage(cpage - 1); }}>
                    &lt;
                </Link>
            );
        }


        for (let p = data.pi.startPage; p <= data.pi.endPage; p++) {
            if (cpage == p) {
                linkArr.push(
                    <Link key={p} className="btn btn-outline-info btn-sm">
                        {p}
                    </Link>)
            } else {
                linkArr.push(
                    <Link key={p} className="btn btn-info btn-sm"
                        to="/order/list"
                        onClick={() => { setCpage(p); }}>
                        {p}
                    </Link>
                );
            }

        }

        if (cpage == data.pi.maxPage) {
            linkArr.push(
                <Link key="next" className="btn btn-outline-info btn-sm">
                    &gt;
                </Link>
            );
        } else {
            linkArr.push(
                <Link key="next" className="btn btn-info btn-sm"
                    to="/order/list"
                    onClick={() => { setCpage(cpage + 1); }}>
                    &gt;
                </Link>
            );
        }


        setPageList(linkArr);
        
       
    }
    const searchMember = () => {
        let url = "http://192.168.40.32:8100/soyo/delivery/searchMember";

        const memberName = document.getElementById("searchInput").value;
        axios({
            url,
            method: "get",
            params: {
                memberName
            },
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response) => {
            setDataList(response.data);

        }).catch(() => {
            console.log("ajax 통신 실패");
        });
    }

    useEffect(() => {
        selectPayment();
    }, [cpage]);


    return (
        <div>
            <h2>구매내역</h2>

            <br /><br />

            <div style={{
                display: "flex",
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
                        <th width="150px">구매자</th>
                        <th width="150px">수령인</th>
                        <th width="200px">가격</th>
                        <th width="100px">비고</th>

                    </tr>
                </thead>
                <tbody>
                    {dataList}
                </tbody>
            </table>
            <br /><br />
            <div align = "center">
                {pageList}
            </div>
                

        </div>
    );
}
export default OrderListComponent