import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- Model
type alias Model =
  { name : String
  , password : String
  , passwordConfirmation : String
  }

model : Model
model =
  Model "" "" ""

-- Update
type Msg
  = Name String
  | Password String
  | PasswordConfirmation String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }
    Password password  ->
      { model | password = password }
    PasswordConfirmation password ->
      { model | passwordConfirmation = password }

-- View
view : Model -> Html Msg
view model =
  div []
  [ input [type_ "text", placeholder "Name", onInput Name ] []
  , input [type_ "password", placeholder "Password", onInput Password ] []
  , input [type_ "password", placeholder "Re enter Password", onInput PasswordConfirmation ] []
  , viewValidation model
  ]

viewValidation : Model -> Html Msg
viewValidation model =
  let
    (color, message) =
      if model.password == model.passwordConfirmation then
        ("green", "OK")
      else
        ("red", "Passwords do not match")
  in
    div [ style [("color", color)]] [ text message ]
