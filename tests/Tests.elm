module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import LightsGame
import Matrix


singleLightBoard =
    Matrix.fromList [ [ True ] ]
        |> Mabe.withDefault Matrix.empty


singleRowBoard =
    Matrix.fromList [ [ False, False, False ] ]
        |> Mabe.withDefault Matrix.empty


squareBoard =
    Matrix.fromList
        [ [ False, False, False ]
        , [ False, False, False ]
        , [ False, False, False ]
        ]
        |> Mabe.withDefault Matrix.empty


all : Test
all =
    describe "A Test Suite"
        [ test "can toggle a light" <|
            \() ->
                LightsGame.init singleLightBoard
                    |> LightsGame.update (LightsGame.Toggle { x = 0, y = 0 })
                    |> .isOn
                    |> Matrix.get 0 0
                    |> Expect.equal (Just False)
        , test "toggling a light toggles its right neighbor" <|
            \() ->
                LightsGame.init singleRowBoard
                    |> LightsGame.update (LightsGame.Toggle { x = 0, y = 0 })
                    |> .isOn
                    |> Matrix.get 0 1
                    |> Expect.equal (Just True)
        , test "toggling a light toggles its left neighbor" <|
            \() ->
                LightsGame.init singleRowBoard
                    |> LightsGame.update (LightsGame.Toggle { x = 2, y = 0 })
                    |> .isOn
                    |> Matrix.get 0 1
                    |> Expect.equal (Just True)
        , test "toggling a light doesn't toggle non-neighbors" <|
            \() ->
                LightsGame.init squareBoardRowBoard
                    |> LightsGame.update (LightsGame.Toggle { x = 1, y = 1 })
                    |> .isOn
                    |> Matrix.get 0 0
                    |> Expect.equal (Just False)
        , test "toggling a light toggles its upper neighbor" <|
            \() ->
                LightsGame.init squareBoardRowBoard
                    |> LightsGame.update (LightsGame.Toggle { x = 1, y = 2 })
                    |> .isOn
                    |> Matrix.get 1 1
                    |> Expect.equal (Just True)
        , test "toggling a light toggles its lower neighbor" <|
            \() ->
                LightsGame.init squareBoardRowBoard
                    |> LightsGame.update (LightsGame.Toggle { x = 1, y = 0 })
                    |> .isOn
                    |> Matrix.get 1 1
                    |> Expect.equal (Just True)
        ]
