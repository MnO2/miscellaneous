#!/bin/bash

# number each line of files
ghc -e 'print . (zip [1..]) . lines =<< getContents'

# remove newlines
ghc -e 'print . (filter (/= '\n'))  =<< getContents'

# count lines
ghc -e 'print . length . lines =<< getContents'

# print specific line
ghc -e 'print . (filter (\x -> (fst x) == 1)) . (zip [1..]) . lines =<< getContents'

# remove prefix spaces
ghc -e 'print . (map (\s -> subRegex (mkRegex "^[[:space:]]+") s "")) . lines =<< getContents'

# show interface content
ghc --show-iface M.hi 

# only type-check
ghc -fno-code file.hs 
