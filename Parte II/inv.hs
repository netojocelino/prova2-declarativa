-- Função de inversão de matrizes.

-- Uso de ponto flutuante em Matriz.
type Matriz = [[Double]]

-- Definição do tamanho para uso posterior.
tamanho :: Matriz -> Int
tamanho = length

-- Mapeamento da matriz.
mapMatriz :: (Double -> Double) -> Matriz -> Matriz
mapMatriz f = map (map f)

coords :: Matriz -> [[(Int, Int)]]
coords = zipWith (map . (,)) [0..] . map (zipWith const [0..])

-- Limpando  a matriz.
delMatriz :: Int -> Int -> Matriz -> Matriz
delMatriz i j = dellist i . map (dellist j)
  where
    dellist i xs = take i xs ++ drop (i + 1) xs

-- Cálculo da determinante.
determinante :: Matriz -> Double
determinante m
    | tamanho m == 1 = head (head m)
    | otherwise    = sum $ zipWith adicao [0..] m
  where
    adicao i (x:_) =  x * cofator i 0 m

-- Cálculo de cofatores.
cofator :: Int -> Int -> Matriz -> Double
cofator i j m = ((-1.0) ** fromIntegral (i + j)) * determinante (delMatriz i j m)

cofatorM :: Matriz -> Matriz
cofatorM m = map (map (\(i,j) -> cofator j i m)) $ coords m

-- Função de inversão de matrizes
inv :: Matriz -> Matriz
inv m = mapMatriz (* recip det) $ cofatorM m
  where
    det = determinante m