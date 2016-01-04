module Skeleton (skeleton) where

import Html exposing (..)
import Html.Attributes exposing (..)


(=>) = (,)


skeleton tabName content =
  div []
    (header tabName :: content ++ [footer])



-- HEADER


header name =
  div [ id "tabs" ]
    [ a [ href "/"
        , style
            [ "position" => "absolute"
            , "left" => "1em"
            , "top" => "1em"
            ]
        ]
        [ img [ src "/assets/logo.svg", style [ "width" => "24px" ] ] []
        ]
    ]


tab currentName name =
  li []
    [ a [ classList [ "tab" => True, "current" => (currentName == name) ]
        , href ("/" ++ name)
        ]
        [ text name ]
    ]



-- FOOTER


footer =
  div [class "footer"]
    [ text "This site is an adaptation of "
    , a [ class "grey-link", href "http://elm-lang.org" ] [ text "elm-lang.org" ]
    , text "."
    ]

