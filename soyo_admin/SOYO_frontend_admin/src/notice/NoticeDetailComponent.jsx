import { useParams, useNavigate } from 'react-router-dom';
import './NoticeDetailComponent.css';
import { useEffect, useState } from 'react';
import axios from 'axios';
import React from 'react';

function NoticeDetailComponent() {

    let noticeNo = useParams().noticeNo;
    // console.log(noticeNo);
    let navigate = useNavigate();

    let [dataList, setDataList] = useState({});

    useEffect(() => {


        let url = "http://192.168.40.32:8100/soyo/notice/detail/" + noticeNo;

        axios({
            url,
            method: "get",
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response) => {

            // selectNotice(response.data);
            // console.log(response.data);
            // console.log(response.data.noticeType);

            if(response.data.noticeImage == null){
                document.getElementById("fileImg").remove();
            }

            setDataList(response.data)
            


        }).catch(() => {
            console.log("상세보기 페이지 통신 실패");

            console.log("잘되남-catch")
        });



    }, []);

    return (

        <div id="noticeDetail">
            <h2>공지사항 상세보기</h2>

            <br /><br />

            <button onClick={() => { navigate("/notice/list") }}>
                목록가기
            </button>
  
            <table id="notice-Detail-Table">
                <thead>
                    <tr>
                        <td>
                            <div>
                                <span id="noticeTitle">&#91;{dataList.noticeType}&#93;&nbsp;{dataList.noticeTitle}</span>
                                <br />
                                <span id="noticeDate">{dataList.newNoticeDate}</span>
                                <hr />
                            </div>
                        </td>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>
                            <img id="fileImg" src={`http://192.168.40.32:8100/soyo/resources/notice_upfile/${dataList.noticeImage}`} />
                            <br /><br />
                            <p id="noticeContent">{dataList.noticeContent}
                            </p>
                        </td>
                    </tr>
                </tbody>
            </table>
            <br /><br />
        </div>

    );

}

export default NoticeDetailComponent;