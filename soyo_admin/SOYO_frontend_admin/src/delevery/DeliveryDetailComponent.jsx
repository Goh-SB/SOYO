function DeliveryDetailComponent(){

    // 실행할 구문
    const [delivery,setDelivery]=useState({

        status:''
    });
    const orderNo= useParams().orderNo;
    let navigate = useNavigate();

    useEffect(() => {
    deliveryDetail(); // 딱 한 번만 실행
    }, []); 

    const deliveryDetail = ()=>{

       let url = "http://localhost:8100/soyo/delivery/" + orderNo;

        axios({
            url,
            method: "get"

        }).then((response) => {

            setDelivery(response.data); 
              
        }).catch(() => {
            console.log("ajax 요청 실패");
        });
    }


    return(
        <div>
            <h2>배송정보 상세 조회</h2>

            <br /><br />

                 

            <div align="center">
            
            <table className="table" 
                   style={{ width: "500px" , 
                            border: "1px solid black",
                            borderCollapse: "collapse",
                            marginTop:"30px",
                            marginLeft:"150px",
                            marginRight: "100px",
                             }}
                   align="left">
                <tbody align="center">
                    <tr>
                        <th>수령인</th>
                        <td>{delivery.receiverName}</td>
                    </tr>
                    <tr>
                        <th>주문번호</th>
                        <td>{delivery.orderImpNo}</td>
                    </tr>
                    <tr>
                        <th>배송지</th>
                        <td>
                            {delivery.addressName}
                            {delivery.addressOther}
                        </td>
                    </tr>
                    <tr>
                        <th>배송완료일</th>
                        <td>{delivery.deliveryDate}</td>
                    </tr>
                    <tr>
                        <th>요청사항</th>
                        <td>{delivery.requestMsg}</td>
                    </tr>
                </tbody>
            </table>

            <img src={  delivery.orderStatus == '배송전'
            ? '/img/배송전1.png'
            : delivery.orderStatus == '배송중'
            ? '/img/배송중1.png'
            : '/img/배송완료.png'
            }
            alt="배송 상태 트럭"
            style={{ width: '700px'}}
            />

           
       
            </div>

            <br /><br />

            <h2>배송상품</h2>
            <br /><br />
            <table className="table">
                <thead>
                   <tr align="center">
                        <th width="250px">이미지</th>   
                        <th width="600px">상품명</th>
                        <th width="130px">구매수량</th>
                        <th>가격</th>                       
                   </tr>
                </thead>
                <tbody>
                   <tr align="center">
                        <th width="250px">이미지1</th>
                        <th width="600px">상품명1</th>
                        <th width="130px"></th>
                        <th>{delivery.totalPrice}</th>                       
                   </tr>
                    <tr align="center">
                        <th width="250px">이미지1</th>
                        <th width="600px">상품명1</th>
                        <th width="130px">구매수량1</th>
                        <th>가격1</th>                       
                   </tr>
                </tbody>
            </table>

        </div>
    );

}
export default DeliveryDetailComponent;