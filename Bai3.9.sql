CREATE SCHEMA school;

SET search_path TO school;

CREATE TABLE school.students (
                                 student_id SERIAL PRIMARY KEY,
                                 name VARCHAR(100) NOT NULL,
                                 dob DATE
);

CREATE TABLE school.courses (
                                course_id SERIAL PRIMARY KEY,
                                course_name VARCHAR(150) NOT NULL,
                                credits INT CHECK (credits > 0)
);

CREATE TABLE school.enrollments (
                                    enrollment_id SERIAL PRIMARY KEY,
                                    student_id INT NOT NULL,
                                    course_id INT NOT NULL,
                                    grade CHAR(1) CHECK (grade IN ('A', 'B', 'C', 'D', 'F')),

                                    CONSTRAINT fk_student
                                        FOREIGN KEY (student_id)
                                            REFERENCES school.students (student_id)
                                            ON DELETE CASCADE,

                                    CONSTRAINT fk_course
                                        FOREIGN KEY (course_id)
                                            REFERENCES school.courses (course_id)
                                            ON DELETE CASCADE
);

