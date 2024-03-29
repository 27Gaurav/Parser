# Logic Programming Language Parser

## Assignment Description

In this assignment, you will write a simple parser for a logic programming language, which is a subset similar to Prolog. The parser will be implemented using the OCaml version of Yacc. Your task involves defining the grammar and lexical tokens for this surface language based on the given abstract formulation. You'll be evaluated on both the design of the surface syntax and the parser's implementation.

### Objective

- Define the grammar and lexical tokens for the logic programming language.
- Implement the parser using OCaml Yacc.
- Represent the abstract syntax of the logic programming language as a data type in OCaml. The output of your parser should be in the form of abstract syntax trees.

### Prolog Program Structure

The abstract structure of a Prolog program is as follows:

- A **program** is a sequence of **clauses**.
  
- A **clause** can either be a **fact** or a **rule**.
  
- A **fact** has a head but no body. A **rule** consists of a head and a body.

- The **head** is a single atomic formula.

- A **body** is a sequence of atomic formulas.
