defmodule VoteMonitor.City do
  use Ecto.Schema
  import Ecto.Changeset

  alias VoteMonitor.{Incident, County, Precinct}

  schema "cities" do 
    belongs_to :county, County

    field :name, :string
    field :siruta_code, :integer
    field :el_circle_code, :integer

    has_many :incidents, Incident
    has_many :precincts, Precinct

    timestamps()
  end

  @doc false
  def changeset(incident, attrs) do
    incident
    |> cast(attrs, [])
    |> validate_required([])
  end
end
