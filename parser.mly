%{
    open Ast (* Assuming Ast.ml contains the Ocaml data type definitons *)

%}

%token <string> IDENTIFIER PREDICATE CONST BOOL
%token MUL LPAREN RPAREN COMMA ARROW PERIOD EOF NOT LB RB PLUS MINUS DIV PIPE EQ LT GT QS 
%token <string> NUMBER

%start program 
%type <Ast.program> program
%type <Ast.clause> clause
%type <Ast.atomic_formula> atomic_formula
%type <Ast.atomic_formula list> atomic_formulas
%type <Ast.term list> terms
%type <Ast.term> term


%%

program:
        | clause PERIOD { [$1]}
        | clause PERIOD program {$1 :: $3}
   
clause:
        | atomic_formula { Fact($1) }
        | atomic_formula ARROW atomic_formulas { Rule($1, $3) }
        | QS atomic_formula  { Query($2) }

atomic_formulas:
        | atomic_formula COMMA atomic_formulas {$1 :: $3} 
        | atomic_formula { [$1]}
atomic_formula :
        |PREDICATE LPAREN terms RPAREN { Atomic_formula($1, $3) }
 
terms:
        | term COMMA terms { $1 :: $3 }
        | term {[$1]}
       

term:
        | CONST { Constant($1) }
        | PREDICATE LPAREN terms RPAREN { Atomic_formula($1, $3) }
        | IDENTIFIER { Variable($1) } 
        | BOOL { Bool($1)}
        | NUMBER { Number($1)}








  
