CREATE DATABASE quanlydiemthi;
USE quanlydiemthi;
CREATE TABLE hoc_sinh(
MaHS varchar(20) PRIMARY KEY,
TenHS varchar(50),
NgaySinh Datetime,
Lop varchar(20),
GT varchar(20)
);
CREATE TABLE giao_vien(
MaGV varchar(20) PRIMARY KEY,
TenGV varchar(50),
SDT varchar(10)
);
CREATE TABLE mon_hoc(
MaMH varchar(20) PRIMARY KEY,
TenMH varchar(50),
MaGV varchar(20),
FOREIGN KEY (MaGV) REFERENCES giao_vien(MaGV)
);
CREATE TABLE bang_diem(
MaHS varchar(20),
MaMH varchar(50),
DiemThi int,
NgayKT Datetime,
PRIMARY KEY(MaHS, MaMH),
FOREIGN KEY (MaHS) REFERENCES hoc_sinh(MaHS),
FOREIGN KEY (MaMH) REFERENCES mon_hoc(MaMH)
);