---
title: Basic Examples with SELECT in MySQL
description: Learn how to use the SELECT command in MySQL, perform basic operations, and manipulate data.
categories:
 - tutorial
 - sql
 - mysql
tags:
---

The `SELECT` command is used to retrieve data stored in tables in MySQL. It
allows for various operations, from simple calculations to more elaborate queries
in databases.
In the first examples, we will only work with MySQL's internal operations, without involving
tables. Later, we will explore commands applied to tables, which require adapting
the names according to the context of the database being used.

## Simple Arithmetic Operations

These operations use MySQL as a calculator, allowing for sums, multiplications, and
other basic mathematical functions.

```sql
-- Addition operation
SELECT 2+2;

SELECT 2+2, 3+3;

-- Subtraction operation
SELECT 2-1;

-- Multiplication operation
SELECT 2*2, 9*(2+3);

-- Division operation
SELECT 10/2;
SELECT FORMAT(4/7,12);
SELECT 4*PI()/3;

-- Exponentiation operation
SELECT FORMAT(POWER(2,64),0);

-- Square root operation
SELECT SQRT(2);

```
The query `SELECT FORMAT(3/7,12)` divides 3 by 7 and uses the `FORMAT` function to display the result with 12 decimal places.

In the query `SELECT FORMAT(POWER(2,64),0)`, the `POWER` function calculates 2 raised to the power of 64.
Here, `FORMAT` is used to display the number without any decimal part, making the result more organized.

## Logical and Boolean Operators

Logical operators, such as `AND` (conjunction), `OR` (disjunction), and `NOT` (negation), are used to combine or modify conditions.
They work with boolean values, where `1` represents true and `0` represents false.

For example, `AND` returns true only if all conditions are true, while `OR` returns true if at least one condition is true.
The `NOT` operator inverts the logical value, turning true into false and vice versa.

```sql
-- Conjunction operation
SELECT 1 AND 1; -- Both are true, returns 1
SELECT 1 AND 0; -- One of the values is false, returns 0
SELECT FALSE && TRUE; -- `FALSE` is equivalent to 0 and `TRUE` to 1, so it returns 0

-- Disjunction operation
SELECT FALSE OR TRUE; -- Since there is a true value, it returns 1
SELECT FALSE || TRUE; -- Alternative with `||`, also returns 1

-- Negation operation
SELECT NOT 1; -- Since 1 is true, it returns 0 (false)
SELECT NOT 0; -- Since 0 is false, it returns 1 (true)
```

MySQL follows the logical precedence where `AND` is evaluated before `OR`, unless parentheses explicitly state another order.

## Bitwise Operations

Bitwise operations allow for the direct manipulation of the bits of integer numerical values.
Unlike logical operators (`AND`, `OR`), which work with boolean values (`0` or `1`), bitwise operators act on each individual bit in the binary numbers.

###### Bitwise AND Operation
The **bitwise AND** is a binary operation that uses two binary representations of the same length and performs the logical AND operation on each pair of corresponding bits.
Thus, if both bits in the compared position are `1`, the bit in the resulting binary representation will be `1` (1 × 1 = 1); otherwise, the result will be `0` (1 × 0 = 0 and 0 × 0 = 0).

```markdown
      0 1 0 1  (decimal 5)
  AND 0 0 1 1  (decimal 3)
  -------------
      0 0 0 1  (decimal 1)
 ```

MySQL allows us to perform this type of operation by abstracting the process of converting from decimal to binary.
Below is the previous example done in MySQL:
```sql
  SELECT 5 & 3, 3 & 5; -- Both return 1
```
###### Bitwise OR Operation

The **bitwise OR** is a binary operation that uses two bit patterns of the same length and performs the **inclusive OR** logical operation on each pair of corresponding bits.
The result in each position will be `0` if both bits are `0`; otherwise, the result will be `1`.

```markdown
      0 1 0 1  (decimal 5)
  OR  0 0 1 1  (decimal 3)
  -------------
      0 1 1 1  (decimal 7)
 ```
Below is how this operation occurs in MySQL:

```sql
  SELECT 5 | 3, 3 | 5; -- Both return 7
```

## Selecting Date and Time

MySQL offers several functions to return information about the system's date and time.
These functions are useful for capturing the current time, the current date, or even *timestamps*.
Below are some examples:

```sql
-- Returns the current time
SELECT CURRENT_TIME();

-- Returns the current date
SELECT CURRENT_DATE();

-- Returns the current date and time
SELECT NOW();

-- Returns the Unix timestamp (number of seconds since January 1, 1970)
SELECT UNIX_TIMESTAMP();
```

In addition to the basic functions for getting date and time, MySQL offers several functions to manipulate and extract specific information from dates.
These functions are useful for more detailed temporal analysis.
Below are some examples:

```sql
-- Returns the week of the year for the current date
SELECT WEEK(CURRENT_DATE());

-- Returns the day of the week (0 = Monday, 6 = Sunday)
SELECT WEEKDAY(CURRENT_DATE());

-- Returns the quarter of the year for the current date
SELECT QUARTER(CURRENT_DATE());

-- Returns the number of the day in the year for the current date
SELECT DAYOFYEAR(CURRENT_DATE());

-- Returns the name of the month for the current date
SELECT MONTHNAME(CURRENT_DATE());

-- Returns the difference in days between two dates
SELECT DATEDIFF('2025-12-31', CURRENT_DATE());

```

## Mathematical Functions

MySQL has several built-in mathematical functions that can be used to perform calculations directly in the database.
These functions are useful for operations like rounding, calculating powers, trigonometry, among others.
Below are several examples:

```sql
-- Returns the absolute value of a number
SELECT ABS(-15);

-- Rounds a number to the nearest integer
SELECT ROUND(3.75);

-- Rounds a number with specified decimal precision
SELECT ROUND(3.14159, 2); -- Result: 3.14

-- Returns the largest integer value less than or equal to the number (rounding down)
SELECT FLOOR(4.9);

-- Returns the smallest integer value greater than or equal to the number (rounding up)
SELECT CEIL(4.1);

-- Calculates the square root of a number
SELECT SQRT(16);

-- Returns the value of a number raised to the specified power
SELECT POW(2, 3); -- Equivalent to 2^3

-- Calculates the sine of an angle (in radians)
SELECT SIN(PI()/2);

-- Calculates the cosine of an angle (in radians)
SELECT COS(PI());

-- Calculates the tangent of an angle (in radians)
SELECT TAN(PI()/4);

-- Returns the natural logarithm of a number
SELECT LOG(10);

-- Returns the base-10 logarithm of a number
SELECT LOG10(100);

-- Returns the value of Pi
SELECT PI();

-- Returns the greatest value from a list of numbers
SELECT GREATEST(10, 20, 30, 5);

-- Returns the least value from a list of numbers
SELECT LEAST(10, 20, 30, 5);

-- Returns the remainder of the division of two numbers
SELECT MOD(10, 3); -- Result: 1

-- Converts degrees to radians
SELECT RADIANS(180); -- Result: PI

-- Converts radians to degrees
SELECT DEGREES(PI()); -- Result: 180

-- Generates a random number between 0 and 1
SELECT RAND();

-- Generates a random number multiplied by an interval
SELECT RAND() * 100; -- Number between 0 and 100
```

## Working with User Variables

In MySQL, it is possible to use user variables to store temporary values during the execution of queries. These variables are useful for manipulating data, performing intermediate calculations, or sharing values between different SQL commands within the same session.

User variables are identified by the `@` prefix and can be assigned and accessed directly. Below are some examples of use:

```sql
-- Defines a variable and assigns the value 1
SELECT @x := 1;

-- Returns the value of the previously defined variable
SELECT @x;

-- Assigns the value of the constant PI() to the variable
SELECT @x := PI();

-- Assigns the value of PI() and displays the result with an alias
SELECT @x := PI() AS pi;

-- Uses a variable in a calculation
SELECT @x := 10, @y := 20, @sum := @x + @y;

-- Defines a variable and uses it in a condition
SELECT @limit := 100;
SELECT * FROM products WHERE price < @limit;

-- Reuses the value of a variable in multiple queries
SELECT @counter := 0;
SELECT @counter := @counter + 1 AS increment;

```
# Operations using tables

Now, we will start working with tables. Remember to replace the table and column names
with the corresponding ones from your database.

Below, we explain the main uses of the `SELECT` command with practical examples:

## Querying all records from a table

To retrieve all records from a table, use the `*` character:

```sql
SELECT * FROM table_name;
```

## Querying specific columns


If you want to return only some columns from the table, specify the column names:

```sql
SELECT column1, column2 FROM table_name;
```
For example, if we want to get the `id` and `name` from the `customers` table:

```sql
SELECT id, name FROM customers;
```

## Filtering records with WHERE

The `WHERE` clause is used to filter records based on specific conditions:

```sql
SELECT * FROM table_name WHERE column1 = 'value';
```

For example, if we want to select the record in the `customers` table with `id = 1`:


```sql
SELECT * FROM customers WHERE id = '1';
```

## Using comparison operators

Comparison operators in MySQL are powerful tools that allow for more detailed and precise queries.
They are used to compare values in a table, returning only the records that meet the specified conditions.
Below are the main operators:


- **Equality (`=`)**: Returns records where the values of a field are exactly equal to a certain value.
```sql
-- Returns all records that meet the condition column1 equal to 10
SELECT * FROM table_name WHERE column1 = 10;
```
- **Not equal (`!=` or `<>`)**: Returns records where the values are different from a specified value.
```sql
-- Returns all records that meet the condition column1 not equal to 10
SELECT * FROM table_name WHERE column1 != 10;
```
- **Greater than (`>`)**: Returns records where the values are greater than a specified value.
```sql
-- Returns all records that meet the condition column1 greater than 10
SELECT * FROM table_name WHERE column1 > 10;
```
- **Less than (`<`)**: Returns records where the values are less than a specified value.
```sql
-- Returns all records that meet the condition column1 less than 50
SELECT * FROM table_name WHERE column1 < 50;
```
- **Greater than or equal to (`>=`)**: Returns records where the values are greater than or equal to a specified value.
```sql
-- Returns all records that meet the condition column1 greater than or equal to 20
SELECT * FROM table_name WHERE column1 >= 20;
```
- **Less than or equal to (`<=`)**: Returns records where the values are less than or equal to a specified value.
```sql
-- Returns all records that meet the condition column1 less than or equal to 30
SELECT * FROM table_name WHERE column1 <= 30;
```

These operators make queries more flexible and allow for the extraction of specific information, which is very useful when working with large volumes of data.

## Sorting queries with ORDER BY

The `ORDER BY` clause is used to sort the results of a query based on one or more columns.
It allows organizing data in ascending order (default, using `ASC`) or descending order (using `DESC`).
This is especially useful for viewing records in a structured and hierarchical way.
```sql
-- Sorts the records based on column1 in ascending order
SELECT * FROM table_name ORDER BY column1 ASC;

-- Sorts the records based on column1 in descending order
SELECT * FROM table_name ORDER BY column1 DESC;
```

## Limiting the number of records
The `LIMIT` clause is used to restrict the number of records returned by a query.
It is especially useful when you want to view only a portion of the data, such as the first few results of a table or the most relevant records.

For example, to limit the number of results to 10 records, use `LIMIT 10`:
```sql
    SELECT * FROM table_name LIMIT 10;
```

You can also combine `LIMIT` with `OFFSET` to specify from which record the query should start:

```sql
SELECT * FROM table_name LIMIT 10 OFFSET 5;
```

This functionality is widely used in results pagination and optimized queries.

## Querying unique records with DISTINCT

The `DISTINCT` keyword is used to eliminate duplicate values in the results of a query.
It ensures that only unique records are returned, considering the values of the specified columns.
This is useful when you need to identify distinct values in a table, such as categories, names, or other attributes.

```sql
SELECT DISTINCT column1 FROM table_name;
```

## Using LIKE to search for a pattern

The `LIKE` operator in MySQL is used to perform pattern searches in text columns.
It is especially useful when you need to find records that contain, start with, or end with certain characters.
To define the patterns, the wildcards `%` and `_` are used:

For example, to search for all records containing strings that start with "A":
```sql
SELECT * FROM table_name WHERE column1 LIKE 'A%';
```
Now if we want to search for all records containing strings in column1 that end with "B":

```sql
SELECT * FROM table_name WHERE column1 LIKE '%B';
```

All records containing strings in column1 that have "C":
```sql
SELECT * FROM table_name WHERE column1 LIKE '%C%';
```
The `%` wildcard character represents any sequence of characters (including none).


Another example, let's say we need records that start with "A" and contain exactly 2 characters in sequence.
For this, you will need to use the `_` wildcard, which represents exactly 1 character:

```sql
SELECT * FROM table_name WHERE column1 LIKE 'A__';
```

In the statement above, values like `ANA`, `ABC`, and `A23` would meet the condition. But values like `ABCD` and `ANAS` would not, as they have more than 2 characters after the "A".

## Counting Records with COUNT

The `COUNT` function returns the total number of records in the table or in a filtered subset:
```sql
-- Returns the number of records in the table
SELECT COUNT(*) FROM table_name;
-- Returns the number of records that meet the condition
SELECT COUNT(*) FROM table_name WHERE column1 = 'value';

```

## Performing Calculations with Aggregate Functions

In addition to `COUNT`, other aggregate functions can be used for calculations:

- **Sum of the values of a column**:
```sql
SELECT SUM(column1) FROM table_name;
```


- **Average of the values of a column**:
```sql
SELECT AVG(column1) FROM table_name;
```

- **Maximum value of a column**:
```sql
SELECT MAX(column1) FROM table_name;
```

- **Minimum value of a column**:
```sql
SELECT MIN(column1) FROM table_name;
```


## Grouping Results with GROUP BY

 The `GROUP BY` clause is used to group records based on one or more columns:
```sql
SELECT column1, COUNT(*) FROM table_name GROUP BY column1;
```

## Filtering Groups with HAVING

 The `HAVING` clause is used to filter the results after grouping:

```sql
SELECT column1, COUNT(*) FROM table_name GROUP BY column1 HAVING COUNT(*) > 5
```

This material was created based on the sources listed below:

- **MySQL 8.4 Reference Manual:** [https://dev.mysql.com/doc/refman/8.4/en/non-typed-operators.html](https://dev.mysql.com/doc/refman/8.4/en/non-typed-operators.html)
- **Bitwise operation:** [https://en.wikipedia.org/wiki/Bitwise_operation](https://en.wikipedia.org/wiki/Bitwise_operation)

