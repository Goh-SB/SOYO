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
                        onClick={() => { navigate("/delivery") }}>
                        배송정보
                    </div>

                </div>

            </div>

            <div id="top-menu">
                <div id="top-menu-icon">
                    <div className="header_icons">
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