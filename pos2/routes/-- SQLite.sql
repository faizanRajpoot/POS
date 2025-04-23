-- SQLite
-- DROP TABLE items;


CREATE TABLE totalitems(id INTEGER PRIMARY KEY AUTOINCREMENT , name, category, brand, total, selling INTEGER, quantity INTEGER);
-- CREATE TABLE login(id INTEGER PRIMARY KEY AUTOINCREMENT , username TEXT, password TEXT);
CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT);
CREATE TABLE supplier(id INTEGER PRIMARY KEY AUTOINCREMENT , Name TEXT, Email TEXT, phNum INTEGER);
INSERT INTO supplier(Name, Email, phNum) VALUES ('faizan', 'faizan@gmail.com', 03012244221);
CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT , username TEXT, password TEXT);


CREATE TABLE expense(id INTEGER PRIMARY KEY AUTOINCREMENT ,date, reference TEXT, name TEXT, amount INTEGER);
DROP TABLE expense;





CREATE TABLE purchase(id INTEGER PRIMARY KEY AUTOINCREMENT ,date, productname TEXT, productqty INTEGER, productprice INTEGER, subtotal INTEGER, suppliername TEXT, grandtotal INTEGER);

INSERT INTO purchase(date, productname, productqty, productprice, subtotal, suppliername, grandtotal) VALUES ('2023-11-16', '["s20", "iph"]', '[1, 3]', '[1000, 4000]', '[1000, 12000]', 'supplier', 13000);
INSERT INTO purchase(date, productname, productqty, productprice, subtotal, suppliername, grandtotal) VALUES ('2023-11-16', '["s20"]', '[1]', '[1000]', '[1000]', 'supplier', 13000);

DROP TABLE purchase;










INSERT INTO user(username, password) VALUES('faizan', 'saif');
INSERT INTO login(username, password) VALUES('faizan', 'saif');

INSERT INTO category(name) VALUES('Computer and Screens');
DROP TABLE totalitems;
SELECT * FROM supplier;


-- DROP DATABASE poss;
-- SELECT nam FROM Test;
INSERT INTO totalitems(name, category, brand, total, selling, quantity) VALUES('S20', 'mobile', 'apple', 4000, 5000, 5);
-- INSERT INTO Test(nam, val, num) VALUES("some name2", 1234, 456.789);
-- INSERT INTO Test(nam, val, num) VALUES("some name34", 1234, 456.789);
-- -- INSERT INTO Test2(nam, val, num) VALUES("some name3", 1234, 456.789);
-- -- INSERT INTO Test2(nam, val, num) VALUES("some name5", 1234, 456.789);

-- CREATE TABLE Student(id INTEGER PRIMARY KEY, name TEXT, class INTEGER);
-- INSERT INTO Student(name, class) VALUES("faizan", 11);
-- INSERT INTO Student(name, class) VALUES("subhan", 12);
-- INSERT INTO Student(name, class) VALUES("talha", 10);


