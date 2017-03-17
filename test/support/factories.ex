defmodule Urito.Factory do
  use ExMachina.Ecto, repo: Urito.Repo

  def request_factory do
    %Urito.Request{
      mapped_url: build(:mapped_url),
    }
  end

  def mapped_url_factory do
    %Urito.MappedUrl{
      source: "https://example.com",
      slug: sequence(:slug, &"slug-#{&1}")
    }
  end

  def user_factory do
    %Urito.User{
      email: sequence(:email, &"user-#{&1}@example.com"),
      hashed_password: "password",
    }
  end
end
