import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

main : Element
main =
  collage 400 400 {--TODO--} []

checkerBoard : Int -> Form
checkerBoard n =
  let row = {--TODO--} 0 in
  let column = {--TODO--} 0 in
  let c = {--TODO--} red in
  square 50
    |> filled c
    |> move (-175 + (toFloat column) * 50, -175 + (toFloat row) * 50)
