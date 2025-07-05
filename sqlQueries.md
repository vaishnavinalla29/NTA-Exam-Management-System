#  SQL Queries - NTA Exam Management System

Below are the frequently used SQL queries on the NTA Exam Management System database, designed to extract useful insights from normalized tables.

---

### 1.  Names and Ranks of Students Who Scored Rank Less Than 90 in JEE Main

```sql
SELECT si.name, r.rank
FROM result r
JOIN student1 s ON r.student_id = s.student_id
JOIN student_info si ON s.email = si.email
JOIN exam_info e ON r.exam_id = e.exam_id
WHERE r.rank < 50 AND e.exam_name = 'JEE Main';
```

---

### 2.  Display all students who attended all exams they registered for

```sql
SELECT s.student_id, si.name
FROM student1 s
JOIN student_info si ON s.email = si.email
WHERE NOT EXISTS (
    SELECT e.exam_id 
    FROM exam_info e
    WHERE NOT EXISTS (
        SELECT a.exam_id
        FROM attends a
        WHERE a.student_id = s.student_id 
        AND a.exam_id = e.exam_id 
        AND a.status = 'Present'
    )
);

```

---

### 3.  Exam Centers That Conducted Exams on '2025-07-12'

```sql
SELECT ec.name, ec.location
FROM conducts c
JOIN examcenter ec ON c.center_id = ec.center_id
WHERE c.datee = TO_DATE('2025-07-12', 'YYYY-MM-DD');
```

---

### 4.  Students Who Attended All the Exams They Registered For

```sql
SELECT si.name
FROM student1 s
JOIN student_info si ON s.email = si.email
WHERE NOT EXISTS (
    SELECT 1
    FROM hallticket h
    WHERE h.student_id = s.student_id
    AND NOT EXISTS (
        SELECT 1 
        FROM attends a
        WHERE a.student_id = h.student_id AND a.exam_id = h.exam_id
    )
);
```

---

### 5.  Total Number of Students Assigned to Each Exam Center

```sql
SELECT ec.name, COUNT(DISTINCT h.student_id) AS total_students
FROM hallticket h
JOIN examcenter ec ON h.center_id = ec.center_id
GROUP BY ec.name;
```

---

> These queries utilize JOINs, subqueries, and aggregate functions to analyze relationships between normalized tables efficiently.
