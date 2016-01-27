import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

main : Element
main = drawPoints (10, 10) (100, 100)

drawPoints : (Float,Float) -> (Float,Float) -> Element
drawPoints (x1,y1) (x2,y2) =
  collage 500 500 []
