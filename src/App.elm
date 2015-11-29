module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import StartApp.Simple as StartApp

import Views.Title as Title
import Views.List as List
import Model.Items
import Actions.Items

-- UPDATE
update update data =
  {data | model = update data.action data.model}

updates updaters =
  \action model ->
    .model (List.foldr (update) {action = action, model = model} updaters)

-- VIEW
view address model =
  div [ class "App" ]
    [
      Title.view,
      List.view address model
    ]

-- MAIN
main =
  StartApp.start
    {
      model = {items = Model.Items.model},
      view = view,
      update = updates [Actions.Items.update]
    }
