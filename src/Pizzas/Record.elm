module Pizzas.Record exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (Msg)
import Models exposing (Pizza)
import Utilities exposing (..)


view : Pizza -> Html Msg
view pizza =
    div []
        [  record pizza
        ]


record : Pizza -> Html Msg
record pizza =
   section [ class "section" ]
    [ div [ class "container" ]
        [ div [ class "heading" ]
            [ h1 [ class "title" ]
                [ text "Pizza "
                , strong []
                    [ text pizza.name ]
                ]
            ]
        , div [ class "columns" ]
            [ div [ class "column is-two-thirds" ]
                [ img [ src ("http://localhost:3000/images/eco_bundle_organicpizza/" ++ pizza.image ++ "?width=1200") ]
                    []
                , text "            "
                ]
            , div [ class "column" ]
                [ p [ class "title is-3" ]
                    [ text (pizza.price 
            |> formatCurrency
        ) ]
                , button [ class "button is-primary", attribute "onClick" "" ]
                    [ text "Add to Order" ]
                , hr []
                    []
                , h3 [ class "title" ]
                    [ text "Toppings on this pizza" ]
                , p []
                    [ text "Click on topping for description and nutritional details" ]
                , div [ id "toppings" ]
                    []
                , hr []
                    []
                , h2 [ class "title is-4" ]
                    [ text "Nutritional Information" ]
                , table [ class "table" ]
                    [ tr []
                        [ th []
                            [ text "Fat" ]
                        , td []
                            [ text (pizza.totalfat |> toString) ]
                        ]
                    , tr []
                        [ th []
                            [ text "Carbohydrates" ]
                        , td []
                            [ text (pizza.totalcarbs |> toString) ]
                        ]
                    , tr []
                        [ th []
                            [ text "Protien" ]
                        , td []
                            [ text (pizza.totalprotien |> toString) ]
                        ]
                    ]
                ]
            ]
        , h3 [ class "title is-4" ]
            [ text "Chef Mario says..." ]
        , p [ class "subtitle" ]
            [ text pizza.description ]
        ]
    ]

