import './MenuComponent.css'
import { Link, useNavigate } from 'react-router-dom';

function MenuComponent() {
    let navigate = useNavigate();
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


    return (
        <div id="background">
            <div id="wrap">
                <div id="side-menu" style={{ left: "-400px" }}>
                    <img id="logo" width="60" height="60" src="../../resources/soyo-logo.png"
                        onClick={() => { navigate("/") }} />
                    <div className='side-menu-content link-menu'
                        onClick={() => { navigate("/") }}>
                        HOME

                    </div>
                    <div className='side-menu-content link-menu'
                        onClick={() => { navigate("/member/list") }}>
                        회원정보
                    </div>
                    <div className='side-menu-content'>
                        상품 정보
                    </div>
                    <div className='side-menu-content'>
                        문의
                    </div>
                    <div className='side-menu-content link-menu'
                        onClick={() => { navigate("/notice/list") }}>
                        공지사항
                    </div>
                    <div className='side-menu-content'
                        onClick={() => { navigate("/delivery") }}>
                        배송정보
                    </div>

                </div>

            </div>

            <div id="top-menu">
                <div id="top-menu-icon" align="center">
                    <span>
                        <img src="../../resources/soyo-logo.png"
                            id="mainLogo" onClick={() => { navigate("/") }} />

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
                        <h2>SOYO 관리자 페이지 입니다.</h2>
                    </span>

                </div>
            </div>
        </div>
    );

}

export default MenuComponent;