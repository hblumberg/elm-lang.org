import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

main : Element
main = show (quadrant (-10, 10))

quadrant : (Int, Int) -> String
quadrant (x,y) = "none"
