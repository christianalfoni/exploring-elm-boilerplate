module Items.Model where

type alias Model =
  {
    isLoading : Bool,
    list : List String
  }

model : Model
model =
  {
    isLoading = True,
    list = [ ]
  }
