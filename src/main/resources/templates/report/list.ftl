<html>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- ECharts单文件引入 -->
<script src="https://cdn.bootcss.com/echarts/4.1.0.rc2/echarts.min.js"></script>
<#include "../common/header.ftl">

<body>
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
    <#include "../common/nav.ftl">

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid" id="main" style="height: 400px;">
            报表预留区
        </div>
        <div class="container-fluid" id="main1" style="height: 400px;">
            报表预留区
        </div>
        <div class="container-fluid" id="main2" style="height: 400px;">
            报表预留区
        </div>
    </div>

</div>

<script>
    $(document).ready(function () {
        var shopsList = ${shopsList![]};
        var citysList = ${citysList![]};
        var nameList = ${nameList![]};
        console.log(shopsList)
        console.log(citysList)
        console.log((nameList))
        var tArray = {
            names: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"],
            rows: [5, 20, 40, 10, 10, 20]
        };
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 基于准备好的dom，初始化echarts实例
        var myChart1 = echarts.init(document.getElementById('main1'));
        // 基于准备好的dom，初始化echarts实例
        var myChart2 = echarts.init(document.getElementById('main2'));
        // 指定图表的配置项和数据
        var option = {
            color: ['#3398DB'],
            title: {
                text: '城市下单报表'
            },
            tooltip: {},
            legend: {
                data: ['数据']
            },
            xAxis: {
                data: citysList.names,
                axisLabel: {
                    interval: 0,
                    rotate: 40
                }
            },
            grid: {
                left: '10%',
                bottom: '35%'
            },
            yAxis: {},
            series: [{
                name: '数据',
                type: 'bar',
                data: citysList.rows
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);

        var option1 = {
            color: ['#3398DB'],
            title: {
                text: '商品下单报表'
            },
            tooltip: {},
            legend: {
                data: ['数据']
            },
            xAxis: {
                data: shopsList.names,
                axisLabel: {
                    interval: 0,
                    rotate: 40
                }
            },
            grid: {
                left: '10%',
                bottom: '35%'
            },
            yAxis: {},
            series: [{
                name: '数据',
                type: 'bar',
                data: shopsList.rows
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart1.setOption(option1);

        var option2 = {
            color: ['#3398DB'],
            title: {
                text: '业务员回复报表'
            },
            tooltip: {},
            legend: {
                data: ['数据']
            },
            xAxis: {
                data: nameList.names,
                axisLabel: {
                    interval: 0,
                    rotate: 40
                }
            },
            grid: {
                left: '10%',
                bottom: '35%'
            },
            yAxis: {},
            series: [{
                name: '数据',
                type: 'bar',
                data: nameList.rows
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart2.setOption(option2);
    });
</script>
</body>
</html>