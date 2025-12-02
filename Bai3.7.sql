SET search_path TO sales;

CREATE TABLE sales.products (
                                product_id SERIAL PRIMARY KEY,
                                product_name VARCHAR(200),
                                price NUMERIC(10,2),
                                stock_quantity INT
);

CREATE TABLE sales.orders (
                              order_id SERIAL PRIMARY KEY,
                              order_date DATE DEFAULT CURRENT_DATE,
                              member_id INT,
                              CONSTRAINT fk_member
                                  FOREIGN KEY (member_id)
                                      REFERENCES library.members (member_id)
                                      ON DELETE SET NULL
);

CREATE TABLE sales.orderdetails (
                                    order_detail_id SERIAL PRIMARY KEY,
                                    order_id INT,
                                    product_id INT,
                                    quantity INT,

                                    CONSTRAINT fk_order
                                        FOREIGN KEY (order_id)
                                            REFERENCES sales.orders (order_id)
                                            ON DELETE CASCADE,

                                    CONSTRAINT fk_product
                                        FOREIGN KEY (product_id)
                                            REFERENCES sales.products (product_id)
                                            ON DELETE CASCADE
);
