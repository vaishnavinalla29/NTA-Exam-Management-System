#  Normalization
 
## What is Normalization?

**Normalization** is a database design technique that reduces data redundancy and ensures data integrity.  
This document outlines the normalization process for the **NTA Exam Management System** database, explaining how each table is normalized to its highest normal form — up to **Third Normal Form (3NF)**.  

---

## 1. **COLLEGE**
**Attributes:** `college_id (PK)`, `name`, `city`

### Functional Dependencies:
- `college_id → name`
- `college_id → city`

### Candidate Key:  
- `college_id`

 **This relation is in 1NF, 2NF, and 3NF**

---

## 2. **STUDENT**
**Attributes:** `student_id (PK)`, `name`, `dob`, `gender`, `email`

### Functional Dependencies:
- `student_id → name, dob, gender, email`
- `email → name, dob, gender`
- `student_id → email`

### Candidate Key:  
- `student_id`

 **This relation is in 1NF, 2NF but NOT in 3NF** due to transitive dependency via `email`.

### Decomposition:
####  STUDENT1:
- `student_id (PK)`, `email` — **in 3NF**

####  STUDENT_INFO:
- `email (PK, FK)`, `name`, `dob`, `gender` — **in 3NF**

---

## 3. **EXAM**
**Attributes:** `exam_id`, `exam_name`, `date`, `duration`

### Functional Dependencies:
- `exam_id → exam_name, duration`

### Candidate Key:  
- `exam_id, date`

 **This relation is in 1NF but NOT in 2NF or 3NF**

### Decomposition:
####  EXAM_INFO:
- `exam_id (PK)`, `exam_name`, `duration` — **in 3NF**

####  EXAM_SCHEDULE:
- `exam_id (FK)`, `date` — **in 3NF**

---

## 4. **EXAMCENTER**
**Attributes:** `center_id (PK)`, `name`, `location`, `capacity`

### Functional Dependencies:
- `center_id → name, location, capacity`

### Candidate Key:  
- `center_id`

 **This relation is in 1NF, 2NF, and 3NF**

---

## 5. **CENTERSTAFF**
**Attributes:** `staff_id`, `name`, `role`, `phone`, `age`, `gender`, `assigned_date`

### Functional Dependencies:
- `staff_id → name, phone, age, gender, role`

### Candidate Key:  
- `staff_id, assigned_date`

 **This relation is in 1NF but NOT in 2NF or 3NF**

### Decomposition:
####  CENTERSTAFF_INFO:
- `staff_id (PK)`, `name`, `role`, `phone`, `age`, `gender` — **in 3NF**

####  CENTERSTAFF1:
- `staff_id (FK)`, `assigned_date` — **in 3NF**

---

## 6. **HALLTICKET**
**Attributes:** `ticket_id`, `student_id`, `exam_id`, `center_id`

### Functional Dependencies:
- `{ticket_id, exam_id} → student_id, center_id`

### Candidate Key:  
- `{ticket_id, exam_id}`

 **This relation is in 1NF, 2NF, and 3NF**

---

## 7. **RESULT**
**Attributes:** `student_id`, `exam_id`, `rank`

### Functional Dependencies:
- `{student_id, exam_id} → rank`

### Candidate Key:  
- `{student_id, exam_id}`

 **This relation is in 1NF, 2NF, and 3NF**

---

## 8. **CONDUCTS**
**Attributes:** `exam_id`, `center_id`, `date`, `session`

### Functional Dependencies:
- `{center_id, date, session} → exam_id`

### Candidate Key:  
- `{center_id, date, session}`

 **This relation is in 1NF, 2NF, and 3NF**

---

## 9. **ATTENDS**
**Attributes:** `student_id`, `exam_id`, `status`

### Functional Dependencies:
- `{student_id, exam_id} → status`

### Candidate Key:  
- `{student_id, exam_id}`

 **This relation is in 1NF, 2NF, and 3NF**

---

>  **Note**: All final decomposed relations eliminate partial and transitive dependencies, ensuring they are in **Third Normal Form (3NF)**.
