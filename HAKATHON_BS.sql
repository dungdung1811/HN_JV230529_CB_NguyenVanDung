-- drop database QUANLYDIEMTHI;
CREATE DATABASE QUANLYDIEMTHI;
USE QUANLYDIEMTHI;
CREATE TABLE STUDENT(
studentId VARCHAR(4) NOT NULL PRIMARY KEY,
studentName VARCHAR(100) NOT NULL,
birthday DATE NOT NULL,
gender BIT(1) NOT NULL,
assress TEXT NOT NULL,
phoneNumber VARCHAR(45) 
);
CREATE TABLE SUBJECT(
subjectId VARCHAR(4) NOT NULL PRIMARY KEY,
subjectName VARCHAR(45) NOT NULL,
priority INT(11) NOT NULL
);

CREATE TABLE MARK (
    subjectId VARCHAR(4) NOT NULL,
    studentId VARCHAR(4) NOT NULL,
    point FLOAT(11) NOT NULL,
    PRIMARY KEY (subjectId, studentId)
);


ALTER TABLE MARK
ADD CONSTRAINT fk_subject FOREIGN KEY (subjectId) REFERENCES SUBJECT(subjectId);

ALTER TABLE MARK
ADD CONSTRAINT fk_student FOREIGN KEY (studentId) REFERENCES STUDENT(studentId);
-- Thêm dữ liệu vào bảng Student 
INSERT INTO STUDENT (studentId, studentName, birthday, gender, assress, phoneNumber)
VALUES
('S001', 'Nguyễn Thế Anh', '1999-11-01', 1, 'Hà Nội', '984678082'),
('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '904982654'),
('S003', 'Trần Hà Phương', '2000-05-05', 0, 'Nghệ An', '947645363'),
('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', '983665353'),
('S005', 'Phạm Duy Nhất', '1998-10-04', 1, 'Tuyên Quang', '987242678'),
('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Định', '982654268'),
('S007', 'Giang Gia Hân', '1996-10-11', 0, 'Phú Thọ', '982364753'),
('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '927867453'),
('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '989274673'),
('S010', 'Nguyễn Thiều Quang', '2000-09-18', 1, 'Hà Nội', '984378291');
-- thêm dữ liệu vào bảng subject
INSERT INTO SUBJECT (subjectId, subjectName, priority)
VALUES
('MH01', 'Toán', 2),
('MH02', 'Vật Lý', 2),
('MH03', 'Hoá Học', 1),
('MH04', 'Ngữ Văn', 1),
('MH05', 'Tiếng Anh', 2);
 -- thêm dữ liệu cho bảng mark
 INSERT INTO MARK (subjectId, studentId, point)
VALUES
('MH01', 'S001', 8.5), ('MH02', 'S001', 7), ('MH03', 'S001', 9), ('MH04', 'S001', 9), ('MH05', 'S001', 5),
('MH01', 'S002', 9), ('MH02', 'S002', 8), ('MH03', 'S002', 6.5), ('MH04', 'S002', 8), ('MH05', 'S002', 6),
('MH01', 'S003', 7.5), ('MH02', 'S003', 6.5), ('MH03', 'S003', 8), ('MH04', 'S003', 7), ('MH05', 'S003', 7),
('MH01', 'S004', 6), ('MH02', 'S004', 7), ('MH03', 'S004', 5), ('MH04', 'S004', 6.5), ('MH05', 'S004', 8),
('MH01', 'S005', 5.5), ('MH02', 'S005', 8), ('MH03', 'S005', 7.5), ('MH04', 'S005', 8.5), ('MH05', 'S005', 9),
('MH01', 'S006', 8), ('MH02', 'S006', 10), ('MH03', 'S006', 9), ('MH04', 'S006', 7.5), ('MH05', 'S006', 6.5),
('MH01', 'S007', 9.5), ('MH02', 'S007', 9), ('MH03', 'S007', 6), ('MH04', 'S007', 9), ('MH05', 'S007', 4),
('MH01', 'S008', 10), ('MH02', 'S008', 8.5), ('MH03', 'S008', 8.5), ('MH04', 'S008', 6), ('MH05', 'S008', 9.5),
('MH01', 'S009', 7.5), ('MH02', 'S009', 7), ('MH03', 'S009', 9), ('MH04', 'S009', 5), ('MH05', 'S009', 10),
('MH01', 'S010', 6.5), ('MH02', 'S010', 8), ('MH03', 'S010', 5.5), ('MH04', 'S010', 4), ('MH05', 'S010', 7);

-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”. 
UPDATE STUDENT
SET studentName = 'Đỗ Đức Mạnh'
WHERE studentId = 'S004';

-- Sửa tên và hệ số môn học có mã `MH05` thành “NgoạiNgữ” và hệ số là 1.
UPDATE SUBJECT
SET subjectName = 'Ngoại Ngữ'
WHERE subjectId = 'MH05';

-- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6,
-- MH05 : 9).

UPDATE MARK
SET point = CASE(subjectId)
    WHEN 'MH01' THEN 8.5
    WHEN  'MH02' THEN 7
    WHEN 'MH03' THEN 5.5
    WHEN  'MH04' THEN 6
    WHEN  'MH05' THEN 9
END
WHERE studentId = 'S009';
SELECT * FROM MARK where studentId = 'S009';

-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh
-- này ở bảng STUDENT.
-- Xóa dữ liệu từ bảng MARK
DELETE FROM MARK
WHERE studentId = 'S010';
SELECT * FROM MARK;

-- Xóa dữ liệu từ bảng STUDENT
DELETE FROM STUDENT
WHERE studentId = 'S010';
SELECT * FROM STUDENT;


-- Bài 3:
-- Lấy ra tất cả thông tin của sinh viên trong bảng Student
SELECT * FROM STUDENT;
-- Hiển thị tên và mã môn học của những môn có hệ số bằng 1. 
SELECT subjectId, subjectName FROM SUBJECT WHERE priority =1 ;
 
-- Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh.
SELECT studentId, studentName, 
       YEAR(CURDATE()) - YEAR(birthday) AS age, 
       CASE 
           WHEN gender = 1 THEN 'Nam'
           WHEN gender = 0 THEN 'Nữ'
           ELSE 'Không rõ'
       END AS gender, 
       address
FROM STUDENT;

-- Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
-- Toán và sắp xếp theo điểm giảm dần.
SELECT STUDENT.studentName, SUBJECT.subjectName, MARK.point
FROM MARK
JOIN STUDENT ON MARK.studentId = STUDENT.studentId
JOIN SUBJECT ON MARK.subjectId = SUBJECT.subjectId
WHERE SUBJECT.subjectName = 'Toán'
ORDER BY MARK.point DESC;

-- Thống kê số lượng học sinh theo giới tính ở trong bảng
SELECT CASE
    WHEN gender = 1 THEN 'Nam'
    WHEN gender = 0 THEN 'Nữ'
    ELSE 'Không rõ'
END AS gender,
COUNT(*) AS studentCount
FROM STUDENT
GROUP BY gender;


-- Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
-- để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình.
SELECT STUDENT.studentId, STUDENT.studentName,
       SUM(MARK.point) AS TongDiem,
       AVG(MARK.point) AS diemtrungbinh
FROM STUDENT
JOIN MARK ON STUDENT.studentId = MARK.studentId
GROUP BY STUDENT.studentId, STUDENT.studentName;

-- Bài 4
-- Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
-- sinh, giới tính , quê quán
CREATE VIEW STUDENT_VIEW AS
SELECT studentId, studentName, (CASE WHEN gender = 1 THEN 'Nam' WHEN gender = 0 THEN 'Nữ' END) AS gender, assress
FROM STUDENT;
SELECT * FROM STUDENT_VIEW;


-- Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
-- điểm trung bình các môn học
CREATE VIEW AVERAGE_MARK_VIEW AS
SELECT STUDENT.studentId, STUDENT.studentName, AVG(MARK.point) AS averageMark
FROM STUDENT
LEFT JOIN MARK ON STUDENT.studentId = MARK.studentId
GROUP BY STUDENT.studentId, STUDENT.studentName;
SELECT * FROM AVERAGE_MARK_VIEW;

-- Đánh Index cho trường `phoneNumber` của bảng STUDENT.
CREATE INDEX idx_phoneNumber ON STUDENT (phoneNumber);


-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
-- thông tin học sinh đó.


DELIMITER && 
CREATE PROCEDURE PROC_INSERTSTUDENT (
  IN in_studentId VARCHAR(4),
  IN in_studentName VARCHAR(100),
  IN in_birthday DATE,
  IN in_gender BIT(1),
  IN in_address TEXT,
  IN in_phoneNumber VARCHAR(45)
)
BEGIN
  INSERT INTO STUDENT (studentId, studentName, birthday, gender, address, phoneNumber)
  VALUES (in_studentId, in_studentName, in_birthday, in_gender, in_address, in_phoneNumber);
END && DELIMITER ;

CALL PROC_INSERTSTUDENT();



-- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
DELIMITER &&
CREATE PROCEDURE PROC_DELETEMARK (
  IN in_studentId VARCHAR(4),
  OUT out_deletedRows INT
)
BEGIN
  DECLARE row_count INT;
  
  DELETE FROM MARK
  WHERE studentId = in_studentId;

  SET row_count = ROW_COUNT();
  SET out_deletedRows = row_count;
END && DELIMITER ;
CALL PROC_DELETEMARK();


-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học
-- sinh và trả về số bản ghi đã xóa.
DELIMITER &&
CREATE PROCEDURE PROC_DELETEMARK (
  IN in_studentId VARCHAR(4),
  OUT out_deletedRows INT
)
BEGIN
  DECLARE row_count INT;
  DELETE FROM MARK
  WHERE studentId = in_studentId;
  SET row_count = ROW_COUNT();
  SET out_deletedRows = row_count;
END && DELIMITER ;
CALL PROC_DELETEMARK();
