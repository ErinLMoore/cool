defmodule CoolWeb.Components.CardTest do
  use CoolWeb.ConnCase, async: true
  use Surface.LiveViewTest

  catalogue_test CoolWeb.Card
end
