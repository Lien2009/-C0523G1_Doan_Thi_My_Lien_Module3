package service;

import model.Customer;
import repository.CustomerRepository;
import repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService{
    private ICustomerRepository repository = new CustomerRepository();
    @Override
    public List<Customer> showList() {
        return repository.showList();
    }
}
