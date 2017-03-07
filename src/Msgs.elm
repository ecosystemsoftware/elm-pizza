module Msgs exposing (..)

import Models exposing (Pizza)
import RemoteData exposing (WebData)
import Navigation exposing (Location)


type Msg
    = OnFetchPizzas (WebData (List Pizza))
    | OnLocationChange Location