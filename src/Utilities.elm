module Utilities exposing (..)
import Round exposing (..)

formatCurrency: Float -> String
formatCurrency amount =
     Round.round 2 amount
     |> String.append "£"
