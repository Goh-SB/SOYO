import { useState } from 'react'
import './App.css'
import { Route, Routes, } from 'react-router-dom';
import MenuComponent from './common/MenuComponent';
import Home from './Home';
import MemberListComponent from './member/MemberListComponent';
import NoticeListComponent from './notice/NoticeListComponent';
import MemberDetailComponent from './member/MemberDetailComponent';
import NoticeDetailComponent from './notice/NoticeDetailComponent';
import NoticeEnrollFormComponent from './notice/NoticeEnrollFormComponent';
import DeliveryComponent from './delevery/DeliveryComponent';
import ProductListComponent from './product/ProductListComponent';
import ProductEnrollFormComponent from './product/ProductEnrollFormComponent';
import DeliveryDetailComponent from './delevery/DeliveryDetailComponent';
import OrderListComponent from './order/OrderListComponent';
import ProductDetailComponent from './product/ProductDetailComponent';

import OrderDetailComponent from './order/OrderDetailComponent';

function App() {

  // 실행 구문

  // sessionStorage 에 있던 값을 뽑아서 state 변수로 셋팅
  let [loginUser, setLoginUser]
      = useState(sessionStorage.getItem("loginUser"));

  // return 구문
  return (
    <div id="main">
     
      {/* 메뉴 */}
      <MenuComponent />
      {/* content */}
      <br />
      <Routes>
        <Route path="/" element={<Home loginUser={ loginUser } setLoginUser={ setLoginUser } />} />
        <Route path="/member/list" element={<MemberListComponent />} />
        <Route path="/notice/list" element={<NoticeListComponent />} />
        <Route path="/member/detail/:memberId" element={<MemberDetailComponent />} /> 
        <Route path="/notice/detail/:noticeNo" element={<NoticeDetailComponent />} />
        <Route path="/notice/enrollForm" element={<NoticeEnrollFormComponent /> } />
        <Route path="/delivery" element={<DeliveryComponent/>} />
        <Route path="/product/list" element={ <ProductListComponent/>} />
        <Route path="/delivery/:orderNo" element={<DeliveryDetailComponent/>} />
        <Route path="/product/enrollForm" element={ <ProductEnrollFormComponent /> }/>
        <Route path="/order/list" element={<OrderListComponent/>}/>
        <Route path="/product/detail" element={<ProductDetailComponent />} />
        <Route path="/order/:memberId/:productNo" element={<OrderDetailComponent />} />
      </Routes>
      {/* footer? */}



      <div>

       
      </div>

    </div>
  )
}

export default App
