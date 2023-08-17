USE furama;
-- 21. Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
CREATE VIEW v_nhan_vien AS
SELECT n.ma_nhan_vien, n.ho_ten, n.dia_chi
FROM nhan_vien n
JOIN hop_dong h ON n.ma_nhan_vien = h.ma_nhan_vien
WHERE n.dia_chi LIKE '%Hải Châu%'
AND h.ngay_lam_hop_dong = '2019-12-12';
-- 22.Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

