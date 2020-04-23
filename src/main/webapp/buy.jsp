<%@ page import="com.entities.Coffee" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.entities.CoffeeBrewing" %>
<%@ page import="com.entities.Accessories" %>
<%@ page import="com.dao.CoffeeDaoImpl" %>
<%@ page import="com.dao.CoffeeBrewingImpl" %>
<%@ page import="com.dao.AccessoriesDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: zj
  Date: 2020/4/16
  Time: 下午9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Here is your bill</title>
    <style>
        ul.a {
            list-style-image: url("images/rrt.png");

        }
    </style>
</head>
<body  >
<img src="images/buy.jpg">
<h1>Here is your bill</h1><br>
<%
    double price=0;
    //获取对象
    ArrayList<Coffee> coffees= (ArrayList<Coffee>) request.getAttribute("coffees");
    ArrayList<CoffeeBrewing> coffeeBrewings= (ArrayList<CoffeeBrewing>) request.getAttribute("coffeeBrewings");
    ArrayList<Accessories> accessories= (ArrayList<Accessories>) request.getAttribute("accessories");
    //获取dao层对象
    CoffeeDaoImpl coffeeDao=new CoffeeDaoImpl();
    CoffeeBrewingImpl coffeeBrewing=new CoffeeBrewingImpl();
    AccessoriesDaoImpl accessoriesDao=new AccessoriesDaoImpl();


%>
<ul class="a">
        <%
            if(0!=coffees.size()){
                for(Coffee temp:coffees){
                    out.print("<li>"+temp+"</li>");
                    temp.setSold(temp.getSold()+1);
                    price+=temp.getPrice();
                    coffeeDao.sell(temp);
                }
            }
        %>
    <%
        if(0!=coffeeBrewings.size()){
            for(CoffeeBrewing temp:coffeeBrewings){
                out.print("<li>"+temp+"</li>");
                temp.setSold(temp.getSold()+1);
                price+=temp.getPrice();
                coffeeBrewing.sell(temp);
            }
        }
    %>
    <%
        if(0!=accessories.size()){
            for(Accessories temp:accessories){
                out.print("<li>"+temp+"</li>");
                temp.setSold(temp.getSold()+1);
                price+=temp.getPrice();
                accessoriesDao.sell(temp);
            }
        }
    %>

</ul>
<h1>You need to pay $
<%
    out.print(String.format("%.2f",price));
%>
</h1>



</body>
</html>
