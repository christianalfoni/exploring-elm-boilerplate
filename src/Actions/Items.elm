module Actions.Items where


type Action =
    NoOp
    | Add String

update action model =
  case action of
    Add text ->
      let
        items = model.items
        changedItems = { items | list = List.append items.list [ text ] }
      in
        { model | items = changedItems }

    NoOp ->
      model
