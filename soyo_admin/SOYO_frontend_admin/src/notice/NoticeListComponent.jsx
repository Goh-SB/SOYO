import { useEffect, useState } from 'react';
import axios from 'axios';
import { useNavigate, Link } from 'react-router-dom';

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
    let url = "http://localhost:8100/soyo/notice/list";

    const noticeList = () => {

        axios({
            url,
            method: "get",
            params: {
                cpage
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
                        <td>{(item.noticeImage == null) ? "" : <span class="material-symbols-outlined">
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
                        <td>{(item.noticeImage == null) ? "" : <span class="material-symbols-outlined">
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
        let url = "http://localhost:8100/soyo/notice/delete";
        axios({
            url,
            method: "get",
            params: {
                noticeNo
            }
        }).then((response) => {
            console.log("삭제 성공")
            noticeList();
        }).catch(() => {
            console.log("삭제 실패")
        })
    }

    const repairBtn = (noticeNo) => {
        let url = "http://localhost:8100/soyo/notice/repair";
        axios({
            url,
            method: "get",
            params: {
                noticeNo
            }
        }).then((response) => {
            // console.log(response.data);
            noticeList();
        }).catch(() => {
            console.log("복구 실패");
        });
    }




    return (
        <div>
            <h2>공지사항 목록</h2>

            <br /><br />
            <div>
                <button onClick={() => { navigate("/notice/enrollForm"); }}>
                    작성하기
                </button>
            </div>
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

        </div>
    );



}

export default NoticeListComponent;