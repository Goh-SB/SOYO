import { useEffect, useState } from 'react';
import axios from 'axios';
import { useNavigate, Link } from 'react-router-dom';
import './NoticeListComponent.css';
import React from 'react';

function NoticeListComponent() {

    let navigate = useNavigate();

    let [listData, setListData] = useState([]);

    let [cpage, setCpage] = useState(1);

    let [keyword, setKeyword] = useState("");

    let [pageList, setPageList] = useState([]);

    useEffect(() => {
        if (keyword == "") {
            noticeList();
        } else {
            searchList();
        }
    }, [cpage, keyword]);

    // 공지사항 목록 조회 요청
    let url = "http://192.168.40.32:8100/soyo/notice/list";

    const noticeList = () => {

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

            // console.log(response.data)
            setState(response.data);


        }).catch(() => {
            console.log("공지사항 목록 통신 실패")
        });
    };

    const setState = (data) => {
        // console.log(data);

        const trArr = data.list.map((item, index) => {
            if (item.status == 'Y') {
                return (
                    <tr key={index} onClick={() => { navigate("/notice/detail/" + item.noticeNo); }}>

                        <td>{item.noticeNo}</td>
                        <td>&#91;{item.noticeType}&#93;&nbsp;{item.noticeTitle}</td>
                        <td>{item.noticeDate}</td>
                        <td>{item.status}  &nbsp;
                            <button onClick={(e) => {
                                e.stopPropagation();
                                deleteBtn(item.noticeNo)
                            }}>
                                삭제
                            </button>
                        </td>
                        <td>{(item.noticeImage == null) ? "" : <span className="material-symbols-outlined">
                            imagesmode
                        </span>}</td>


                    </tr>
                );
            } else {

                return (
                    <tr key={index} onClick={() => { navigate("/notice/detail/" + item.noticeNo); }}>
                        <td>{item.noticeNo}</td>
                        <td>&#91;{item.noticeType}&#93;&nbsp;{item.noticeTitle}</td>
                        <td>{item.noticeDate}</td>
                        <td>
                            {item.status} &nbsp;
                            <button onClick={(e) => {
                                e.stopPropagation();
                                repairBtn(item.noticeNo)
                            }}>
                                복구
                            </button>
                        </td>
                        <td>{(item.noticeImage == null) ? "" : <span className="material-symbols-outlined">
                            imagesmode
                        </span>}</td>

                    </tr>
                );
            }

        });

        setListData(trArr);

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
                    to="/notice/list" onClick={() => { setCpage(cpage - 1); }}>
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
                        to="/notice/list"
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
                    to="/notice/list"
                    onClick={() => { setCpage(cpage + 1); }}>
                    &gt;
                </Link>
            );
        }


        setPageList(linkArr);


    };

    const deleteBtn = (noticeNo) => {
        let url = "http://192.168.40.32:8100/soyo/notice/delete";
        axios({
            url,
            method: "get",
            params: {
                noticeNo
            },
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response) => {
            console.log("삭제 성공")
            noticeList();
        }).catch(() => {
            console.log("삭제 실패")
        })
    }

    const repairBtn = (noticeNo) => {
        let url = "http://192.168.40.32:8100/soyo/notice/repair";
        axios({
            url,
            method: "get",
            params: {
                noticeNo
            },
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response) => {
            // console.log(response.data);
            noticeList();
        }).catch(() => {
            console.log("복구 실패");
        });
    }

    const filter = ['공지사항', '이벤트', '모든사항'];

    const [selected, setSelected] = useState('모든사항');

    const filtering = () => {
        return filter.map((item, index) => {
            const active = item === selected ? 'filter-btn active' : 'filter-btn';
            return (
                <button key={index}
                    className={active} value={item}
                    onClick={() => { filt(item) }}>
                    {item}
                </button>
            );
        })
    };

    const filt = (item) => {

        setSelected(item);
        setCpage(1);

        let url = "http://192.168.40.32:8100/soyo/notice/filter";
        axios({
            url,
            method: "get",
            params: {
                item,
                cpage
            },
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response) => { 
            setState(response.data);
        }).catch(() => { })
    }

    const searchList = () => {
        setKeyword(document.querySelector("#notice-search-text").value);
        let noticeMenu = document.querySelector("#notice-search-menu").value;
        let url = "http://192.168.40.32:8100/soyo/notice/search";
        setCpage(1);
        axios({
            url,
            method : "get",
            params : {
                keyword,
                noticeMenu,
                cpage
            },
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response) => {
            // console.log(response.data);
            setState(response.data);
        }).catch(()=> {});
    };

    return (
        <div>
            <h2>공지사항 목록</h2>

            <br /><br />
            <div className="filter-buttons">
                {filtering()}
            </div>
            <br />
            <div id="notice-write-btn-area">
                <button onClick={() => { navigate("/notice/enrollForm"); }}
                    id="notice-write-btn">
                    작성하기
                </button>

            </div>
            <br />
            <table className="table list-table table-hover">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>상태</th>
                        <th>이미지</th>
                    </tr>
                </thead>
                <tbody>

                    {listData}

                </tbody>

            </table>
            <br />
            <div align="center">
                {pageList}
            </div>
            <br />
            <div id="notice-search-area">
                <select id="notice-search-menu">
                    <option value="noticeTitle">제목</option>
                    <option value="noticeContent">내용</option>
                </select>
                &nbsp;
                <input type="text"
                    id="notice-search-text">
                </input>
                <button type="button"
                    id="notice-search-btn"
                    onClick={searchList}>
                    검색
                </button>

            </div>

        </div>
    );



}

export default NoticeListComponent;