(* Ast.ml *)
type var = string  
type predicate =string
type bl = string
type number  = string 
type term =
  | Variable of var
  | Constant of string
  | Bool of bl
  | Atomic_formula of predicate * (term list)
  | Number of number

type atomic_formula = Atomic_formula of predicate * (term list)
 
type clause =
  | Fact of atomic_formula
  | Rule of atomic_formula * (atomic_formula list)
  | Query of atomic_formula
type program = clause list 

let rec string_of_term term =
  match term with
  | Variable v -> "Variable: " ^ v
  | Constant c -> "Constant: " ^ c
  | Bool bl -> "Boolean: " ^ bl
  | Number n -> "Numeral: " ^ n
  | Atomic_formula (p, args) ->
      "Atomic formula: " ^ p ^ "(" ^ String.concat ", " (List.map string_of_term args) ^ ")"

let string_of_atomic_formula atomic_formula =
  match atomic_formula with
  | Atomic_formula (p, args) ->
      "Atomic formula: " ^ p ^ "(" ^ String.concat ", " (List.map string_of_term args) ^ ")"

let rec string_of_clause clause =
  match clause with
  | Fact atomic_formula -> "Fact: " ^ string_of_atomic_formula atomic_formula
  | Rule (head, body) ->
      "Rule: " ^ string_of_atomic_formula head ^ " :- " ^ String.concat ", " (List.map string_of_atomic_formula body)
  | Query atomic_formula -> "Query: " ^ string_of_atomic_formula atomic_formula

let show_ast program =
  String.concat "\n" (List.map string_of_clause program)

