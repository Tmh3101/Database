-- 1. Xem nội dung của tất cả các bảng dữ liệu bằng SELECT
SELECT * FROM KHOAHOC;
SELECT * FROM CHUONGTRINH;
SELECT * FROM LOAILOP;
SELECT * FROM LOP;
SELECT * FROM HOCVIEN;
SELECT * FROM PHIEUTHU;
SELECT * FROM MONHOC;
SELECT * FROM DIEM;

-- 2. Tìm thông tin về các học viên nam
SELECT * FROM HOCVIEN WHERE GIOITINH = 1;

-- 3. Tìm thông tin về các học viên có địa chỉ ở Cần Thơ
SELECT * FROM HOCVIEN WHERE DIACHI LIKE ('%Cần Thơ');

-- 4. Tìm thông tin về các lớp học của 'khóa 1'
SELECT L.*
FROM LOP L
JOIN KHOAHOC K ON L.MAKH = K.MAKH
WHERE TENKH = 'Khóa 1';

-- 5. Tìm mã và họ tên học viên có học 'khóa 1'
SELECT H.MAHV, TENHV FROM KHOAHOC K
JOIN LOP L ON K.MAKH = L.MAKH
JOIN PHIEUTHU P ON P.MALOP = L.MALOP
JOIN HOCVIEN H ON H.MAHV = P.MAHV
WHERE  TENKH='Khóa 1';

-- 6. Tìm họ tên học viên có bao gồm chữ 'Đỗ'
SELECT TENHV FROM HOCVIEN
WHERE TENHV LIKE ('%Đỗ%');

-- 7. Tìm thông tin các học viên sinh năm 2000
SELECT * FROM HOCVIEN WHERE EXTRACT(YEAR FROM NGAYSINH) = '2000';

-- 8. Tìm thông tin của các học vieensinh tháng 12 năm 2001
SELECT * FROM HOCVIEN
WHERE EXTRACT(MONTH FROM NGAYSINH) = '12' AND EXTRACT(YEAR FROM NGAYSINH) = '2001';

-- 9. Tìm thông tin của các học viên sinh từ năm 1998 đến 2000
SELECT * FROM HOCVIEN
WHERE EXTRACT(YEAR FROM NGAYSINH) BETWEEN '1998' AND '2000';

-- 10. Tìm thông tin các phiếu thu được thực hiện ngày 5 đến ngày 10 tháng 6 năm 2021
SELECT * FROM PHIEUTHU
WHERE NGAYLAPPHIEU BETWEEN '2021-06-05' AND '2021-06-10';

-- 11. In danh sách các học viên lớp 'Lớp 1' Tiếng anh căn bản
SELECT H.* FROM LOAILOP LL
JOIN LOP L ON LL.MALOAI = L.MALOAI
JOIN PHIEUTHU P ON L.MALOP = P.MALOP
JOIN HOCVIEN H ON P.MAHV = H.MAHV
WHERE LL.TENLOAI = 'Tiếng Anh căn bản' AND L.TENLOP = 'Lớp 1';

-- 12. In danh sách các lớp thuộc chương trình 'Tiếng anh tổng quát'
SELECT L.* FROM CHUONGTRINH CT
JOIN LOAILOP LL ON CT.MACT = LL.MACT
JOIN LOP L ON LL.MALOAI = L.MALOAI
WHERE CT.TENCT = 'Tiếng Anh Tổng Quát';

-- 13. Liệt kê thông tin tất cả các phiếu thu của 'lớp 1' Tiếng Anh A1
SELECT P.* FROM LOAILOP LL
JOIN LOP L ON LL.MALOAI = L.MALOAI
JOIN PHIEUTHU P ON L.MALOP = P.MALOP
WHERE LL.TENLOAI = 'Tiếng Anh A1';

-- 14. Tìm họ tên học viên, tên môn và điểm thi các môn của các học viên học 'khóa 1'
SELECT H.TENHV, M.TENMH, D.DIEM FROM KHOAHOC K
JOIN LOP L ON K.MAKH = L.MAKH
JOIN DIEM D ON L.MALOP = D.MALOP
JOIN HOCVIEN H ON D.MAHV = H.MAHV
JOIN MONHOC M ON D.MAMH = M.MAMH
WHERE K.TENKH = 'Khóa 1';

-- 15. Có tất cả bao nhiêu học viên?
SELECT COUNT(*) SOHOCVIEN FROM HOCVIEN;

-- 16. 'Lớp 1' Tiếng anh căn bản có bao nhiêu học viên
SELECT L.SISO FROM LOAILOP LL
JOIN LOP L ON LL.MALOAI = L.MALOAI
WHERE LL.TENLOAI = 'Tiếng Anh căn bản' AND L.TENLOP = 'Lớp 1';

-- 17. Tính tổng số tiền đã thu được của 'lớp 1' Tiếng anh căn bản
SELECT SUM(P.THANHTIEN) TONGTIEN FROM LOAILOP LL
JOIN LOP L ON LL.MALOAI = L.MALOAI
JOIN PHIEUTHU P ON L.MALOP = P.MALOP
WHERE LL.TENLOAI = 'Tiếng Anh căn bản' AND L.TENLOP = 'Lớp 1';

-- 18. Tính tổng số tiền đã thu được của 'khóa 1'
SELECT SUM(P.THANHTIEN) TONGTIENKHOA1 FROM KHOAHOC K
JOIN LOP L ON K.MAKH = L.MAKH
JOIN PHIEUTHU P ON L.MALOP = P.MALOP
WHERE K.TENKH = 'Khóa 1';

-- 19. Tính điểm trung bình của học viên 'Đỗ Gia Bảo', sinh ngày 02/12/2001 học 'lớp 1' Tiếng anh căn bản ?
SELECT AVG(D.DIEM) DIEMTB FROM HOCVIEN H
JOIN DIEM D ON H.MAHV = D.MAHV
JOIN LOP L ON D.MALOP = L.MALOP
WHERE H.TENHV = 'Đỗ Gia Bảo' AND H.NGAYSINH = TO_DATE('02/12/2001', 'DD/MM/YYYY') AND L.TENLOP = 'Lớp 1';

-- 20. Tìm điểm lớn nhất
SELECT MAX(DIEM) DIEMLONNHAT FROM DIEM;
