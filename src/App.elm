module Bingo where

import Html exposing (..)
import Html.Attributes exposing (..)
import Task
import Effects exposing (..)
import StartApp

import Items.Views.Title as Title
import Items.Views.List as List
import Items.Actions as ItemsActions
import Model exposing(model)

-- VIEW
view address model =
  div [ class "App" ]
    [
      Title.view,
      List.view address model
    ]

-- INIT
app =
  StartApp.start {
    init = (model, ItemsActions.getItems),
    view = view,
    update = updates [
      ItemsActions.update
    ],
    inputs = [ ]
  }

main =
  app.html

-- WIRING
update action update (oldModel, accumulatedEffects) =
  let
      (newModel, additionalEffects) = update action oldModel
  in
      (newModel, Effects.batch [accumulatedEffects, additionalEffects])

updates updaters =
  \action model ->
    List.foldr (update action) (model, Effects.none) updaters

port tasks : Signal (Task.Task Effects.Never ())
port tasks =
  app.tasks
