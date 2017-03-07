module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import Models exposing (PizzaId, Pizza)
import RemoteData
import Jwt

fetchPizzas : Cmd Msg
fetchPizzas =
    Jwt.get "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2OTJlOGE2NC03Njc2LTQ3OTAtYjNmOC1hODZhNTA4M2Q1YmIifQ.AIy1o46BVCE3d7c41Chr1ulk6D1v8_jWpJNOw5QS_68" "http://localhost:3000/api/eco_bundle_organicpizza/pizzas_info" pizzasDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchPizzas


pizzasDecoder : Decode.Decoder (List Pizza)
pizzasDecoder =
    Decode.list pizzaDecoder


pizzaDecoder : Decode.Decoder Pizza
pizzaDecoder =
    decode Pizza
        |> required "id" Decode.string
        |> required "name" Decode.string
        |> required "description" Decode.string
        |> required "image" Decode.string
        |> required "slug" Decode.string
        |> required "keywords" (Decode.list Decode.string)
        |> required "totalfat" Decode.int
        |> required "totalcarbs" Decode.int
        |> required "totalprotien" Decode.int
        |> required "totalcost" Decode.float
        |> required "price" Decode.float
