defmodule VoteMonitor.Precinct do
  use Ecto.Schema
  import Ecto.Changeset

  alias VoteMonitor.{Incident, County, City}

  schema "precincts" do 
    belongs_to :county, County 
    belongs_to :city, City

    field :siruta_code, :integer
    field :circ_no, :integer
    field :precinct_no, :integer
    field :headquarter, :string
    field :address, :string

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
