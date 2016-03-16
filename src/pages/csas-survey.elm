import Html exposing (..)
import Html.Attributes exposing (..)

main =
  node "script" 
    [ attribute "type" "text/javascript"]
    [ text "window.location.href = 'http://goo.gl/forms/ZJbvRX0dG2'" ]
