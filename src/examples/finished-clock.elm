import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

main =
  collage 500 500
    [ image 400 400 "http://bit.ly/elm_clock"
        |> toForm
        |> move (0,0)
    , hands 12 15
    ]

hands hour minute = group
  [ segment (0,0) (hourHandEnd hour)
      |> traced (solid black)
  , segment (0,0) (minuteHandEnd minute)
      |> traced (solid red)
  ]

hourHandEnd hour =
  let angle = hour * 30 in
  let x = 100 * sin (degrees angle) in
  let y = 100 * cos (degrees angle) in
  (x,y)

minuteHandEnd minute =
  let angle = minute * 6 in
  let x = 140 * sin (degrees angle) in
  let y = 140 * cos (degrees angle) in
  (x,y)
