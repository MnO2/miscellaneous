{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Data.Array
import Data.Array.ST
import Data.List
import Control.Monad.ST
import Control.Monad
import System.Random
import System.CPUTime

--ST Monad instead!
mgccl :: (Eq a) => [a] -> [a] -> [a]
mgccl s' t' = reverse $ build n m
  where
    a = runST $ do
          b <- newArray ((0,0),(n,m)) 0
          mapM_ (f b) $ range ((0,0),(n,m))
          unsafeFreeze b
    n = length s'
    m = length t'
    s = listArray (0,n-1) s'
    t = listArray (0,m-1) t'
    f ::STArray s (Int,Int) Int -> (Int,Int) -> ST s ()
    f b (i,j)
      | min i j == 0  = writeArray b (i,j) 0
      | otherwise     =
          if s!(i-1) == t!(j-1) then do
            x <- readArray b (i-1,j-1)
            writeArray b (i,j) (x + 1)
          else do
            x <- readArray b (i-1,j)
            y <- readArray b (i,j-1)
            writeArray b (i,j) (max x y)
    build i j
      | min i j == 0          = []
      | s!(i-1) == t!(j-1)    = (s!(i-1)):build (i-1) (j-1)
      | a!(i,j-1) > a!(i-1,j) = build i (j-1)
      | otherwise             = build (i-1) j

-- Lazy Array
cindy :: forall a. Eq a => [a] -> [a] -> [a]
cindy s t = snd $ ans ! (0, 0)
  where
    ans :: Array (Int, Int) (Int, [a])
    ans = listArray ((0,0), (length s, length t)) $ map compute mix
      where
        mix :: [(Int, Int, [a], [a])]
        mix = mixGen 0 s
          where
            innerMixGen :: Int -> [a] -> [(Int, [a])]
            innerMixGen index str =
              (index, str) :
              case str of
                _:ss      -> innerMixGen (index+1) ss
                otherwise -> []
            innerMix = innerMixGen 0 t

            mixGen :: Int -> [a] -> [(Int, Int, [a], [a])]
            mixGen index str =
              map ( \ (innerIndex, innerStr) -> (index, innerIndex, str, innerStr) ) innerMix ++
              case str of
                _:ss      -> mixGen (index+1) ss
                otherwise -> []

        compute :: (Int, Int, [a], [a]) -> (Int, [a])
        compute (_, _, [], _) = (0, [])
        compute (_, _, _, []) = (0, [])
        compute (sIndex, tIndex, s:ss, t:tt) =
          if s == t
            then
              let
                (len, after) = ans ! (sIndex+1, tIndex+1)
              in (len+1, s:after)
            else
              let
                (sLen, sAfter) = ans ! (sIndex+1, tIndex)
                (tLen, tAfter) = ans ! (sIndex, tIndex+1)
                (len, after) = if sLen > tLen
                  then (sLen, sAfter)
                  else (tLen, tAfter)
              in (len, after)

main = do
  s <- replicateM 5000 (randomRIO ('a', 'b'))
  t <- replicateM 5000 (randomRIO ('a', 'b'))
  aTime <- getCPUTime
  putStrLn $ mgccl s t
  bTime <- getCPUTime
  putStrLn $ cindy s t
  cTime <- getCPUTime
  print $ bTime - aTime
  print $ cTime - bTime