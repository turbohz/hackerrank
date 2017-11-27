open System    
let parsed i =
    match Int32.TryParse i with
    | (true , v) -> Some v
    | (false, _) -> None

let (|EOF|_|) (r:IO.TextReader) = if r.Peek() = -1 then Some EOF else None

let rec readLines (reader:IO.TextReader) (lines: string list) : string list = 
    match reader with
    | EOF -> lines
    | _ -> readLines reader (lines @ [reader.ReadLine()])

let input = Console.OpenStandardInput()

let reader = new IO.StreamReader(input)

let dump (lines: string list) =
    lines |> List.iter (Console.WriteLine)

let repeated n v =
    List.init n (fun _ -> v)

let compute lines =
    match lines with
    | [_] | [] -> printfn "Invalid input"; exit 1
    | n::xs -> xs |> List.map string |> List.collect (repeated n)

// let's go

[] |> readLines reader |> List.choose parsed |> compute |> dump
exit 0
