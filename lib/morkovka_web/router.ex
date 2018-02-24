defmodule MorkovkaWeb.Router do
  use MorkovkaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MorkovkaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", MorkovkaWeb do
    pipe_through :api # Use the default browser stack

    get "/photos", PhotosController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", MorkovkaWeb do
  #   pipe_through :api
  # end
end
