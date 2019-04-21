# Project-2



# Database
Table XetNghiem:

create table XetNghiem(
	ID INT CHECK (ID > 0) PRIMARY KEY,
	Tuan INT NOT NULL CHECK (TUAN > 0 AND TUAN <= 53),
	TenBenhNhan NVarchar(100) NOT NULL,
	NamSinh INT NOT NULL CHECK (NamSinh > 1990 AND NamSinh < 2020),
	GioiTinh NVarchar(5) NOT NULL,
	NgayYeuCau Date NOT NULL,
	NgayLayMau Datetime NOT NULL,
	NguoiLayMau NVarchar(100) NOT NULL,
	NgayNhanMau Datetime NOT NULL,
	NguoiSaoThongTin NVarchar(100) NOT NULL,
	NgaySaoThongTin Date NOT NULL,
	NgayCoKetQua Date NOT NULL
)

Table KetQuaXetNghiem:

create table KetQuaXetNghiem(
	ID INT FOREIGN KEY REFERENCES XetNghiem (ID),
	Urea DECIMAL(5,2) CHECK (Urea > 0),
	Creatinine DECIMAL(5,2) CHECK (Creatinine > 0),
	CPK DECIMAL(5,2) CHECK (CPK > 0),
	Calcium DECIMAL(5,2) CHECK (Calcium > 0),
	Phosphorous DECIMAL(5,2) CHECK (Phosphorous > 0),
	Amylase DECIMAL(5,2) CHECK (Amylase > 0),
	Lipase DECIMAL(5,2) CHECK (Lipase > 0),
	BilirubinToanPhan DECIMAL(5,2) CHECK (BilirubinToanPhan > 0),
	AST DECIMAL(5,2) CHECK (AST > 0),
	ALT DECIMAL(5,2) CHECK (ALT > 0),
	AlkalinePhosphatase DECIMAL(5,2) CHECK (AlkalinePhosphatase > 0),
	OngLithiumHeparine4ml BIT NOT NULL,
	Glucose DECIMAL(5,2) CHECK (Glucose > 0),
	OngFlouride2ml BIT NOT NULL,
	LoaiMauPhanTich NVarchar(100) Default (N'Huyết tương')
)
