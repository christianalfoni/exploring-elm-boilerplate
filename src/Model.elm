module Model where

import Items.Model as ItemsModel

type alias Model =
  {
    items : ItemsModel.Model
  }

model : Model
model =
  {
    items = ItemsModel.model
  }
