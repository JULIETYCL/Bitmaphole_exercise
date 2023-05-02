import Data.Array

type Position = (Int, Int)

bitmapHoles :: [String] -> Int
bitmapHoles strArr =
    let numArray = listArray ((0, 0), (length strArr - 1, length (head strArr) - 1)) (concat strArr)
    in findZero numArray []

findZero :: Array Position Char -> [Position] -> Int
findZero numArray visited
    | null unvisitedPositions = 0
    | otherwise = 1 + findZero (markPositionsAsVisited numArray visitedNeighbours) (visited ++ visitedNeighbours)
    where
        unvisitedPositions = filter (\pos -> numArray ! pos == '0' && pos `notElem` visited) [(i, j) | i <- [0 .. fst (snd (bounds numArray))], j <- [0 .. snd (snd (bounds numArray))]]
        p = head unvisitedPositions
        visitedNeighbours = p : neighbours numArray p visited

neighbours :: Array Position Char -> Position -> [Position] -> [Position]
neighbours numArray (i, j) visited = go [(i+1, j), (i-1, j), (i, j+1), (i, j-1)] visited []
    where
        go [] _ acc = acc
        go (p:ps) visitedPositions acc
            | not (inRange (bounds numArray) p) = go ps visitedPositions acc
            | p `elem` visitedPositions = go ps visitedPositions acc
            | numArray ! p == '0' = go (ps ++ neighbours numArray p (visitedPositions ++ [p])) (visitedPositions ++ [p]) (p:acc)
            | otherwise = go ps visitedPositions acc

markPositionsAsVisited :: Array Position Char -> [Position] -> Array Position Char
markPositionsAsVisited numArray positions = numArray // [(pos, '1') | pos <- positions]

main :: IO ()
main = do
    let input = ["01001", "00001", "11010", "11011"]
    let result = bitmapHoles input
    print result





