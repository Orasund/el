module Page.Introduction exposing (chapter)

import Data.Shared exposing (Model)
import Data.Test.Introduction as Test
import ElmBook.Chapter as Chapter
import ElmBook.ElmUI exposing (Chapter)
import View.Chapter as Chapter


chapter : ( String, List (Chapter Model) )
chapter =
    ( "Basics"
    , [ Chapter.view "Introduction" introduction
        , Chapter.view "Hello World" helloWorld
        , Chapter.view "Extension Functions" extensionFunctions
      ]
    )

introduction : String
introduction =
    """
Leaf is a multi paradigm scripting language for Elm. It is designed to be extendable to fit your needs.

Leaf is
* dynamically Typed
* extendable (by normal Elm functions)
* based on Lua with a few features taken from Rust
* context sensitive (similar to Ports in Elm)
* small (50KB of pure Elm code)

A Leaf block is composed out of a list of statements, followed by an expression.

### Block

![Syntax for Blocks](https://orasund.github.io/leaf-lang/syntax/block.svg)

### Spaces

![Syntax for Spaces](https://orasund.github.io/leaf-lang/syntax/spaces.svg)
"""

helloWorld : String
helloWorld =
    """

A Hello World script in Leaf is as simple as

<component with-label="HelloWorld" />

To run this script in Elm you need to call `Leaf.run`.

""" ++ Test.helloWorldString ++ """
The first argument of `Leaf.run` is the "context". 
You can pass values from Elm to Leaf through the context.
""" ++ Test.contextSensitiveString ++ """
Your Leaf script may now use the variable `name` and the extension function `append`.

<component with-label="Append" />

You can use the pipe operator `.` to pass a value from one function to the next.

<component with-label="PipeOp" />"""

extensionFunctions : String
extensionFunctions =
    """

"Vanilla" Leaf  does not come with any predefined functions. We suggest to always include at least the `Leaf.Core` package. This package contains the most essential functions: `equal`, `if`, `isBool`, `isExtension`, `isFloat`, `isFunction`, `isInt`, `isList`, `isNull`, `isObject`, `isString` and `notEqual`. 

Any type specific functions, like the `append` function, must be implemented by yourself. 
This has practical reasons: Maintaining a language and libraries for it is a lot of work. 
It's therefore better to split these more specific functions off into their own projects.

<component with-label="ExtensionFunction" />

### InputVariable

![Syntax for input variables](https://orasund.github.io/leaf-lang/syntax/inputVariable.svg)

This way we can allow the naming convention `Package::functionName`. """
