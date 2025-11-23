create database MySQL_Project;

use MySQL_Project;

select * from Books;
select * from Customers;
select * from Orders;

#1) retrieve all books in the "fiction" genre:

select * from Books
Where Genre='Fiction';

#2)find books published after the year 1950:

 select * from Books
 Where Published_year>1950;
 
 #3)list all customers from the Canada:
 
 select * from Customers
 where country='Canada';
 
 #4)show order placed in november 2023:
 
 select * from Orders
 where order_date Between'2023-11-01' and '2023-11-30';
 
 #5) retrive the total stock of books available:
 
  select SUM(stock) AS Total_Stock
  from Books;
  
#6) find the details of the most expensive books:
select * from Books order by Price DESC limit 1;
  
#7) show all customers who ordered more tha 1 quantity of a books:
select * from Orders
where quantity>1;

#8) retrieve all orders where the total amount exceeds $20:
select * from Orders
where Total_amount>20;

# 9) list all genres avilable in the Books table;
select distinct genre from Books;

#10) find the book with the lowest stock:
select * from books order by stock limit 1;

#11) calculate the total revenue generated from all orders:
select sum(total_amount)AS Revenue from Orders;

# advance questions:
#1) retrieve the total numbers of books sold each genre:
 select * from orders;
 
 select b.Genre,sum(o.Quantity) as Total_Books_Sales
 from orders o
 join Books b on o.book_id = b.book_id
group by b.genre; 

#2)find the average price of books inthe "fantasy" genre

select AVG(price) As Average_Price
from Books
where Genre = 'Fantasy';



#3)list customers who have placed at least 2 orders

select customer_id,count(Order_id) As ORDER_COUNT
from orders
group by customer_id
having count(Order_id) >=2;



#4)find the most frequently ordered book

select o.Book_id, b.title, count(o.order_id) as ORDER_COUNT
from orders o
join books b on o.book_id=b.book_id
group by o.Book_id, b.Title
order by ORDER_COUNT DESC limit 1;

select * from books;
#5)show the top 3 most expensive books of 'Fantasy'genre
	
select book_id,
	   title,
       price
from books
where genre = 'Fantasy'
order by price desc limit 3;



#6)retrieve the total quantity of books sold by each author
SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.Author;																																			


#7)list the cities where customers who spent over $30 are
SELECT DISTINCT c.city
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount > 30;



#8)find the customers who spent the most on orders
SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc;



#9)calculate the stock remaining after fulfilling all orders
SELECT 
  b.book_id,
  b.stock,
  IFNULL(SUM(o.quantity), 0) AS total_ordered,
  b.stock - IFNULL(SUM(o.quantity), 0) AS stock_remaining
FROM 
  books b 
  LEFT JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY 
  b.Book_ID,b.Stock
ORDER BY 
  b.Book_ID;
  
