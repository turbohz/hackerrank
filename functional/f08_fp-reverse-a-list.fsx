open System

let (|Line|_|) (r:IO.TextReader) = if r.Peek() = -1 then None else Some (r.ReadLine())
let rec readLines (reader:IO.TextReader) (lines: string list) : string list = 
    match reader with
    | Line l -> readLines reader (lines @ [l])
    | _ -> lines

let input = Console.OpenStandardInput()

let reader = new IO.StreamReader(input)

let dump (lines: string list) =
    lines |> List.iter (Console.WriteLine)

let rec reverse output input =
    match input with
    | [] -> output
    | x::xs -> reverse (x::output) xs

// let's go

[] |> readLines reader |> reverse [] |> dump
exit 0