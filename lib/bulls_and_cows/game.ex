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

    str = [Integer.to_string(d1), Integer.to_string(d2), Integer.to_string(d3),
      Integer.to_string(d4)]
    str
  end

  def guess(st, gs) do
    #add guess to the list of guesses
    %{ st | guesses: st.guesses ++ [gs]}

  end

  def get_results(st, gs) do
    sec = st.secret

    #check for bulls
    {bulls, newSec, newGs} = check_bulls(sec, gs, 0, sec, gs)

    #check for cows
    cows = check_cows(newSec, newGs)

    bac = {"Bulls: ", bulls, "Cows: ", cows}
    bac
  end

  def check_bulls(sec, gs, num, newSec, newGs) do
    case sec do
      [] ->
        #list is mt, return num
        {num, newSec, newGs}
      _ ->
      cond do
        hd(sec) == hd(gs) ->
          #remove heads, add 1 b or c, check again
          check_bulls(tl(sec), tl(gs), num+1, tl(sec), tl(gs))
        hd(sec) != hd(gs) ->
          #remove heads, check again
          check_bulls(tl(sec), tl(gs), num, newSec, newGs)
      end
    end
  end

  def check_cows(sec, gs) do
    secSet = MapSet.new(sec)
    gsSet = MapSet.new(gs)
    num = (Enum.count(sec) - 1) -
      (MapSet.size(MapSet.difference(secSet, gsSet)))
    num
  end


end
