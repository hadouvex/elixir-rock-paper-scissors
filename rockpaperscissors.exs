defmodule RSP do
  def user_guess() do
    IO.gets("Rock(1), paper(2) or scissors(3)?\n")
    |> String.trim()
    |> String.downcase()
    |> match_input()
  end

  def match_input(val) do
    case val do
      "1" -> "rock"
      "2" -> "paper"
      "3" -> "scissors"
      "rock" -> "rock"
      "paper" -> "paper"
      "scissors" -> "scissors"
      _ -> user_guess()
    end
  end

  def ai_guess() do
    Enum.random(1..3)
    |> Integer.to_string()
    |> match_input()
  end

  def display(tuple) do
    IO.puts(elem(tuple, 0) <> "(Yours) vs (AI's)" <> elem(tuple, 1))
  end

  def def_winner(tuple) do
    case tuple do
      {"rock", "scissors"} -> :victory
      {"rock", "paper"} -> :loss
      {"rock", "rock"} -> :draw
      {"paper", "rock"} -> :victory
      {"paper", "scissors"} -> :loss
      {"paper", "paper"} -> :draw
      {"scissors", "paper"} -> :victory
      {"scissors", "rock"} -> :loss
      {"scissors", "scissors"} -> :draw
    end
  end

  def replay() do
    IO.gets("Replay?(y/n):\n")
    |> String.trim()
    |> case do
      "y" -> play()
      "n" -> System.halt(0)
      _ -> replay()
    end
  end

  def play() do
    res = {user_guess(), ai_guess()}
    display(res)
    case def_winner(res) do
      :victory -> IO.puts("You have won!")
      :loss -> IO.puts("You have lost!")
      :draw -> IO.puts("It's a draw!")
    end
    replay()
  end 
end


RSP.play()
