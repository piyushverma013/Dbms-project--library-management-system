create database library;
use library;

create table add_books
(
book_id int(35) ,
book_name varchar(35),
book_author varchar(35),
book_price int(35),
quantity int(35) ,
issued int(35),
primary key(book_id)
 );


 create table delete_books
 (
 book_id int(35) not null ,
 book_name varchar (35) ,
 quantity int(35),
 foreign key(book_id) references add_books(book_id) 
 
 );
 
create table issue_books
(
book_id int(35),
book_name varchar(35),
student_id int(35),
student_name varchar(35),
contact_no varchar(35),
branch varchar(35),
issue_date date,
return_date date,
primary key(student_id),

foreign key(book_id) references add_books(book_id)
);

create table return_book
(

student_id int(35),
return_date date,
foreign key(student_id) references issue_books(student_id)
);
 
 
 drop table add_books;
 drop table delete_books;
 drop table issue_books;
 drop table return_books;

 drop database library;
 
 select * from add_books;
 select * from issue_books;
 select * from return_books;




 


 create trigger t1 before insert on issue_books for each row update add_books set add_books.quantity=add_books.quantity-1 where book_id=new.book_id;
 create trigger t2 before insert on issue_books for each row update add_books set add_books.issued=add_books.issued+1 where book_id=new.book_id;


 
create trigger t4 after delete
on issue_books
for each row update add_books set
add_books.quantity=add_books.quantity+1
where book_id=old.book_id;



create trigger t5 after delete
on issue_books
for each row update add_books set
add_books.issued=add_books.issued-1
where book_id=old.book_id;

create procedure del(in a integer)delete from issue_books where student_id=a;

commit;

