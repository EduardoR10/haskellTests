module FizzBuzz (fizzbuzz) where

--Convierte un número en su representación de FizzBuzz
fizzbuzz :: Int -> String
fizzbuzz n
    | n `mod` 15 == 0 = "fizzbuzz!"
    | n `mod` 3 == 0 = "fizz!"
    | n `mod` 5 == 0 = "buzz!"
    | otherwise = numberToWords n ++ "!"

--Convierte un numero en su representación en palabras
numberToWords :: Int -> String
numberToWords n
    | n <= 19 = wordsList !! (n - 1)
    | n == 100 = "one hundred"
    | otherwise = tensList !! (n `div` 10 - 2) ++ if n `mod` 10 /= 0 then " " ++ numberToWords (n `mod` 10) else ""

--Lista de numeros en palabras ingles
wordsList :: [String]
wordsList = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
             "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", 
             "seventeen", "eighteen", "nineteen"]

tensList :: [String]
tensList = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]