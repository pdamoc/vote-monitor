defmodule VoteMonitor.IncidentType do
  use Ecto.Schema
  import Ecto.Changeset

  alias VoteMonitor.Incident

  schema "incident_types" do
    field :label, :string
    field :code, :string
    field :name, :string

    has_many :incidents, Incident
    timestamps()
  end

  @doc false
  def changeset(incident, attrs) do
    incident
    |> cast(attrs, [])
    |> validate_required([])
  end
end
