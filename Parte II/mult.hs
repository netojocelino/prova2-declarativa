-- Função de Multiplicação de Matrizes.

-- Assuma que as matrizes são listas de listas de números de ponto flutuante.
type Matriz = [[Double]]


-- Usarei a função de tranposição de matrizes já implementada em outra questão.
---------------------------------------------------------------------------------------------------

-- Função Transposição de Matrizes.

-- Recebe como argumento uma lista de listas(Matriz) que representa a matriz e retorna a matriz transposta.
trans:: Matriz -> Matriz
trans ([]:_) = []	-- "cauda" da lista vazia? retorna somente "cabeça".
trans x = (map head x) : trans (map tail x) -- Vai pegando as "cabeças" das listas recursivamente até chegar no caso da matriz vazia. 

-- Ex: [[1,2,3],[4,5,6]] -> pega as "cabeças" e faz recursão!
-- [[1,4] : ( [2,3],[5,6] )] -> novamente!
-- [( [1,4],[2,5] ) : ( [3],[6] )] -> última recursão até chegar no caso de matriz vazia retorna resultado final.
-- [( [1,4],[2,5],[3,6] ) : ([])] -- caso de "cauda" vazia, retorna resultado [[1,4],[2,5],[3,6]].

----------------------------------------------------------------------------------------------------


-- Agora a função de multiplicação de matrizes.
----------------------------------------------------------------------------------------------------

-- Função Multiplicação de Matrizes.

-- Recebe duas matrizes de números do tipo ponto flutuante, como pede para se assumir nessa questão de prova e retorna resultado da multiplicação, usando função de tranposição.
mult :: Matriz -> Matriz -> Matriz
-- Uso de função de tranposição para processo de multiplicação de matrizes. 
mult x y = [[ sum $ zipWith (*) xr yr | yr <- (trans y)] | xr <- x ]   
----------------------------------------------------------------------------------------------------
