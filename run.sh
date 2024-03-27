#!/bin/bash

# Compile the lexer and parser file
ocamlyacc parser.mly
ocamllex lexer.mll

ocamlc -c ast.ml
ocamlc -c parser.mli
ocamlc -c parser.ml
ocamlc -c lexer.ml
ocamlc -c comp.ml

ocamlc -o main lexer.cmo parser.cmo ast.cmo comp.cmo

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful."

    # Run the compiled program with the input file
    ./main input_file.pl > output_file.txt

    # Check if the program executed successfully
    if [ $? -eq 0 ]; then
        echo "Program executed successfully. Output saved to output_file.txt."
    else
        echo "Error: Program execution failed."
    fi
else
    echo "Error: Compilation failed."
fi

