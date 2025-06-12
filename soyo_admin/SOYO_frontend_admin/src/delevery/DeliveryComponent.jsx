    import { useNavigate } from "react-router-dom";
    import { useState, useEffect } from "react";
    import axios from "axios";

    function DeliveryComponent() {

        let navigate = useNavigate();
        let [dataList, setDataList] = useState([]);

        const selectDelivery = () => {
            let url = "http://localhost:8100/soyo/delivery/list";
            axios({
                url,
                method: "get"
            }).then((response) => {
                console.log(response);
                setDataList(response.data); // 화면에 출력할 데이터 저장
            }).catch(() => {
                console.log("❌ 주문내역 통신 실패");
            });
        };
        const changeStatus =(orderNo,orderStatus)=>{
            let url="http://localhost:8100/soyo/delivery/changeStatus";
            axios({
                url,
                method:"get",
                params : {
                    orderNo,
                    orderStatus
                }
            }).then((response)=>{
                console.log(response);
              
                selectDelivery();
            }).catch(()=>{
                console.log("ajax 통신실패");
            })
        };

        useEffect(() => {
            selectDelivery(); 
        }, []);
        

        return (
            <div>
                <h2>배송 정보</h2>
                <br /><br />
                <table className="table list-table table-hover">
                    <thead>
                        <tr align="center">
                            <th width="100px">주문번호</th>
                            <th width="150px">이름</th>
                            <th width="200px">전화 번호</th>
                            <th width="200px">결제 날짜</th>
                            <th width="200px">배송 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        {dataList.map((delivery, index) => (
                            <tr align="center" key={index} >
                                <td onClick={() => navigate("/delivery/" + delivery.orderNo)}>{delivery.orderNo}</td>
                                <td onClick={() => navigate("/delivery/" + delivery.orderNo)}>{delivery.memberName}</td>
                                <td onClick={() => navigate("/delivery/" + delivery.orderNo)}>{delivery.receiverPhone}</td>
                                <td onClick={() => navigate("/delivery/" + delivery.orderNo)}>{delivery.orderDate}</td>
                                <td>
                                <select
                                value={delivery.orderStatus}
                                onChange={(e) => {
                                    const newStatus = e.target.value;
                                    changeStatus(delivery.orderNo, newStatus);
                                }}
                                >
                                    <option value="배송전">배송전</option>
                                    <option value="배송중">배송중</option>
                                    <option value="배송완료">배송완료</option>
                                </select>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        );
    }
    export default DeliveryComponent;
