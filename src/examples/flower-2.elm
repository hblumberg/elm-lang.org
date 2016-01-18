import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

main : Element
main =
  collage 500 500
    (List.map double flower)

petal : Float -> Float -> Float -> Form
petal x y deg =
  oval 100 50
    |> filled yellow
    |> rotate (degrees deg)
    |> move (x,y)

flower : List Form
flower =
  [ petal -60 0 0
  , petal 60  0 0
  , petal 0 -60 90
  , petal 0 60 90
  , petal -45 -45 45
  , petal -45 45 -45
  , petal 45 -45 -45
  , petal 45 45 45
  , circle 35
      |> filled black
      |> move (0,0)
  ]

double : Form -> Form
double f = scale 2 f
