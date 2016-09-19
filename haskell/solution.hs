-- weave insert first into second.
--
--       i: [11,12], [0,1,2,3]
--       o: [0,11,1,12,2,11,3]
--
weave :: [a] -> [a] -> [a]
weave [] b = b
weave a [] = a
weave a b  = init $ concat $ zipWith (\x y -> [y, x]) (cycle a) b

-- bracket insert first into second.
-- b with even length is obligatory.
--
--       i: "abc", "()"
--       o: ["(a)","(b)","(c)"]
--
--       i: "+-", "234567"
--       o: ["2+3", "4-5", "6+7"]
--
bracket :: [a] -> [a] -> [a]
bracket [] _ = []
bracket _ [] = []
bracket a b  = if length a >= length b `div` 2
                  then concat $ zipWith (\x (ya, yb) -> [ya, x, yb]) a $ cycle (zipPairs b)
                  else concat $ zipWith (\x (ya, yb) -> [ya, x, yb]) (cycle a) $ zipPairs b

zipPairs :: [a] -> [(a, a)]
zipPairs (xa:xb:[]) = (xa, xb):[]
zipPairs (xa:xb:xs) = (xa, xb):(zipPairs xs)
