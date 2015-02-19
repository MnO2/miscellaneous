loop f b = let (c, d) = f (b, d) in c

f (b, d) = (drop (d-2) b, length b)

foo b = loop f b

main = print $ foo "Hello World!"
