weave :: [a] -> [a] -> [a]
weave [] b = b
weave a b = weave' (cycle a) b

weave' :: [a] -> [a] -> [a]
weave' _ b@(x:[]) = b
weave' a@(x:xs) b@(y:ys) = y:x: weave' xs ys

bracket :: [a] -> [a] -> [[a]]
bracket a b
        | (length a) >= (length b) `quot` 2 = bracketR a (cycle b)
        | (length a) < (length b) `quot` 2 = bracketL (cycle a) b

bracketR :: [a] -> [a] -> [[a]]
bracketR [] _ = []
bracketR (x:xs) (n:m:ys) =
        [n:x:m:[]] ++ bracketR xs ys

bracketL :: [a] -> [a] -> [[a]]
bracketL _ [] = []
bracketL (x:xs) (n:m:ys) =
        [n:x:m:[]] ++ bracketL xs ys
