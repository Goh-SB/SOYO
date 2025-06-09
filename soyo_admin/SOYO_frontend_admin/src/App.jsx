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

function App() {


  return (
    <div id="main">
     
      {/* 메뉴 */}
      <MenuComponent />
      {/* content */}
      <br />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/member/list" element={<MemberListComponent />} />
        <Route path="/notice/list" element={<NoticeListComponent />} />
        <Route path="/member/detail/:memberId" element={<MemberDetailComponent />} /> 
        <Route path="/notice/detail/:noticeNo" element={<NoticeDetailComponent />} />
        <Route path="/notice/enrollForm" element={<NoticeEnrollFormComponent /> } />
        <Route path="/delivery" element={<DeliveryComponent/>} />
        <Route path="/product/list" element={ <ProductListComponent/>} />
        <Route path="/delivery/:orderNo" element={<DeliveryDetailComponent/>} />
        <Route path="/product/enrollForm" element={ <ProductEnrollFormComponent /> }/>
      </Routes>
      {/* footer? */}



      <div>

       
      </div>

    </div>
  )
}

export default App
