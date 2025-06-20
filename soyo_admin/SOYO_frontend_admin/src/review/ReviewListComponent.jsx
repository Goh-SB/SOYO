import './ReviewListComponent.css';
import { useEffect, useState } from 'react';
import $ from 'jquery';
import React from 'react';

function ReviewListComponent() {

    useEffect(() => {


    }, []);

    let [Open, setOpen] = useState(false);

    const reviewList = () => {
        let url = "http://192.168.40.32:8100/soyo/review/list";
        axios({
            url,
            method: "get"
        }).then(() => { }).catch(() => { });
    };

    $(() => {
        // $("#reviewCol").hide();
        $("#trOb").on("click", () => {
            $("#reviewCol").click();
        })
        $("#reviewCol").on("click", (e) => {
            e.stopPropagation();
            console.log("클릭")
        })
    })
    const reviewOpen = (e) => {

        
    };


    return (
        <div>
            <h2>리뷰 목록</h2>
            <br /><br />
            <table>
                <thead>
                    <tr>
                        <th>상품</th>
                        <th>상품명</th>
                        <th>리뷰제목</th>
                        <th>게시날짜</th>
                        <th>상태</th>
                        <th>별점</th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="trOb">

                        <td>
                            사진
                            <button data-toggle="collapse" data-target="#demo" id="reviewCol">
                                s
                            </button>

                            <div id="demo" className="collapse">
                                Lorem ipsum dolor text....
                            </div>
                        </td>
                        <td>상품이름</td>
                        <td>리뷰</td>
                        <td>날짜</td>
                        <td>Y</td>
                        <td>***</td>
                    </tr>
                </tbody>
            </table>

        </div>
    );

}
export default ReviewListComponent;