package controller;

import model.bean.Customer;
import model.bean.CustomerType;
import model.repo.DBRepoCustomer;
import model.repo.DBRepoCustomerType;
import model.repo.IDBRepo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    private DBRepoCustomer dbRepoCustomer;
    public void init() {
        dbRepoCustomer = new DBRepoCustomer();
    }
    private IDBRepo dbRepoCustomerType= new DBRepoCustomerType();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                insertNew(request, response);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id= request.getParameter("id");
        Customer customerEdit=dbRepoCustomer.getById(id);
        request.setAttribute("customerEdit", customerEdit);
        List<CustomerType> customerTypeList = dbRepoCustomerType.getAll();
        customerTypeList.remove(0);
        request.setAttribute("customerTypeListEdit", customerTypeList);
//        request.setAttribute("flag", true);
        RequestDispatcher dispatcher = request.getRequestDispatcher("update_customer.jsp");
        dispatcher.forward(request, response);

    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = dbRepoCustomer.getAll();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customers.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        dbRepoCustomer.delete(id);
        listCustomer(request, response);
    }

    private void insertNew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        int customerType=Integer.parseInt(request.getParameter("customerType"));
        String name=request.getParameter("name");
        String birthday=request.getParameter("birthday");
        String gender=request.getParameter("gender");
        String idCard=request.getParameter("idCard");
        String phone=request.getParameter("phone");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        Customer customer=new Customer(id, customerType,name,birthday,gender,idCard,
                phone,email,address);
        dbRepoCustomer.add(customer);
        listCustomer(request,response);
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customers.jsp");
        dispatcher.forward(request, response);
    }
}
