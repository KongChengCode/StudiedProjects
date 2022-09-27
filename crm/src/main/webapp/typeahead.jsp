<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <!--  JQUERY -->
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <!--  BOOTSTRAP -->
    <link rel="stylesheet" type="text/css" href="jquery/bootstrap_3.3.0/css/bootstrap.min.css">
    <script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <!--TYPEAHEAD-->
    <script type="text/javascript" src="jquery/bs_typeahead/bootstrap3-typeahead.min.js"></script>
    <title>演示自动补全插件</title>

    <script type="text/javascript">
        $(function () {
            //当容器加载完成之后，对容器调用工具函数
            $("#customerName").typeahead({
                source:['京东商城','阿里巴巴','百度网络科技公司','字节跳动','动力节点']
            });

            $("#myText").typeahead({
                source:function (jquery, process) {
                    //每次键盘弹起，都自动触发本函数；我们可以向后台送请求，查询客户表中所有的名称，把客户名称以[]字符串形式返回前台，赋值给source
                    //process：是个函数，能够将['xxx','xxxxx','xxxxxx',.....]字符串赋值给source，从而完成自动补全
                    //jquery：在容器中输入的关键字
                    alert("hello")
                    $.ajax({
                        url:"workbench/transaction/queryCustomerName.do",
                        type:'post',
                        data:{
                            name:jquery
                        },
                        dataType:'json',
                        success:function (data) {
                            //['xxx','xxxxxx','xxxxxxxxxxxx','xxxxxxxxx']
                            process(data);
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
<input type="text" id="customerName"><br>
<input type="text" id="myText">

</body>
</html>
