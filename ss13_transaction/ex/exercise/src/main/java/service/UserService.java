package service;

import model.User;
import repository.IUserDao;
import repository.UserDao;

import java.util.List;

public class UserService implements IUserService {
    private IUserDao repository = new UserDao();

    @Override
    public void insertUser(User user) {
        repository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return repository.selectUser(id);
    }

    @Override
    public List<User> selectAllUser() {
        return repository.selectAllUser();
    }

    @Override
    public void deleteUser(int id) {
        repository.deleteUser(id);
    }

    @Override
    public void updateUser(User user) {
        repository.updateUser(user);
    }

    @Override
    public List<User> findUser(String country) {
        return repository.findUser(country);
    }

    @Override
    public List<User> sortList() {
        return repository.sortList();
    }

    @Override
    public void addUserTransaction(User user, List<Integer> permissions) {

    }
}
