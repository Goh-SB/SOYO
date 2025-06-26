import './ReviewListComponent.css';
import { useEffect, useState } from 'react';
import $ from 'jquery';
import React from 'react';
import axios from 'axios';
import { Link, useNavigate } from 'react-router-dom';

function ReviewListComponent() {

    let [dataList, setDataList] = useState([]);

    let [cpage, setCpage] = useState(1);

    let [pageList, setPageList] = useState([]);

    useEffect(() => {

        reviewList();
    }, [cpage]);


    const reviewList = () => {
        let url = "http://192.168.40.32:8100/soyo/review/list";
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
        }).catch(() => { });
    };


    const setState = (data) => {
        let trArr = data.list.map((item, index) => {
            const filledStars = "★".repeat(item.rating);
            const emptyStars = "☆".repeat(5 - item.rating);
            const stars = filledStars + emptyStars;
            if (item.status == 'Y') {
                return (

                    <tr className="trOb" key={index} >
                        <td width="20%">
                            <img src={`http://192.168.40.32:8100/soyo/resources/product_upfile/${item.productChange}`}
                                width="200px"
                                height="250px" />
                        </td>
                        <td width="15%" className="review-productName">{item.productName}</td>
                        <td width="20%" className="review-review"><span className="review-title">{item.reviewTitle}</span>
                            <br />{item.reviewContent}
                        </td>
                        <td width="10%" className="review-writer">{item.memberName}</td>
                        <td width="10%" className="review-reviewDate">{item.reviewDate}</td>
                        <td width="10%" className="review-status">
                            {item.status} &nbsp;
                            <button onClick={(e) => {
                                e.stopPropagation();
                                deleteBtn(item.reviewNo)
                            }}>
                                삭제
                            </button>
                        </td>
                        <td widht="15%" className="review-rating">
                            {stars}
                        </td>
                    </tr>
                );
            } else {
                return (

                    <tr className="trOb" key={index} >
                        <td width="20%">
                            <img src={`http://192.168.40.32:8100/soyo/resources/product_upfile/${item.productChange}`}
                                width="200px"
                                height="250px" />
                        </td>
                        <td width="15%" className="review-productName">{item.productName}</td>
                        <td width="20%" className="review-review"><span className="review-title">{item.reviewTitle}</span>
                            <br />{item.reviewContent}
                        </td>
                        <td width="10%" className="review-writer">{item.memberName}</td>
                        <td width="10%" className="review-reviewDate">{item.reviewDate}</td>
                        <td width="10%" className="review-status">
                            {item.status} &nbsp;
                            <button onClick={(e) => {
                                e.stopPropagation();
                                repairBtn(item.reviewNo)
                            }}>
                                복구
                            </button>
                        </td>
                        <td widht="15%" className="review-rating">
                            {stars}
                        </td>
                    </tr>
                );
            }

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
                    to="/review/list" onClick={() => { setCpage(cpage - 1); }}>
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
                        to="/review/list"
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
                    to="/review/list"
                    onClick={() => { setCpage(cpage + 1); }}>
                    &gt;
                </Link>
            );
        }

        setPageList(linkArr);


    };


    const deleteBtn = (reviewNo) => {
        let url = "http://192.168.40.32:8100/soyo/review/delete";
        axios({
            url,
            method: "get",
            params: {
                reviewNo
            },
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response) => {
            alert(response.data);
            reviewList();
        }).catch(() => { })
    }

    const repairBtn = (reviewNo) => {
        let url = "http://192.168.40.32:8100/soyo/review/repair";
        axios({
            url,
            method: "get",
            params: {
                reviewNo
            },
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response) => {
            alert(response.data);
            reviewList();
        }).catch(() => { });
    }

    return (
        <div>
            <h2>리뷰 목록</h2>
            <br /><br />
            <table id="review-table" className="table table-hover">
                <thead>
                    <tr>
                        <th>상품</th>
                        <th>상품명</th>
                        <th>리뷰</th>
                        <th>작성자</th>
                        <th>게시날짜</th>
                        <th>상태</th>
                        <th>별점</th>
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
export default ReviewListComponent;