defmodule VoteMonitor.County do
  use Ecto.Schema
  import Ecto.Changeset

  alias VoteMonitor.{Incident, City}

  schema "counties" do 
    field :name, :string
    field :code, :string

    has_many :incidents, Incident
    has_many :cities, City

    timestamps()
  end

  @doc false
  def changeset(incident, attrs) do
    incident
    |> cast(attrs, [])
    |> validate_required([])
  end
end
