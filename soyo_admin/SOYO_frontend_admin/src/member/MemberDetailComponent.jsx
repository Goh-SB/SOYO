import { useParams, useNavigate } from 'react-router-dom';
import { useEffect } from 'react';
import axios from 'axios';
import './MemberDetailComponent.css';
import React from 'react';

function MemberDetailComponent() {

    let memberId = useParams().memberId;
    let navigate = useNavigate();
    // console.log(memberId);

    useEffect(() => {
        memberDetail();
    }, []);

    const memberDetail = () => {

        let url = "http://192.168.40.32:8100/soyo/member/detail/" + memberId;

        axios({
            url,
            method: "get"

        }).then((response) => {
            // console.log(response.data);
            const member = response.data;

            document.getElementById("memberId").value = member.memberId;
            document.getElementById("memberName").value = member.memberName;
            if (member.gender == 'F') {
                document.getElementById("genderF").checked = true;
            } else if (member.gender == 'M') {
                document.getElementById("genderM").checked = true;
            } else {
                document.getElementById("genderX").checked = true;
            }
            document.getElementById("birthDate").value = member.birthDate;
            document.getElementById("email").value = member.email;
            document.getElementById("phone").value = member.phone;
            document.getElementById("address").value = member.address;
            document.getElementById("enrollDate").value = member.enrollDate;



        }).catch(() => {
            console.log("회원 상세 조회 실패");
        });
    }

    const updateMember = (e) => {
        e.preventDefault();

        let memberId = document.querySelector("#memberId").value;
        let memberName = document.querySelector("#memberName").value;
        let gender = document.querySelector('input[name="gender"]:checked')?.value || '';
        let birthDate = document.querySelector("#birthDate").value;
        let phone = document.querySelector("#phone").value;
        let address = document.querySelector("#address").value;
        let email = document.querySelector("#email").value;

        let url = "http://192.168.40.32:8100/soyo/member/updateForm";
        axios({
            url,
            method: "post",
            data: {
                memberId,
                memberName,
                gender,
                birthDate,
                phone,
                address,
                email
            }
        }).then((response) => {
            alert(response.data);
            memberDetail();
        }).catch(() => {
            console.log("회원 정보 수정 실패");
        })

    };

    return (
        <div>
            <h2>회원 상세 페이지</h2>

            <br /><br />

            <form id="member-form">
                <table id="member-table">
                    <tbody>
                        <tr>
                            <th>회원 아이디</th>
                            <td>
                                <input type="text" id="memberId" readOnly />
                            </td>
                        </tr>
                        <tr>
                            <th>회원 이름</th>
                            <td>
                                <input type="text" className="form-control" id="memberName" />
                            </td>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <td>
                                <div className="form-check-inline">
                                    <label className="form-check-label">
                                        <input type="radio" className="form-check-input" id="genderM" name="gender" value="M" /> 남
                                    </label>
                                </div>
                                <div className="form-check-inline">
                                    <label className="form-check-label">
                                        <input type="radio" className="form-check-input" id="genderF" name="gender" value="F" /> 여                                </label>
                                </div>
                                <div className="form-check-inline">
                                    <label className="form-check-label">
                                        <input type="radio" className="form-check-input" id="genderX" name="gender" value="" /> 선택안함
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td>
                                <input type="date" id="birthDate" />
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input type="email" className="form-control" id="email" />
                            </td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td>
                                <input type="text" className="form-control" id="phone" />
                            </td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>
                                <input type="text" className="form-control" id="address" />
                            </td>
                        </tr>
                        <tr>
                            <th>가입일</th>
                            <td>
                                <input type="text" id="enrollDate" readOnly />
                            </td>
                        </tr>
                        <tr>
                            <td>

                            </td>
                        </tr>
                    </tbody>
                </table>
                <div align="center">
                    <button type="submit" onClick={updateMember}
                            id="updateBtn">
                        수정하기
                    </button> &nbsp;

                    <button onClick={() => { navigate("/member/list") }}
                            id="listBtn">
                        목록가기
                    </button>
                </div>



            </form>
        </div>

    );

}

export default MemberDetailComponent;