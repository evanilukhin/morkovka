defmodule Morkovka.VkAPI.Photos do
  import Morkovka.VkAPI.ServiceFunctions

  def search(params) do
    result =
       prepare_request_url("photos.search", "q=#{params["q"]}&count=#{params["count"]}&offset=#{params["offset"]}")
       |> URI.encode
       |> HTTPoison.get!
    Jason.decode(result.body)
  end
end
