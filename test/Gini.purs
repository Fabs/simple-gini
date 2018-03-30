module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Test.Spec (it)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (RunnerEffects, run)
import Test.Spec.Assertions (shouldEqual)
import Data.Maybe (Maybe(..))
import Gini (gini)

main :: Eff (RunnerEffects ()) Unit
main = run [consoleReporter] do
  it "empty list" $ (gini []) `shouldEqual` 0.0
  it "single element" $ (gini [1]) `shouldEqual` 0.0
  it "fair distribution" $ (gini [3,3]) `shouldEqual` 0.0
  it "unfair distribution" $ (gini [1,5]) `shouldEqual` 0.33333333333333337
  it "very unfair distribution" $ (gini [0,0,5,40]) `shouldEqual` 0.6944444444444444
  it "somewhat fair distribution" $ (gini [2,2,2,3,3]) `shouldEqual` 0.09999999999999998