-- the average grade given by each professor
SELECT professor_name AS "Professor", AVG(grades_value) AS "Average grade given"
FROM course
JOIN professor
ON course.course_professor_id = professor_id
JOIN grades
ON course.course_id = grades_course_id
GROUP BY professor_name;

-- 
-- the top grades for each student
SELECT students_name AS "Student", MAX(grades_value) AS "Top Grade"
FROM students
JOIN grades
ON students.students_id = grades_student_id
GROUP BY students_name;

-- 
-- Group students by the courses that they are enrolled in
SELECT students_name AS "Students", course_name AS "Courses"
FROM grades 
JOIN students 
ON students.students_id = grades.grades_student_id
JOIN course
ON grades.grades_course_id = course.course_id;

-- 
-- Create a summary report of courses and their average grades, 
-- sorted by the most challenging course (course with the lowest average grade) to the easiest course
SELECT course_name AS "courses", grades_value AS "Lowest Grade"
FROM course
JOIN grades
ON grades.grades_course_id = course_id
ORDER BY grades_value ASC;

-- 
-- Finding which student and professor have the most courses in common
SELECT  students_name AS "students",  professor_name AS "professor", COUNT(*) AS matching_classes
FROM students
JOIN grades
ON students_id = grades_student_id
JOIN course
ON grades_course_id = course_id
JOIN professor
ON course_professor_id = professor_id
GROUP BY professor_name, students_name
ORDER BY professor_name ASC;

-- 