---
tags:
  - review
  - flashcards/R
sr-due: 2025-02-15
sr-interval: 48
sr-ease: 290
---

Based on your notes, here is a markdown table listing all R functions used throughout the Introduction to R course, along with a brief description and the chapter in which they appear:

| Function           | Description                                                                                   | Chapter Number |
| ------------------ | --------------------------------------------------------------------------------------------- | -------------- |
| [[R.c()]]          | Combines values into a vector or list.                                                        | 2              |
| [[R.cbind()]]      | Combines R objects by columns.                                                                | 3              |
| [[R.class()]]      | Returns or sets the class of an object.                                                       | 1              |
| [[R.colSums()]]    | Computes the sum of columns for matrices and arrays.                                          | 3              |
| [[R.data.frame()]] | Creates a data frame from vectors and/or factors.                                             | 5              |
| [[R.factor()]]     | Encodes a vector as a factor (categorical variable).                                          | 4              |
| [[R.head()]]       | Returns the first parts of an object.                                                         | 5              |
| [[R.list()]]       | Creates a list containing a variety of objects.                                               | 6              |
| [[R.matrix()]]     | Creates a matrix from vector(s).                                                              | 3              |
| [[R.mean()]]       | Calculates the arithmetic mean.                                                               | 3, 6           |
| [[R.names()]]      | Gets or sets the names of an object.                                                          | 4, 6           |
| [[R.order()]]      | Returns a permutation which rearranges its first argument into ascending or descending order. | 5              |
| [[R.rbind()]]      | Combines R objects by rows.                                                                   | 3              |
| [[R.rowSums()]]    | Computes the sum of rows for matrices and arrays.                                             | 3              |
| [[R.str()]]        | Displays the structure of an R object.                                                        | 5              |
| [[R.subset()]]     | Returns subsets of vectors, matrices, or data frames which meet conditions.                   | 5              |
| [[R.summary()]]    | Provides a summary of an object's contents.                                                   | 4              |
| [[R.tail()]]       | Returns the last parts of an object.                                                          | 5              |

# Study Guide for Introduction to R

## Chapter 1: Intro to Basics

### Key Concepts
- **R Code Execution**: R executes code line by line, and comments (preceded by `#`) are ignored during execution.
- **Arithmetic Operators**: Understand the basic arithmetic operators in R:
  - Addition: `+`
  - Subtraction: `-`
  - Multiplication: `*`
  - Division: `/`
  - Exponentiation: `^`
  - Modulo: `%%`
  
### Exercises Overview
1. **Exercise 1.1**: Identify R code vs comments; calculate `6 + 12`.
2. **Exercise 1.2**: Use arithmetic operators to perform calculations.
3. **Exercise 1.3**: Assign values to variables using `<-`.
4. **Exercise 1.4**: Create a variable for the number of apples.
5. **Exercise 1.5**: Create a variable for oranges and calculate total fruits.
6. **Exercise 1.6**: Understand errors when adding different data types.
7. **Exercise 1.7**: Learn about basic data types: numerics, integers, logicals, and characters.
8. **Exercise 1.8**: Use `class()` to check data types.

## Chapter 2: Vectors

### Key Concepts
- **Vectors**: One-dimensional arrays that can hold multiple values of the same type.
- **Creating Vectors**: Use `c()` to combine values into a vector.

### Exercises Overview
1. **Exercise 2.1**: Create a variable `vegas` and assign it a string.
2. **Exercise 2.2**: Create a boolean vector.
3. **Exercise 2.3**: Create vectors for poker and roulette winnings.
4. **Exercise 2.4**: Name vector elements for clarity.
5. **Exercise 2.5**: Use a variable to name vector elements.
6. **Exercise 2.6**: Calculate total winnings.
7. **Exercise 2.7**: Calculate total winnings for poker and roulette.
8. **Exercise 2.8**: Compare total winnings.
9. **Exercise 2.9**: Select specific elements from vectors.

## Chapter 3: Matrices

### Key Concepts
- **Matrices**: Two-dimensional arrays that hold elements of the same type.
- **Creating Matrices**: Use `matrix()` to create a matrix from a vector.

### Exercises Overview
1. **Exercise 3.1**: Construct a matrix with specified rows and columns.
2. **Exercise 3.2**: Combine box office numbers into a matrix.
3. **Exercise 3.3**: Name rows and columns of a matrix.
4. **Exercise 3.4**: Calculate row sums for total box office.
5. **Exercise 3.5**: Add a column to a matrix.
6. **Exercise 3.6**: Combine two matrices using `rbind()`.
7. **Exercise 3.7**: Calculate total revenue using `colSums()`.
8. **Exercise 3.8**: Select elements from a matrix.
9. **Exercise 3.9**: Perform arithmetic operations on matrices.

## Chapter 4: Factors

### Key Concepts
- **Factors**: Used for categorical data; can be nominal or ordinal.
- **Creating Factors**: Use `factor()` to create factors from vectors.

### Exercises Overview
1. **Exercise 4.1**: Understand the concept of factors.
2. **Exercise 4.2**: Convert a character vector to a factor.
3. **Exercise 4.3**: Differentiate between nominal and ordinal variables.
4. **Exercise 4.4**: Change factor levels for clarity.
5. **Exercise 4.5**: Use `summary()` to summarize factor data.
6. **Exercise 4.6**: Compare elements of factors.
7. **Exercise 4.7**: Create ordered factors.

## Chapter 5: Data Frames

### Key Concepts
- **Data Frames**: Two-dimensional objects that can hold different types of data.
- **Creating Data Frames**: Use `data.frame()` to create a data frame from vectors.

### Exercises Overview
1. **Exercise 5.1**: Understand data frames by exploring `mtcars`.
2. **Exercise 5.2**: Use `head()` to view the first few rows of a data frame.
3. **Exercise 5.3**: Use `str()` to investigate the structure of a data frame.
4. **Exercise 5.4**: Create a data frame for planets.
5. **Exercise 5.5**: Check the structure of the created data frame.
6. **Exercise 5.6**: Select specific elements from a data frame.
7. **Exercise 5.7**: Select columns by name.
8. **Exercise 5.8**: Select rows based on conditions.
9. **Exercise 5.9**: Use `subset()` for conditional selection.
10. **Exercise 5.10**: Sort data frames using `order()`.

## Chapter 6: Lists

### Key Concepts
- **Lists**: Can hold different types of objects and are useful for organizing complex data.

### Exercises Overview
1. **Exercise 6.1**: Understand the purpose of lists.
2. **Exercise 6.2**: Learn how to create a list using `list()`.
3. **Exercise 6.3**: Create a list with different components.
4. **Exercise 6.4**: Create a named list for clarity.
5. **Exercise 6.5**: Create a list for a movie with various attributes.
6. **Exercise 6.6**: Select elements from a list using `$` and `[[ ]]`.
7. **Exercise 6.7**: Create a list for another movie with reviews.

## Tips for Success
- Practice writing and executing R code regularly.
- Use R's built-in help functions (like `?function_name`) to understand functions better.
- Experiment with different data types and structures to solidify your understanding.
- Review the exercises and ensure you understand the concepts behind each one.

Here are the inline reversed flashcards without the `|` characters:


Combines values into a vector or list. ::: [[R.c()]]
<!--SR:!2025-08-04,176,330!2025-02-18,44,307-->
Combines R objects by columns. ::: [[R.cbind()]]
<!--SR:!2025-02-22,48,307!2025-02-21,47,307-->
Returns or sets the class of an object. ::: [[R.class()]]
<!--SR:!2025-07-30,171,327!2025-06-04,125,307-->
Computes the sum of columns for matrices and arrays. ::: [[R.colSums()]]
<!--SR:!2025-02-12,44,310!2025-02-19,45,290-->
Creates a data frame from vectors and/or factors. ::: [[R.data.frame()]]
<!--SR:!2025-06-02,123,307!2025-05-31,121,307-->
Encodes a vector as a factor (categorical variable). ::: [[R.factor()]]
<!--SR:!2025-08-08,180,330!2025-02-16,42,307-->
Returns the first parts of an object. ::: [[R.head()]]
<!--SR:!2025-07-25,166,327!2025-03-23,69,330-->
Creates a list containing a variety of objects. ::: [[R.list()]]
<!--SR:!2025-02-18,44,307!2025-02-26,52,310-->
Creates a matrix from vector(s). ::: [[R.matrix()]]
<!--SR:!2025-02-24,50,307!2025-03-23,69,330-->
Calculates the arithmetic mean. ::: [[R.mean()]]
<!--SR:!2025-03-27,73,330!2025-03-10,64,330-->
Gets or sets the names of an object. ::: [[R.names()]]
<!--SR:!2025-02-17,48,310!2025-04-25,81,307-->
Returns a permutation which rearranges its first argument into ascending or descending order. ::: [[R.order()]]
<!--SR:!2025-03-10,32,250!2025-07-04,148,310-->
Combines R objects by rows. ::: [[R.rbind()]]
<!--SR:!2025-02-13,45,310!2025-02-19,45,307-->
Computes the sum of rows for matrices and arrays. ::: [[R.rowSums()]]
<!--SR:!2025-08-14,184,330!2025-04-28,91,290-->
Displays the structure of an R object. ::: [[R.str()]]
<!--SR:!2025-02-19,50,310!2025-02-23,49,307-->
Returns subsets of vectors, matrices, or data frames which meet conditions. ::: [[R.subset()]]
<!--SR:!2025-07-29,170,327!2025-02-25,43,267-->
Provides a summary of an object's contents. ::: [[R.summary()]]
<!--SR:!2025-05-11,104,307!2025-04-04,67,287-->
Returns the last parts of an object. ::: [[R.tail()]]
<!--SR:!2025-08-03,174,327!2025-03-24,70,330-->


