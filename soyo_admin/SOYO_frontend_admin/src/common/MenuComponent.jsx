import './MenuComponent.css'
import React from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useState,useEffect } from 'react';

function MenuComponent(props) {
    let navigate = useNavigate();

    let loginUser = props.loginUser

    let setLoginUser = props.setLoginUser

    let [logoutBtn , setLogoutBtn] = useState('');

    useEffect(() => {
        setLogoutBtn(logoutB()); 
    }, [loginUser])

    let hideSideMenu = () => {

        let sideMenu = document.getElementById("side-menu");

        if (sideMenu.style.left == "20px") {
            sideMenu.style.left = "-400px";
        } else {
            sideMenu.style.left = "20px";
        }

    };

    let chatAlram = () => {
        location.href = "https://dashboard.tawk.to/#/chat";
    };

    const logout = () => {
        alert("로그아웃 되었습니다.");

        // sessionStorage 에 담긴 로그인한 회원 정보 제거
        sessionStorage.removeItem("loginUser");

        // 반대로 로그인 전 화면이 보여져야 하므로
        setLoginUser(null);
    }

    const logoutB = () => {
        if (loginUser != null) {
            return (
                <span className="material-symbols-outlined"
                    onClick={logout}
                    id="logout">
                    logout
                </span>
            );
        }
    }

    return (
        <div id="background">
            <div id="wrap">
                <div id="side-menu" style={{ left: "-400px" }}>
                    <br />
                    <img id="logo" width="130" height="130" src="../../resources/side_menu-logo.png"
                        onClick={() => { navigate("/") }} />
                    <hr />
                    <br />
                    <div className='side-menu-content link-menu'
                        onClick={() => { navigate("/") }}>
                        메인화면
                    </div>
                    <div className='side-menu-content link-menu'
                        onClick={() => { navigate("/member/list") }}>
                        회원정보
                    </div>
                    <div className='side-menu-content'
                        onClick={() => { navigate("/product/list") }}>
                        상품정보
                    </div>
                    <div className='side-menu-content'
                        onClick={() => { navigate("/review/list") }}>
                        리뷰 관리
                    </div>
                    <div className='side-menu-content link-menu'
                        onClick={() => { navigate("/notice/list") }}>
                        공지사항
                    </div>
                    <div className='side-menu-content'
                        onClick={() => { navigate("/order/list") }}>
                        구매내역
                    </div>
                    <div className='side-menu-content'
                        onClick={() => { navigate("/delivery/list") }}>
                        배송정보
                    </div>
                </div>
            </div>

            <div id="top-menu">
                <div id="top-menu-icon">
                    <div className="header_icons">
                        {logoutBtn}
                        <a href="http://192.168.40.17:8888/soyo/" target="_blank">
                            <span className="material-symbols-outlined"
                                id="go-shop">
                                store
                            </span>
                        </a>
                        <span className="material-symbols-outlined"
                            onClick={hideSideMenu}
                            id="hide-side-menu">
                            menu
                        </span>
                        <span className="material-symbols-outlined"
                            onClick={chatAlram}
                            id="chat-alram">
                            notifications
                        </span>
                    </div>
                    <span>
                        <img src="../../resources/soyo-logo.png"
                            id="mainLogo" onClick={() => { navigate("/") }} />
                        <h2>SOYO 관리자 페이지 입니다.</h2>
                    </span>

                </div>
            </div>
        </div>
    );

}

export default MenuComponent;