module Models exposing (..)


import RemoteData exposing (WebData)


type Route
    = PizzasRoute
    | PizzaRoute PizzaId
    | NotFoundRoute


type alias Model =
    { pizzas : WebData (List Pizza)
    , route: Route
    }


initialModel : Route -> Model
initialModel route =
    { pizzas = RemoteData.Loading
    , route = route
    }



type alias PizzaId =
    String


type alias Pizza =
    { id : PizzaId
    , name : String
    , description : String
    , image : String
    , slug : String
    , keywords: List String
    , totalfat: Int
    , totalcarbs: Int
    , totalprotien: Int
    , totalcost: Float
    , price: Float
    }
    