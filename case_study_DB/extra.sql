USE furama;
-- 21. Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
CREATE VIEW v_nhan_vien AS
SELECT n.ma_nhan_vien, n.ho_ten, n.dia_chi
FROM nhan_vien n
JOIN hop_dong h ON n.ma_nhan_vien = h.ma_nhan_vien
WHERE n.dia_chi LIKE '%Hải Châu%'
AND h.ngay_lam_hop_dong = '2021-04-25';

-- 22.Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
CREATE OR REPLACE VIEW v_nhan_vien_new AS
SELECT ma_nhan_vien, ho_ten,
REPLACE (dia_chi, 'Hải Châu', 'Liên chiểu') AS dia_chi
FROM v_nhan_vien;

-- 23.Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào 
-- như là 1 tham số của sp_xoa_khach_hang.
delimiter //
create procedure sp_xoa_khach_hang(ma_khach_hang_xoa int)
begin
delete from khach_hang where ma_khach_hang = ma_khach_hang_xoa;
end //
delimiter ;
call sp_xoa_khach_hang(1);

-- 24.Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure sp_them_moi_hop_dong(
n_ngay_lam_hop_dong DATETIME,
n_ngay_ket_thuc DATETIME,
n_tien_dat_coc DOUBLE,
n_ma_nhan_vien INT,
n_ma_khach_hang INT,
n_ma_dich_vu INT)
begin

declare count int;
select count(*) into count from nhan_vien where ma_nhan_vien = n_ma_nhan_vien;
if count > 0 then
signal sqlstate '45000' set message_text = 'Không có nhân viên này';
end if;

select count(*) into count from khach_hang where ma_khach_hang = n_ma_khach_hang;
if count > 0 then
signal sqlstate '45000' set message_text = 'Không có khách hàng này';
end if;

select count(*) into count from dich_vu where ma_dich_vu = n_ma_dich_vu;
if count > 0 then
signal sqlstate '45000' set message_text = 'Không có dịch vụ này';
end if;

insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
values (n_ngay_lam_hop_dong, n_ngay_ket_thuc, n_tien_dat_coc, n_ma_nhan_vien, n_ma_khach_hang, n_ma_dich_vu);
end //
delimiter ;

-- 25.Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại 
-- có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.