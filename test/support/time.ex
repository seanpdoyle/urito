defmodule Urito.Time do
  def cast!(time) do
    time |> NaiveDateTime.from_erl! |> DateTime.from_naive!("Etc/UTC")
  end
end
