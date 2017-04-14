defmodule Urito.User do
  use Urito.Web, :model
  import Doorman.Auth.Bcrypt, only: [hash_password: 1]

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :hashed_password, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end

  def registration_changeset(struct, params \\ %{}) do
    struct
    |> changeset(params)
    |> cast(params, [:password])
    |> hash_password
    |> validate_required([:password, :hashed_password])
  end
end
