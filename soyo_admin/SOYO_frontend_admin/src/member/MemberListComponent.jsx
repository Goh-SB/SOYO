import axios from 'axios';
import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import './MemberListComponent.css';

function MemberListComponent() {



    let [memberList, setMemberList] = useState([]);

    let [pageList, setPageList] = useState([]);

    let [cpage, setCpage] = useState(1);

    let [keyword, setKeyword] = useState("");

    let navigate = useNavigate();


    useEffect(() => {

        if (keyword == "") {
            selectMember();

        } else {

        }


    }, [cpage, keyword]);

    const selectMember = () => {
        let url = "http://localhost:8100/soyo/member/list";
        axios({
            url,
            method: "get",
            params: {
                cpage
            }
        }).then((response) => {
            // console.log(response.data.list);
            setMember(response.data);

        }).catch(() => {
            console.log("회원 목록 통신 실패");

        })
    };

    const setMember = (data) => {


        let trArr = data.list.map((item, index) => {
            if (item.status == 'Y') {
                return (
                    <tr key={index} onClick={() => { navigate("/member/detail/" + item.memberId); }}>
                        <td>{item.memberId}</td>
                        <td>{item.memberName}</td>
                        <td>{item.enrollDate}</td>
                        <td>
                            {item.status} &nbsp;
                            <button onClick={(e) => {
                                e.stopPropagation();
                                deleteBtn(item.memberId);
                            }}>
                                탈퇴
                            </button>
                        </td>
                    </tr>
                );
            } else {
                return (
                    <tr key={index} onClick={() => { navigate("/member/detail/" + item.memberId); }}>
                        <td>{item.memberId}</td>
                        <td>{item.memberName}</td>
                        <td>{item.enrollDate}</td>
                        <td>
                            {item.status} &nbsp;
                            <button onClick={(e) => {
                                e.stopPropagation();
                                repairBtn(item.memberId);
                            }}>
                                복구
                            </button>

                        </td>
                    </tr>
                );
            }

        });
        setMemberList(trArr);

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
                    to="/member/list" onClick={() => { setCpage(cpage - 1); }}>
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
                        to="/member/list"
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
                    to="/member/list"
                    onClick={() => { setCpage(cpage + 1); }}>
                    &gt;
                </Link>
            );
        }


        setPageList(linkArr);


    };
    const deleteBtn = (memberId) => {
        let url = "http://localhost:8100/soyo/member/delete";

        axios({
            url,
            method: "get",
            params: {
                memberId
            }

        }).then((response) => {
            console.log(response.data)
            selectMember();
        }).catch(() => {
            console.log("삭제 실패")
        });
    };


    const repairBtn = (memberId) => {

        let url = "http://localhost:8100/soyo/member/repair";

        axios({
            url,
            method: "get",
            params: {
                memberId
            }
        }).then((response) => {
            console.log(response.data);
            selectMember();
        }).catch(() => {
            console.log("복구 실패");
        });
    };


    return (

        <div>

            <h2>회원 관리</h2>
            <br /><br />
            <table className="table list-table table-hover">
                <thead>
                    <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>가입 일</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    {memberList}
                </tbody>

            </table>

            <br /><br />
            <div align="center">
                {pageList}
            </div>
            <div>
                <select id="">
                    <option value=""></option>
                    <option value=""></option>
                    
                </select>
            </div>
        </div>
    );

};

export default MemberListComponent;