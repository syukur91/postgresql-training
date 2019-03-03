<!-- $theme: gaia -->

# DATABASE

---

# WHAT IS DATABASE

1. Program that allows for the storage and retrieval of data. 
2. There are two types of databases: relational and non-relational.

---

# BUT WHY DATABASE



<p align="center">
  <img width="360" height="300" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7-J_NVBZ9NYnLcIxfhAJPM5f7UjzLrijtm4kt9hIQ5yBaWIcKmA#center">
</p>

---
# PROBLEMS IF NOT USING DATABASE

1. Size of data
2. Ease of Updating Data
3. Accuracy
4. Security
5. Redundancy
6. Incomplete Data

---

# TABLES AND PRIMARY KEY


1. Database is made up of (often multiple) tables.
2. Example:
   
   ![Drag Racing](https://wsvincent.com/assets/images/database-design-tutorial-for-beginners/image1.png)

3. Each row is known as a record
4. Each record has a primary key


---

# PRIMARY KEY


Unique and non-null number that refers to each record

``
To understand why, let’s imagine that the user “william” wants to change his “username” to “bill.” How do we know which “password” and “birthday” to associate with this user? Without a primary key, we don’t.
``

---

# FOREIGN KEY

1. Foreign Key references the primary key of another Table! It helps connect your Tables
2. A foreign key can have a different name from its primary key
3. It ensures rows in one table have corresponding rows in another
4. Unlike the Primary key, they do not have to be unique. Most often they aren't

---

# FOREIGN KEY

![Foreign Key](https://www.guru99.com/images/ForeignKeyRelationWithPrimary.png)

---

# DATABASE RELATIONSHIP

1. One-to-one
2. One-to-many
3. Many-to-many

---

# One to One

Allows only one record on each side of the relationship.

`The primary key relates to only one record – or none – in another table. For example, in a marriage, each spouse has only one other spouse. This kind of relationship can be implemented in a single table and therefore does not use a foreign key.
`

--- 

# One to Many

Allows a single record in one table to be related to multiple records in another table.

`
Consider a business with a database that has Customers and Orders tables.
A single customer can purchase multiple orders, but a single order could not be linked to multiple customers. Therefore the Orders table would contain a foreign key that matched the primary key of the Customers table, while the Customers table would have no foreign key pointing to the Orders table.
`

---

# Many to Many

Complex relationship in which many records in a table can link to many records in another table. 

`For example, our business probably needs not only Customers and Orders tables, but likely also needs a Products table.`
