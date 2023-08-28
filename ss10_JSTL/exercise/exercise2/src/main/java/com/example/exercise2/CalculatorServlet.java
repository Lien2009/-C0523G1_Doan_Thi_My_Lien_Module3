package com.example.exercise2;

import service.Calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("first"));
        double secondOperand = Double.parseDouble(request.getParameter("second"));
        char operator = request.getParameter("operator").charAt(0);
        PrintWriter print = response.getWriter();
        try {
            double result = Calculator.calculate(firstOperand, secondOperand, operator);
            request.setAttribute("firstOperand", firstOperand);
            request.setAttribute("operator", operator);
            request.setAttribute("secondOperand", secondOperand);
            request.setAttribute("result", result);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/result.jsp");
            requestDispatcher.forward(request, response);
        }catch (ArithmeticException e){
            print.println(e.getMessage());
        }
    }
}
