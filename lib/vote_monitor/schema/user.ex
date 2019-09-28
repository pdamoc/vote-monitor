defmodule VoteMonitor.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :first_name, :string  
    field :last_name, :string  
    field :email, :string  
    field :password, :string, virtual: true
    field :password_hash, :string 
    field :role, :string, default: "observer"

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
