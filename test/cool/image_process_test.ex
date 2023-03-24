defmodule Cool.ImageProcessTest do
  use CoolWeb.ConnCase
  alias Cool.ImageProcess

  test "reverse_it" do
    result = ImageProcess.reverse_it()
    assert result == "hello"
  end
end
