import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse exposing (..)
import Signal exposing (..)
import Time exposing (..)

type alias Filter =
  { r : Int
  , g : Int
  , b : Int
  , a : Float
  }

filter : Filter
filter =
  { r = 0
  , g = 0
  , b = 0
  , a = 0.5
  }

w = 500
picW = 300
picH = 200
sliderL = w-100
circR = 15

main = Signal.map draw (Signal.foldp updateFilter filter inputSignal)

inputSignal : Signal (Bool,(Int,Int))
inputSignal =
  Signal.sampleOn (Time.fps 120) (Signal.map2 (,) Mouse.isDown Mouse.position)

draw : Filter -> Element
draw filter =
  collage w w
    [ image picW picH "http://learn-elm.com/assets/puppy.jpg"
        |> toForm
        |> move (0,picH/2)
    , rect picW picH
        |> filled (rgba filter.r filter.g filter.b filter.a)
        |> move (0,picH/2)
    , drawSlider (toFloat filter.r) red
    , drawSlider (toFloat filter.g) green
    , drawSlider (toFloat filter.b) blue
    , drawSlider filter.a gray
    ]

drawSlider : Float -> Color -> Form
drawSlider i color =
  let x = indexToSlider i color in
  let y = colorToY color in group
  [ rect (w-100) 2
      |> filled black
      |> move (0,y)
  , circle circR
      |> filled color
      |> move (x,y)
  ]

updateFilter : (Bool,(Int,Int)) -> Filter -> Filter
updateFilter (isDown,(a,b)) filter =
  let (x,y) = (toFloat a - w/2, w/2 - toFloat b) in
  if not isDown then filter else
    if inCirc x y red (toFloat filter.r)
      then { filter | r = round (sliderToIndex x red) }
    else if inCirc x y green (toFloat filter.g)
      then { filter | g = round (sliderToIndex x green) }
    else if inCirc x y blue (toFloat filter.b)
      then { filter | b = round (sliderToIndex x blue) }
    else if inCirc x y gray filter.a
      then { filter | a = (sliderToIndex x gray) }
    else filter

sliderToIndex : Float -> Color -> Float
sliderToIndex x color =
  let index = 
    if color == gray then (x + sliderL/2)/sliderL
    else (x + sliderL/2)*255/sliderL in
  if index < 0 then 0
  else if index > 255 then 255
  else index

indexToSlider : Float -> Color -> Float
indexToSlider i color =
  if color == gray then i*sliderL - sliderL/2 else i/255*sliderL - sliderL/2

colorToY : Color -> Float
colorToY color =
  if color == red then -picH/4
  else if color == green then -picH/2
  else if color == blue then -3*picH/4
  else -picH

inCirc : Float -> Float -> Color -> Float -> Bool
inCirc x y color i =
  abs (x - indexToSlider i color) < circR && abs (y - colorToY color) < circR
