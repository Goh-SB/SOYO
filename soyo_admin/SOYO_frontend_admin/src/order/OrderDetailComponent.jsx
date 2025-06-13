import OrderDetailCancelComponent from "./OrderDetailCancelComponent";
import OrderDetailMemberComponent from "./OrderDetailMemberComponent";

function OrderDetailComponent(){

    return(
        <div>
            <h2>결제내역 상세정보</h2>

            <br /><br />

            <OrderDetailMemberComponent/>    
            <h3>결제 정보</h3>
            <OrderDetailCancelComponent/>
        </div>
    );
}
export default OrderDetailComponent;