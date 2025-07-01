import { useNavigate, Link } from "react-router-dom";
import { useState, useEffect } from "react";
import axios from "axios";
import "./DeliveryComponent.css";
import React from 'react';

function DeliveryComponent() {

    let [selectCate, setSelectCate] = useState('모든사항');
    let category = ['모든사항', '주문완료', '배송중', '배송완료'];
    let navigate = useNavigate();
    let [dataList, setDataList] = useState([]);
    let [filteredList, setFilteredList] = useState([]);
    let [currentFilter, setCurrentFilter] = useState('모든사항');
    let [cpage, setCpage] = useState(1);
    let [pageList, setPageList] = useState([]);


    useEffect(() => {

        if (currentFilter != "" && currentFilter != "모든사항") {
            filterlist();
        } else {
            selectDelivery();
        }
    }, [cpage, currentFilter]);


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
        let url = "http://192.168.40.32:8100/soyo/delivery/changeStatus";
        axios({
            url,
            method: "get",
            params: {
                orderNo,
                orderStatus
            },headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response) => {
            console.log("이제 그만 놀자");

            selectDelivery();
        }).catch(() => {
            console.log("ajax 통신실패");
        })
    };

    const filterlist = () => {
        let url = "http://192.168.40.32:8100/soyo/delivery/filter";


        axios({
            url,
            method: "get",
            params: {
                orderStatus: currentFilter,
                cpage
            }, headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }

        }).then((response) => {

            console.log(response.data);
            setState(response.data);
        }).catch(() => {

        });


    }
    const filterBtn = (e) => {

        let orderStatus = e.target.value;
        /*console.log(deliveryStatus);*/
        setCurrentFilter(orderStatus);
        setCpage(1);
    }
    const setState = (data) => {
        const trArr = data.list.map((item, index) => {

            return (
                <tr align="center" key={index} >
                    <td onClick={() => navigate("/delivery/" + item.orderNo)}>{item.orderNo}</td>
                    <td onClick={() => navigate("/delivery/" + item.orderNo)}>{item.memberName}</td>
                    <td onClick={() => navigate("/delivery/" + item.orderNo)}>{item.totalPrice}</td>
                    <td onClick={() => navigate("/delivery/" + item.orderNo)}>{item.orderDate}</td>
                    
                    <td>
                        <select
                            value={item.orderStatus}
                            onChange={(e) => {
                                const newStatus = e.target.value;
                                changeStatus(item.orderNo, newStatus);
                            }}
                        >
                            <option value="주문완료">주문완료</option>
                            <option value="배송중">배송중</option>
                            <option value="배송완료">배송완료</option>
                        </select>
                    </td>
                    <td onClick={() => navigate("/delivery/" + item.orderNo)}>{item.cancelStatus}</td>
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

    const arrivalDate = () =>{

        let url = "http://192.168.40.32:8100/soyo/delivery/arrivalDate";


    }

    return (
        <div>
            <h2>배송 정보</h2>
            <div className="filter-container">
                <h5>배송 상태별 필터링</h5>
                <div className="filter-buttons">

                </div>
            </div>
            <div id="dilivery-filterArea">
                {category.map((item, index) => (
                    <button value={item} key={index}
                        onClick={(e) => { filterBtn(e) }}
                        className="delivery-filterBtn"
                        style={{
                            backgroundColor: currentFilter == item ? "#E3E4FA" : "",
                            borderRadius: currentFilter == item ? "10px" : ""

                        }}>
                        {item}
                    </button>
                ))}
            </div>
            <br />
            <table className="table list-table table-hover">
                <thead>
                    <tr align="center">
                        <th width="100px">주문번호</th>
                        <th width="150px">구매자</th>
                        <th width="200px">결제 금액</th>
                        <th width="200px">결제 날짜</th>
                        <th width="200px">배송 상태</th>
                        <th width="200px">비고</th>
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
