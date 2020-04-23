<%@ page import="com.dao.AccessoriesDaoImpl" %>
<%@ page import="com.dao.CoffeeBrewingImpl" %>
<%@ page import="com.dao.CoffeeDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.entities.Accessories" %>
<%@ page import="com.entities.Coffee" %>
<%@ page import="com.entities.CoffeeBrewing" %>
<%--<html>--%>
<%--<title>Welcome to Gourmet Coffee</title>--%>
<%--<body>--%>

<%--<h2>Hello World!</h2>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="mezz">
    <meta name="author" content="mezz">
    <link href="css/css.css" rel="stylesheet">
    <link href="css/chosen.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <link href="css/ie.css" rel="stylesheet" type="text/css" >
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <![endif]-->
    <!--[if lte IE 6]><meta http-equiv="refresh" content="0;url=IE6/IE6.html"><![endif]-->
    <title></title>
    <style>
        table.table1{
            font-family: "Trebuchet MS", sans-serif;
            font-size: 16px;
            font-weight: bold;
            line-height: 1.4em;
            font-style: normal;
            border-collapse:separate;
        }
        .table1 thead th{
            padding:15px;
            color:#fff;
            text-shadow:1px 1px 1px #568F23;
            border:1px solid #93CE37;
            border-bottom:3px solid #9ED929;
            background-color:#9DD929;
            background:-webkit-gradient(
                    linear,
                    left bottom,
                    left top,
                    color-stop(0.02, rgb(123,192,67)),
                    color-stop(0.51, rgb(139,198,66)),
                    color-stop(0.87, rgb(158,217,41))
            );
            background: -moz-linear-gradient(
                    center bottom,
                    rgb(123,192,67) 2%,
                    rgb(139,198,66) 51%,
                    rgb(158,217,41) 87%
            );
            -webkit-border-top-left-radius:5px;
            -webkit-border-top-right-radius:5px;
            -moz-border-radius:5px 5px 0px 0px;
            border-top-left-radius:5px;
            border-top-right-radius:5px;
        }
        .table1 thead th:empty{
            background:transparent;
            border:none;
        }
        .table1 tbody th{
            color:#fff;
            text-shadow:1px 1px 1px #568F23;
            background-color:#9DD929;
            border:1px solid #93CE37;
            border-right:3px solid #9ED929;
            padding:0px 10px;
            background:-webkit-gradient(
                    linear,
                    left bottom,
                    right top,
                    color-stop(0.02, rgb(158,217,41)),
                    color-stop(0.51, rgb(139,198,66)),
                    color-stop(0.87, rgb(123,192,67))
            );
            background: -moz-linear-gradient(
                    left bottom,
                    rgb(158,217,41) 2%,
                    rgb(139,198,66) 51%,
                    rgb(123,192,67) 87%
            );
            -moz-border-radius:5px 0px 0px 5px;
            -webkit-border-top-left-radius:5px;
            -webkit-border-bottom-left-radius:5px;
            border-top-left-radius:5px;
            border-bottom-left-radius:5px;
        }
        .table1 tfoot td{
            color: #9CD009;
            font-size:32px;
            text-align:center;
            padding:10px 0px;
            text-shadow:1px 1px 1px #444;
        }
        .table1 tfoot th{
            color:#666;
        }
        .table1 tbody td{
            padding:10px;
            text-align:center;
            background-color:#DEF3CA;
            border: 2px solid #E7EFE0;
            -moz-border-radius:2px;
            -webkit-border-radius:2px;
            border-radius:2px;
            color:#666;
            text-shadow:1px 1px 1px #fff;
        }

    </style>
    <style type="text/css">
        /*首先第一步就是隐藏原来的复选框*/
        .regular-checkbox {
            display: none;
        }
        /*第二部定义现在复选框样式*/
        .regular-checkbox + label {
            position: relative;
            display: inline-block;
            /*lable是内联元素所以需要加inline-block*/
            padding: 7px;
            /*设置复选框大小*/
            background-color: #fafafa;
            /*设置背景颜色*/
            border-radius: 3px;
            /*复选框border*/
            border: 1px solid #CACACA;
            box-shadow: 0 1px 3px rgba(0,0,0,0.5);
            /*创建的阴影效果  这里需要了解box-shadow的属性，前三个值分别是
                阴影离开横方向的距离   :offset-x
                阴影离开纵方向的距离   ：offset-y
                阴影的模糊半径：
                阴影的颜色 ：
            */
        }
        /*第三部分做一个active的效果*/
        .regular-checkbox + label:active, .regular-checkbox + label:checked + label:active {
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }
        /*选中之后的样式*/
        .regular-checkbox:checked + label {
            background-color: #E9ECEE;
            box-shadow: 0 1px 2px rgba(0,0,0,0.05);
        }
        /*选中后的效果*/
        .regular-checkbox:checked + label:after {
            content: '\2714';
            /*这是一个对勾*/
            position: absolute;
            font-size: 12px;
            /*设置对勾的大小*/
            top: 0px;
            left: 2px;
            /*设置位置的偏向*/
            color: #009900;
            /*设置颜色绿色*/
            font-weight: bold;
            /*设置对勾的粗细*/
        }
    </style>
</head>
<body>
<%
    CoffeeBrewingImpl coffeeBrewing=new CoffeeBrewingImpl();
    CoffeeDaoImpl coffeeDao=new CoffeeDaoImpl();
    AccessoriesDaoImpl accessoriesDao=new AccessoriesDaoImpl();

    ArrayList<Accessories> accessories=accessoriesDao.select();
    ArrayList<Coffee> coffees=coffeeDao.select();
    ArrayList<CoffeeBrewing> coffeeBrewings=coffeeBrewing.select();

//    for(Accessories temp:accessories){
//        out.println(temp+"<br>");
//    }
//    for(Coffee temp:coffees){
//        out.println(temp+"<br>");
//    }
//    for(CoffeeBrewing temp:coffeeBrewings){
//        out.println(temp+"<br>");
//    }
%>
<div class="indexban" style="background-image:url(images/img1.jpg);">
    <div class="wrap">
        <div class="txt"><span class="hd">Welcome to Gourmet Coffee
        Please check the code checkbox under the screen
        </span>
    </div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <h1><b>Here is our list...</b></h1>
        <div class="wrap">

            <div class="apply-form">
                <h1><b>Coffee</b></h1><br>
                <table class="table1">
                    <tr>
                        <th scope="row">Code      </th>
                        <th scope="row">Descrption</th>
                        <th scope="row">Price</th>
                        <th scope="row">Origin</th>
                        <th scope="row">Roast</th>
                        <th scope="row">Flavor</th>
                        <th scope="row">Aroma</th>
                        <th scope="row">Acidity</th>
                        <th scope="row">Body</th>
                        <th scope="row">sold</th>
                    </tr>
                    <%

                        for(Coffee temp:coffees){
                            out.print("<tr>\n");
                            out.print("<td>"+temp.getCode()+"</td>\n");
                            out.print("<td>"+temp.getDescription()+"</td>\n");
                            out.print("<td>"+temp.getPrice()+"</td>\n");
                            out.print("<td>"+temp.getOrigin()+"</td>\n");
                            out.print("<td>"+temp.getRoast()+"</td>\n");
                            out.print("<td>"+temp.getFlavor()+"</td>\n");
                            out.print("<td>"+temp.getAroma()+"</td>\n");
                            out.print("<td>"+temp.getAcidity()+"</td>\n");
                            out.print("<td>"+temp.getBody()+"</td>\n");
                            out.print("<td>"+temp.getSold()+"</td>\n");
                            out.print("</tr>\n");
                        }

                    %>
                </table>

                <h1><b>Coffee Brewings</b></h1><br>
                <table class="table1">
                    <tr>
                        <th scope="row">Code      </th>
                        <th scope="row">Descrption</th>
                        <th scope="row">Price</th>
                        <th scope="row">Model</th>
                        <th scope="row">waterSupply</th>
                        <th scope="row">numOfCups</th>
                        <th scope="row">sold</th>
                    </tr>
                    <%

                        for(CoffeeBrewing temp:coffeeBrewings){
                            out.print("<tr>\n");
                            out.print("<td>"+temp.getCode()+"</td>\n");
                            out.print("<td>"+temp.getDescription()+"</td>\n");
                            out.print("<td>"+temp.getPrice()+"</td>\n");
                            out.print("<td>"+temp.getModel()+"</td>\n");
                            out.print("<td>"+temp.getWaterSupply()+"</td>\n");
                            out.print("<td>"+temp.getNumOfCups()+"</td>\n");
                            out.print("<td>"+temp.getSold()+"</td>\n");
                            out.print("</tr>\n");
                        }

                    %>
                </table>

                <h1><b>Accessories</b></h1><br>
                <table class="table1">
                    <tr>
                        <th scope="row">Code      </th>
                        <th scope="row">Descrption</th>
                        <th scope="row">Price</th>
                        <th scope="row">sold</th>
                    </tr>
                    <%

                        for(Accessories temp:accessories){
                            out.print("<tr>\n");
                            out.print("<td>"+temp.getCode()+"</td>\n");
                            out.print("<td>"+temp.getDescription()+"</td>\n");
                            out.print("<td>"+temp.getPrice()+"</td>\n");
                            out.print("<td>"+temp.getSold()+"</td>\n");
                            out.print("</tr>\n");
                        }

                    %>
                </table>
            </div>
        </div>

</div>
    <form method="post" action="/calc">

        <%
            for(Coffee temp:coffees){
                out.print("<input type=\"checkbox\" id=\""+temp.getCode()+"\""+" name = \""+"code"+"\""+" value=\""+temp.getCode()+"\""+" class=\"regular-checkbox\" /><label for=\""+temp.getCode()+"\">");
                out.print(temp.getCode());
                out.print("</label>\n");
            }
        %>

        <%
            for(CoffeeBrewing temp:coffeeBrewings){
                out.print("<input type=\"checkbox\" id=\""+temp.getCode()+"\""+" name = \""+"code"+"\""+" value=\""+temp.getCode()+"\""+" class=\"regular-checkbox\" /><label for=\""+temp.getCode()+"\">");
                out.print(temp.getCode());
                out.print("</label>\n");
            }
        %>

        <%
            for(Accessories temp:accessories){
                out.print("<input type=\"checkbox\" id=\""+temp.getCode()+"\""+" name = \""+"code"+"\""+" value=\""+temp.getCode()+"\""+" class=\"regular-checkbox\" /><label for=\""+temp.getCode()+"\">");
                out.print(temp.getCode());
                out.print("</label>\n");
            }
        %>

<%--        <input type="checkbox" id="description" class="regular-checkbox" /><label for="description">description</label>--%>
        <br>
        <input type="submit" name="Submit"  value="BUY NOW!!!">

    </form>
</body>
</html>