-- List comprehensions

-- all 16-bit patterns of length 4 using list comprehension
bit :: [(Integer, Integer, Integer, Integer)]
bit = [(a,b,c,d) | a <- [0,1], b <- [0,1], c <- [0,1], d <- [0,1]]

-- ab patterns of length 4
