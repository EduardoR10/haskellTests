module Main where

import Test.Tasty
import Test.Tasty.HUnit
import FizzBuzz  -- Asegúrate de que FizzBuzz.hs tiene la función fizzbuzz implementada

--Pruebas definidas para FizzBuzz
fizzBuzzSuite :: TestTree
fizzBuzzSuite = testGroup "Pruebas de FizzBuzz"
  [ testGroup "fizzbuzz"
      [ testCase "1 es 'one!'" $ fizzbuzz 1 @?= "one!"
      , testCase "2 es 'two!'" $ fizzbuzz 2 @?= "two!"
      , testCase "3 es 'fizz!'" $ fizzbuzz 3 @?= "fizz!"
      , testCase "5 es 'buzz!'" $ fizzbuzz 5 @?= "buzz!"
      , testCase "101 '" $ fizzbuzz 101 @?= "fizzbuzz!"
      , testCase "22 es 'twenty two!'" $ fizzbuzz 22 @?= "twenty two!"
      , testCase "23 es 'buzz!'" $ fizzbuzz 25 @?= "buzz!"
      , testCase "60 es 'fizzbuzz!'" $ fizzbuzz 60 @?= "fizzbuzz!"
      , testCase "99 es 'fizz!'" $ fizzbuzz 99 @?= "fizz!"
      , testCase "100 es 'buzz!'" $ fizzbuzz 100 @?= "buzz!"
      ]
  ]

main :: IO ()
main = defaultMain fizzBuzzSuite
