package model.repo;

import model.bean.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBRepoCustomer implements IDBRepo<Customer> {

    private static final String INSERT_CUSTOMER_SQL = "insert into customers(customer_id,customer_type_id,customer_name, customer_birthday, customer_gender, customer_id_card,customer_phone, customer_email, customer_address)\n" +
            "        value\n" +
            "        (?,?,?,?,?,?,?,?,?);";
    private static final String DELETE_CUSTOMER_SQL = "delete\n" +
            "from customers\n" +
            "where customer_id=?;";
    private static final String SELECT_CUSTOMER_BY_ID = "select customers.customer_id,customer_type.customer_type_name, customers.customer_name\n" +
            ",customer_birthday,customer_gender, customer_id_card, customer_phone, customer_email, customer_address\n" +
            "from\n" +
            "customers left join customer_type on customer_type.customer_type_id=customers.customer_type_id\n" +
            "where customer_id=?;";
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
    public void add(Customer customer) {
        System.out.println(INSERT_CUSTOMER_SQL);

        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL);
        ) {
            preparedStatement.setString(1, customer.getId());
            preparedStatement.setInt(2, customer.getTypeId());
            preparedStatement.setString(3, customer.getName());
            preparedStatement.setString(4, customer.getBirthday());
            preparedStatement.setString(5, customer.getGender());
            preparedStatement.setString(6, customer.getIdCard());
            preparedStatement.setString(7, customer.getPhone());
            preparedStatement.setString(8, customer.getEmail());
            preparedStatement.setString(9, customer.getAddress());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public Customer getById(String id) {

        Customer customer = null;

        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
        ) {
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            System.out.println(preparedStatement);

            while (resultSet.next()) {
                String typeName = resultSet.getString(2);
                String name = resultSet.getString(3);
                String birthday = resultSet.getString(4);
                String gender = resultSet.getString(5);
                String idCard = resultSet.getString(6);
                String phone = resultSet.getString(7);
                String email = resultSet.getString(8);
                String address = resultSet.getString(9);
                customer  = new Customer(id, typeName, name, birthday, gender, idCard, phone, email, address);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return customer;
    }

    @Override
    public List<Customer> getAll() {
        List<Customer> customerList = new ArrayList<>();
        String query = "select customers.customer_id,customer_type.customer_type_name, customers.customer_name\n" +
                ",customer_birthday,customer_gender, customer_id_card, customer_phone, customer_email, customer_address\n" +
                "from\n" +
                "customers inner join customer_type on customer_type.customer_type_id=customers.customer_type_id;";
        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString(1);
                String typeName = resultSet.getString(2);
                String name = resultSet.getString(3);
                String birthday = resultSet.getString(4);
                String gender = resultSet.getString(5);
                String idCard = resultSet.getString(6);
                String phone = resultSet.getString(7);
                String email = resultSet.getString(8);
                String address = resultSet.getString(9);
                Customer customer = new Customer(id, typeName, name, birthday, gender, idCard, phone, email, address);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean delete(int id) {
        boolean rowDeleted = false;
        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_SQL);
        ) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public boolean update(Customer customer) {
        return false;
    }

    public static void main(String[] args) {
        DBRepoCustomer d = new DBRepoCustomer();
        System.out.println(d.getConnection());

//        d.add(new Customer("KV-1115",1,"Le Duc Sang","1992-08-09","male", "208897566", "0909090909","leducsang.10dt2@gmail.com","Da Nang"));
//        List<Customer> customerList = d.getAll();
//        for (Customer c : customerList) {
//            System.out.println(c);
//        }
        Customer customer=d.getById("KH-1111");
        System.out.println(customer);
    }
}
