import { useParams } from "react-router-dom";
import axios from "axios";
import { useState,useEffect } from "react";

function OrderDetailMemberComponent(){

    const [order,setOrder]=useState({});
    const memberId= useParams().memberId;
    const orderMember = () =>{
    
        let url = "http://localhost:8100/soyo/delivery/memberInfo/"+memberId;

        axios({
            url,
            method : "get"
        }).then((response)=>{
            setOrder(response.data);
        }).catch(()=>{
            console.log("ajax 요청 실패");
        });
    }
    useEffect(()=>{
        orderMember();
    },[]);
    return(
    <div>
        <h3>구매자</h3> 
        
        <table className="table" 
        style={{ width: "500px" , 
                border: "1px solid black",
                borderCollapse: "collapse",
                marginTop:"30px",
            
                marginRight: "100px",
                    }}
        align="left">
         <tbody align="center">
                    <tr>
                        <th>이름</th>
                        <td>{order.memberName}</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>{order.email}</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>{order.phone}</td>
                    </tr>
                    <tr>
                        <th>배송지</th>
                        <td>{order.addressOther}</td>
                    </tr>
                </tbody>

        </table>
    </div>
    );
}
export default OrderDetailMemberComponent;