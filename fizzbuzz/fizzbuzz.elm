module FizzBuzz exposing (parse, toString)


import Html exposing (Html, text)
import List exposing (foldl, map)
import String exposing (join)


type FizzBuzz
  = FizzBuzz
  | Fizz
  | Buzz
  | Just Int


parse : Int -> FizzBuzz

parse x =
  case (x % 3, x % 5) of
    (0, 0) ->
      FizzBuzz

    (0, _) ->
      Fizz

    (_, 0) ->
      Buzz

    _ ->
      Just x


toString : FizzBuzz -> String

toString fizzBuzz =
  case fizzBuzz of
    Fizz ->
      "Fizz"

    Buzz ->
      "Buzz"

    FizzBuzz ->
      "FizzBuzz"

    Just x ->
      Basics.toString x


main : Html msg

main =
  text <| join ", " <| map (toString << parse) <| [1..100]
