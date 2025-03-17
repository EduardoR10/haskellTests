module Main where
import Bowling
import Test.Tasty
import Test.Tasty.HUnit

-- Test 1: Test con un juego estándar
testStandardGame :: TestTree
testStandardGame = testCase "Test Juego Estándar" $ do
    let game = [10, 3, 5, 7, 3, 2, 8, 0, 10, 4, 4, 6, 2, 9, 1, 10, 10, 10]
    scorePlay game @?= Just 110  
-- Test 2: Test con un solo Strike
testSingleStrike :: TestTree
testSingleStrike = testCase "Test con un solo Strike" $ do
    let game = [10, 3, 6, 4, 5, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    scorePlay game @?= Nothing  

-- Test 3: Test con Spares consecutivos
testConsecutiveSpares :: TestTree
testConsecutiveSpares = testCase "Test con Spares consecutivos" $ do
    let game = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]
    scorePlay game @?= Just 150

-- Test 4: Test con todos Strikes (Juego perfecto)
testPerfectGame :: TestTree
testPerfectGame = testCase "Test con Strikes consecutivos (Juego perfecto)" $ do
    let game = replicate 12 10
    scorePlay game @?= Just 100

-- Test 5: Test con todos Open frames
testAllOpenFrames :: TestTree
testAllOpenFrames = testCase "Test con todos Open frames" $ do
    let game = [3, 5, 2, 4, 6, 3, 1, 7, 8, 1, 4, 2, 5, 3, 7, 2, 4, 6, 3, 6]
    scorePlay game @?= Just 85  

-- Función principal para ejecutar los tests
main :: IO ()
main = do
    defaultMain $ testGroup "Tests de Bowling"
        [ testStandardGame
        , testSingleStrike
        , testConsecutiveSpares
        , testPerfectGame
        , testAllOpenFrames
        ]