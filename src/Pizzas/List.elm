module Pizzas.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (Msg)
import Models exposing (Pizza)
import RemoteData exposing (WebData)
import Routing exposing (pizzaPath)
import Utilities exposing (..)



view : WebData (List Pizza) -> Html Msg
view response =
    div []
        [ 
            maybeList response
        ]


list : List Pizza -> Html Msg
list pizzas =
    section [ class "section" ][
        div [ class "container" ][
            div [ class "columns is-multiline" ] (List.map pizzaRow pizzas)
        ]
    ]
   
pizzaRow : Pizza -> Html Msg
pizzaRow pizza =
    let
      path =
        pizzaPath pizza.id
    in
    div [ class "column is-one-quarter" ]
    [ a [ href path ]
        [ img [ src ("http://localhost:3000/images/eco_bundle_organicpizza/" ++ pizza.image ++ "?width=400") ]
            []
        ]
    , h1 [ class "title is-4" ]
        [ a [ href path ]
            [ text pizza.name ]
        ]
    , h2 [ class "subtitle" ]
        [ text (pizza.price 
            |> formatCurrency
        )

        ]
    ]

maybeList : WebData (List Pizza) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success pizzas ->
            list pizzas

        RemoteData.Failure error ->
            text (toString error)