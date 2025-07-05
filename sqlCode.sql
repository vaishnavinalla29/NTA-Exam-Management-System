CREATE DATABASE NTA;

        -- 1. COLLEGE
        CREATE TABLE COLLEGE (
            college_id INT PRIMARY KEY,
            name VARCHAR(20),
            city VARCHAR(20)
        );
        SELECT * FROM COLLEGE;
        -- 2. STUDENT1
        CREATE TABLE STUDENT1 (
            student_id INT PRIMARY KEY,
            email VARCHAR(20) UNIQUE,
            college_id INT,
            FOREIGN KEY (college_id) REFERENCES COLLEGE(college_id)
        );
         SELECT * FROM STUDENT1;
        -- 3. STUDENT_INFO
        CREATE TABLE STUDENT_INFO (
            email VARCHAR(20) PRIMARY KEY,
            name VARCHAR(20),
            dob DATE,
            gender CHAR(1),
            FOREIGN KEY (email) REFERENCES STUDENT1(email)
        );
         SELECT * FOM STUDENT_INFO;
        -- 4. EXAM_INFO
        CREATE TABLE EXAM_INFO (
            exam_id INT PRIMARY KEY,
            exam_name VARCHAR(20),
            duration INT
        );
         SELECT * FROM EXAM_INFO;
        -- 5. EXAM_SCHEDULE
        CREATE TABLE EXAM_SCHEDULE (
            exam_id INT,
            datee DATE,
            PRIMARY KEY (exam_id, datee),
            FOREIGN KEY (exam_id) REFERENCES EXAM_INFO(exam_id)
        );
         SELECT * FROM EXAM_SCHEDULE;
        -- 6. EXAMCENTER
        CREATE TABLE EXAMCENTER (
            center_id INT PRIMARY KEY,
            name VARCHAR(20),
            location VARCHAR(20),
            capacity INT
        );
        SELECT * FROM EXAMCENTER;
        -- 7. CENTERSTAFF_INFO
        CREATE TABLE CENTERSTAFF_INFO (
            staff_id INT PRIMARY KEY,
            name VARCHAR(20),
            role VARCHAR(20),
            phone VARCHAR(15),
            age INT,
            gender CHAR(1),
            center_id INT,
            FOREIGN KEY (center_id) REFERENCES EXAMCENTER(center_id)
        );
        SELECT * FROM  CENTERSTAFF_INFO;
        -- 8. CENTERSTAFF1
        CREATE TABLE CENTERSTAFF1 (
            staff_id INT,
            assigned_date DATE,
            PRIMARY KEY (staff_id, assigned_date),
            FOREIGN KEY (staff_id) REFERENCES CENTERSTAFF_INFO(staff_id)
        );
        SELECT * FROM CENTERSTAFF1;
        -- 9. HALLTICKET
        CREATE TABLE HALLTICKET (
            ticket_id INT,
            student_id INT,
            exam_id INT,
            center_id INT,
            PRIMARY KEY (ticket_id, exam_id),
            FOREIGN KEY (student_id) REFERENCES STUDENT1(student_id),
            FOREIGN KEY (exam_id) REFERENCES EXAM_INFO(exam_id),
            FOREIGN KEY (center_id) REFERENCES EXAMCENTER(center_id)
        );
        SELECT * FROM HALLTICKET;
        -- 10. RESULT
        CREATE TABLE RESULT (
            student_id INT,
            exam_id INT,
            rank INT,
            PRIMARY KEY (student_id, exam_id),
            FOREIGN KEY (student_id) REFERENCES STUDENT1(student_id),
            FOREIGN KEY (exam_id) REFERENCES EXAM_INFO(exam_id)
        );
        SELECT * FROM  RESULT;
        
        -- 11. CONDUCTS
        CREATE TABLE CONDUCTS (
            exam_id INT,
            center_id INT,
            datee DATE,
            sessionn VARCHAR(2) CHECK (sessionn IN ('FN', 'AN')),
            PRIMARY KEY (center_id, datee, sessionn),
            FOREIGN KEY (exam_id) REFERENCES EXAM_INFO(exam_id),
            FOREIGN KEY (center_id) REFERENCES EXAMCENTER(center_id)
        ); 
        SELECT * FROM CONDUCTS;
        
        -- 12. ATTENDS
        CREATE TABLE ATTENDS (
            student_id INT,
            exam_id INT,
            status VARCHAR(20),
            PRIMARY KEY (student_id, exam_id),
            FOREIGN KEY (student_id) REFERENCES STUDENT1(student_id),
            FOREIGN KEY (exam_id) REFERENCES EXAM_INFO(exam_id)
        );
        SELECT * FROM ATTENDS;
        --INSERTING VALUES
        
        INSERT INTO college VALUES (1, 'NIT Warangal', 'Warangal');
        INSERT INTO college VALUES (2, 'IIT Madras', 'Chennai');
        INSERT INTO college VALUES (3, 'BITS Pilani', 'Pilani');
        INSERT INTO college VALUES (4, 'IIT Bombay', 'Mumbai');
        INSERT INTO college VALUES (5, 'IIIT Hyderabad', 'Hyderabad');
        
        select * from college;
        
        INSERT INTO Student1 VALUES (101, 's101@college.com', 1);
        INSERT INTO Student1 VALUES (102, 's102@college.com', 2);
        INSERT INTO Student1 VALUES (103, 's103@college.com', 3);
        INSERT INTO Student1 VALUES (104, 's104@college.com', 1);
        INSERT INTO Student1 VALUES (105, 's105@college.com', 4);
        INSERT INTO Student1 VALUES (106, 's106@college.com', 2);
        INSERT INTO Student1 VALUES (107, 's107@college.com', 5);
        INSERT INTO Student1 VALUES (108, 's108@college.com', 3);
        INSERT INTO Student1 VALUES (109, 's109@college.com', 4);
        INSERT INTO Student1 VALUES (110, 's110@college.com', 1);
        INSERT INTO Student1 VALUES (111, 's111@college.com', 5);
        INSERT INTO Student1 VALUES (112, 's112@college.com', 1);
        INSERT INTO Student1 VALUES (113, 's113@college.com', 2);
        INSERT INTO Student1 VALUES (114, 's114@college.com', 3);
        INSERT INTO Student1 VALUES (115, 's115@college.com', 1);
        
        select * from Student1;
        
        
        INSERT INTO Student_info VALUES ('s101@college.com', 'kavya', TO_DATE('2001-02-22', 'YYYY-MM-DD'), 'M');
        INSERT INTO Student_info VALUES ('s102@college.com', 'vikram', TO_DATE('2005-07-18', 'YYYY-MM-DD'), 'F');
        INSERT INTO Student_info VALUES ('s103@college.com', 'ananya', TO_DATE('2002-01-11', 'YYYY-MM-DD'), 'F');
        INSERT INTO Student_info VALUES ('s104@college.com', 'arjun', TO_DATE('2000-03-27', 'YYYY-MM-DD'), 'M');
        INSERT INTO Student_info VALUES ('s105@college.com', 'ishitha', TO_DATE('2001-05-21', 'YYYY-MM-DD'), 'F');
        INSERT INTO Student_info VALUES ('s106@college.com', 'aarav', TO_DATE('2000-04-26', 'YYYY-MM-DD'), 'M');
        INSERT INTO Student_info VALUES ('s107@college.com', 'meera', TO_DATE('2002-09-11', 'YYYY-MM-DD'), 'F');
        INSERT INTO Student_info VALUES ('s108@college.com', 'aditha', TO_DATE('2004-02-14', 'YYYY-MM-DD'), 'M');
        INSERT INTO Student_info VALUES ('s109@college.com', 'shruthi', TO_DATE('2005-07-19', 'YYYY-MM-DD'), 'M');
        INSERT INTO Student_info VALUES ('s110@college.com', 'rajesh', TO_DATE('2000-04-10', 'YYYY-MM-DD'), 'F');
        INSERT INTO Student_info VALUES ('s111@college.com', 'vishwa', TO_DATE('2000-01-21', 'YYYY-MM-DD'), 'F');
        INSERT INTO Student_info VALUES ('s112@college.com', 'nandini', TO_DATE('2002-06-16', 'YYYY-MM-DD'), 'M');
        INSERT INTO Student_info VALUES ('s113@college.com', 'rohan', TO_DATE('2002-03-28', 'YYYY-MM-DD'), 'M');
        INSERT INTO Student_info VALUES ('s114@college.com', 'karthik', TO_DATE('2005-03-19', 'YYYY-MM-DD'), 'F');
        INSERT INTO Student_info VALUES ('s115@college.com', 'yashwanth', TO_DATE('2000-06-10', 'YYYY-MM-DD'), 'M');
        
        select * from Student_info;
        
        INSERT INTO exam_info VALUES (1, 'JEE Main', 180);
        INSERT INTO exam_info VALUES (2, 'NEET', 180);
        INSERT INTO exam_info VALUES (3, 'CUET', 180);
        INSERT INTO exam_info VALUES (4, 'GATE', 180);
        INSERT INTO exam_info VALUES (5, 'UGC NET', 180);
        
        select * from exam_info;
        
        INSERT INTO exam_schedule VALUES (4, TO_DATE('2025-07-01', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (2, TO_DATE('2025-07-02', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (4, TO_DATE('2025-07-03', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (2, TO_DATE('2025-07-04', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (2, TO_DATE('2025-07-05', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (4, TO_DATE('2025-07-06', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (1, TO_DATE('2025-07-07', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (1, TO_DATE('2025-07-08', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (2, TO_DATE('2025-07-09', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (2, TO_DATE('2025-07-10', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (2, TO_DATE('2025-07-11', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (5, TO_DATE('2025-07-12', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (4, TO_DATE('2025-07-13', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (3, TO_DATE('2025-07-14', 'YYYY-MM-DD'));
        INSERT INTO exam_schedule VALUES (2, TO_DATE('2025-07-15', 'YYYY-MM-DD'));
        
        select * from exam_schedule;
        
        INSERT INTO examcenter VALUES (11, 'Center A', 'Delhi', 300);
        INSERT INTO examcenter VALUES (12, 'Center B', 'Mumbai', 350);
        INSERT INTO examcenter VALUES (13, 'Center C', 'Chennai', 400);
        INSERT INTO examcenter VALUES (14, 'Center D', 'Hyderabad', 320);
        INSERT INTO examcenter VALUES (15, 'Center E', 'Bangalore', 280);
        
        select * from examcenter;
        
        INSERT INTO centerstaff_info VALUES (501, 'Abdul', 'Clerk', 986178502, 35, 'M', 14);
        INSERT INTO centerstaff_info VALUES (502, 'Priya', 'Support', 973754999, 39, 'F', 11);
        INSERT INTO centerstaff_info VALUES (503, 'Ravi', 'Clerk', 985778517, 45, 'F', 12);
        INSERT INTO centerstaff_info VALUES (504, 'Meena', 'Security', 934939145, 32, 'M', 13);
        INSERT INTO centerstaff_info VALUES (505, 'John', 'Security', 973501109, 38, 'F', 13);
        INSERT INTO centerstaff_info VALUES (506, 'Lakshmi', 'Invigilator', 984143956, 37, 'F', 11);
        INSERT INTO centerstaff_info VALUES (507, 'Karan', 'Security', 932657402, 40, 'F', 14);
        INSERT INTO centerstaff_info VALUES (508, 'Ravi', 'Support', 944269049, 30, 'F', 15);
        
        select * from centerstaff_info;
        
        INSERT INTO centerstaff1 VALUES (501, TO_DATE('2025-07-01', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (504, TO_DATE('2025-07-02', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (507, TO_DATE('2025-07-03', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (501, TO_DATE('2025-07-04', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (504, TO_DATE('2025-07-05', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (505, TO_DATE('2025-07-06', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (506, TO_DATE('2025-07-07', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (502, TO_DATE('2025-07-08', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (508, TO_DATE('2025-07-09', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (507, TO_DATE('2025-07-10', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (504, TO_DATE('2025-07-11', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (503, TO_DATE('2025-07-12', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (503, TO_DATE('2025-07-13', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (502, TO_DATE('2025-07-14', 'YYYY-MM-DD'));
        INSERT INTO centerstaff1 VALUES (506, TO_DATE('2025-07-15', 'YYYY-MM-DD'));
        
        select * from centerstaff1;
        
        INSERT INTO hallticket VALUES (1001, 101, 2, 12);
        INSERT INTO hallticket VALUES (1002, 101, 1, 11);
        INSERT INTO hallticket VALUES (1003, 102, 5, 11);
        INSERT INTO hallticket VALUES (1004, 103, 1, 14);
        INSERT INTO hallticket VALUES (1005, 103, 2, 15);
        INSERT INTO hallticket VALUES (1006, 104, 4, 13);
        INSERT INTO hallticket VALUES (1007, 104, 3, 14);
        INSERT INTO hallticket VALUES (1008, 105, 2, 12);
        INSERT INTO hallticket VALUES (1009, 106, 2, 11);
        INSERT INTO hallticket VALUES (1010, 106, 4, 13);
        INSERT INTO hallticket VALUES (1011, 107, 4, 13);
        INSERT INTO hallticket VALUES (1012, 107, 2, 15);
        INSERT INTO hallticket VALUES (1013, 108, 3, 12);
        INSERT INTO hallticket VALUES (1014, 109, 1, 12);
        INSERT INTO hallticket VALUES (1015, 109, 5, 12);
        INSERT INTO hallticket VALUES (1016, 110, 5, 11);
        INSERT INTO hallticket VALUES (1017, 111, 5, 13);
        INSERT INTO hallticket VALUES (1018, 112, 5, 13);
        INSERT INTO hallticket VALUES (1020, 113, 2, 11);
        INSERT INTO hallticket VALUES (1021, 114, 4, 14);
        INSERT INTO hallticket VALUES (1022, 114, 2, 11);
        INSERT INTO hallticket VALUES (1023, 115, 1, 14);
        INSERT INTO hallticket VALUES (1024, 115, 3, 13);
        INSERT INTO hallticket VALUES (1025, 102, 2, 11);
        INSERT INTO hallticket VALUES (1026, 102, 1, 11);
        INSERT INTO hallticket VALUES (1027, 104, 1, 13);
        INSERT INTO hallticket VALUES (1028, 108, 1, 12);
        INSERT INTO hallticket VALUES (1029, 109, 2, 14);
        INSERT INTO hallticket VALUES (1030, 110, 2, 13);
        INSERT INTO hallticket VALUES (1031, 111, 2, 13);
        INSERT INTO hallticket VALUES (1032, 112, 1, 12);
        
        select * from hallticket;
        
        
        INSERT INTO result VALUES (101, 1, 74);
        INSERT INTO result VALUES (102, 1, 94);
        INSERT INTO result VALUES (102, 2, 83);
        INSERT INTO result VALUES (104, 1, 38);
        INSERT INTO result VALUES (106, 2, 80);
        INSERT INTO result VALUES (107, 1, 87);
        INSERT INTO result VALUES (107, 2, 80);
        INSERT INTO result VALUES (108, 1, 39);
        INSERT INTO result VALUES (108, 2, 56);
        INSERT INTO result VALUES (109, 2, 77);
        INSERT INTO result VALUES (110, 1, 84);
        INSERT INTO result VALUES (110, 2, 36);
        INSERT INTO result VALUES (111, 2, 48);
        INSERT INTO result VALUES (112, 1, 39);
        INSERT INTO result VALUES (114, 2, 72);
        INSERT INTO result VALUES (115, 1, 72);
        INSERT INTO result VALUES (115, 2, 76);
        INSERT INTO result VALUES (101, 3, 61);
        INSERT INTO result VALUES (101, 5, 66);
        INSERT INTO result VALUES (102, 3, 88);
        INSERT INTO result VALUES (102, 4, 75);
        INSERT INTO result VALUES (102, 5, 81);
        INSERT INTO result VALUES (103, 4, 59);
        INSERT INTO result VALUES (104, 5, 77);
        INSERT INTO result VALUES (105, 3, 73);
        INSERT INTO result VALUES (105, 4, 64);
        INSERT INTO result VALUES (105, 5, 90);
        INSERT INTO result VALUES (106, 3, 52);
        INSERT INTO result VALUES (107, 3, 91);
        INSERT INTO result VALUES (107, 4, 85);
        INSERT INTO result VALUES (107, 5, 87);
        INSERT INTO result VALUES (108, 3, 62);
        INSERT INTO result VALUES (108, 5, 84);
        INSERT INTO result VALUES (110, 3, 90);
        INSERT INTO result VALUES (110, 4, 88);
        INSERT INTO result VALUES (110, 5, 76);
        INSERT INTO result VALUES (111, 3, 79);
        INSERT INTO result VALUES (111, 5, 69);
        INSERT INTO result VALUES (112, 4, 55);
        INSERT INTO result VALUES (112, 5, 74);
        INSERT INTO result VALUES (113, 3, 58);
        INSERT INTO result VALUES (113, 4, 61);
        INSERT INTO result VALUES (114, 5, 65);
        INSERT INTO result VALUES (115, 3, 89);
        INSERT INTO result VALUES (115, 4, 78);
        
        Select * from result;
        
        INSERT INTO attends VALUES (101, 1, 'Present');
        INSERT INTO attends VALUES (101, 2, 'Absent');
        INSERT INTO attends VALUES (102, 1, 'Present');
        INSERT INTO attends VALUES (102, 2, 'Present');
        INSERT INTO attends VALUES (103, 1, 'Absent');
        INSERT INTO attends VALUES (103, 2, 'Absent');
        INSERT INTO attends VALUES (104, 1, 'Present');
        INSERT INTO attends VALUES (104, 2, 'Absent');
        INSERT INTO attends VALUES (105, 1, 'Present');
        INSERT INTO attends VALUES (105, 2, 'Absent');
        INSERT INTO attends VALUES (106, 1, 'Absent');
        INSERT INTO attends VALUES (106, 2, 'Present');
        INSERT INTO attends VALUES (107, 1, 'Present');
        INSERT INTO attends VALUES (107, 2, 'Present');
        INSERT INTO attends VALUES (108, 1, 'Present');
        INSERT INTO attends VALUES (108, 2, 'Present');
        INSERT INTO attends VALUES (109, 1, 'Absent');
        INSERT INTO attends VALUES (109, 2, 'Present');
        INSERT INTO attends VALUES (110, 1, 'Present');
        INSERT INTO attends VALUES (110, 2, 'Present');
        INSERT INTO attends VALUES (111, 1, 'Absent');
        INSERT INTO attends VALUES (111, 2, 'Present');
        INSERT INTO attends VALUES (112, 1, 'Present');
        INSERT INTO attends VALUES (112, 2, 'Absent');
        INSERT INTO attends VALUES (113, 2, 'Absent');
        INSERT INTO attends VALUES (114, 1, 'Absent');
        INSERT INTO attends VALUES (114, 2, 'Present');
        INSERT INTO attends VALUES (115, 1, 'Present');
        INSERT INTO attends VALUES (115, 2, 'Absent');
        INSERT INTO attends VALUES (101, 3, 'Present');
        INSERT INTO attends VALUES (101, 4, 'Absent');
        INSERT INTO attends VALUES (101, 5, 'Present');
        INSERT INTO attends VALUES (102, 3, 'Present');
        INSERT INTO attends VALUES (102, 4, 'Present');
        INSERT INTO attends VALUES (102, 5, 'Present');
        INSERT INTO attends VALUES (103, 3, 'Absent');
        INSERT INTO attends VALUES (103, 4, 'Present');
        INSERT INTO attends VALUES (103, 5, 'Absent');
        INSERT INTO attends VALUES (104, 3, 'Absent');
        INSERT INTO attends VALUES (104, 4, 'Absent');
        INSERT INTO attends VALUES (104, 5, 'Present');
        INSERT INTO attends VALUES (105, 3, 'Present');
        INSERT INTO attends VALUES (105, 4, 'Present');
        INSERT INTO attends VALUES (105, 5, 'Present');
        INSERT INTO attends VALUES (106, 3, 'Present');
        INSERT INTO attends VALUES (106, 4, 'Absent');
        INSERT INTO attends VALUES (106, 5, 'Absent');
        INSERT INTO attends VALUES (107, 3, 'Present');
        INSERT INTO attends VALUES (107, 4, 'Present');
        INSERT INTO attends VALUES (107, 5, 'Present');
        INSERT INTO attends VALUES (108, 3, 'Present');
        INSERT INTO attends VALUES (108, 4, 'Absent');
        INSERT INTO attends VALUES (108, 5, 'Present');
        INSERT INTO attends VALUES (109, 3, 'Absent');
        INSERT INTO attends VALUES (109, 4, 'Absent');
        INSERT INTO attends VALUES (109, 5, 'Absent');
        INSERT INTO attends VALUES (110, 3, 'Present');
        INSERT INTO attends VALUES (110, 4, 'Present');
        INSERT INTO attends VALUES (110, 5, 'Present');
        INSERT INTO attends VALUES (111, 3, 'Present');
        INSERT INTO attends VALUES (111, 4, 'Absent');
        INSERT INTO attends VALUES (111, 5, 'Present');
        INSERT INTO attends VALUES (112, 3, 'Absent');
        INSERT INTO attends VALUES (112, 4, 'Present');
        INSERT INTO attends VALUES (112, 5, 'Present');
        INSERT INTO attends VALUES (113, 3, 'Present');
        INSERT INTO attends VALUES (113, 4, 'Present');
        INSERT INTO attends VALUES (113, 5, 'Absent');
        INSERT INTO attends VALUES (114, 3, 'Absent');
        INSERT INTO attends VALUES (114, 4, 'Absent');
        INSERT INTO attends VALUES (114, 5, 'Present');
        INSERT INTO attends VALUES (115, 3, 'Present');
        INSERT INTO attends VALUES (115, 4, 'Present');
        INSERT INTO attends VALUES (115, 5, 'Absent');
        
        
        SELECT * FROM attends;
        
        
        INSERT INTO conducts VALUES (4, 15, TO_DATE('2025-07-01', 'YYYY-MM-DD'), 'FN');  
        INSERT INTO conducts VALUES (2, 14, TO_DATE('2025-07-02', 'YYYY-MM-DD'), 'AN');  
        INSERT INTO conducts VALUES (4, 14, TO_DATE('2025-07-03', 'YYYY-MM-DD'), 'FN');  
        INSERT INTO conducts VALUES (2, 13, TO_DATE('2025-07-04', 'YYYY-MM-DD'), 'AN');  
        INSERT INTO conducts VALUES (2, 11, TO_DATE('2025-07-05', 'YYYY-MM-DD'), 'FN');  
        INSERT INTO conducts VALUES (4, 12, TO_DATE('2025-07-06', 'YYYY-MM-DD'), 'AN');  
        INSERT INTO conducts VALUES (1, 11, TO_DATE('2025-07-07', 'YYYY-MM-DD'), 'FN');  
        INSERT INTO conducts VALUES (1, 12, TO_DATE('2025-07-08', 'YYYY-MM-DD'), 'AN');  
        INSERT INTO conducts VALUES (2, 13, TO_DATE('2025-07-09', 'YYYY-MM-DD'), 'AN');  
        INSERT INTO conducts VALUES (2, 14, TO_DATE('2025-07-10', 'YYYY-MM-DD'), 'AN');  
        INSERT INTO conducts VALUES (2, 15, TO_DATE('2025-07-11', 'YYYY-MM-DD'), 'FN');  
        INSERT INTO conducts VALUES (5, 15, TO_DATE('2025-07-12', 'YYYY-MM-DD'), 'AN');  
        INSERT INTO conducts VALUES (4, 13, TO_DATE('2025-07-13', 'YYYY-MM-DD'), 'FN');  
        INSERT INTO conducts VALUES (3, 14, TO_DATE('2025-07-14', 'YYYY-MM-DD'), 'FN');  
        INSERT INTO conducts VALUES (2, 12, TO_DATE('2025-07-15', 'YYYY-MM-DD'), 'AN');  
        INSERT INTO conducts VALUES (1, 13, TO_DATE('2025-07-09', 'YYYY-MM-DD'), 'FN');
        INSERT INTO conducts VALUES (3, 12, TO_DATE('2025-07-14', 'YYYY-MM-DD'), 'AN');
        INSERT INTO conducts VALUES (3, 13, TO_DATE('2025-07-14', 'YYYY-MM-DD'), 'FN');
        INSERT INTO conducts VALUES (5, 11, TO_DATE('2025-07-12', 'YYYY-MM-DD'), 'FN');
        INSERT INTO conducts VALUES (5, 12, TO_DATE('2025-07-12', 'YYYY-MM-DD'), 'AN');
        INSERT INTO conducts VALUES (5, 13, TO_DATE('2025-07-12', 'YYYY-MM-DD'), 'FN');
        
        SELECT * FROM conducts;
 