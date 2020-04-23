package com.service;


import com.dao.AccessoriesDaoImpl;
import com.dao.CoffeeBrewingImpl;
import com.dao.CoffeeDaoImpl;
import com.entities.Accessories;
import com.entities.Coffee;
import com.entities.CoffeeBrewing;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "LoginServlet",urlPatterns = "/calc")
public class CalcServlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] strs=req.getParameterValues("code");
        //如果没买任何东西
        if(null==strs){
            Cookie cookie=new Cookie("null","1");
            cookie.setMaxAge(10);
            cookie.setPath("/");
            resp.addCookie(cookie);
            resp.sendRedirect("/index.jsp");
            return;
        }
        System.out.println(strs.length);


        ArrayList<Coffee> coffees=new ArrayList<>();
        ArrayList<CoffeeBrewing> coffeeBrewings=new ArrayList<>();
        ArrayList<Accessories> accessories=new ArrayList<>();

        //dao层对象
        AccessoriesDaoImpl accessoriesDao=new AccessoriesDaoImpl();
        CoffeeBrewingImpl coffeeBrewing=new CoffeeBrewingImpl();
        CoffeeDaoImpl coffeeDao=new CoffeeDaoImpl();

        //循环从数据库select如果不为空则加入到ArrayList中
        for(String temp:strs){
            System.out.println(temp);
            if(null!=accessoriesDao.getAccessory(temp)){
                accessories.add(accessoriesDao.getAccessory(temp));
            }else if(null!=coffeeBrewing.getCoffeeBrewing(temp)){
                coffeeBrewings.add(coffeeBrewing.getCoffeeBrewing(temp));
            }else if(null!=coffeeDao.getCoffee(temp)){
                coffees.add(coffeeDao.getCoffee(temp));
            }
        }

        //将数据从servlet传到jsp
        req.setAttribute("coffees",coffees);
        req.setAttribute("coffeeBrewings",coffeeBrewings);
        req.setAttribute("accessories",accessories);
        req.getRequestDispatcher("buy.jsp").forward(req,resp);
    }
}
