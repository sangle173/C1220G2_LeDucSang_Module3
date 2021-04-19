package controller;

import model.bean.CustomerType;
import model.repo.DBRepoCustomerType;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerTypeServlet",urlPatterns = "/create_customer")
public class CustomerTypeServlet extends HttpServlet {
    private DBRepoCustomerType dbRepoCustomerType;
    public void init() {
        dbRepoCustomerType = new DBRepoCustomerType();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            default:
                listCustomerType(request, response);
                break;
        }
    }

    private void listCustomerType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CustomerType> customerTypeList = dbRepoCustomerType.getAll();
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("create_customer.jsp");
        dispatcher.forward(request, response);
    }
}
