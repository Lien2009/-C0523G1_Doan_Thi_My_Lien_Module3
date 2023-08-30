package repository;

import model.User;

import java.util.List;

public interface IUserDao {
    void insertUser(User user);
    User selectUser(int id);
    List<User> selectAllUser();
    void deleteUser(int id);
    void updateUser(User user);
    List<User> findUser(String country);
    List<User> sortList();
}
