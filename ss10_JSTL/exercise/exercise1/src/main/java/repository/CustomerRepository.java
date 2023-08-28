package repository;

import model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
private static List<Customer> list;
static {
    list = new ArrayList<>();
    list.add(new Customer("Mỹ Liên", "1996-09-20", "Đà Nẵng","https://watermark.lovepik.com/photo/20211130/large/lovepik-operator-customer-service-beauty-picture_501226753.jpg") );
    list.add(new Customer("Bảo Thiện", "1995-08-04", "Đà Nẵng","https://s.memehay.com/files/posts/20201015/khong-duoc-danh-khach-hang-meme-danh-khach-hang-han-vet-tay-97b933917c5163f39d92ed825d55c7d9.jpg"));
    list.add(new Customer("Phước Hưng", "1994-08-04", "Hội An","https://halozendsoft.com/wp-content/uploads/2017/09/giai-phap-cham-soc-khach-hang.jpg"));
    list.add(new Customer("Văn Lâm", "2000-10-01", "Hội An","https://watermark.lovepik.com/photo/20211130/large/lovepik-operator-customer-service-beauty-picture_501226753.jpg"));
}
    @Override
    public List<Customer> showList() {
        return list;
    }
}
