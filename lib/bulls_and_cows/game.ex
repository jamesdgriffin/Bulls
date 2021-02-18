defmodule BullsAndCows.Game do

  def new do
    %{
      secret: get_random(),
      guesses: [],
      results: [],
      text: "",
      message: "",
    }
  end

  def view(st) do
    # view for end user to see
    %{
      guesses: st.guesses,
      results: st.results,
      text: st.text,
      message: st.message,
    }
  end

  def get_random() do
    # gets the random 4 digit num for secret
    d1 = Enum.random([0,1,2,3,4,5,6,7,8,9])
    d2 = Enum.random([0,1,2,3,4,5,6,7,8,9])
    d3 = Enum.random([0,1,2,3,4,5,6,7,8,9])
    d4 = Enum.random([0,1,2,3,4,5,6,7,8,9])

    str = [d1,d2,d3,d4]
    str
  end

  def guess(st, gs) do
    #add guess to the list of guesses
    %{ st | guesses: st.guesses ++ [gs]}

  end

  def get_results(st, gs) do
    # checks for
    Enum.map(gs, fn(g) -> check_char(st.secret, g) end)
    # to check for other one, sort lists and check again
  end

  def check_char(sec, char) do
    Enum.map(sec, fn(s) ->
      cond do
        (s == char) ->
          "equals"
        (s != char) ->
          "dne"
      end
    end)
  end

end
