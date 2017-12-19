module Main where

main :: IO ()
main = putStrLn "Hello World!"

-- tupFunc :: (Int, String) -> (Int, String) -> (Int, String)
-- tupFunc x y = (fst x + fst y, snd x ++ snd y)

-- tupFunc' (a,b) (c,d) = (a + c, b  ++ d)

add :: Num a => a -> a -> a
add x y = x + y
addFive :: Num a => a -> a
addFive = add 5

addUnCurried :: Num a => (a, a) -> a
addUnCurried (x,y) = x + y

data Trivial = Trivial

instance Show Trivial where
  show Trivial = "Trivial"

instance Eq Trivial where
  Trivial == Trivial = True

data DayOfWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving (Eq, Show, Ord, Enum)


f' :: ((Int, Int), Bool) -> ((Int, Int), Bool)
f' (t@(5, 3), b)     = (t, b)
f' ((x, y), True)  = ((y, x), False)
f' (t, False) = (t, True)

myAbs :: Integer -> Integer
-- myAbs x = if x < 0 then -x else x

myAbs x | x < 0 = -x
        -- | x == 0 = 0
        | otherwise = x

factorial :: Integer -> Maybe Integer
factorial 0 = Just 1
factorial n
  | n > 0 = case factorial (n-1) of
      Nothing -> Nothing
      Just nMinus1 -> Just $ n * nMinus1
  | otherwise = Nothing

-- otherwise = True

-- st' (x,_) = x

-- fst3 (x,_,_) = x

-- fst4 (x,_,_,_) = x

data Identity a = Identity a

instance Eq a => Eq (Identity a) where
  (==) (Identity v) (Identity v') = v == v'

data Point = Point
  { getX :: Int
  , getY :: Int
  }
  deriving Show

data TrivialT = TrivialInt Int | TrivialDouble Double

data Point3 = Point3
  { getXY :: Point
  , getZ :: Int
  }
  deriving Show


-- getX, getY :: Point -> Int
-- getX (Point x _) = x
-- getY (Point _ y) = y

newtype Grade = Grade Int

goodEnough :: Grade -> Bool
goodEnough (Grade g) = g < 5
