defmodule Morkovka.VkAPI.ServiceFunctions do
  def prepare_request_url(method, query) do
    api_conf = Application.get_env(:morkovka, Morkovka.VkAPI)
    "#{api_conf[:path]}/method/#{method}?#{query}&v=#{api_conf[:version]}&access_token=#{api_conf[:access_token]}"
  end
end
