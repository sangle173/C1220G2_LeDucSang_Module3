package model.repo;

import model.bean.User;

import java.util.List;

public interface IUserDAO {
    void insertUser(User user);

    User selectUser(int id);

    List<User> selectAllUser();

    boolean deleteUser(int id);

    boolean updateUser(User user);
}
