module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, src, style)


(=>) : a -> b -> ( a, b )
(=>) =
    (,)



---- Generic UI


sharedButtonStyles =
    [ "border-radius" => "3px"
    , "height" => "26px"
    , "padding" => "0 8px"
    , "text-transform" => "uppercase"
    , "margin" => "0 4px"
    , "cursor" => "pointer"
    ]


nriButton : List ( String, String ) -> String -> Html msg
nriButton styles t =
    button [ style (sharedButtonStyles ++ styles) ] [ text t ]



----


topBar : Html msg
topBar =
    let
        styles =
            [ "height" => "4px"
            , "width" => "100vw"
            , "position" => "absolute"
            , "top" => "0"
            , "left" => "0"
            , "background-image" => ("url(" ++ "https://s3-us-west-2.amazonaws.com/css-interview/top-bar.png" ++ ")")
            ]
    in
        div [ style styles ] []


logo : Html msg
logo =
    let
        styles =
            [ "margin-right" => "36px" ]
    in
        img
            [ style styles
            , src "https://s3-us-west-2.amazonaws.com/css-interview/logo.png"
            ]
            []


linkTitles =
    [ "Home"
    , "About"
    , "Jobs"
    , "FAQ"
    , "Contact"
    , "For teachers"
    ]


renderLink : String -> Html msg
renderLink linkTitle =
    let
        styles =
            [ "text-transform" => "uppercase"
            , "font-size" => "12px"
            , "margin" => "0 12px"
            ]
    in
        a [ style styles, href "" ] [ text linkTitle ]


links : Html msg
links =
    Html.nav [] (List.map renderLink linkTitles)


signUpButton : Html msg
signUpButton =
    let
        styles =
            [ "color" => "white"
            , "background-color" => "lightblue"
            , "border" => "0"
            ]
    in
        nriButton styles "Sign Up"


logInButton : Html msg
logInButton =
    let
        styles =
            [ "border" => "1px solid lightblue"
            , "color" => "lightblue"
            , "margin-right" => "0"
            ]
    in
        nriButton styles "Log in"


actionButtons =
    div []
        [ signUpButton
        , logInButton
        ]


header : Html msg
header =
    let
        styles =
            [ "display" => "flex"
            , "align-items" => "center"
            , "justify-content" => "space-between"
            , "margin-top" => "12px"
            ]
    in
        Html.header [ style styles ]
            [ logo
            , div [ style styles ]
                [ links
                , actionButtons
                ]
            ]



---- Body


bulletTitles : List String
bulletTitles =
    [ "Instantly differentiate using our adaptive platform"
    , "Track progress toward mastery of Common Core and state standards"
    , "Provide students with unlimited help whenever they need it"
    ]


bullet : String -> Html msg
bullet bulletText =
    let
        styles =
            [ "margin-bottom" => "12px" ]
    in
        li [ style styles ]
            [ text bulletText ]


signUpForFreeButton : Html msg
signUpForFreeButton =
    let
        styles =
            [ "height" => "45px"
            , "background" => "lightblue"
            , "border" => "0"
            , "color" => "white"
            , "font-size" => "14px"
            , "width" => "200px"
            , "margin" => "0"
            ]
    in
        nriButton styles "Sign up for Free"


bulletList =
    ul
        [ style
            [ "list-style" => "none"
            , "list-style-image" => "url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/4621/treehouse-marker.png)"
            ]
        ]
        (List.map bullet bulletTitles)


bodyContent =
    let
        styles =
            [ "width" => "580px"
            , "display" => "flex"
            , "flex-direction" => "column"
            , "text-align" => "left"
            ]
    in
        div [ style styles ]
            [ h1 [ style [ "margin-bottom" => "12px", "font-size" => "36px", "z-index" => "2" ] ]
                [ text "Help you students improve their grammar writing skills" ]
            , bulletList
            , signUpForFreeButton
            , p
                [ style
                    [ "font-size" => "12px"
                    , "margin" => "8px 0 0"
                    ]
                ]
                [ text "Are you a school/district leader?"
                , a [ style [ "padding-left" => "4px" ], href "" ]
                    [ text "Learn more about NoRedInk Premium!" ]
                ]
            ]


ladyImg =
    let
        styles =
            [ "position" => "absolute"
            , "bottom" => "0"
            , "right" => "-26px"
            , "width" => "280px"
            ]
    in
        img
            [ style styles
            , src "https://s3-us-west-2.amazonaws.com/css-interview/lady.jpg"
            ]
            []


body =
    let
        styles =
            [ "align-items" => "center"
            , "border-bottom" => "1px solid lightgray"
            , "position" => "relative"
            , "height" => "400px"
            ]
    in
        div [ style styles ]
            [ bodyContent
            , ladyImg
            ]



----- Footer


footerLinks =
    [ "Product"
    , "Bloopers"
    , "Jobs"
    , "Privacy"
    , "Terms of Service"
    , "FAQ"
    , "Contact"
    ]


footerLink : String -> Html msg
footerLink t =
    let
        styles =
            [ "text-underline" => "none"
            , "color" => "lightblue"
            ]
    in
        a
            [ style styles
            , href ""
            ]
            [ text t ]


footer =
    Html.footer []
        [ Html.nav
            [ style
                [ "display" => "flex"
                , "justify-content" => "space-between"
                , "padding" => "0 60px"
                , "margin-top" => "24px"
                ]
            ]
            (List.map footerLink footerLinks)
        , div [] [ p [] [ text "Copyright 2017 © NoRedInk Corp." ] ]
        ]


video =
    div [ style [ "height" => "40px", "width" => "40px", "background" => "blue" ] ] []


middleImage =
    div [ style [ "height" => "40px", "width" => "40px", "background" => "purple" ] ] []


middleSection =
    Html.section
        [ style
            [ "border-bottom" => "1px solid lightgray"
            , "display" => "flex"
            , "justify-content" => "space-between"
            , "padding" => "20px 16px"
            ]
        ]
        (video :: (List.repeat 5 middleImage))


main : Html msg
main =
    let
        styles =
            [ "max-width" => "760px"
            , "margin" => "0 auto"
            ]
    in
        Html.main_ [ style styles ]
            [ topBar
            , header
            , body
            , middleSection
            , footer
            ]
