CREATE DATABASE PhieuSP

USE PhieuSP

CREATE TABLE NguoiCTN (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL)

CREATE TABLE LoaiSP (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL)

CREATE TABLE ChitietSP (
    id VARCHAR(20) PRIMARY KEY,
    loaisp_id VARCHAR(20),
    nsx DATE,
    name VARCHAR(100),
    nguoictn_id INT,
    FOREIGN KEY (loaisp_id) REFERENCES LoaiSP(id),
    FOREIGN KEY (nguoictn_id) REFERENCES NguoiCTN(id))

INSERT INTO NguoiCTN(id, name) VALUES (987688, 'Nguyễn Văn An')
INSERT INTO NguoiCTN(id, name) VALUES (987686, 'Hoàng Mạnh Tường')

INSERT INTO LoaiSP(id, name) VALUES ('Z37E', 'Máy tính sách tay Z37')
INSERT INTO LoaiSP(id, name) VALUES ('15S', 'Máy tính sách tay HP')

INSERT INTO ChitietSP(id, loaisp_id, nsx, name, nguoictn_id) VALUES ('Z37 111111', 'Z37E', '2009-12-12', 'Máy tính sách tay Z37', 987688)
INSERT INTO ChitietSP(id, loaisp_id, nsx, name, nguoictn_id) VALUES ('15S 111111', '15S', '2021-10-25', 'Máy tính sách tay HP', 987686)
--Liệt kê danh sách loại sản phẩm của công ty
SELECT id AS Mã_loại_sản_phẩm, name AS Tên_loại_sản_phẩm FROM LoaiSP

--Liệt kê danh sách sản phẩm của công ty
SELECT ChitietSP.id AS Mã_số_sản_phẩm, ChitietSP.name AS Tên_loại_sản_phẩm, ChitietSP.nsx AS Ngày_sản_xuất, ChitietSP.loaisp_id AS Mã_loại_sản_phẩm, NguoiCTN.name AS Người_chịu_trách_nhiệm, NguoiCTN.id AS Mã_số_của_người_chịu_trách_nhiệm FROM ChitietSP
JOIN NguoiCTN ON ChitietSP.nguoictn_id = NguoiCTN.id


--Liệt kê danh sách người chịu trách nhiệm của công ty
SELECT id AS Mã_số_của_người_chịu_trách_nhiệm, name AS Người_chịu_trách_nhiệm FROM NguoiCTN

-- Liệt kê danh sách loại sản phẩm của công ty theo thứ tự tăng dần của tên
SELECT id AS Mã_loại_sản_phẩm, name AS Tên_loại_sản_phẩm FROM LoaiSP ORDER BY name ASC

-- Liệt kê danh sách người chịu trách nhiệm của công ty theo thứ tự tăng dần của tên
SELECT id AS Mã_số_của_người_chịu_trách_nhiệm, name AS Người_chịu_trách_nhiệm FROM NguoiCTN ORDER BY name ASC

-- Liệt kê các sản phẩm của loại sản phẩm có mã số là Z37E
SELECT ChitietSP.id AS Mã_số_sản_phẩm, ChitietSP.name AS Tên_loại_sản_phẩm, ChitietSP.nsx AS Ngày_sản_xuất, ChitietSP.loaisp_id AS Mã_loại_sản_phẩm, NguoiCTN.name AS Người_chịu_trách_nhiệm, NguoiCTN.id AS Mã_số_của_người_chịu_trách_nhiệm FROM ChitietSP
JOIN NguoiCTN ON ChitietSP.nguoictn_id = NguoiCTN.id
WHERE ChitietSP.loaisp_id='Z37E'

-- Liệt kê các sản phẩm Nguyễn Văn An chịu trách nhiệm theo thứ tự giảm đần của mã
SELECT ChitietSP.id AS Mã_số_sản_phẩm, ChitietSP.name AS Tên_loại_sản_phẩm, ChitietSP.nsx AS Ngày_sản_xuất, ChitietSP.loaisp_id AS Mã_loại_sản_phẩm, NguoiCTN.name AS Người_chịu_trách_nhiệm, NguoiCTN.id AS Mã_số_của_người_chịu_trách_nhiệm FROM ChitietSP
JOIN NguoiCTN ON ChitietSP.nguoictn_id = NguoiCTN.id
WHERE NguoiCTN.name='Nguyễn Văn An' ORDER BY ChitietSP.id DESC

-- Số sản phẩm của từng loại sản phẩm
SELECT LoaiSP.id AS Mã_loại_sản_phẩm, LoaiSP.name AS Tên_loại_sản_phẩm, COUNT(ChitietSP.id) AS Số_sản_phẩm FROM LoaiSP
JOIN ChitietSP ON LoaiSP.id = ChitietSP.loaisp_id
GROUP BY LoaiSP.id, LoaiSP.name

-- Hiển thị toàn bộ thông tin về sản phẩm và loại sản phẩm
SELECT ChitietSP.* FROM ChitietSP

-- Hiển thị toàn bộ thông tin về người chịu trách nhiệm, loại sản phẩm và sản phẩm
SELECT ChitietSP.*, NguoiCTN.name AS Người_chịu_trách_nhiệm FROM ChitietSP
JOIN NguoiCTN ON ChitietSP.nguoictn_id = NguoiCTN.id

--Cập nhật ngày sản xuất trước hoặc bằng ngày hiện tại
UPDATE ChitietSP SET nsx=GETDATE() WHERE nsx<=GETDATE()

--Thêm các trường khóa ngoại

ALTER TABLE ChitietSP ADD CONSTRAINT FK_LoaiSP
FOREIGN KEY (loaisp_id) REFERENCES LoaiSP(id)

ALTER TABLE ChitietSP ADD CONSTRAINT FK_NguoiCTN
FOREIGN KEY (nguoictn_id) REFERENCES NguoiCTN(id)

--Thêm trường phiên bản của sản phẩm
ALTER TABLE ChitietSP ADD New VARCHAR(50)




