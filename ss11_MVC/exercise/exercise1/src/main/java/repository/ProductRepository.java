package repository;

import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String SELECT = "SELECT * FROM products";
    private static final String INSERT = "INSERT INTO products(product_name,price,description,company) VALUES (?,?,?,?)";
    private static final String FIND = "SELECT * FROM products WHERE id=?";
    private static final String DELETE = "DELETE FROM products WHERE id=?";
    private static final String UPDATE = "UPDATE products SET product_name=?, price=?, description=?, company=? WHERE id=?";
    private static final String SEARCH = "SELECT * FROM products WHERE product_name LIKE ?";

    @Override
    public List<Product> showList() {
        Connection connection = BaseRepository.getConnection();
        List<Product> list = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("product_name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String company = resultSet.getString("company");
                list.add(new Product(id, name, price, description, company));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void save(Product product) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setString(4, product.getCompany());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Product findById(int id) {
        Connection connection = BaseRepository.getConnection();
        Product product = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("product_name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String company = resultSet.getString("company");
                product = new Product(name, price, description, company);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(int id, Product product) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setString(4, product.getCompany());
            preparedStatement.setInt(5, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Product findByName(String chooseName) {
        Connection connection = BaseRepository.getConnection();
        Product product = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, chooseName);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("product_name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String company = resultSet.getString("company");
                product = new Product(id, name, price, description, company);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
}
