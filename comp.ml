open Ast

let _ =
    let input_channel = open_in "input_file.pl" in
    try
        let lexbuf = Lexing.from_channel input_channel in
        let ast = Parser.program Lexer.tokenize lexbuf in
        close_in input_channel;
        print_endline (Ast.show_ast ast);
    with
    | Lexer.LexerError msg ->
        Printf.fprintf stderr "%s%!" msg ;
        exit (-1)
    | c  ->
        close_in_noerr input_channel;
        raise c

           

