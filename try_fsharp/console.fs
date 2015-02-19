open System

let main() = 
    Console.Write("What's your name? ")
    let name = Console.ReadLine()
    Console.Write("Hello, {0}", name)

main()
