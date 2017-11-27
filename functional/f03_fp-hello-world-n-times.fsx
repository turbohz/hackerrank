open System

let maybeParse i =
    match Int32.TryParse i with
    | (true , v) -> Some v
    | (false, _) -> None
    
let maybeTimes = Console.ReadLine() |> maybeParse 

match maybeTimes with
| None -> 
    printfn "Invalid input"; exit 1
| Some times when times < 0 || times > 50 ->
    printfn "Invalid input"; exit 1
| Some times -> 
    [1..times] |> Seq.iter (fun _ -> printfn "Hello World")
    exit 0