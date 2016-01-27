import Graphics.Element exposing (..)
import Mouse exposing (..)

main : Signal Element
main =
  Signal.map show (Signal.foldp incrementTotal 0 Mouse.isDown)

incrementTotal : Bool -> Int -> Int
incrementTotal isClicked total =
  if isClicked then total + 1 else total
