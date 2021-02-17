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
    d1 = to_string(Enum.random([0,1,2,3,4,5,6,7,8,9]))
    d2 = to_string(Enum.random([0,1,2,3,4,5,6,7,8,9]))
    d3 = to_string(Enum.random([0,1,2,3,4,5,6,7,8,9]))
    d4 = to_string(Enum.random([0,1,2,3,4,5,6,7,8,9]))

    str = d1 <> d2 <> d3 <> d4
    {rand, _} = Integer.parse(str)
    rand
  end

  def guess(st, gs) do
    #add guess to the list of guesses
    %{ st | guesses: st.guesses ++ [gs]}

  end

  def get_results(gs, sec) do
    bulls = 0
    cows = 0

  end


end
