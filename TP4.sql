CREATE TABLE  CGTRINH (
	STT_CTR int NOT NULL ,
	TEN_CTR varchar (20)  NULL ,
	DIACHI_CTR varchar (20)  NULL ,
	TINH_THANH varchar (15)  NULL ,
	KINH_PHI int NULL ,
	TEN_CHU varchar (20)  NULL ,
	TEN_THAU varchar (20)  NULL ,
	NGAY_BD date NULL 
) ;


CREATE TABLE  CHUNHAN (
	TEN_CHU varchar (20)  NOT NULL ,
	DCHI_CHU varchar (20)  NULL 
) ;


CREATE TABLE  CHUTHAU (
	TEN_THAU varchar (20)  NOT NULL ,
	TEL char (7)  NULL ,
	DCHI_THAU varchar (20)  NULL 
) ;


CREATE TABLE  CONGNHAN (
	HOTEN_CN varchar (20)  NOT NULL ,
	NAMS_CN int NULL ,
	NAM_VAO_N int NULL ,
	CH_MON varchar (10)  NULL 
) ;


CREATE TABLE  KTRUCSU (
	HOTEN_KTS varchar (20)  NOT NULL ,
	NAMS_KTS int NULL ,
	PHAI char (2)  NULL ,
	NOI_TN varchar (15)  NULL ,
	DCHI_LL_KTS varchar (30)  NULL 
) ;


CREATE TABLE  THAMGIA (
	HOTEN_CN varchar (20)  NOT NULL ,
	STT_CTR int NOT NULL ,
	NGAY_TGIA date NULL ,
	SO_NGAY int NULL 
) ;


CREATE TABLE  THIETKE (
	HOTEN_KTS varchar (20)  NOT NULL ,
	STT_CTR int NOT NULL ,
	THU_LAO int NULL 
) ;


ALTER TABLE  CGTRINH ADD 
	CONSTRAINT PK_CGTRINH PRIMARY KEY  	(STT_CTR	)  ; 


ALTER TABLE  CHUNHAN ADD 
	CONSTRAINT PK_CHUNHAN PRIMARY KEY  (	TEN_CHU	)  ; 


ALTER TABLE  CHUTHAU ADD 
	CONSTRAINT PK_CHUTHAU PRIMARY KEY  (	TEN_THAU	)  ; 


ALTER TABLE  CONGNHAN ADD 
	CONSTRAINT PK_CONGNHAN PRIMARY KEY  (	HOTEN_CN	)  ; 


ALTER TABLE  KTRUCSU ADD 
	CONSTRAINT PK_KTRUCSU PRIMARY KEY  	(	HOTEN_KTS	)  ; 


ALTER TABLE  THAMGIA ADD 
	CONSTRAINT PK_THAMGIA PRIMARY KEY  	(	HOTEN_CN,	STT_CTR	)  ; 


ALTER TABLE  THIETKE ADD 
	CONSTRAINT PK_THIETKE PRIMARY KEY  	(	HOTEN_KTS,	STT_CTR	)  ; 


ALTER TABLE  CGTRINH ADD 
	CONSTRAINT FK_CGTRINH_CHUNHAN FOREIGN KEY 	(	TEN_CHU	) REFERENCES  CHUNHAN (	TEN_CHU	);

ALTER TABLE  CGTRINH ADD 
	CONSTRAINT FK_CGTRINH_CHUTHAU FOREIGN KEY 
	(	TEN_THAU	) REFERENCES  CHUTHAU (	TEN_THAU	);


ALTER TABLE  THAMGIA ADD 
	CONSTRAINT FK_THAMGIA_CGTRINH FOREIGN KEY 
	(		STT_CTR	) REFERENCES  CGTRINH (		STT_CTR	);

ALTER TABLE  THAMGIA ADD 
	CONSTRAINT FK_THAMGIA_CONGNHAN FOREIGN KEY 
	(		HOTEN_CN	) REFERENCES  CONGNHAN (		HOTEN_CN	);


ALTER TABLE  THIETKE ADD 
	CONSTRAINT FK_THIETKE_CGTRINH FOREIGN KEY 	(STT_CTR) REFERENCES  CGTRINH (	STT_CTR	);

ALTER TABLE  THIETKE ADD 
	CONSTRAINT FK_THIETKE_KTRUCSU FOREIGN KEY 
	(	HOTEN_KTS	) REFERENCES  KTRUCSU (	HOTEN_KTS );


insert into  chunhan values ('so t mai du lich','54 xo viet nghe tinh');
insert into  chunhan values ('so van hoa thong tin','101 hai ba trung');
insert into  chunhan values ('so giao duc','29 duong 3/2');
insert into  chunhan values ('dai hoc can tho','56 duong 30/4');
insert into  chunhan values ('cty bitis','29 phan dinh phung');
insert into  chunhan values ('nguyen thanh ha','45 de tham');
insert into  chunhan values ('phan thanh liem','48/6 huynh thuc khan');


insert into  chuthau values ('cty xd so 6','567456','5 phan chu trinh');
insert into  chuthau values ('phong dich vu so xd','206481','2 le van sy');
insert into  chuthau values ('le van son','028374','12 tran nhan ton');
insert into  chuthau values ('tran khai hoan','658432','20 nguyen thai hoc');

insert into  congnhan values ('nguyen thi suu',   45 ,    60  ,'ho');
insert into  congnhan values ('vi chi a',   66  ,    87  ,'han');
insert into  congnhan values ('le manh quoc',   56  ,    71 ,'moc');
insert into  congnhan values ('vo van chin',   40 ,    52  ,'son');
insert into  congnhan values ('le quyet thang',   54  ,    74 ,'son');
insert into  congnhan values ('nguyen hong van',   50  ,    70   ,'dien');
insert into  congnhan values ('dang van son',   48,    65 ,'dien');


insert into  ktrucsu values ('le thanh tung',   1956          ,'1','tp hcm','25 duong 3/2 tp bien hoa');
insert into  ktrucsu values ('le kim dung',   1952          ,'0','ha noi','18/5 phan van tri tp can tho');
insert into  ktrucsu values ('nguyen anh thu',   1970          ,'0','new york usa','khu i dhct tp can tho');
insert into  ktrucsu values ('nguyen song do quyen',   1970          ,'0','tp hcm','73 tran hung dao tp hcm');
insert into  ktrucsu values ('truong minh thai',   1950          ,'1','paris france','12/2/5 tran phu tp hanoi');

insert into  cgtrinh values 
( 1       ,'khach san quoc te','5 nguyen an ninh','can tho',450 ,'so t mai du lich','cty xd so 6','dec-13-1994'); 
insert into  cgtrinh values 
( 2       ,'cong vien thieu nhi','100 nguyen thai hoc','can tho',   200         ,'so van hoa thong tin','cty xd so 6','may-08-1994'); 
insert into  cgtrinh values 
( 3       ,'hoi cho nong nghiep','bai cat','vinh long',   1000        ,'so t mai du lich','phong dich vu so xd','jun-10-1994'); 
insert into  cgtrinh values 
( 4       ,'truong mg mang non','48 cm thang 8','can tho',   30          ,'so giao duc','le van son','jun-10-1994'); 
insert into  cgtrinh values 
( 5       ,'khoa trong trot dhct','khu ii dhct','can tho',   3000        ,'dai hoc can tho','le van son','jun-10-1994'); 
insert into  cgtrinh values 
( 6       ,'van phong bitis','25 phan dinh phung','ha noi',   40          ,'cty bitis','le van son','oct-05-1994'); 
insert into  cgtrinh values 
( 7       ,'nha rieng 1','124/5 nguyen trai','tp hcm',   65          ,'nguyen thanh ha','phong dich vu so xd','nov-15-1994'); 
insert into  cgtrinh values 
( 8       ,'nha rieng 2','76 chau van liem','ha noi',   100         ,'phan thanh liem','tran khai hoan','sep-06-1994'); 

insert into  thamgia values ('nguyen thi suu',   2       ,'may-08-1994',   20          );
insert into  thamgia values ('nguyen thi suu',   4       ,'sep-07-1994',   20          );
insert into  thamgia values ('nguyen thi suu',   1       ,'dec-15-1994',   5           );
insert into  thamgia values ('le manh quoc',   1       ,'dec-18-1994',   6           );
insert into  thamgia values ('vo van chin',   2       ,'may-10-1994',   10          );
insert into  thamgia values ('le quyet thang',   2       ,'may-12-1994',   5           );
insert into  thamgia values ('nguyen hong van',   1       ,'dec-16-1994',   7           );
insert into  thamgia values ('nguyen hong van',   4       ,'sep-14-1994',   7           );
insert into  thamgia values ('dang van son',   3       ,'jun-10-1994',   18          );
insert into  thamgia values ('vo van chin',   3       ,'jun-10-1994',   10          );



insert into  thietke values ('le thanh tung',   1       ,    25          );
insert into  thietke values ('le kim dung',   5       ,    30          );
insert into  thietke values ('truong minh thai',   8       ,    18          );
insert into  thietke values ('le kim dung',   6       ,    40          );
insert into  thietke values ('nguyen anh thu',   3       ,    12          );
insert into  thietke values ('le thanh tung',   7       ,    10          );
insert into  thietke values ('nguyen song do quyen',   2       ,    6           );
insert into  thietke values ('truong minh thai',   6       ,    27          );
insert into  thietke values ('le kim dung',   4       ,    20          );
insert into  thietke values ('truong minh thai',   1       ,    12          );

-- 2. Mở các bảng dữ liệu ra để xem dữ liệu của từng trường và quan sát dữ liệu của từng bảng
SELECT * FROM KTRUCSU;
SELECT * FROM CHUTHAU;
SELECT * FROM CHUNHAN;
SELECT * FROM CONGNHAN;
SELECT * FROM CGTRINH;
SELECT * FROM THAMGIA;
SELECT * FROM THIETKE;

-- 3. Hãy cgo biết về kiến trúc sư có họ Lê và sinh năm 1956
SELECT * FROM KTRUCSU
WHERE HOTEN_KTS LIKE ('le%') AND NAMS_KTS = 1956;

-- 4. Hãy cho biết tên các công trình bắt đầu trong khoảng 1/9/1994 đến 20/10/1994
SELECT TEN_CTR FROM CGTRINH
WHERE NGAY_BD BETWEEN '9/1/1994' AND '10/20/1994';

-- 5. Hãy cho biết tên và địa chỉ các công trình do chủ thầu 'công ty xây dựng số 6' thi công
SELECT TEN_CTR, DIACHI_CTR FROM CGTRINH
WHERE TEN_THAU = 'cty xd so 6';

-- 6. Tìm tên và địa chỉ liên lạc của các chủ thầu thi công công trình Cần Thơ do kiến trúc sư Lê Kim Dung thiết kế
SELECT DISTINCT CT.TEN_THAU, CT.TEL FROM CGTRINH CTR
JOIN THIETKE TK ON CTR.STT_CTR = TK.STT_CTR
JOIN CHUTHAU CT ON CTR.TEN_THAU = CT.TEN_THAU
WHERE CTR.TINH_THANH = 'can tho' AND TK.HOTEN_KTS = 'le kim dung';

-- 7. Hãy cho biết nơi tốt nghiệp của các kiến trúc sư đã thiết kế công trình Khách sạn quốc tế ở Cần Thơ
SELECT KTS.HOTEN_KTS, KTS.NOI_TN FROM CGTRINH CTR
JOIN THIETKE TK ON CTR.STT_CTR = TK.STT_CTR
JOIN KTRUCSU KTS ON KTS.HOTEN_KTS = TK.HOTEN_KTS
WHERE TEN_CTR = 'khach san quoc te' AND TINH_THANH = 'can tho';

-- 8. Cho biết họ tên, năm sinh và năm vào nghề của các công nhân có chuyên môn hàn hoặc điện đã tham gia các công trình mà chủ thầu Lê Văn Sơn đã trúng thầu
SELECT HOTEN_CN, NAMS_CN, NAM_VAO_N FROM CONGNHAN
WHERE CH_MON = 'han' OR CH_MON = 'dien';

-- 9. Những công nhân nào bắt đầu tham gia công trình Khách sạn Quốc tế ở Cần Thơ trong giai đoạn từ ngày 15/12/1994 đến 31/12/1994
SELECT TG.HOTEN_CN FROM THAMGIA TG
JOIN CGTRINH CTR ON TG.STT_CTR = CTR.STT_CTR
WHERE (TG.NGAY_TGIA BETWEEN '12/15/1994' AND '12/31/1994') AND CTR.TEN_CTR = 'khach san quoc te' AND CTR.TINH_THANH = 'can tho';

-- 10. Cho biết họ tên và năm sinh của các kiến trúc sư đã tốt nghiệp ở TP HCM và đã thiết kế ít nhất một công trình có kinh phí đầu tư trên 400 triệu đồng
SELECT DISTINCT KTS.HOTEN_KTS FROM CGTRINH CTR
JOIN THIETKE TK ON CTR.STT_CTR = TK.STT_CTR
JOIN KTRUCSU KTS ON TK.HOTEN_KTS = KTS.HOTEN_KTS
WHERE CTR.KINH_PHI > 400 AND KTS.NOI_TN = 'tp hcm';

-- 11. Tìm họ tên và chuyên môn của các công nhân tham gia các công trình do kiến trúc sư Lê Thanh Tùng thiết kế
SELECT CN.HOTEN_CN, CN.CH_MON FROM THIETKE TK
JOIN THAMGIA TG ON TK.STT_CTR = TG.STT_CTR
JOIN CONGNHAN CN ON TG.HOTEN_CN = CN.HOTEN_CN
WHERE HOTEN_KTS = 'le thanh tung';

-- 12. Cho biết công trình có kinh phí cao nhất
SELECT TEN_CTR FROM CGTRINH
WHERE KINH_PHI = (
    SELECT MAX(KINH_PHI) KPLN FROM CGTRINH
);

-- 13. Cho biết họ tên kiến trúc sư trẻ tuổi nhất
SELECT HOTEN_KTS FROM KTRUCSU
WHERE NAMS_KTS = (
    SELECT MAX(NAMS_KTS) FROM KTRUCSU
);

-- 14. Tìm tổng kinh phí của các công trình theo từng chủ thầu
SELECT TEN_THAU, SUM(KINH_PHI) TONGKP FROM CGTRINH
GROUP BY TEN_THAU

-- 15. Tìm tên và địa chỉ những chủ thầu đã trúng thầu công trình có kinh phí thấp nhất
SELECT CT.TEN_THAU, CT.DCHI_THAU FROM CGTRINH CGT
JOIN CHUTHAU CT ON CGT.TEN_THAU = CT.TEN_THAU
WHERE CGT.KINH_PHI = (
    SELECT MIN(KINH_PHI) FROM CGTRINH
);

-- 16. Cho biết học tên các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
SELECT DISTINCT HOTEN_KTS FROM THIETKE
WHERE THU_LAO > 25

-- 17. Cho biết sô lượng các kiến trúc sư có tổng thù lao thiết kế các công trình lơn hơn 25 triêu
SELECT COUNT(*) SL_KTS FROM (
    SELECT DISTINCT HOTEN_KTS FROM THIETKE
    WHERE THU_LAO > 25
);

-- 18. Tính tổng số công trình mà mỗi kiến trúc sư đã thiết kế
SELECT HOTEN_KTS, COUNT(*) SLTK FROM THIETKE
GROUP BY HOTEN_KTS;

-- 19. Tính tổng số công nhân đã tham gia mỗi công trình
SELECT STT_CTR, COUNT(*) FROM THAMGIA
GROUP BY STT_CTR;

-- 20. Tìm tên và địa chỉ công trình có tổng số công nhân tham gia nhiều nhất
SELECT TEN_CTR, DIACHI_CTR FROM CGTRINH
WHERE STT_CTR IN (
    SELECT STT_CTR FROM THAMGIA
    GROUP BY STT_CTR
    HAVING COUNT(*) >= (
        SELECT MAX(SLCN) SLCNLN FROM (
            SELECT COUNT(*) SLCN FROM THAMGIA
            GROUP BY STT_CTR
        )

    )
);

-- 21. Cho biết tên các thành phố và kinh phí trung bình của các công trình của từng thành phố tương ứng
SELECT TINH_THANH, AVG(KINH_PHI) FROM CGTRINH
GROUP BY TINH_THANH

-- 22. Cho biết tên và địa chỉ của các công trình mà công nhân Nguyễn Hồng Vân đang tham gia vào ngày 18/12/1994
SELECT CTR.TEN_CTR, CTR.DIACHI_CTR, TG.NGAY_TGIA FROM THAMGIA TG
JOIN CGTRINH CTR ON TG.STT_CTR = CTR.STT_CTR
WHERE TG.HOTEN_CN = 'nguyen hong van' AND TG.NGAY_TGIA = '12/16/1994';

-- 23. Cho biết họ tên kiến trúc sư vừa thiết kế các công trình do Phòng dịch vụ Sở Xây dựng thi công, vừa thiết kế các công trình do chủ thầu Lê Văn Sơn thi công



-- 24. Cho biết tên các công nhân có tham gia các công trình ở Cần Thơ nhưng không tham gia công trình ở Vĩnh Long
SELECT TG.HOTEN_CN FROM THAMGIA TG
JOIN CGTRINH CTR ON TG.STT_CTR = CTR.STT_CTR
WHERE CTR.TINH_THANH = 'can tho'
MINUS
SELECT TG.HOTEN_CN FROM THAMGIA TG
JOIN CGTRINH CTR ON TG.STT_CTR = CTR.STT_CTR
WHERE CTR.TINH_THANH = 'vinh long'






