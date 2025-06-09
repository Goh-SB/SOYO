import ReactQuill from 'react-quill-new';
import 'react-quill-new/dist/quill.snow.css';
import './ProductListComponent.css';

function ProductListComponent() {


    return (

        <div>

            <h2 align="center">상품 조회</h2>

            <br /><br />

            <table align="center">
                <tbody>
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