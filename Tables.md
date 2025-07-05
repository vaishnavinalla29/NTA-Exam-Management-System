# Tables for NTA Exam Management System

Below is a detailed list of tables used in the NTA Exam Management System, along with their attributes, datatypes, and constraints.

---

## 1. COLLEGE

* **college\_id**: INT, PRIMARY KEY
* **college\_name**: VARCHAR(100), NOT NULL
* **college\_address**: TEXT, NULL

---

## 2. STUDENT1

* **student\_id**: INT, PRIMARY KEY
* **email**: VARCHAR(100), UNIQUE, NOT NULL
* **college\_id**: INT, FOREIGN KEY REFERENCES COLLEGE(college\_id), NOT NULL

---

## 3. STUDENT\_INFO

* **email**: VARCHAR(100), PRIMARY KEY
* **name**: VARCHAR(100), NOT NULL
* **dob**: DATE, NOT NULL
* **gender**: VARCHAR(10), CHECK (gender IN ('Male', 'Female', 'Other'))

---

## 4. EXAM\_INFO

* **exam\_id**: INT, PRIMARY KEY
* **exam\_name**: VARCHAR(100), NOT NULL
* **description**: TEXT, NULL

---

## 5. EXAM\_SCHEDULE

* **schedule\_id**: INT, PRIMARY KEY
* **exam\_id**: INT, FOREIGN KEY REFERENCES EXAM\_INFO(exam\_id), NOT NULL
* **exam\_date**: DATE, NOT NULL
* **session**: VARCHAR(2), CHECK (session IN ('FN', 'AN'))

---

## 6. EXAMCENTER

* **center\_id**: INT, PRIMARY KEY
* **center\_name**: VARCHAR(100), NOT NULL
* **location**: TEXT, NULL

---

## 7. CENTERSTAFF\_INFO

* **staff\_id**: INT, PRIMARY KEY
* **name**: VARCHAR(100), NOT NULL
* **center\_id**: INT, FOREIGN KEY REFERENCES EXAMCENTER(center\_id), NOT NULL

---

## 8. CENTERSTAFF1

* **staff\_id**: INT, FOREIGN KEY REFERENCES CENTERSTAFF\_INFO(staff\_id), NOT NULL
* **exam\_date**: DATE, NOT NULL
* **session**: VARCHAR(2), CHECK (session IN ('FN', 'AN'))
* **PRIMARY KEY (staff\_id, exam\_date, session)**

---

## 9. CONDUCTS

* **center\_id**: INT, FOREIGN KEY REFERENCES EXAMCENTER(center\_id), NOT NULL
* **exam\_id**: INT, FOREIGN KEY REFERENCES EXAM\_INFO(exam\_id), NOT NULL
* **exam\_date**: DATE, NOT NULL
* **session**: VARCHAR(2), CHECK (session IN ('FN', 'AN'))
* **PRIMARY KEY (center\_id, exam\_id, exam\_date, session)**

---

## 10. HALLTICKET

* **hallticket\_id**: INT, PRIMARY KEY
* **student\_id**: INT, FOREIGN KEY REFERENCES STUDENT1(student\_id), NOT NULL
* **exam\_id**: INT, FOREIGN KEY REFERENCES EXAM\_INFO(exam\_id), NOT NULL
* **center\_id**: INT, FOREIGN KEY REFERENCES EXAMCENTER(center\_id), NOT NULL

---

## 11. RESULT

* **student\_id**: INT, FOREIGN KEY REFERENCES STUDENT1(student\_id), NOT NULL
* **exam\_id**: INT, FOREIGN KEY REFERENCES EXAM\_INFO(exam\_id), NOT NULL
* **marks\_obtained**: DECIMAL(5,2), NULL
* **PRIMARY KEY (student\_id, exam\_id)**

---

## 12. ATTENDS

* **student\_id**: INT, FOREIGN KEY REFERENCES STUDENT1(student\_id), NOT NULL
* **exam\_id**: INT, FOREIGN KEY REFERENCES EXAM\_INFO(exam\_id), NOT NULL
* **status**: VARCHAR(10), CHECK (status IN ('Present', 'Absent'))
* **PRIMARY KEY (student\_id, exam\_id)**
