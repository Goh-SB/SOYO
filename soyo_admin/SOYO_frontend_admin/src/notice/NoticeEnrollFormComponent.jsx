import { useNavigate } from 'react-router-dom';
import { useState, useEffect } from 'react';
import './NoticeEnrollFormComponent.css';
import $ from 'jquery';
import axios from 'axios';

function NoticeEnrollFormComponent() {

    let navigate = useNavigate();
    let [count, setCount] = useState('');

    const noticeWrite = (e) => {
        e.preventDefault();
        let noticeTitle = document.querySelector("#noticeTitle").value;
        let noticeContent = document.querySelector("#noticeContent").value;
        let upfile = document.querySelector("#imgFile");
        let noticeType = document.querySelector("#selectOption").value;

        // console.log(upfile.files.length);
        const formData = new FormData();

        formData.append("noticeTitle", noticeTitle);
        formData.append("noticeContent", noticeContent);
        formData.append("noticeType", noticeType);
        if (upfile.files.length == 1) {
            // > 첨부파일이 있을 경우
            formData.append("upfile", upfile.files[0]);
        }

        let url = "http://localhost:8100/soyo/notice/enrollForm";

        axios({
            url,
            method: "post",
            data: formData,
            headers: {
                "Content-Type": "multipart/form-data"
            }

        }).then((response) => {
            console.log(response.data);
            navigate("/notice/list");
        }).catch(() => {
            console.log("공지사항 작성 통신 실패");
        });

    };


    const keyEvent = (e) => {

        setCount(e.target.value);
    }

    useEffect(() => {
        if (count.length > 200) {
            document.getElementById("error").innerText = "200자를 넘을 수 없습니다.";
            document.getElementById("submitBtn").disabled = true;
        } else {
            document.getElementById("error").innerText = "";
            document.getElementById("submitBtn").disabled = false;
        }

        $("#imgFile").hide();
        $("#img-area").off("click").on("click", () => {
            $("#imgFile").click();
        });

    }, [count])






    // 이미지 미리보기용 스테이트 변수
    let [imgUrl, setImgUrl] = useState(null);
    //console.log(upfile.files.length);
    const loadImg = (e) => {
        // console.log(e.target.files[0].name)
        // 이미지 미리보기용 src 속성을 만드는 함수


        if (e.target.files[0] == null) {
            setImgUrl(null);
        } else {
            setImgUrl(URL.createObjectURL(e.target.files[0]));
        }
    }




    return (
        <div>
            <h2>공지사항 작성 페이지</h2>

            <br /><br />
            <div align="right">
                <button type="submit" onClick={noticeWrite}
                    className="btn btn-primary "
                    id="submitBtn">
                    작성하기
                </button>
                &nbsp;
                <button onClick={() => { navigate("/notice/list") }}
                    className="btn btn-secondary">
                    목록가기
                </button>

                <select id="selectOption" defaultValue="noti">
                    <option value="공지사항">공지사항</option>
                    <option value="이벤트">이벤트</option>
                </select>
            </div>
               <br />
            <form>
                <div className="form-group">
                    <label htmlFor="email">제목</label>
                    <input type="text" className="form-control" placeholder="제목을 입력하세요" id="noticeTitle" required />
                </div>
                <div className="form-group">
                    <label htmlFor="pwd">내용</label>
                    <textarea className="form-control"
                        placeholder="내용을 입력하세요"
                        onChange={keyEvent}
                        id="noticeContent"
                        required></textarea>
                    <span id="count">{count.length}</span>/200
                    <br /><br />
                    <div id="error" style={{ color: "red" }}></div>
                    <div>
                        <img src={imgUrl} width="1000" height="900" id="img-area" />
                    </div>
                    <input type="file" id="imgFile" onChange={(e) => { loadImg(e) }}></input>

                </div>
                

            </form>
        </div>
    );

}

export default NoticeEnrollFormComponent;