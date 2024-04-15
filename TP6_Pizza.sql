

create table NGUOI_AN(ten VARCHAR(30) NOT NULL , tuoi int, phai VARCHAR(6));
create table LUI_TOI(ten VARCHAR(30)NOT NULL, quanPizza VARCHAR(30) NOT NULL);
create table AN(ten VARCHAR(30)NOT NULL, pizza VARCHAR(30) NOT NULL);
create table PHUC_VU(quanPizza VARCHAR(30)NOT NULL, pizza VARCHAR(30)NOT NULL, gia numeric (6,3));


insert into NGUOI_AN values('Amy', 16, 'female');
insert into NGUOI_AN values('Ben', 21, 'male');
insert into NGUOI_AN values('Cal', 33, 'male');
insert into NGUOI_AN values('Dan', 13, 'male');
insert into NGUOI_AN values('Eli', 45, 'male');
insert into NGUOI_AN values('Fay', 21, 'female');
insert into NGUOI_AN values('Gus', 24, 'male');
insert into NGUOI_AN values('Hil', 30, 'female');
insert into NGUOI_AN values('Ian', 18, 'male');

insert into LUI_TOI values('Amy', 'Pizza Hut');
insert into LUI_TOI values('Ben', 'Pizza Hut');
insert into LUI_TOI values('Ben', 'Chicago Pizza');
insert into LUI_TOI values('Cal', 'Straw Hat');
insert into LUI_TOI values('Cal', 'New York Pizza');
insert into LUI_TOI values('Dan', 'Straw Hat');
insert into LUI_TOI values('Dan', 'New York Pizza');
insert into LUI_TOI values('Eli', 'Straw Hat');
insert into LUI_TOI values('Eli', 'Chicago Pizza');
insert into LUI_TOI values('Fay', 'Dominos');
insert into LUI_TOI values('Fay', 'Little Caesars');
insert into LUI_TOI values('Gus', 'Chicago Pizza');
insert into LUI_TOI values('Gus', 'Pizza Hut');
insert into LUI_TOI values('Hil', 'Dominos');
insert into LUI_TOI values('Hil', 'Straw Hat');
insert into LUI_TOI values('Hil', 'Pizza Hut');
insert into LUI_TOI values('Ian', 'New York Pizza');
insert into LUI_TOI values('Ian', 'Straw Hat');
insert into LUI_TOI values('Ian', 'Dominos');

insert into AN values('Amy', 'pepperoni');
insert into AN values('Amy', 'mushroom');
insert into AN values('Ben', 'pepperoni');
insert into AN values('Ben', 'cheese');
insert into AN values('Cal', 'supreme');
insert into AN values('Dan', 'pepperoni');
insert into AN values('Dan', 'cheese');
insert into AN values('Dan', 'sausage');
insert into AN values('Dan', 'supreme');
insert into AN values('Dan', 'mushroom');
insert into AN values('Eli', 'supreme');
insert into AN values('Eli', 'cheese');
insert into AN values('Fay', 'mushroom');
insert into AN values('Gus', 'mushroom');
insert into AN values('Gus', 'supreme');
insert into AN values('Gus', 'cheese');
insert into AN values('Hil', 'supreme');
insert into AN values('Hil', 'cheese');
insert into AN values('Ian', 'supreme');
insert into AN values('Ian', 'pepperoni');

insert into PHUC_VU values('Pizza Hut', 'pepperoni', 12);
insert into PHUC_VU values('Pizza Hut', 'sausage', 12);
insert into PHUC_VU values('Pizza Hut', 'cheese', 9);
insert into PHUC_VU values('Pizza Hut', 'supreme', 12);
insert into PHUC_VU values('Little Caesars', 'pepperoni', 9.75);
insert into PHUC_VU values('Little Caesars', 'sausage', 9.5);
insert into PHUC_VU values('Little Caesars', 'cheese', 7);
insert into PHUC_VU values('Little Caesars', 'mushroom', 9.25);
insert into PHUC_VU values('Little Caesars', 'supreme', 9);
insert into PHUC_VU values('Dominos', 'cheese', 9.75);
insert into PHUC_VU values('Dominos', 'mushroom', 11);
insert into PHUC_VU values('Straw Hat', 'pepperoni', 8);
insert into PHUC_VU values('Straw Hat', 'cheese', 9.25);
insert into PHUC_VU values('Straw Hat', 'sausage', 9.75);
insert into PHUC_VU values('New York Pizza', 'pepperoni', 8);
insert into PHUC_VU values('New York Pizza', 'cheese', 7);
insert into PHUC_VU values('New York Pizza', 'supreme', 8.5);
insert into PHUC_VU values('Chicago Pizza', 'cheese', 7.75);
insert into PHUC_VU values('Chicago Pizza', 'supreme', 8.5);

-- 1. - Thêm khóa chính cho các bảng đã cho
--    - Đặt thuộc tính "ten" là khóa ngoại của bảng LUI_TOI và AN
--    - THêm ràng buộc gia>0 cho cột "gia" của bảng PHUC_VU

ALTER TABLE NGUOI_AN
ADD CONSTRAINT pk_nguoian_ten PRIMARY KEY (TEN)

ALTER TABLE LUI_TOI
ADD CONSTRAINT fk_luitoi_ten FOREIGN KEY (TEN) REFERENCES NGUOI_AN (TEN)
  
ALTER TABLE LUI_TOI
ADD CONSTRAINT pk_luitoi_ten_quanPizza PRIMARY KEY (TEN, QUANPIZZA)

ALTER TABLE AN
ADD CONSTRAINT fk_an_ten FOREIGN KEY (TEN) REFERENCES NGUOI_AN (TEN)
  
ALTER TABLE AN
ADD CONSTRAINT pk_an_ten_pizza PRIMARY KEY (TEN, PIZZA)
  
ALTER TABLE PHUC_VU
ADD CONSTRAINT pk_phucvu_quanPizza_pizza_gia PRIMARY KEY (QUANPIZZA, PIZZA, GIA)

-- 2. Cho biết quán 'Pizza Hut' đã phục vụ các bánh pizza nào
SELECT PIZZA FROM PHUC_VU
WHERE QUANPIZZA = 'Pizza Hut';

-- 3. Danh sách các bánh pizza mà các quán có bán
SELECT DISTINCT PIZZA FROM PHUC_VU;

-- 4. Cho biết tên các quán có phục vụ các bánh pizza mà tên gồm chữ 'm'
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE PIZZA LIKE ('%m%');

-- 5. Tìm tên và tuổi của người ăn đã đến quán 'Dominos', sắp xếp kết quả giảm dần theo tuổi
SELECT NA.TEN, TUOI FROM LUI_TOI LT
JOIN NGUOI_AN NA ON LT.TEN = NA.TEN
WHERE QUANPIZZA = 'Dominos'
ORDER BY TUOI DESC;

-- 6. Tìm tên quán pizza và số bánh pizza mà mỗi quán phục vụ
SELECT QUANPIZZA, COUNT(PIZZA) SB FROM PHUC_VU
GROUP BY QUANPIZZA;

-- 7. Tìm tên những quán pizza phục cụ pizza với giá cao nhất
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE GIA >= ALL (
    SELECT GIA FROM PHUC_VU
);

-- 8. Tìm tên các quán phục vụ ít nhất một bánh pizza mà "Ian" thích ăn
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE PIZZA IN (
    SELECT PIZZA FROM AN
    WHERE TEN = 'Ian'
);

-- 9. Tìm tên các quán có phục vụ ít nhất một bánh mà "Eli" không thích
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE PIZZA NOT IN (
    SELECT PIZZA FROM AN
    WHERE TEN = 'Eli'
);

-- 10. Tìm tên các quán chỉ phục vụ các bánh mà "Eli" thích (chua xong)
SELECT QUANPIZZA FROM PHUC_VU
MINUS
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
    WHERE PIZZA NOT IN (
    SELECT PIZZA FROM AN
    WHERE TEN = 'Eli'
);

-- 11. Tên quán có phục vụ bánh với giá lớn hơn tất cả bánh phục vụ bởi quán ‘New York Pizza’
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE GIA >= ALL (
    SELECT GIA FROM PHUC_VU
    WHERE QUANPIZZA = 'New York Pizza'
);

-- 12. Tìm tên các quán chỉ phục vụ các bánh có giá nhỏ hơn 10
SELECT QUANPIZZA FROM PHUC_VU
MINUS
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE GIA >= 10

-- 13. Tìm tên bánh được phục vụ bởi quán ‘New York Pizza’ và quán ‘Dominos’
SELECT PIZZA FROM PHUC_VU
WHERE QUANPIZZA = 'New York Pizza'
INTERSECT
SELECT PIZZA FROM PHUC_VU
WHERE QUANPIZZA = 'Dominos'

-- 14.  Tìm tên bánh được phục vụ bởi quán ‘Little Caesars’ và không phục vụ bởi quán 'Pizza Hut'
SELECT PIZZA FROM PHUC_VU
WHERE QUANPIZZA = 'Little Caesars'
MINUS
SELECT PIZZA FROM PHUC_VU
WHERE QUANPIZZA = 'Pizza Hut'

-- 15. Tìm tên các quán có phục vụ tất cả các loại bánh pizza
SELECT QUANPIZZA FROM PHUC_VU
GROUP BY QUANPIZZA
HAVING COUNT(PIZZA) = (
    SELECT COUNT(*) FROM (
        SELECT DISTINCT PIZZA FROM PHUC_VU
    )
);

-- 16. Tên quán phục vụ ít nhất 2 bánh pizza mà ‘Gus’ thích
SELECT QUANPIZZA FROM PHUC_VU
WHERE PIZZA IN (
    SELECT PIZZA FROM AN
    WHERE TEN = 'Gus'
)
GROUP BY QUANPIZZA
HAVING COUNT(PIZZA) >= 2;

-- 17. Tìm tên các quán có phục vụ tất cả các bánh mà ‘Ian’ thích
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE PIZZA IN (
    SELECT PIZZA FROM AN
    WHERE TEN = 'Gus'
);

-- 18. 













