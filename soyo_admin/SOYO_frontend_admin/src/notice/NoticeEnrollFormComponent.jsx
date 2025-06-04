import { useNavigate } from 'react-router-dom';
import React, { useState } from 'react';
import ReactQuill from 'react-quill-new';
import 'react-quill-new/dist/quill.snow.css'; 

function NoticeEnrollFormComponent() {

    let navigate = useNavigate();


    const noticeWrite = (e) => {
        e.preventDefault();
    };

    return (
        <div>
            <h2>공지사항 작성 페이지</h2>

            <br /><br />
            <form>
                <ReactQuill />

                <div>
                    <button type="submit" onClick={ () => {noticeWrite} }>
                        작성하기

                    </button>
                    <button onClick={ () => {navigate("/notice/list")} }>
                        목록가기
                    </button>

                </div>
            </form>
        </div>
    );

}

export default NoticeEnrollFormComponent;