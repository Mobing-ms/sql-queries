--Creating user  and granting permission

mysql> create user 'divyaa'@'localhost' identified by 'hello'
    -> ;
Query OK, 0 rows affected (0.30 sec)

mysql> grant select,insert on windows.* to 'divyaa'@localhost;
Query OK, 0 rows affected (0.03 sec)

select * from user' at line 1
mysql> select user,host from mysql.user;
+------------------+-----------+
| user             | host      |
+------------------+-----------+
| debian-sys-maint | localhost |
| divyaa           | localhost |
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| root             | localhost |
+------------------+-----------+
6 rows in set (0.02 sec)

--switching to user divyaa in localhost
  
mysql> mysql -u divyaa -p

mysql> use windows;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-------------------+
| Tables_in_windows |
+-------------------+
| employee_salary   |
| monthly_sales     |
| purchase_details  |
| window_table      |
+-------------------+
4 rows in set (0.01 sec)

mysql> select * from monthly_sales;
+---------+---------------+-------------+------------+--------------+
| sale_id | employee_name | department  | sale_month | sales_amount |
+---------+---------------+-------------+------------+--------------+
|       1 | Akshay        | Electronics | January    |        45000 |
|       3 | Arjun         | Electronics | January    |        52000 |
|       6 | John          | Electronics | February   |        61000 |
|       8 | Midhun        | Electronics | February   |        72000 |
|      11 | Rohit         | Electronics | March      |        83000 |
|      14 | Manu          | Electronics | March      |        91000 |
|       2 | Rahul         | Furniture   | January    |        22000 |
|       5 | David         | Furniture   | January    |        30000 |
|       9 | Anand         | Furniture   | February   |        28000 |
|      12 | Kevin         | Furniture   | March      |        34000 |
|      15 | Joseph        | Furniture   | March      |         7000 |
|       4 | Neeraj        | Clothing    | January    |        18000 |
|       7 | Kiran         | Clothing    | February   |        15000 |
|      10 | Vishnu        | Clothing    | February   |        12000 |
|      13 | Abhi          | Clothing    | March      |        16000 |
+---------+---------------+-------------+------------+--------------+
15 rows in set (0.01 sec)

--permission denied because divyaa only have acces to elect and insert not to update.

mysql> update monthly_sales set sale_month = 'February' where sale_id = 1;
ERROR 1142 (42000): UPDATE command denied to user 'divyaa'@'localhost' for table 'monthly_sales'
mysql> exit;
Bye

--Revoking permission from user divyaa

mysql> revoke select,insert on windows.* from 'divyaa'@localhost;
Query OK, 0 rows affected (0.13 sec)
mysql> flush privileges;
Query OK, 0 rows affected (0.06 sec)
