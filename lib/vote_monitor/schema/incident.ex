defmodule VoteMonitor.Incident do
  use Ecto.Schema
  import Ecto.Changeset

  alias VoteMonitor.{County, City, Precinct, IncidentType}

  schema "incidents" do

    belongs_to :county, County
    belongs_to :city, City
    belongs_to :precinct, Precinct
    belongs_to :incident_type, IncidentType

    field :first_name, :string
    field :last_name, :string
    field :description, :string
    field :image_url, :string
    field :status, :string, default: "pending"
    
    timestamps()
  end

  @doc false
  def changeset(incident, attrs) do
    incident
    |> cast(attrs, [])
    |> validate_required([])
  end
end
