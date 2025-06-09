import ReactQuill from 'react-quill-new';
import 'react-quill-new/dist/quill.snow.css';
import './ProductListComponent.css';
import { useNavigate } from 'react-router-dom';
import { useEffect, useState } from 'react';
import axios from 'axios';

function ProductListComponent() {

    let navigate = useNavigate();

    let [ cpage, setCpage ] = useState(1);


    const productList = () => {
        
    };

    useEffect(() => {
        let url = "http://localhost:8100/soyo/product/list";
        axios({
            url,
            method : "get",
            data : {
                cpage
            }
        }).then((response) => {
            console.log(response.data);




        }).catch(() => {
            console.log("상품목록 조회 통신 실패");
        });
    }, [])


    return (

        <div>

            <h2 align="center">상품 조회</h2>

            <br /><br />
            <div id="product-Write">
                <button onClick={ () => { navigate("/product/enrollForm")}}>
                    상품 등록
                </button>
            </div>
            <br /><br />
            <table align="center" id="product-table">
                <tbody>
                    <tr>
                        <td>
                            <div className="product-Object">
                                <img src="../resources/kuromi.png" className="product-img" width="150" height="200"
                                            onClick={ () => {navigate("/product/productNo")} } />
                                <br /><br />
                                <div align="center">
                                    상품설명
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div className="product-Object">
                                <img src="../resources/kuromi.png" className="product-img" width="150" height="200" />
                                <br /><br />
                                <div align="center">
                                    상품설명
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div className="product-Object">
                                <img src="../resources/kuromi.png" className="product-img" width="150" height="200" />
                                <br /><br />
                                <div align="center">
                                    상품설명
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div className="product-Object">
                                <img src="../resources/kuromi.png" className="product-img" width="150" height="200" />
                                <br /><br />
                                <div align="center">
                                    상품설명
                                </div>

                            </div>
                        </td>
                    </tr>

                </tbody>

            </table>

        </div>

    );


}

export default ProductListComponent;