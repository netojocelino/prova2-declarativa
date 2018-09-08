-- Função de Transposição de Matrizes.

-- Assuma que as matrizes são listas de listas de números de ponto flutuante.
type Matriz = [[Double]]

-- Recebe como argumento uma lista de listas(Matriz) que representa a matriz e retorna a matriz transposta.
trans:: Matriz -> Matriz
trans ([]:_) = []	-- "cauda" da lista vazia? retorna somente "cabeça".
trans x = (map head x) : trans (map tail x) -- Vai pegando as "cabeças" das listas recursivamente até chegar no caso da matriz vazia. 

-- Ex: [[1,2,3],[4,5,6]] -> pega as "cabeças" e faz recursão!
-- [[1,4] : ( [2,3],[5,6] )] -> novamente!
-- [( [1,4],[2,5] ) : ( [3],[6] )] -> última recursão até chegar no caso de matriz vazia retorna resultado final.
-- [( [1,4],[2,5],[3,6] ) : ([])] -- caso de "cauda" vazia, retorna resultado [[1,4],[2,5],[3,6]]