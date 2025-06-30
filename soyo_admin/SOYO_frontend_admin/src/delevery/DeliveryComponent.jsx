import { useNavigate, Link } from "react-router-dom";
import { useState, useEffect } from "react";
import axios from "axios";
import "./DeliveryComponent.css";
import React from 'react';

function DeliveryComponent() {
    let navigate = useNavigate();
    let [dataList, setDataList] = useState([]);
    let [filteredList, setFilteredList] = useState([]);
    let [currentFilter, setCurrentFilter] = useState("모든 상태");
    let [cpage, setCpage] = useState(1);
    let [pageList, setPageList] = useState([]);

    const selectDelivery = () => {

        let url = "http://192.168.40.32:8100/soyo/delivery/list";

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
            // console.log(response.data);
            setState(response.data);

        }).catch(() => {
            console.log("❌ 주문내역 통신 실패");
        });
    };


    const changeStatus = (orderNo, orderStatus) => {
        let url = "http://localhost:8100/soyo/delivery/changeStatus";
        axios({
            url,
            method: "get",
            params: {
                orderNo,
                orderStatus
            }
        }).then((response) => {
            // console.log(response);

            selectDelivery();
        }).catch(() => {
            console.log("ajax 통신실패");
        })
    };

    const setState = (data) => {
        const trArr = data.list.map((item, index) => {

            return (
                <tr align="center" key={index} >
                    <td onClick={() => navigate("/delivery/" + item.orderNo)}>{item.orderNo}</td>
                    <td onClick={() => navigate("/delivery/" + item.orderNo)}>{item.receiverName}</td>
                    <td onClick={() => navigate("/delivery/" + item.orderNo)}>{item.receiverPhone}</td>
                    <td onClick={() => navigate("/delivery/" + item.orderNo)}>{item.orderDate}</td>
                    <td>
                        <select
                            value={item.orderStatus}
                            onChange={(e) => {
                                const newStatus = e.target.value;
                                changeStatus(item.orderNo, newStatus);
                            }}
                        >
                            <option value="배송전">배송전</option>
                            <option value="배송중">배송중</option>
                            <option value="배송완료">배송완료</option>
                        </select>
                    </td>
                </tr>
            );
        })
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
                    to="/delivery/list" onClick={() => { setCpage(cpage - 1); }}>
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
                        to="/delivery/list"
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
                    to="/delivery/list"
                    onClick={() => { setCpage(cpage + 1); }}>
                    &gt;
                </Link>
            );
        }


        setPageList(linkArr);


    };


    useEffect(() => {
        selectDelivery();
    }, [cpage]);


    return (
        <div>
            <h2>배송 정보</h2>
            <div className="filter-container">
                <h5>배송 상태별 필터링</h5>
                <div className="filter-buttons">

                </div>
            </div>
            <br />
            <table className="table list-table table-hover">
                <thead>
                    <tr align="center">
                        <th width="100px">주문번호</th>
                        <th width="150px">수령인</th>
                        <th width="200px">전화 번호</th>
                        <th width="200px">결제 날짜</th>
                        <th width="200px">배송 상태</th>
                    </tr>
                </thead>
                <tbody>
                    {dataList}
                </tbody>
            </table>
            <br /><br />
            <div align="center">
                {pageList}
            </div>
        </div>
    );
}

export default DeliveryComponent;
