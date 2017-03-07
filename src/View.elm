module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Msgs exposing (Msg)
import Models exposing (..)
import Pizzas.List
import Pizzas.Record
import RemoteData
import Routing exposing (pizzasPath)

css path =
  Html.node "link" [ rel "stylesheet", href path ] []

view : Model -> Html Msg
view model =
    div [][
        css "https://cdnjs.cloudflare.com/ajax/libs/bulma/0.3.2/css/bulma.css"
        ,navbar
         , page model
    ]
        


page : Model -> Html Msg
page model =
    case model.route of
        Models.PizzasRoute ->
            Pizzas.List.view model.pizzas

        Models.PizzaRoute id ->
            pizzaRecordPage model id

        Models.NotFoundRoute ->
            Pizzas.List.view model.pizzas


pizzaRecordPage : Model -> PizzaId -> Html Msg
pizzaRecordPage model pizzaId =
    case model.pizzas of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading ..."

        RemoteData.Success pizzas ->
            let
                maybePizza =
                    pizzas
                        |> List.filter (\pizza -> pizza.id == pizzaId)
                        |> List.head
            in
                case maybePizza of
                    Just pizza ->
                        Pizzas.Record.view pizza

                    Nothing ->
                        notFoundView

        RemoteData.Failure err ->
            text (toString err)


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]


navbar : Html Msg
navbar =
  let
      path =
        pizzasPath
    in
    nav [ class "nav has-shadow" ]
    [ div [ class "nav-left" ]
        [ a [ class "nav-item", href "/" ]
            [ img [ src "/logo.png" ]
                []
            , h1 [ class "title" ]
                [ text "ORGANIC PIZZA CO." ]
            ]
        ]
    , text "        "
    , span [ class "nav-toggle", id "main-nav-toggle", attribute "onclick" "toggleMainNav()" ]
        [ span []
            []
        , span []
            []
        , span []
            []
        ]
    , text "        "
    , div [ class "nav-right nav-menu", id "main-nav" ]
        [ span [ class "nav-item" ]
            [ a [ href path ]
                [ span []
                    [ strong []
                        [ text "All Pizzas" ]
                    ]
                ]
            ]
        , span [ class "nav-item" ]
            [ a [ href "/site/eco_bundle_organicpizza/toppings-info" ]
                [ span []
                    [ strong []
                        [ text "Toppings" ]
                    ]
                ]
            ]
        ]
    ]
