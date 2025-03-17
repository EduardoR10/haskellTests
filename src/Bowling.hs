module Bowling where

-- Definición de Frame
data Frame = Open Int Int    -- Frame con 2 lanzamientos
           | Spare Int Int   -- Frame con 1 lanzamiento y un Spare (completa 10)
           | Strike          -- Frame con un Strike (solo 1 lanzamiento)
           deriving (Eq, Show)

-- Convertir una lista de números en una lista de frames
toFrames :: [Int] -> Maybe [Frame]
toFrames = go 1
  where
    -- Manejo del último frame (con 2 lanzamientos o Strike)
    go 10 [x, y] | x + y < 10 = Just [Open x y]  -- Frame abierto
    go 10 [x, y] | x == 10   = Just [Strike]     -- Strike en el último
    go 10 [x, y, z] | x == 10 = Just [Strike]     -- Strike en el último
    go 10 [x, y, z]          = Just [Spare x z]   -- Spare en el último
    -- Manejo de frames previos
    go n (x:y:z:ys)
      | x == 10 = (Strike :) <$> go (n + 1) (y:z:ys)   -- Si es un Strike
      | x + y == 10 = (Spare x z :) <$> go (n + 1) (z:ys) -- Si es un Spare
      | x + y < 10 = (Open x y :) <$> go (n + 1) (z:ys)   -- Si es un Open
      | otherwise = Nothing
    go _ _ = Nothing

-- Función para calcular la puntuación de un frame
frameScore :: Frame -> Int
frameScore (Open x y)   = x + y        -- Open: Suma los dos lanzamientos
frameScore (Spare _ y)  = 10 + y        -- Spare: 10 más el siguiente lanzamiento
frameScore (Strike)     = 10            -- Strike: 10 (sin valor adicional)

-- Función para calcular la puntuación total de la partida
score :: [Frame] -> Int
score = sum . map frameScore

-- Función que calcula el puntaje final a partir de los lanzamientos
scorePlay :: [Int] -> Maybe Int
scorePlay pins = do
    frames <- toFrames pins   -- Convierte los lanzamientos a frames
    return $ score frames     -- Calcula la puntuación total