import axios from 'axios';
import React from 'react';
import { Chart1, Chart2, Chart3} from './dashboard/Chart';
import './Home.css';

function Home (props) {

    // 실행 구문
    let loginUser = props.loginUser;
    let setLoginUser = props.setLoginUser;

    // 로그인 버튼 클릭 시 실행 함수
    const login = (e) => {

        e.preventDefault();

        // 사용자가 입력한 아이디, 비밀번호 뽑기
        let memberId = document.getElementById("memberId").value;
        let memberPwd = document.getElementById("memberPwd").value;

        let url = "http://192.168.40.32:8100/soyo/auth/login";

        axios({
            url,
            method : "post",
            data : {
                memberId,
                memberPwd
            }
        }).then((response) => {

            // console.log(response.data);

            if(response.data == "") {
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
    const logout = () => {

        alert("로그아웃 되었습니다.");

        // sessionStorage 에 담긴 로그인한 회원 정보 제거
        sessionStorage.removeItem("loginUser");

        // 반대로 로그인 전 화면이 보여져야 하므로
        setLoginUser(null);

    };

    // return 구문
    if(loginUser != null) {
        // 로그인 후에 보여질 화면
        return (
            <div>

                <h2>관리자님 환영합니다!</h2>

                <br />

                <button id='logout-btn' className="btn btn-primary btn-bg btn-block"
                        onClick={ logout }>
                    로그아웃
                </button>

                <br /><br />

                <Chart1 />
                <br />
                <Chart3 />
                <br />
                
                <Chart2 />

            </div>
        );
    } else {

    // 로그인 전에 보여질 화면
    return (
            <div>
                <h4 style={{ color: 'gray', fontWeight: 'bold', marginLeft: '300px' }}>
                    ● 관리자 로그인
                </h4>
                <br /><br />

                <form>

                    <table className="form">

                        <tbody>
                            <tr>
                                <th>아이디</th>
                                <td>
                                    <input type="text" id="memberId" />
                                </td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td>
                                    <input type="password" id="memberPwd" />
                                </td>
                            </tr>
                        </tbody>

                    </table>

                    <br /><br />

                    <div align="center">

                        <button type="submit" onClick={ login }
                                className="btn btn-primary btn-bg">
                            로그인
                        </button>

                        <br /><br /><br />

                        <h5>디자인은 추후 다듬을 예정입니다.</h5>

                    </div>

                </form>

            </div>
        );
    }
}
export default Home;