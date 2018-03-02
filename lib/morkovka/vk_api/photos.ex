defmodule Morkovka.VkAPI.Photos do
  import Morkovka.VkAPI.ServiceFunctions

  def search(params) do
    result =
       prepare_request_url("photos.search", "q=#{params["q"]}&count=#{params["count"]}&offset=#{params["offset"]}")
       |> URI.encode
       |> HTTPoison.get!
    Jason.decode(result.body)
    |> prepare_search_result
  end

  defp prepare_search_result(raw_result) do
    {:ok, %{"response" => %{"items" => raw_items, "count" => count_all}}} = raw_result
    items = Enum.map(raw_items, &trasnform_photo_item/1)
    %{count_all: count_all, items: items}
  end

  defp trasnform_photo_item(item) do
    %{
      id: item["id"],
      preview_image_link: item[find_prewiev_image(item)],
      full_image_link: item[find_full_image(item)],
      text_message: String.trim(item["text"]),
      owner_link: owner_link(item["owner_id"]),
      width: item["width"],
      height: item["height"]
    }
  end

  defp owner_link(item) do
    case item do
      x when is_integer(x) and x > 0 -> "vk.com/id#{x}"
      x when is_integer(x) and x < 0 -> "vk.com/public#{x*(-1)}"
      _ -> ""
    end
  end

  defp find_full_image(item) do
    sizes = ["photo_2560", "photo_1280", "photo_807", "photo_604", "photo_130", "photo_75"]
    Enum.find(sizes, fn(x) -> item[x] != nil end)
  end

  defp find_prewiev_image(item) do
    sizes = ["photo_604", "photo_130", "photo_75"]
    Enum.find(sizes, fn(x) -> item[x] != nil end)
  end
end
