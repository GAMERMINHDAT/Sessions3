SET search_path TO nhanvien;

CREATE TABLE departments (
                                     department_id SERIAL PRIMARY KEY,
                                     department_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
                                   emp_id SERIAL PRIMARY KEY,
                                   name VARCHAR(100) NOT NULL,
                                   dob DATE,
                                   department_id INT,
                                   CONSTRAINT fk_department
                                       FOREIGN KEY (department_id)
                                           REFERENCES departments (department_id)
                                           ON DELETE SET NULL
);

CREATE TABLE projects (
                                  project_id SERIAL PRIMARY KEY,
                                  project_name VARCHAR(150) NOT NULL,
                                  start_date DATE,
                                  end_date DATE
);

CREATE TABLE employeeprojects (
                                          emp_id INT,
                                          project_id INT,
                                          PRIMARY KEY (emp_id, project_id),

                                          CONSTRAINT fk_emp
                                              FOREIGN KEY (emp_id)
                                                  REFERENCES employees (emp_id)
                                                  ON DELETE CASCADE,

                                          CONSTRAINT fk_project
                                              FOREIGN KEY (project_id)
                                                  REFERENCES projects (project_id)
                                                  ON DELETE CASCADE
);