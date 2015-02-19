import Control.Monad
import Data.List
import Data.Ord
import System.Random
import System.CPUTime

type Cell a = (Integer,[a])
type Row a = [Cell a]

lcs :: Eq a => [a] -> [a] -> [a]
lcs [] _  = []
lcs _  [] = []
lcs s1 s2 = reverse $ snd $ last $
            foldl
              (lcs' cell0 cell0)
              (repeat cell0)
              (map (`matchings` s1) s2)

cell0 :: Cell a
cell0 = (0,[])

matching :: Eq a => a -> a -> Maybe a
matching c1 c2 = guard (c1==c2) >> return c1

matchings :: Eq a => a -> [a] -> [Maybe a]
matchings c = map (matching c)

prepend :: a -> Cell a -> Cell a
prepend c (n,str) = (n+1,c:str)

maximumByFst :: [Cell a] -> Cell a
maximumByFst = maximumBy (comparing fst)

lcs' :: Eq a => Cell a -> Cell a -> Row a -> [Maybe a] -> Row a
lcs' left diag _        []           = []
lcs' left diag (up:ups) (Just c:ms)  = let current = prepend c diag
                                       in current : lcs' current up ups ms
lcs' left diag (up:ups) (Nothing:ms) = let current = maximumByFst [up,left]
                                       in current : lcs' current up ups ms

main = do
  s <- replicateM 5000 (randomRIO ('a', 'b'))
  t <- replicateM 5000 (randomRIO ('a', 'b'))
  aTime <- getCPUTime
  putStrLn $ lcs s t
  bTime <- getCPUTime
  print $ bTime - aTime
