<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%-- <base href="<%=basePath%>"> --%>
<title>ECharts</title>
<script src="js/esl.js"></script>
<script src="js/jquery-2.2.4.js"></script>
</head>

<body>
	<div id="main" style="height:400px;width:100%"></div>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths:{ 
                'echarts' : 'js/echarts',
                'echarts/chart/bar' : 'js/echarts'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
            ],
            drewEcharts
        );
         function drewEcharts(ec) {
                
                console.log("1");
                // 基于准备好的dom，初始化echarts图表
                myChart = ec.init(document.getElementById('main')); 
                console.log("2");
                var option = {
                    tooltip: {
                        show: true
                    },
                    legend: {
                        data:['次数']
                    },
                    xAxis : [
                        {
                            type : 'category',
                            axisLabel: { rotate:30, margin: 2, textStyle: { color: '#000', fontWeight: 'bold',fontFamily:'宋体'} },
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            "name":"次数",
                            "type":"bar",
                            
                        }
                    ]
                };
                //加载数据
                loadDATA(option);
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            
        }
        function loadDATA(option){
            $.ajax({
               type : "post",
               async : false, //同步执行
               url : "bar.do",
               data : {},
               dataType : "json", //返回数据形式为json
               success : function(result) {
                          if (result) {
                                 //初始化option.xAxis[0]中的data
                                  option.xAxis[0].data=[];
                                  for(var i=0;i<result.length;i++){
                                    option.xAxis[0].data.push(result[i].name);
                                  }
                                  //初始化option.series[0]中的data
                                  option.series[0].data=[];
                                  for(var i=0;i<result.length;i++){
                                    option.series[0].data.push(result[i].num);
                                  }
                           }
                        }
            });       
       }
    </script>
</body>
</html>
