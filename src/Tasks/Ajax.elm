module Tasks.Ajax where

import Effects exposing (..)
import Http
import Task

get url decoder action =
  Http.get decoder url
    |> Task.toMaybe
    |> Task.map action
    |> Effects.task
