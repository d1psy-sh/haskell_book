main = putStrLn myHtml

newtype Html = Html String

newtype Structure = Structure String

myHtml :: String
myHtml =
  makeHtml
    "Hello, World"
    (h1_ "Hello, World" <> p1_ "This is my first Haskell program")

head_ :: String -> String
head_ = el "head"

title_ :: String -> String
title_ = el "title"

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

p1_ :: String -> String
p1_ = el "p1"

h1_ :: String -> String
h1_ = el "h1"

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

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

makeHtml :: String -> String -> String
makeHtml title content = html_ (head_ (title_ title) <> body_ content)
