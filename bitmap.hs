import Data.Array

type Position = (Int, Int)

bitmapHoles :: [String] -> Int
bitmapHoles strArr =
    let numArray = listArray((0,0),(length strArr-1, length (head strArr)-1)) (concat strArr)
    in findZero numArray []

-- | The 'findZero' function takes an array and a list of visited positions,
-- and returns the number of holes in the bitmap.
findZero :: Array Position Char ->[Position] ->Int
findZero numArray visited = go 0 [ (i, j) | i <- [0 .. fst (snd (bounds numArray))], j <- [0 .. snd (snd (bounds numArray))]]
    where
    go count [] = count
    go count (p:ps) =
      if numArray ! p == '0' && p `notElem` visited
        then go (count + 1) (ps ++ neighbours numArray p (visited ++ [p]))
        else go count ps

-- | The 'neighbours' function takes an array, a position, and a list of visited positions,
-- and returns a list of new positions that are part of the same hole.
neighbours :: Array Position Char -> Position -> [Position] -> [Position]
neighbours numArray (i, j) visited =
  let validPositions = filter (inRange (bounds numArray)) [(i+1, j), (i-1, j), (i, j+1), (i, j-1)]
      newVisited = filter (\pos -> numArray ! pos == '0' && pos `notElem` visited) validPositions
  in foldr (\pos acc -> neighbours numArray pos (visited ++ newVisited) ++ acc) newVisited newVisited

-- | The 'main' function is the entry point of the program. It calls the 'bitmapHoles'
-- function with the example input and prints the result.
main :: IO ()
main = print $ bitmapHoles ["01001", "00001", "11010", "11011"]