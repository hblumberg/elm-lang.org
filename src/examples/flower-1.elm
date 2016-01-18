import Color exposing (..)
import Graphics.Collage exposing (..)

main =
  collage 500 500
    flower

petal x y deg =
  oval 100 50
    |> filled yellow
    |> rotate (degrees deg)
    |> move (x,y)

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
