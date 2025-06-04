import { useEffect } from 'react';


function Chart1() {

    useEffect(() => {
        // -- 1번 그래프
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawBar2);

        function drawBar2() {
            // 그래프 상에 표현할 데이터
            var data = google.visualization.arrayToDataTable([
                ['월', '매출(원)', '순이익(원)'],
                ['1', 1000000, 700000],
                ['2', 1170000, 830000],
                ['3', 660000, 570000],
                ['4', 1030000, 990000],
                ['5', 360000, 270000],
                ['6', 830000, 790000],
                ['7', 1470000, 1250000],
                ['8', 860000, 700000],
                ['9', 1200000, 1100000],
                ['10', 660000, 240000],
                ['11', 1720000, 1530000],
                ['12', 500000, 488000]
            ]);

            // 그래프 그리기 옵션
            var options = {
                chart: {
                    title: '월별 매출 현황',
                    subtitle: '2023년',
                },
                bars: 'vertical',
                vAxis: { format: 'decimal' },
                height: 300,
                colors: ['#1b9e77', '#d95f02']
            };

            // 그래프를 그려넣을 요소 선택 후 데이터, 옵션을 매개변수로 넣어 그리기
            var chart = new google.charts.Bar(document.getElementById('chart_div2'));
            chart.draw(data, google.charts.Bar.convertOptions(options));
        }

    }, []);



    return (
        <div>

            <div id="chart_div2"></div>
        </div>
    );
}

function Chart2() {
    // ----- 2번 그래프
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
        <div>
            <div id="chart_div3"></div>

        </div>
    );



}



export { Chart1, Chart2 };