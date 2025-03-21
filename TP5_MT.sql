CREATE TABLE khuvuc(
	IP varchar(20) NOT NULL PRIMARY KEY,
	tenKhuvuc varchar(30) not null,
	tang smallint);
----------------------------------------------------
CREATE TABLE phong(
	MP varchar(20) NOT NULL PRIMARY KEy,
	tenphong varchar(20) not null,
	somay smallint,
	IP varchar(20),
	foreign key(IP) references khuvuc(IP));
----------------------------------------------------
create table loai(
	idloai varchar(20) not null primary key,
	tenloai varchar(30) not null);
----------------------------------------------------
create table may(
	idMay varchar(20) not null primary key,
	tenmay varchar(20) not null,
	IP varchar(20),
	ad smallint check (ad BETWEEN 0 and 255),
	idloai varchar(20),
	MP varchar(20),
	foreign key(IP) references khuvuc(IP),
	foreign key(idloai) references loai(idloai));
----------------------------------------------------
create table phanmem(
	idPM varchar(20) not null primary key,
	tenPM varchar(30) not null,
	ngaymua date,
	version varchar(20),
	idloai varchar(20),
	gia smallint check(gia>=0),
	foreign key(idloai) references loai(idloai));
----------------------------------------------------
create table caidat(
	id varchar(20) not null primary key,
	idMay varchar(20),
	idPM varchar(20),
	ngaycai date default SYSDATE,
	foreign key(idMay) references may(idMay),
	foreign key(idPM) references phanmem(idPM));
	
----------------------------------------------------

insert into khuvuc values('130.120.80','Brin RDC',null);
insert into khuvuc values('130.120.81','Brin tang 1',null);
insert into khuvuc values('130.120.82','Brin tang 2',null);

----------------------------------------------------

insert into phong values('s01','salle 1',3,'130.120.80');
insert into phong values('s02','salle 2',2,'130.120.80');
insert into phong values('s03','salle 3',2,'130.120.80');
insert into phong values('s11','salle 11',2,'130.120.81');
insert into phong values('s12','salle 12',1,'130.120.81');
insert into phong values('s21','salle 21',2,'130.120.82');


--select * from khuvuc;
--select * from phong;
----------------------------------------------------

insert into loai values('TX','Terminal X-Window');
insert into loai values('UNIX','System Unix');
insert into loai values('PCNT','PC Windows NT');
insert into loai values('PCWS','PC Windows');
insert into loai values('NC','Network Computer');

-----------------------------------------------------
insert into may values('p1','Poste 1','130.120.80',01,'TX','s01');
insert into may values('p2','Poste 2','130.120.80',02,'UNIX','s01');
insert into may values('p3','Poste 3','130.120.80',03,'TX','s01');
insert into may values('p4','Poste 4','130.120.80',04,'PCWS','s02');
insert into may values('p5','Poste 5','130.120.80',05,'PCWS','s02');
insert into may values('p6','Poste 6','130.120.80',06,'UNIX','s03');
insert into may values('p7','Poste 7','130.120.80',07,'TX','s03');
insert into may values('p8','Poste 8','130.120.81',01,'UNIX','s11');
insert into may values('p9','Poste 9','130.120.81',02,'TX','s11');
insert into may values('p10','Poste 10','130.120.81',03,'UNIX','s12');
insert into may values('p11','Poste 11','130.120.82',01,'PCNT','s21');
insert into may values('p12','Poste 12','130.120.82',02,'PCWS','s21');
-----------------------------------------------------
insert into phanmem values('log1','Oracle 6','05-13-1995','6.2','UNIX',3000);
insert into phanmem values('log2','Oracle 8','09-15-1999','8i','UNIX',5600);
insert into phanmem values('log3','SQL Server','04-12-1998','7','PCNT',2700);
insert into phanmem values('log4','Front Page','06-03-1997','5','PCWS',500);
insert into phanmem values('log5','WinDev','05-12-1997','5','PCWS',750);
insert into phanmem values('log6','SQL*Net',null,'2.0','UNIX',500);
insert into phanmem values('log7','I.I.S.','04-12-2002','2','PCNT',810);

--SELECT * FROM PHANMEM;
-----------------------------------------------------
insert into caidat(idMay,idPM,id,ngaycai) values('p1','log1','13','08-10-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p1','log2','14','08-11-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p2','log1','1','05-15-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p2','log2','2','09-17-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p4','log5','3',null);
insert into caidat(idMay,idPM,id,ngaycai) values('p6','log6','4','05-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p6','log1','5','05-2-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p8','log2','6','05-19-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p8','log6','7','05-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p8','log1','12','06-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p11','log3','8','04-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p12','log4','9','04-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p11','log7','10','04-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p7','log7','11','04-01-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p12','log6','15','07-25-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p12','log1','16','03-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p3','log1','17','03-20-2003');




-- 2. Loại của máy 'p8'
SELECT L.TENLOAI FROM MAY M
JOIN LOAI L ON M.IDLOAI = L.IDLOAI
WHERE M.IDMAY = 'p8';

-- 3. Tên của các phần mềm 'UNIX'
SELECT TENPM FROM PHANMEM
WHERE IDLOAI = 'UNIX';

-- 4. Tên phòng, địa chỉ IP phòng, mã phòng của các máy loại 'UNIX' hoặc 'PCWS'
SELECT DISTINCT P.TENPHONG, P.IP, P.MP FROM MAY M
JOIN PHONG P ON M.MP = P.MP
WHERE M.IDLOAI IN ('UNIX', 'PCWS');

-- 5. Tên phòng, địa chỉ IP phòng, mã phòng của các máy loại 'UNIX' hoặc 'PCWS' ở khu vực '130.120.80', sắp xếp kết quả tăng dần theo mã phòng
SELECT DISTINCT P.TENPHONG, P.IP, P.MP FROM MAY M
JOIN PHONG P ON M.MP = P.MP
WHERE M.IDLOAI IN ('UNIX', 'PCWS') AND P.IP = '130.120.80'
ORDER BY P.MP;

-- 6. Số các phần mềm được cài đặt trên máy 'p6'
SELECT COUNT(*) SPM FROM CAIDAT
WHERE IDMAY = 'p6';

-- 7. Số các máy đã cài phầm mềm 'log1'
SELECT COUNT(*) SM FROM CAIDAT
WHERE IDPM = 'log1';

-- 8. Tên và địa chỉ IP đầy đủ của các máy loại 'TX'
SELECT TENMAY, IP||'.'||AD IPDAYDU FROM MAY
WHERE IDLOAI = 'TX';

-- 9. Tính số phần mềm đã cài đặt trên mỗi máy
SELECT IDMAY, COUNT(IDPM) SPM FROM CAIDAT
GROUP BY IDMAY;

-- 10. Tính số lần cài đặt của mỗi phần mềm
SELECT IDPM, COUNT(IDMAY) SLCD FROM CAIDAT
GROUP BY IDPM;

-- 11. Giá trung bình của các phần mềm UNIX
SELECT AVG(GIA) GTB_UNIX FROM PHANMEM
WHERE IDLOAI = 'UNIX'
GROUP BY IDLOAI;

-- 12. Ngày mua phần mềm gần nhất
SELECT MAX(NGAYMUA) NMGN FROM PHANMEM;

-- 13. Số máy có ít nhất 2 phần mềm
SELECT COUNT(*) SLM FROM (
    SELECT IDMAY, COUNT(IDPM) SPM FROM CAIDAT
    GROUP BY IDMAY
    HAVING COUNT(IDPM) >= 2
);

-- 14. Tìm các loại không thuộc loại máy nào
SELECT IDLOAI FROM LOAI
MINUS
SELECT IDLOAI FROM MAY;

-- 16. Tìm các loại thuộc cả hai loại máy và loại phần mềm
SELECT IDLOAI FROM PHANMEM
INTERSECT
SELECT IDLOAI FROM MAY;

-- 17. Tìm các loại máy không phải là loại phần mềm
SELECT IDLOAI FROM MAY
MINUS
SELECT IDLOAI FROM PHANMEM;

-- 18. Địa chỉ IP đầy đủ của các máy cài phần mềm 'log6'
SELECT M.IP||'.'||M.AD IPDAYDU FROM CAIDAT CD
JOIN MAY M ON CD.IDMAY = M.IDMAY
WHERE IDPM = 'log6';

-- 19. Địa chỉ IP đầy đủ của các máy cài phần mềm tên 'Oracle 8'
SELECT M.IP||'.'||M.AD IDAYDU FROM CAIDAT CD
JOIN MAY M ON CD.IDMAY = M.IDMAY
JOIN PHANMEM PM ON CD.IDPM = PM.IDPM
WHERE PM.TENPM = 'Oracle 8';

-- 20. Tên của các khu vực có chính xác 3 máy loại 'TX'
SELECT TENKHUVUC FROM MAY M
JOIN KHUVUC KV ON M.IP = KV.IP
WHERE IDLOAI = 'TX'
GROUP BY M.IP, TENKHUVUC
HAVING COUNT(IDMAY) = 3;

-- 21. Tên phòng có ít nhất một máy cài phần mềm tên 'Oracle 6'
SELECT DISTINCT P.TENPHONG FROM PHANMEM PM
JOIN CAIDAT C ON PM.IDPM = C.IDPM
JOIN MAY M ON C.IDMAY = M.IDMAY
JOIN PHONG P ON M.MP = P.MP
WHERE PM.TENPM = 'Oracle 6';

-- 22. Tên phần mềm được mua gần nhất
SELECT TENPM FROM PHANMEM
WHERE NGAYMUA = (
    SELECT MAX(NGAYMUA) FROM PHANMEM
);

-- 23. Tên của phần mềm PCNT có giá lớn hơn bất kỳ giá của một phần mềm UNIX nào
SELECT TENPM, GIA FROM PHANMEM
WHERE IDLOAI = 'PCNT' AND GIA > ANY (
    SELECT GIA FROM PHANMEM
    WHERE IDLOAI = 'UNIX'
);

-- 24. Tên của phần mềm UNIX có giá lớn hơn tất cả các giá của các phần mềm PCNT
SELECT TENPM, GIA FROM PHANMEM
WHERE IDLOAI = 'UNIX' AND GIA > (
    SELECT MAX(GIA) FROM PHANMEM
    WHERE IDLOAI = 'PCNT'
);

-- 25. Tên của máy có ít nhất một phần mềm chung với máy 'p6'
SELECT DISTINCT TENMAY FROM CAIDAT C
JOIN MAY M ON C.IDMAY = M.IDMAY
WHERE C.IDPM IN ( 
    SELECT IDPM FROM CAIDAT
    WHERE IDMAY = 'p6'
);

-- 26. Tên của máy có tất cả phần mềm chung với máy 'p6'
SELECT C.IDMAY FROM CAIDAT C
JOIN (
    SELECT IDPM FROM CAIDAT
    WHERE IDMAY = 'p6'
) TMP ON C.IDPM = TMP.IDPM
GROUP BY C.IDMAY
HAVING COUNT(C.IDPM) >= (
    SELECT COUNT(*) FROM (
        SELECT IDPM FROM CAIDAT
        WHERE IDMAY = 'p6'
    )
);


