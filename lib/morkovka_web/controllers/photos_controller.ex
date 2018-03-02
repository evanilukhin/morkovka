defmodule MorkovkaWeb.PhotosController do
  use MorkovkaWeb, :controller

  def index(conn, params) do
    %{items: items, count_all: count_all} = Morkovka.VkAPI.Photos.search(params)
    json conn, items
  end
end
