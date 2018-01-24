module Monads where

-- import Control.Monad.State
-- import Control.Monad.Writer
f' = do
  s <- getLine
  putStrLn s
  s <- getLine
  putStrLn s

f = getLine >>= (\s -> putStrLn s >> getLine >>= (\s -> putStrLn s))

newtype HumanName =
  HumanName String
  deriving (Eq, Show)

newtype DogName =
  DogName String
  deriving (Eq, Show)

newtype Address =
  Address String
  deriving (Eq, Show)

data Person = Person
  { humanName :: HumanName
  , dogName :: DogName
  , address :: Address
  } deriving (Eq, Show)

data Dog = Dog
  { dogsName :: DogName
  , dogsAddress :: Address
  } deriving (Eq, Show)

pers :: Person
pers =
  Person (HumanName "Big Bird") (DogName "Barkley") (Address "Sesame Street")

getDog :: Person -> Dog
getDog p = Dog (dogName p) (address p)

gcd' :: Int -> Int -> Int
gcd' m n
  | m == n = m
  | m > n = gcd' (m - n) n
  | otherwise = gcd' m (n - m)

type Stack = [Int]

pop' :: Stack -> (Int, Stack)
pop' (x:xs) = (x, xs)
pop' [] = error "pop: empty stack"

push' :: Int -> Stack -> ((), Stack)
push' a xs = ((), a : xs)

stackManip :: Stack -> (Int, Stack)
stackManip stack =
  let ((), newStack1) = push' 3 stack
      (_, newStack2) = pop' newStack1
  in pop' newStack2
