# Assumptions in NTA Exam Management System Database Design

These assumptions  help ensure a structured, consistent, and efficient approach to managing various aspects of national-level examination processes.

## Assumptions

1. One student is uniquely identified by their `student_id`.
2. Each student can register for multiple exams.
3. Each student receives one hall ticket per exam.
4. Student personal information (name, date of birth, gender) is stored and accessed using their unique email.
5. Each student is associated with one college, represented by a foreign key `college_id` in the student table.
6. An exam can be conducted on multiple dates, which is managed using the `exam_schedule` table.
7. Each exam is uniquely identified using `exam_id`, and its schedule is separated and tracked by date.
8. Every exam center is uniquely identified by a `center_id` and can be allocated to conduct multiple exams.
9. A center staff member can be assigned duties on multiple dates, which is handled using the `centerstaff1` table.
10. Each hall ticket links one student to one exam at one specific center.
11. Exam results are unique to each student-exam pair.
12. Each conduct session is uniquely defined by a combination of exam center, date, and session type (`FN` or `AN`).
13. A student's attendance is tracked for each exam they are registered for.
14. The `email` field acts as the connecting attribute between the `STUDENT1` and `STUDENT_INFO` tables.
15. Each staff member works in only one center at a time, enforced through the `center_id` foreign key in the `CENTERSTAFF_INFO` table.
