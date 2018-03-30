module Gini where

import Prelude
import Data.Array (sort, length, foldl, last, snoc)
import Data.Int (toNumber)
import Data.Pair ((~), snd, fst)
import Data.Maybe (Maybe(..))

gini :: Array Int -> Number
gini [] = 0.0
gini [x] = 0.0
gini xs = 1.0 - (maxAreaRes / distributionAreaRes)
    where
        distributionAreaRes = toNumber distributionArea
        maxAreaRes = toNumber (fst maxArea)
        maxArea = foldl areaProportions zeroPair accumulated
        distributionArea = (length xs) * (foldl (+) 0 xs)
        sorted = sort xs
        accumulated = foldl accumulator [] sorted
        areaProportions acc a = (a + (fst acc) + (snd acc) ~ a)
        accumulator acc a = case (last acc) of 
            Just l -> (acc `snoc` (l + a))
            Nothing -> acc `snoc` a
        zeroPair = 0 ~ 0