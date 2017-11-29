open System    
let parsed i =
    match Int32.TryParse i with
    | (true , v) -> Some v
    | (false, _) -> None

let (|Line|_|) (r:IO.TextReader) = if r.Peek() = -1 then None else Some (r.ReadLine())
let rec readLines (reader:IO.TextReader) (lines: string list) : string list = 
    match reader with
    | Line l -> readLines reader (lines @ [l])
    | _ -> lines

let input = Console.OpenStandardInput()

let reader = new IO.StreamReader(input)

let dump (lines: string list) =
    lines |> List.iter (Console.WriteLine)

let rec filter cond list =
    match list with
    | [] -> list
    | x::xs when cond x -> x::filter cond xs
    | _::xs -> filter cond xs

let compute lines =
    match lines with
    | [_] | [] -> printfn "Invalid input"; exit 1
    | n::xs -> xs |> filter (fun x -> x < n)

// let's go

[] |> readLines reader |> List.choose parsed |> compute |> List.map string |> dump
exit 0
