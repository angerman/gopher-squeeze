module Main where

import qualified Gopher

main :: IO ()
main = do
    sound <- Gopher.squeeze
    putStrLn $ "The gopher says: " ++ sound