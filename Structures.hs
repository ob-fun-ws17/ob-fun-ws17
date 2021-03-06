module Structures where

-- import Control.Monad.Reader
import Data.Char (toUpper)

-- instance Monoid Maybe where
--   mempty = Nothing
--   Nothing `mappend` x = x
--   x `mappend` Nothing = x
--   Just x `mappend` Just y =
--     Just $ x `mappend` y
newtype Students =
  Students Int
  deriving (Show)

instance Monoid Students where
  mempty = Students 0
  mappend (Students x) (Students y) = Students (x + y)

data StudentGroups = StudentGroups
  { maxMembersPerGroup :: Int
  , groups :: [Int]
  } deriving (Show)

mkStudentGroups :: Int -> Students -> StudentGroups
mkStudentGroups size (Students i) =
  StudentGroups size ((i `mod` size) : replicate (i `div` size) size)

instance Monoid StudentGroups where
  mempty = StudentGroups 0 []
  (StudentGroups sizeX xs) `mappend` (StudentGroups sizeY ys) =
    mkStudentGroups (max sizeX sizeY) (Students (sum xs + sum ys))

-- f = do
--   fmap (map toUpper) getLine
--   --let sTR = map toUpper str
--   --putStrLn str
g :: Int -> Double -> String -> String
g i d s = show i ++ " " ++ s ++ ": " ++ show d

f :: IO ()
f = getLine >>= putStrLn
