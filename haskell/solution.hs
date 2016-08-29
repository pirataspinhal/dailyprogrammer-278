weave :: [a] -> [a] -> [a]
weave [] b = b
weave a [] = a
weave a b = weave' (cycle a) b

weave' :: [a] -> [a] -> [a]
weave' _ b@(x:[]) = b
weave' a@(x:xs) b@(y:ys) = y:x: weave' xs ys

bracket :: [a] -> [a] -> [[a]]
bracket a b
  | (length a) >= (length b) `quot` 2 = bracket' a (cycle b)
  | (length a) < (length b) `quot` 2 = bracket' (cycle a) b

bracket' :: [a] -> [a] -> [[a]]
bracket' [] _ = []
bracket' _ [] = []
bracket' (x:xs) (n:m:ys) = [n:x:m:[]] ++ bracket' xs ys
