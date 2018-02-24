defmodule MorkovkaWeb.PhotosController do
  use MorkovkaWeb, :controller

  def index(conn, params) do
    {:ok, %{"response" => %{"items" => items, "count" => count_all}}} = Morkovka.VkAPI.Photos.search(params)
    json conn, items
  end
end
