import List exposing (..)

{-- Evaluates to the nth member of the given list or default if there is no such element. --}
nth : Int -> List a -> a -> a
nth n list default =
  case (List.head (List.drop n list)) of
    Just a -> a
    Nothing -> default
