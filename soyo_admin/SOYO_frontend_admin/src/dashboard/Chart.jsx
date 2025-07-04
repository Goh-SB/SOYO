import { useEffect, useState } from 'react';
import React from 'react';
import './Chart.css';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';



function Chart1() {
    let navigate = useNavigate();
    useEffect(() => {
        chart1();
    }, []);

    const chart1 = () => {
        // -- 1번 그래프
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawBar2);



        let url = "http://192.168.40.32:8100/soyo/member/chart1";
        axios({
            url,
            method: "get",
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response) => {
            const data = response.data;
            const chartData = [['분기별 회원가입', '가입 수']];

            data.forEach(item => {
                const date = new Date(item.QUARTER_START);
                const label = `${date.getFullYear()}년 ${date.getMonth() + 1}월`;
                chartData.push([label, item.TOTAL]);
            });

            google.charts.setOnLoadCallback(() => drawBar2(chartData));


        }).catch(() => { });

        const setQuery = (data) => {
            const chartData = [['분기 시작일', '가입 수']];  // 헤더

            data.forEach(item => {
                // QUARTER_START가 ISO 날짜 형식이므로 new Date로 변환 후 연/월 추출
                const date = new Date(item.QUARTER_START);
                const label = `${date.getFullYear()}년 ${date.getMonth() + 1}월`;
                chartData.push([label, item.TOTAL]);
            });

            drawBar2(chartData);
        };


        function drawBar2(chartData) {

            // 그래프 상에 표현할 데이터
            var data = google.visualization.arrayToDataTable(chartData);

            // 그래프 그리기 옵션
            var options = {
                chart: {
                    title: '월별 회원가입 현황',
                    subtitle: '현재',
                },
                bars: 'vertical',
                vAxis: { format: 'decimal' },
                height: 300,
                width: 1000,
                colors: ['#1b9e77', '#d95f02']
            };

            // 그래프를 그려넣을 요소 선택 후 데이터, 옵션을 매개변수로 넣어 그리기
            var chart = new google.charts.Bar(document.getElementById('chart_div2'));
            chart.draw(data, google.charts.Bar.convertOptions(options));
        }

    };

    return (
        <div id="chart_div2_area">

            <div id="chart_div2"></div>
        </div>
    );
}

function Chart2() {
    let [men, setMen] = useState(0);
    let [women, setWomen] = useState(0);
    let [noGender, setNoGender] = useState(0);

    // ----- 원형 그래프
    useEffect(() => {
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(() => {
            let url = "http://192.168.40.32:8100/soyo/member/percent";
            axios({
                url,
                method: "get"
            }).then((response) => {
                setMen(Number(response.data.men));
                setWomen(Number(response.data.women));
                setNoGender(Number(response.data.noGender));
                
            })
        });
    }, []);

    useEffect(() => {
        if(men > 0){
            drawPie();
        }
    }, [men, women, noGender])

    function drawPie() {
        // 그래프 상에 표현할 데이터
        var data = google.visualization.arrayToDataTable([
            ['회원 성별', '비율'],
            ['남성', men],
            ['여성', women], 
            ['성별없음', noGender]
        ]);

        // 그래프 그리기 옵션
        var options = {
            title: '회원 성별',
            height: 300,
            width: 400,
        };

        // 그래프를 그려넣을 요소 선택 후 데이터, 옵션을 매개변수로 넣어 그리기
        var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
        chart.draw(data, options);
    }


    return (
        <div id="chart_div3_area">
            <div id="chart_div3">

            </div>

        </div>
    );



}


function Chart3() {
    let navigate = useNavigate();

    const [memberData, setMemberData] = useState(0);

    useEffect(() => {
        chart3Data();

    }, [])

    const chart3Data = () => {
        let url = "http://192.168.40.32:8100/soyo/member/chart3";
        axios({
            url,
            method: "get",
            headers: {
                Authorization: `Bearer ${sessionStorage.getItem("loginUser")}`
            }
        }).then((response) => {
            setMemberData(response.data);
        }).catch(() => { })
    };



    return (
        <div className="chart-card" >
            <div className="chart-card-block">
                <div align="center" className="chart-title" onClick={() => { navigate("/member/list") }}>
                    회원 가입수
                    <br />
                    <div align="center" className="chart-content">
                        {memberData}
                    </div>
                </div>
            </div>
        </div>
    );

}

function Chart4() {
    let navigate = useNavigate();
    useEffect(() => {
        productCount();
    }, [])
    const productCount = () => {
        let url = "http://192.168.40.32:8100/soyo/product/chartData";
        axios({
            url,
            method: "get"
        }).then((response) => {
            document.getElementById("chart4").innerText = response.data;
        })

    }
    return (

        <div className="chart-card">
            <div className="chart-card-block" onClick={() => { navigate("/product/list") }}>
                <div className="chart-title" align="center">
                    상품 종류
                    <div align="center" id="chart4" className="chart-content">

                    </div>
                </div>
            </div>

        </div>
    );
}


function Chart5() {
    let navigate = useNavigate();
    useEffect(() => {
        cashData();
    }, [])
    const cashData = () => {
        let url = "http://192.168.40.32:8100/soyo/product/cashData";
        axios({
            url,
            method: "get"
        }).then((response) => {

            document.getElementById("chart5").innerText = Number(response.data).toLocaleString('ko-KR') + '원';
        })
    }
    return (
        <div className="chart-card">
            <div className="chart-card-block" onClick={() => { navigate("/delivery/list") }}>
                <div className="chart-title" align="center">
                    총 매출 액
                    <div align="center" id="chart5" className="chart-content">

                    </div>
                </div>
            </div>

        </div>
    );
}

function Chart6() {
    let navigate = useNavigate();
    useEffect(() => {
        orderCount();
    }, [])

    const orderCount = () => {
        let url = "http://192.168.40.32:8100/soyo/product/orderData";
        axios({
            url,
            method: "get"
        }).then((response) => {
            document.getElementById("chart6").innerText = response.data + '건';
        })
    }

    return (
        <div className="chart-card">
            <div className="chart-card-block" onClick={() => { navigate("/delivery/list") }}>
                <div className="chart-title" align="center" >
                    주문 량
                    <div align="center" id="chart6" className="chart-content">

                    </div>
                </div>
            </div>

        </div>
    );

}

export { Chart1, Chart2, Chart3, Chart4, Chart5, Chart6 };