package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> showList();

    void save(Product product);

    Product findById(int id);

    void delete(int id);

    void update(int id, Product product);

    Product findByName(String name);

}
