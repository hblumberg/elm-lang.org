import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

main : Element
main = show (quadrant (-10, 10))

quadrant : (Int, Int) -> String
quadrant (x,y) =
  if x == 0 || y == 0
    then "none" 
  else if x > 0 && y > 0
    then "quadrant I"
  else if x < 0 && y > 0
    then "quadrant II"
  else if x < 0 && y < 0
    then "quadrant III"
  else "quadrant IV"
