CREATE DATABASE nhap_xuat_hang;
USE nhap_xuat_hang;
CREATE TABLE phieu_xuat (
    so_phieu_xuat INT PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat DATETIME
);
CREATE TABLE vat_tu (
    ma_vat_tu INT PRIMARY KEY AUTO_INCREMENT,
    ten_vat_tu VARCHAR(50)
);
CREATE TABLE phieu_xuat_chi_tiet (
    so_phieu_xuat INT,
    ma_vat_tu INT,
    don_gia_xuat DOUBLE,
    so_luong_xuat INT,
    PRIMARY KEY (so_phieu_xuat , ma_vat_tu),
    FOREIGN KEY (so_phieu_xuat)
        REFERENCES phieu_xuat (so_phieu_xuat),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);
CREATE TABLE phieu_nhap (
    so_phieu_nhap INT PRIMARY KEY AUTO_INCREMENT,
    ngay_nhap DATETIME
);
CREATE TABLE phieu_nhap_chi_tiet (
    so_phieu_nhap INT,
    ma_vat_tu INT,
    don_gia_nhap DOUBLE,
    so_luong_nhap INT,
    PRIMARY KEY (so_phieu_nhap , ma_vat_tu),
    FOREIGN KEY (so_phieu_nhap)
        REFERENCES phieu_nhap (so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);
CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap INT PRIMARY KEY AUTO_INCREMENT,
    ten_nha_cung_cap VARCHAR(50),
    dia_chi VARCHAR(50),
    so_dien_thoai VARCHAR(10)
);
CREATE TABLE don_dat_hang (
    so_don_hang INT PRIMARY KEY AUTO_INCREMENT,
    ngay_dat_hang DATETIME,
    ma_nha_cung_cap INT,
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);
CREATE TABLE don_dat_hang_chi_tiet (
    so_don_hang INT,
    ma_vat_tu INT,
    PRIMARY KEY (so_don_hang , ma_vat_tu),
    FOREIGN KEY (so_don_hang)
        REFERENCES don_dat_hang (so_don_hang),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);
