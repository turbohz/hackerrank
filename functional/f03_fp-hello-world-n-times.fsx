open System

let parsed i =
    match Int32.TryParse i with
    | (true , v) -> Some v
    | (false, _) -> None

let (|ValidInput|_|) = function
    | Some v when v >= 0 && v <= 50 -> Some v
    | _ -> None

let greet _ = printfn "Hello World"

Console.ReadLine() 
    |> parsed 
    |> function
        | ValidInput times -> [1..times] |> List.iter greet; 0
        | _ -> printfn "Invalid input"; 1
    |> exit
