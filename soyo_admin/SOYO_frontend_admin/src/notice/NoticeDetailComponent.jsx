import { useParams, useNavigate } from 'react-router-dom';
import './NoticeDetailComponent.css';
import { useEffect, useState } from 'react';
import axios from 'axios';

function NoticeDetailComponent() {

    let noticeNo = useParams().noticeNo;
    // console.log(noticeNo);
    let navigate = useNavigate();

    let [dataList, setDataList] = useState({});

    useEffect(() => {


        let url = "http://localhost:8100/soyo/notice/detail/" + noticeNo;

        axios({
            url,
            method: "get"
        }).then((response) => {

            // selectNotice(response.data);
            console.log(response.data);


            document.getElementById("noticeTitle").innerText = data.noticeTitle;
            document.getElementById("noticeDate").innerText = data.noticeDate;
            document.getElementById("noticeContent").innerText = data.noticeContent;
            if (data.noticeImage != null) {
                document.getElementById("noticeImage").src = data.noticeImage;
            } else {
                document.getElementById("noticeImage").style.display = "none";
            }


        }).catch(() => {
            console.log("상세보기 페이지 통신 실패");

            console.log("잘되남-catch")
        });

    }, []);

    const selectNotice = (data) => {

        /*
        console.log("잘되남-selectNotice")
        console.log(data);
        document.getElementById("noticeTitle").innerText = data.noticeTitle;
        document.getElementById("noticeDate").innerText = data.noticeDate;
        document.getElementById("noticeContent").innerText = data.noticeContent;
        if(data.noticeImage != null) {
            document.getElementById("noticeImage").src = data.noticeImage;
        } else {
            document.getElementById("noticeImage").style.display = "none";
        }
        */

        // state 버전으로 변경

    };

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
                                <span id="noticeTitle"></span>
                                <br />
                                <span id="noticeDate"></span>
                                <hr />
                            </div>
                        </td>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>
                            <img />
                            <p id="noticeContent">

                            </p>
                        </td>
                    </tr>
                </tbody>


            </table>

        </div>

    );

}

export default NoticeDetailComponent;