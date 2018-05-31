module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { email : String
    , message : String
    , submitting : Bool
    }


type Msg
    = InputEmail String
    | InputMessage String
    | SubmitForm


initialModel : Model
initialModel =
    { email = ""
    , message = ""
    , submitting = False
    }


main =
    program
        { init = ( initialModel, Cmd.none )
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        InputEmail e ->
            ( { model | email = e }, Cmd.none )

        InputMessage m ->
            ( { model | message = m }, Cmd.none )

        SubmitForm ->
            ( { model | submitting = True }, Cmd.none )


view : Model -> Html Msg
view model =
    Html.form
        [ onSubmit SubmitForm ]
        [ header
        , body model
        , footer
        , text <| toString <| model
        ]


header =
    div []
        [ h1 [] [ text "Contact Us" ] ]


body model =
    div []
        [ div []
            [ input
                [ placeholder "your email"
                , type_ "email"
                , onInput InputEmail
                , value model.email
                ]
                []
            ]
        , div []
            [ textarea
                [ placeholder "your message"
                , rows 7
                , onInput InputMessage
                , value model.message
                ]
                []
            ]
        ]


footer =
    div []
        [ button
            []
            [ text "Submit" ]
        ]
