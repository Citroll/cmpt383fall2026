# Haskell Functions Taught in Lecture Notes (Chapters 1-4)

A reference of the functions, operators, and syntax introduced in the notes, with how each is used.

---

## 1. Standard Prelude List Functions

| Function | Type | What it does | Example |
|---|---|---|---|
| `head lst` | `[a] -> a` | First element | `head [3,2,1]` -> `3` |
| `tail lst` | `[a] -> [a]` | List without its first element | `tail "person"` -> `"erson"` |
| `last lst` | `[a] -> a` | Last element (error on `[]`) | `last "apple"` -> `'e'` |
| `init lst` | `[a] -> [a]` | List without its last element | `init [1,2,3,4]` -> `[1,2,3]` |
| `length lst` | `[a] -> Int` | Number of elements | `length "road"` -> `4` |
| `lst !! n` | `[a] -> Int -> a` | Element at index `n` (0-based; error if too large) | `[8,3,5] !! 1` -> `3` |
| `take n lst` | `Int -> [a] -> [a]` | First `n` elements | `take 2 [9,3,2,1]` -> `[9,3]` |
| `drop n lst` | `Int -> [a] -> [a]` | Everything except the first `n` elements | `drop 3 "juggler"` -> `"gler"` |
| `sum lst` | `Num a => [a] -> a` | Sum of numbers (`sum [] = 0`) | `sum [2,10,-4]` -> `8` |
| `product lst` | `Num a => [a] -> a` | Product of numbers (`product [] = 1`) | `product [2,10,-4]` -> `-80` |
| `lst1 ++ lst2` | `[a] -> [a] -> [a]` | Append two lists (also joins strings) | `"red " ++ "popper"` -> `"red popper"` |
| `reverse lst` | `[a] -> [a]` | Reverse a list | `reverse "orchestra"` -> `"artsehcro"` |
| `[lo..hi]` | | Range of numbers from `lo` to `hi` | `[22..27]` -> `[22,23,24,25,26,27]` |
| `zip xs ys` | `[a] -> [b] -> [(a,b)]` | Pair up elements of two lists | `zip [1,2,3] ["cat","dog","bird"]` -> `[(1,"cat"),(2,"dog"),(3,"bird")]` |
| `x:xs` (cons) | `a -> [a] -> [a]` | Add `x` to the front of `xs` | `4:[2,6,1]` -> `[4,2,6,1]` |

## 2. Higher-Order Functions

| Function | What it does | Example |
|---|---|---|
| `filter f lst` | Keep elements for which `f` returns `True` | `filter even [1..100]` -> the even numbers 2..100 |
| `map f lst` | Apply `f` to every element | `map (2+) [1,2,3,4]` -> `[3,4,5,6]` |

A function is **higher-order** if it takes a function as input (or returns one).

## 3. Tuple Functions

| Function | Type | What it does | Example |
|---|---|---|---|
| `fst` | `(a, b) -> a` | First value of a pair | `fst (1,"x")` -> `1` |
| `snd` | `(a, b) -> b` | Second value of a pair | `snd (1,"x")` -> `"x"` |

## 4. Other Standard Functions

| Function | Type | What it does | Example |
|---|---|---|---|
| `id` | `a -> a` | Identity: returns its input unchanged | `id "pets"` -> `"pets"` |
| `not` | `Bool -> Bool` | Logical negation | `not True` -> `False` |
| `even n` | `Integral a => a -> Bool` | `True` if `n` is even | `even 4` -> `True` |
| `error msg` | `String -> a` | Stops with an error message (used for invalid input) | `error "list must have 2 or more elements"` |

## 5. Numeric and Class-Based Functions

**`Num`** (`Int`, `Integer`, `Float`, `Double`, ...)

| Function | Description |
|---|---|
| `(+)`, `(-)`, `(*)` | Add, subtract, multiply (`a -> a -> a`) |
| `negate x` | Flip the sign |
| `abs x` | Absolute value |
| `signum x` | `-1`, `0`, or `1` depending on sign. Negatives need brackets: `signum (-3)` |

**`Integral`** (`Int`, `Integer`) - everything in `Num`, plus:

| Function | Example |
|---|---|
| `div` (integer division) | `div 8 3` or ``8 `div` 3`` -> `2` |
| `mod` (remainder) | `mod 10 3` or ``10 `mod` 3`` -> `1` |

**`Fractional`** (`Float`, `Double`) - everything in `Num`, plus:

| Function | Example |
|---|---|
| `(/)` division | `3 / 2` -> `1.5` |
| `recip x` reciprocal | `recip 10` -> `0.1` |

**`Eq`** - `(==)` and `(/=)` (`a -> a -> Bool`). Works on numbers, chars, strings, bools; lists are `Eq` if their elements are. Functions are generally not `Eq`.

**`Ord`** - `(<)`, `(<=)`, `(>)`, `(>=)` (`a -> a -> Bool`), plus `min` and `max` (`a -> a -> a`). Strings and lists compare **lexicographically**.

**`Show`** - `show :: a -> String` converts a value to a string. `show [1,2,3]` -> `"[1,2,3]"`

**`Read`** - `read :: String -> a` parses a string into a value. Often needs a type annotation: `read "5.22" :: Float` -> `5.22`

## 6. GHCi Commands

| Command | Purpose |
|---|---|
| `:type expr` or `:t expr` | Show the type of an expression, e.g. `:t mysum` |
| `:info Class` | Show a type class's functions and instances, e.g. `:info Num` |

---

## 7. Functions Defined in the Notes

### Chapter 1

```haskell
mysum :: Num a => [a] -> a
mysum []     = 0
mysum (n:ns) = n + mysum ns          -- recursive sum
```

```haskell
qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (n:ns) = qsort smalls ++ [n] ++ qsort bigs
             where smalls = [a | a <- ns, a <= n]
                   bigs   = [b | b <- ns, b > n]
```
Uses a **list comprehension** `[a | a <- ns, a <= n]` and `where`. Works on any `Ord` type, e.g. `qsort "SimonFraserUniversity"`.

### Chapter 2

```haskell
double x     = x + x
quadruple x  = double (double x)
factorial n  = product [1..n]
average ns   = sum ns `div` length ns     -- integer average
ends1 lst    = [head lst, last lst]
ends2 lst    = [head lst] ++ [last lst]

mylast1 lst  = head (drop (length lst - 1) lst)   -- drop n-1 elements
mylast2 lst  = head (reverse lst)                 -- reverse then head

myinit1 lst  = take (length lst - 1) lst          -- take n-1 elements
myinit2 lst  = reverse (tail (reverse lst))       -- reverse, tail, reverse
```

### Chapter 3

```haskell
add :: (Int, Int) -> Int          -- takes a tuple
add (x, y) = x + y

range :: Int -> [Int]
range n = [0..n]

twice :: (Int -> Int) -> Int -> Int   -- takes a function
twice f x = f (f x)

add' :: Int -> (Int -> Int)       -- curried: add' 5 returns a function
add' x y = x + y

mult :: Int -> Int -> Int -> Int  -- curried, 3 inputs
mult x y z = x * y * z
```

### Chapter 4

```haskell
middle1 :: [a] -> [a]             -- drops first and last element
middle1 []     = []
middle1 [x]    = []
middle1 (_:xs) = reverse (tail (reverse xs))

pluralize1 :: String -> String    -- uses if-then-else
pluralize1 "" = ""
pluralize1 s  = s ++ (if last s == 's' then "" else "s")

sign1 n | n == 0    = "zero"      -- guarded equations
        | n < 0     = "negative"
        | otherwise = "positive"
-- inferred: sign1 :: (Num a, Ord a) => a -> [Char]

coin1 :: Int -> String            -- literal pattern matching
coin1 1  = "penny"
coin1 5  = "nickel"
coin1 10 = "dime"
coin1 25 = "quarter"
coin1 _  = "unknown"

nand :: Bool -> Bool -> Bool      -- wildcards
nand True True = False
nand _    _    = True

get_x :: (Double, Double) -> Double   -- tuple patterns
get_x (x, _) = x
get_y :: (Double, Double) -> Double
get_y (_, y) = y

is_expr :: [String] -> String     -- list patterns
is_expr [_, "+", _] = "addition"
is_expr [_, "-", _] = "subtraction"
is_expr ["-", _]    = "negation"
is_expr [_, op,  _] = "unknown operator " ++ op
is_expr _           = "unknown expression"

firsts1 :: [a] -> [b] -> (a, b)   -- cons patterns
firsts1 (x:xs) (y:ys) = (x, y)
firsts2 (x:_) (y:_)   = (x, y)    -- same, using _
firsts3 xs ys         = (head xs, head ys)

firsts_list1 :: [a] -> [a] -> [a] -- handle empty lists first
firsts_list1 []    _     = []
firsts_list1 _     []    = []
firsts_list1 (x:_) (y:_) = [x, y]

remove812 :: [Int] -> [Int]       -- match several items at the front
remove812 (8:1:2:xs) = xs
remove812 xs         = xs

inc1 :: Num a => a -> a           -- lambda in a definition
inc1 = \n -> n + 1
```

---

## 8. Syntax and Concepts Cheat Sheet

| Concept | Syntax / Example | Notes |
|---|---|---|
| Function application | `f a b c` | Left associative: `((f a) b) c`. `g (g x)` needs brackets. |
| Type signature | `f :: Int -> Int -> Int` | `->` is right associative; `::` means "has type" |
| Class constraint | `Num a => a -> a` | `a` must be an instance of `Num` |
| Naming | `e`, `xs`, `f'` | Functions/variables start lowercase; types start uppercase |
| Comments | `-- line` and `{- block -}` | |
| Layout rule | Indentation groups equations | Use spaces, not tabs |
| Equations | `f [] = ...` / `f (x:xs) = ...` | Matched top to bottom |
| Guards | `f n \| n < 0 = ...` / `\| otherwise = ...` | `otherwise` is the catch-all |
| Conditional | `if cond then a else b` | `a` and `b` must have the same type |
| Wildcard | `_` | Matches anything, no name bound |
| Cons pattern | `(x:xs)`, `(8:1:2:xs)` | Does not match `[]` |
| Lambda | `\x -> x*x` | Anonymous function |
| Closure | `(\x -> (\y -> x * y)) 3 4` | Inner function remembers `x` |
| Operator section | `(2+)`, `(/2)`, `(2/)` | Position matters: `(/2)` divides by 2, `(2/)` divides 2 |
| Prefix vs infix | `div 8 3` vs ``8 `div` 3``; `(+) 2 5` vs `2 + 5` | Backticks make a function infix |
| `where` | `f = b + c where b = 1; c = 2` | Local definitions |
| List comprehension | `[a \| a <- ns, a <= n]` | Builds a list by filtering/transforming |
| Currying | `add' 5` returns a function | Every function takes one input and may return a function |
| Type annotation | `read "5" :: Int` | Forces a particular type |

---

## 9. Unsolved Practice Challenges Mentioned in the Notes

These are prompts in the notes without solutions given:

- `outside` - returns `(first, last)` of a list; use `error` if fewer than 2 elements
- `middle2` - `middle1` without `reverse`
- `middle_test m1 m2 x` - compares two middle functions on a list (needs `Eq a`)
- `pluralize2`, `pluralize3`, `pluralize_test` - alternate/better pluralization and a tester
- `sign2` - `sign1` rewritten with `if ... then ... else`
- `heron_area a b c` - triangle area via Heron's formula; `error` on non-positive sides
- `coin2` - like `coin1` but the fallback includes the coin's value
- `short_length` - returns 0-3 by pattern matching, `-1` otherwise
- Consed-out form of `"apple"`
- Reciprocals using `map` and a section
- `h n` - sum of fourth powers using an operator section

### "Explain the bug" exercises

- `middle_bug1`
- `sign_bug1`
- `coin_bug1`
- `same_bug1`
- `diff_heads_bug1`

---

## Notes and Caveats

- `average ns = sum ns `div` length ns` only works for integer types, since `div` needs `Integral` and `length` returns `Int`.
- `head []`, `last []`, and `!!` with an index that is too large all raise runtime exceptions. Haskell functions are not required to be **total**.
- `init` appears in the Chapter 2 practice question but is not given its own entry there; its behavior is shown by the `myinit` exercise.
