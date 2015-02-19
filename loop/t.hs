f =  let rep x = x : rep x
         zs = rep 100
     in (zs, zs !! 100000)

g = let rep x = let xs = x:xs in xs
        zs = rep 100
    in (zs, zs !! 100000)

main = print $ snd f
