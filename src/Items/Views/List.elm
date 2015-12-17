module Items.Views.List where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Items.Actions as Actions

item item =
  li [ ]
    [ text item ]

view address model =
  div [ class "List" ]
    [
      button [ onClick address (Actions.Add "hoho"), disabled model.items.isLoading ] [ text "add item" ],
      ul [ class "List" ]
        (List.map item model.items.list)
    ]
