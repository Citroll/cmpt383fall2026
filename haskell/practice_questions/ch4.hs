-- Defining Functions

--Outside function

outside :: [a] -> (a,a)
outside xs
    | length xs < 2 = error "list must have 2 or more elements"
    | otherwise     = (head xs, last xs)


--Middle function
-- write middle in a different way without using reverse.
middle :: [a] -> [a]
middle [] = []
middle [_] = []
middle xs = init (tail xs)

-- Better pluralization
pluralize3 :: String -> String
pluralize3 "" = ""
pluralize3 s = if last s == 's' then s else if last s == 'y' then init s ++ "ies" else s ++ "s"

-- Heron area formula
heron_area :: Double -> Double -> Double -> Double
heron_area a b c
    | a <= 0 = error "a must be positive"
    | b <= 0 = error "b must be positive"
    | c <= 0 = error "c must be positive"
    | otherwise = sqrt (s * (s - a) * (s - b) * (s - c))
    where s = (a + b + c) / 2

-- Better coin
coin :: Int -> String
coin n
    | n == 1 = "penny"
    | n == 5 = "nickel"
    | n == 10 = "dime"
    | n == 25 = "quarter"
    | otherwise = show n ++ " is unknown"

-- Length of short lists
short_length :: [a] -> Int
short_length [] = 0
short_length [_] = 1
short_length [_, _] = 2
short_length [_, _, _] = 3
short_length _ = -1

-- Fourth power
h :: Int -> Int
h n
    | n <= 0 = error "n must be positive"
    | otherwise = sum (map (^4) [1..n])

