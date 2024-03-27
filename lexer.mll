{ 
        open Parser 
}
let uppercase = ['A' -'Z']
let lowercase  = ['a' - 'z']
let digit= ['0'-'9']

rule tokenize = parse 
| [' ' '\t' '\n'] {tokenize lexbuf}
| '(' {Parser.LPAREN}
|')'  {Parser.RPAREN}
|','  {Parser.COMMA}
|'.'  {Parser.PERIOD}
|":-" {Parser.ARROW}
|'['  {Parser.LB}
|']'  {Parser.RB}
|'+'  {Parser.PLUS}
|'-' { Parser.MINUS}
|'*'  {Parser.MUL}
|'/' {Parser.DIV}
|'=' {Parser.EQ}
|'<' {Parser.LT}
|'>' {Parser.GT}
|('?')('-') {Parser.QS}
|("true"|"false") as bl {Parser.BOOL(bl)}
|(uppercase|'_')(uppercase|lowercase|digit|'_')* as ident {Parser.IDENTIFIER(ident)}
|(lowercase)(uppercase|lowercase|digit|'_')* as pred {Parser.PREDICATE(pred)}
|['\''][^'\'']*['\''] as const {Parser.CONST(const)} 
|digit+ as num {Parser.NUMBER(num)}
|eof  {Parser.EOF}
|"\\+" { Parser.NOT }
|_ as i {raise (Failure(Printf.sprintf "Unexpected character: %c" i)) }
{ 
        exception LexerError of string
}


