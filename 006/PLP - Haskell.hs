--1 Fatorial
fat 0 = 1
fat n = n * fat(n-1)

--2 Fibonacci
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)

--3 Intercala
intercala :: [Int] -> [Int] -> [Int]
intercala [] [] = []
intercala (x:xs) (y:ys) = [x]++[y] ++ intercala xs ys

--Função auxiliar - Pertence
pertence :: Eq t => t -> [t] -> Bool
pertence x [] = False
pertence x (y:ys) = if (y == x) then True
                               else pertence x ys

--4 União
uniao :: [Int] -> [Int] -> [Int]
uniao [] l = l
uniao (x:xs) l = if pertence x l then uniao xs l
                                 else x: uniao xs l

--5 Intersecção
interseccao :: [Int] -> [Int] -> [Int]
interseccao [] l = []
interseccao (x:xs) l = if pertence x l then x: interseccao xs l
                                       else interseccao xs l

--6 Sequência
sequencia :: Int -> Int -> [Int]
sequencia 0 _ = []
sequencia n m = m: sequencia (n-1) (m+1)

--7 Cria Tupla par e impar


--8 Partes

--9 Compactar

--10 Fatorial Cauda
fat_aux :: Int -> Int -> Int
fat_aux num parc = if num == 1 then parc
                               else fat_aux (num - 1) (parc*num)

fatC :: Int -> Int
fatC num = fat_aux num 1