--Thêm cột genre (varchar) vào bảng Books
ALTER TABLE library.books
ADD COLUMN genre VARCHAR(100);
--Đổi tên cột available thành is_available
ALTER TABLE library.books
RENAME COLUMN available TO is_available;
--Xóa cột email khỏi bảng Members
ALTER TABLE library.members
DROP COLUMN email;
--Xóa bảng OrderDetails trong schema sales
DROP TABLE sales.orderdetails;