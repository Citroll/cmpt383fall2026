-- List comprehensions

-- all 16-bit patterns of length 4 using list comprehension
bit :: [(Integer, Integer, Integer, Integer)]
bit = [(a,b,c,d) | a <- [0,1], b <- [0,1], c <- [0,1], d <- [0,1]]

-- ab patterns of length 4
patterns4 :: String -> String -> [(String, String, String, String)]
patterns4 x y = [(a,b,c,d) | a <- [x,y], b <- [x,y], c <- [x,y], d <- [x,y]]

-- some sums 1
sums_1 :: [Int]
sums_1 = [a+b | a<-[1..10], b<-[1..10]]

-- some sums 2
sums_2 :: [(Int, Int, Int)]
sums_2 = [(x,y,x+y) | x<-[1..10], y<-[1..10]]

-- sums to n
sums_n :: Int -> [(Int, Int)]
sums_n n = [(a,b) | a<-[1..n], b<-[1..n], a <= b, a+b == n, not (a `mod` 5 == 0), not (b `mod` 5 == 0)]

-- number of priems helpers
factors :: Int -> [Int]
factors n = [d | d <- [1..n], n `mod` d == 0]

is_prime :: Int -> Bool
is_prime n =  factors n == [1,n]

primes :: Int -> [Int]
primes n = [a | a <- [2..n], is_prime a]

-- number of primes
numPrimesUpto :: Int -> Int
numPrimesUpto n = length (primes n)

-- lookup table keys
keys :: [(a,b)] -> [a]
keys table = [k | (k, v) <- table]

-- lookup table values
values :: [(a,b)] -> [b]
values table = [v | (k, v) <- table]

-- twin primes
twinPrimes :: Int -> [(Int, Int)]
twinPrimes n = [(a,b) | a <-[2..n], b <-[2..n], is_prime a, is_prime b, b == (a+2)]
