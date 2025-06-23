import { useEffect, useState } from 'react';
import React from 'react';
import './Chart.css';
import axios from 'axios';


function Chart1() {

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
            method: "get"
        }).then((response) => { const data = response.data;
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
    // ----- 원형 그래프
    useEffect(() => {
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawPie);

        function drawPie() {
            // 그래프 상에 표현할 데이터
            var data = google.visualization.arrayToDataTable([
                ['판매 현황', '비율'],
                ['남성', 19],
                ['여성', 28],
                ['아동', 37],
                ['악세사리', 16]
            ]);

            // 그래프 그리기 옵션
            var options = {
                title: '판매 현황'
            };

            // 그래프를 그려넣을 요소 선택 후 데이터, 옵션을 매개변수로 넣어 그리기
            var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
            chart.draw(data, options);
        }
    }, []);


    return (
        <div id="chart_div3_area">
            <div id="chart_div3"></div>

        </div>
    );



}


function Chart3() {

    const [memberData, setMemberData] = useState(0);

    useEffect(() => {
        chart3Data();

    }, [])

    const chart3Data = () => {
        let url = "http://192.168.40.32:8100/soyo/member/chart3";
        axios({
            url,
            method: "get"
        }).then((response) => {
            setMemberData(response.data);
        }).catch(() => { })
    };



    return (
        <div id="total-member-area" align="right">
            <div id="total-member">
                <span>총 회원 수
                    <br />
                    {memberData}
                </span>
            </div>
        </div>
    );

}



export { Chart1, Chart2, Chart3 };