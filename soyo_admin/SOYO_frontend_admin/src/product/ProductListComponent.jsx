import 'react-quill-new/dist/quill.snow.css';
import './ProductListComponent.css';
import { useNavigate, Link } from 'react-router-dom';
import { useEffect, useState } from 'react';
import axios from 'axios';
import React from 'react';

function ProductListComponent() {

    let navigate = useNavigate();

    let [cpage, setCpage] = useState(1);

    let [pageList, setPageList] = useState([]);

    let [dataList, setDataList] = useState([]);

    let [keyword, setKeyword] = useState('');

    let [selectCate, setSelectCate] = useState('모든상품');

    let category = ['모든상품', '남성', '여성', '아동', '악세사리'];

    useEffect(() => {
        if (keyword !== '') {
            searchList();
        } else if (selectCate != '' && selectCate != '모든상품') {
            filterList();
        } else {
            productList();
        }
    }, [keyword, cpage, selectCate])

    const productList = () => {

        let url = "http://192.168.40.32:8100/soyo/product/list";
        axios({
            url,
            method: "get",
            params: {
                cpage
            }
        }).then((response) => {
            // console.log(response.data);
            setState(response.data);

        }).catch(() => {
            console.log("상품목록 조회 통신 실패");
        });

    };


    const setState = (data) => {

        const trArr = data.list.map((item, index) => {
            return (
                <tr key={index}
                    onClick={() => { navigate("/product/detail/" + item.productNo); }}>
                    <td>
                        <div className="product-Object">
                            <img src={`http://192.168.40.32:8100/soyo/resources/product_upfile/${item.productChange}`} className="product-img" width="200" height="250"
                            />
                            <br />
                            <div align="center">
                                {item.productName}
                                <br />

                            </div>

                        </div>
                    </td>
                </tr>
            );
        })

        setDataList(trArr);

        const linkArr = [];

        if (cpage == 1) {
            linkArr.push(
                <Link key="prev" className="btn btn-outline-info btn-sm">
                    &lt;
                </Link>
            );
        } else {
            linkArr.push(
                <Link key="prev" className="btn btn-info btn-sm"
                    to="/product/list" onClick={() => { setCpage(cpage - 1); }}>
                    &lt;
                </Link>
            );
        }


        for (let p = data.pi.startPage; p <= data.pi.endPage; p++) {
            if (cpage == p) {
                linkArr.push(
                    <Link key={p} className="btn btn-outline-info btn-sm">
                        {p}
                    </Link>)
            } else {
                linkArr.push(
                    <Link key={p} className="btn btn-info btn-sm"
                        to="/product/list"
                        onClick={() => { setCpage(p); }}>
                        {p}
                    </Link>
                );
            }

        }

        if (cpage == data.pi.maxPage) {
            linkArr.push(
                <Link key="next" className="btn btn-outline-info btn-sm">
                    &gt;
                </Link>
            );
        } else {
            linkArr.push(
                <Link key="next" className="btn btn-info btn-sm"
                    to="/product/list"
                    onClick={() => { setCpage(cpage + 1); }}>
                    &gt;
                </Link>
            );
        }

        setPageList(linkArr);

    }

    const searchList = () => {

        let url = "http://192.168.40.32:8100/soyo/product/search";
        axios({
            url,
            method: "get",
            params: {
                cpage,
                keyword
            }
        }).then((response) => {
            setState(response.data)
            // console.log(response.data)
        }).catch(() => {
            console.log("검색 통신 실패");
        })

    };

    const searchClick = (e) => {
        e.preventDefault();
        setSelectCate('');
        let searchText = document.getElementById("product-searchText").value;
        setKeyword(searchText);
        setCpage(1);
    }

    const categoryFilter = (e) => {
        let cate = e.target.value;
        setSelectCate(cate);
        // console.log(selectCate)
        setKeyword('');
        setCpage(1);
        document.getElementById("product-searchText").value = '';

    }
    const filterList = () => {
        let url = "http://192.168.40.32:8100/soyo/product/filtering";
        // console.log(selectCate)
        axios({
            url,
            method: "get",
            params: {
                cate : selectCate,
                cpage
            }
        }).then((response) => {
            setState(response.data);
        }).catch(() => {
            console.log("카테고리 필터링 통신 실패");
        })
    }

    return (

        <div>
            <h2>상품 조회</h2>
            <br /><br />
            <div align="center" id="product-searchArea">
                <div id="search-area">
                    <input type="text"
                        placeholder="상품명을 입력하세요"
                        id="product-searchText" />
                    <button onClick={searchClick}
                        id="product-searchBtn">
                        검색
                    </button>
                </div>
                <div id="product-categoryArea">
                    {category.map((item, index) => (
                        <button
                            key={index}
                            onClick={(e) => { categoryFilter(e) }}
                            className="product-categoryBtn"
                            value={item}
                            style={{
                                backgroundColor: selectCate == item ? "#E3E4FA" : "",
                                borderRadius: selectCate == item ? "10px" : ""

                            }}
                        >
                            {item}
                        </button>
                    ))}
                </div>
            </div>

            <div id="product-Write">
                <button onClick={() => { navigate("/product/enrollForm") }}
                    id="product-writeBtn">
                    상품등록
                </button>
            </div>
            <br /><br />
            <table align="center" id="product-table">
                <tbody>
                    {dataList}
                </tbody>

            </table>
            <div align="center">
                {pageList}
            </div>
        </div>

    );


}

export default ProductListComponent;