import axios from 'axios';
import React from 'react';
import { Chart1, Chart2, Chart3, Chart4, Chart5, Chart6 } 
from './dashboard/Chart';
import './Home.css';
import { useState, useEffect } from 'react';

function Home(props) {

    // 실행 구문
    let loginUser = props.loginUser;
    let setLoginUser = props.setLoginUser;

    useEffect(()=> {

    }, [])

    // 차트 값을 가져오는 함수
   


    // 로그인 버튼 클릭 시 실행 함수
    const login = (e) => {

        e.preventDefault();

        // 사용자가 입력한 아이디, 비밀번호 뽑기
        let memberId = document.getElementById("memberId").value;
        let memberPwd = document.getElementById("memberPwd").value;

        let url = "http://192.168.40.32:8100/soyo/auth/login";

        axios({
            url,
            method: "post",
            data: {
                memberId,
                memberPwd
            }
        }).then((response) => {

            // console.log(response.data);

            if (response.data == "") {
                // > 로그인 실패

                alert("관리자 로그인에 실패했습니다.");

            } else {
                // > 로그인 성공

                alert("관리자 로그인에 성공했습니다.");

                sessionStorage.setItem("loginUser", response.data);
                // > sessionStorage 에 키 + 밸류 형태로 데이터를 담는 메서드
                //   sessionStorage.setItem("키값", "밸류값");

                // 로그인 후의 화면이 보여져야 함. (비동기식 렌더링)
                setLoginUser(response.data);
            }

        }).catch(() => {

            console.log("ajax 통신 실패")
        });

    };

    // 로그아웃 버튼 클릭 시 실행할 함수
    // const logout = () => {

    //     alert("로그아웃 되었습니다.");

    //     // sessionStorage 에 담긴 로그인한 회원 정보 제거
    //     sessionStorage.removeItem("loginUser");

    //     // 반대로 로그인 전 화면이 보여져야 하므로
    //     setLoginUser(null);

    // };

    // return 구문
    if (loginUser != null) {
        // 로그인 후에 보여질 화면
        return (
            <div>
                {/*
                <h2 id="h2">관리자님 환영합니다!</h2>
                */}
                
                <br />

                {/* <button id='logout-btn' className="btn btn-primary btn-bg btn-block"
                        onClick={ logout }>
                    로그아웃
                </button> */}

                <br /><br />
                <div id="chart-card-area">
                    <Chart3 />
                    <Chart4 />
                    <Chart5 />
                    <Chart6 />
                </div>
                <div id="chart1_2">
                    <Chart1 />
                    <Chart2 />
                </div>
                <br />
            </div>
        );
    } else {

        // 로그인 전에 보여질 화면
        return (
            <div className="login-container">
                <div className="login-card">
                    <div className="login-header">
                        <span className="material-icons login-icon">admin_panel_settings</span>
                        <h2>관리자 로그인</h2>
                    </div>
                    <form className="login-form">
                        <div className="input-group">
                            <label htmlFor="memberId" style={{fontSize: '18px'}}>아이디</label>
                            <div className="input-wrapper">
                                <span className="material-icons input-icon">person</span>
                                <input type="text" id="memberId" placeholder="아이디를 입력하세요" autoComplete="username" />
                            </div>
                        </div>
                        <div className="input-group">
                            <label htmlFor="memberPwd" style={{fontSize: '18px'}}>비밀번호</label>
                            <div className="input-wrapper">
                                <span className="material-icons input-icon">lock</span>
                                <input type="password" id="memberPwd" placeholder="비밀번호를 입력하세요" autoComplete="current-password" />
                            </div>
                        </div>
                        <button type="submit" onClick={login} className="login-btn">
                            로그인
                        </button>
                    </form>
                </div>
            </div>
        );
    }
}
export default Home;