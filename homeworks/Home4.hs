import Data.List
import Data.Maybe

int_min = minBound :: Int
int_max = maxBound :: Int

-- | Нахождение максимум и его индекс 
-- >>> myMaxIndex [1,5,2,3,4]
-- (1,5)
myMaxIndex :: [Integer] -> (Int, Integer)
myMaxIndex (x:xs) = (fromJust (elemIndex maxVal (x:xs)), maxVal)
    where maxVal = (foldl max x xs)


myMinIndex :: [Integer] -> (Int, Integer)
myMinIndex (x:xs) = (fromJust (elemIndex minVal (x:xs)), minVal)
    where minVal = (foldl min x xs)


----Old one
--myMaxIndex :: [Int] -> (Int, Int)
--myMaxIndex [] = (0, 0)
--myMaxIndex (x:xs) = getMax' (x:xs) 0 0 0
--    where getMax' [] maxVal maxInd _ = (maxInd, maxVal)
--          getMax' (x:xs) maxVal maxInd currInd | x > maxVal = getMax' xs x (currInd) (currInd+1)
                                               | otherwise  = getMax' xs maxVal (maxInd) (currInd+1)


-- WTF? Commit some functions with another name...
getMax :: [Int] -> (Int, Int)
getMax [] = (0, 0)
getMax (x:xs) = getMax' (x:xs) 0 0 0
    where getMax' [] maxVal maxInd _ = (maxInd, maxVal)
          getMax' (x:xs) maxVal maxInd currInd | x > maxVal = getMax' xs x (currInd) (currInd+1)
                                               | otherwise  = getMax' xs maxVal (maxInd) (currInd+1)

-- | Количество элементов, равных максимальному
-- >>> maxCount [1,5,3,10,3,10,5]
-- 2
maxCount :: [Integer] -> Int
maxCount list = maxCount' list 0 0
    where maxCount' [] _ cnt = cnt
          maxCount' (head:tail) max cnt | head > max = maxCount' tail head 1
                                        | head < max = maxCount' tail max  cnt
                                        | otherwise  = maxCount' tail max  (cnt+1)

-- Вариант с foldl
maxCount' :: [Int] -> Int
maxCount' list = foldl (\ x y -> if (y == maxVal) then (x+1) else x) 0 (filter (\x -> x == maxVal) list)
    where maxVal = foldl max int_min list


-- | Количество элементов между минимальным и максимальным
-- >>> countBetween [-1,3,100,3]
-- 2
--
-- >>> countBetween [100,3,-1,3]
-- -2
--
-- >>> countBetween [-1,100]
-- 1
--
-- >>> countBetween [1]
-- 0


countBetween :: [Integer] -> Int
countBetween list = (fst $ myMaxIndex list) - (fst $ myMaxIndex list)


----Old one
-- countBetween :: [Int] -> Int
-- countBetween list = if (maxInd > minInd)
--                     then length (drop (fromJust minInd) (take (fromJust maxInd) list))
--                     else length (drop (fromJust maxInd) (take (fromJust minInd) list)) * (-1)
--     where maxInd = elemIndex (foldl max int_min list) list
--           minInd = elemIndex (foldl min int_max list) list
           
