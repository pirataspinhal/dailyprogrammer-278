defmodule Weave do
  def collect_input do
   func = IO.gets("")
   weave(func)
  end
  def weave(mode) when mode == "Weave\n" do
    first = IO.read(:line) |> String.to_charlist
  end
  def weave(mode) when mode == "Bracket\n" do
    IO.puts("a")
  end
  def weave(mode) do
    IO.puts("num deu")
  end
end

Weave.collect_input
