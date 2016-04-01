import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

main : Element
main =
  collage 400 400 (List.map checkerBoard [0..63])

checkerBoard : Int -> Form
checkerBoard n =
  let row = n // 8 in
  let column = n % 8 in
  let c =
    if (row + column) % 2 == 0
      then black
    else red in
  square 50
    |> filled c
    |> move (-175 + (toFloat column) * 50, -175 + (toFloat row) * 50)
