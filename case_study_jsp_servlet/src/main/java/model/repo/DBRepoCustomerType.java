package model.repo;

import model.bean.CustomerType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBRepoCustomerType implements IDBRepo<CustomerType> {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_resort?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "leduc1703sang@";


    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }


    @Override
    public void add(CustomerType customerType) {

    }


    @Override
    public List<CustomerType> getAll() {
        List<CustomerType> customerTypeList=new ArrayList<>();
        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM furama_resort.customer_type;");
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt(1);
                String name=resultSet.getString(2);
                CustomerType customerType=new CustomerType(id, name);
                customerTypeList.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypeList;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean update(CustomerType customerType) {
        return false;
    }

    public static void main(String[] args) {
        DBRepoCustomerType d=new DBRepoCustomerType();
        System.out.println(d.getConnection());
        List<CustomerType> customerTypeList=d.getAll();
        for (CustomerType c:customerTypeList) {
            System.out.println(c);

        }
    }
}
