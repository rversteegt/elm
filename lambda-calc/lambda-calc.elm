import Html exposing (text)
import Json.Encode exposing (encode, object)
import String exposing (fromChar)

-- v1

--type Expression
--  = Variable
--  | Function Argument
--  | Lambda Variable Dot Expression
--
--
--type Function
--  = Variable
--  | LeftBrace Lambda Variable Expression Dot RightBrace
--  | Function Argument
--
--
--type Argument
--  = Variable
--  | LeftBrace Lambda Variable Expression Dot RightBrace
--  | LeftBrace Function Argument RightBrace
--
--
type Dot = Dot

type LeftBrace = LeftBrace

type RightBrace = RightBrace



-- v2

type Expression
  = Variable Char
  | Surround Expression
  | Lambda Char Expression
  | Concat Expression Expression


render : Expression -> String

render exp =
  case exp of
    Variable v ->
      fromChar v

    Surround expr ->
      "(" ++ (render expr) ++ ")"

    Lambda v exp ->
      "\\" ++ fromChar v ++ "." ++ render exp

    Concat exp1 exp2 ->
      render exp1 ++ render exp2


-- λx.x
exp1 = Lambda 'x' (Variable 'x')


-- +2
exp2 = Concat (Variable '+') (Variable '2')


-- λx.x+2
exp3 = Concat exp1 exp2


main =
  text <| render <| exp3
