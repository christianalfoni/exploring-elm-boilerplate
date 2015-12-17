module Items.Actions where

import Effects exposing (..)
import Model
import Tasks.Ajax as Ajax
import Json.Decode as Json

type Action =
    NoOp
    | Add String
    | Loaded (Maybe (List String))

update : Action -> Model.Model -> (Model.Model, Effects Action)
update action model =
  case action of
    Loaded maybeItems ->
      let
        items = model.items
        newItems = { items | list = (Maybe.withDefault items.list maybeItems), isLoading = False }
      in
        ({ model | items = newItems }, Effects.none)

    Add text ->
      let
        items = model.items
        changedItems = { items | list = List.append items.list [ text ] }
      in
        ({ model | items = changedItems }, Effects.none)

    NoOp ->
      (model, Effects.none)

getItems =
  Ajax.get "/api/items" (Json.list Json.string) Loaded
