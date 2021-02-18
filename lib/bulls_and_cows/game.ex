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
    sec = st.secret
    gs1 = gs

    #check for bulls
    bulls = check_char(sec, gs1, 0)

    #check for cows, lists need to be sorted
    cows = check_char(sec, gs1, 0)

    bac = {"Bulls: ", bulls, "Cows: ", cows}
    bac
  end

  def check_char(sec, gs, num) do

    case sec do
      [] ->
        #list is mt, return num
        num
      _ ->
      cond do
        hd(sec) == hd(gs) ->
          #remove heads, add 1 b or c, check again
          check_char(tl(sec), tl(gs), num+1)
        hd(sec) != hd(gs) ->
          #remove heads, check again
          check_char(tl(sec), tl(gs), num)
      end
    end
  end

end
