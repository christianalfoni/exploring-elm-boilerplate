module Views.List where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Actions.Items as Items

item item =
  li [ ]
    [ text item ]

view address model =
  div [ class "List" ]
    [
      button [ onClick address (Items.Add "hoho") ] [ text "add" ],
      ul [ class "List" ]
        (List.map item model.items.list)
    ]
