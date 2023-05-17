main = putStrLn (getHtmlString myHtml)

newtype Html = Html String

newtype Structure = Structure String

type Title = String

type Content = Structure

myHtml :: Html
myHtml =
  makeHtml
    "Hello, World"
    (append_ (p1_ "Hello, World") (h1_ "Hello, World"))

head_ :: String -> Structure
head_ = el "head"

title_ :: String -> Structure
title_ = el "title"

html_ :: String -> Structure
html_ = el "html"

body_ :: String -> Structure
body_ = el "body"

p1_ :: String -> Structure
p1_ = el "p1"

h1_ :: String -> Structure
h1_ = el "h1"

el :: String -> String -> Structure
el tag content =
  Structure ("<" <> tag <> ">" <> content <> "</" <> tag <> ">")

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure (a <> b)

render :: Html -> String
render html =
  case html of
    Html str -> str

getStructureString :: Structure -> String
getStructureString struct =
  case struct of
    Structure str -> str

getHtmlString :: Html -> String
getHtmlString struct =
  case struct of
    Html str -> str

makeHtml :: Title -> Content -> Html
makeHtml title content =
  Html
    ( getStructureString
        ( html_
            ( getStructureString
                ( head_
                    ( getStructureString
                        (title_ title)
                        <> getStructureString
                          ( body_ (getStructureString content)
                          )
                    )
                )
            )
        )
    )
