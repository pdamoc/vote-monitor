defmodule VoteMonitor.Repo.Migrations.FirstSchema do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string 
      add :last_name, :string 
      add :email, :string 
      add :password_hash, :string
      add :role, :string, default: "observer"

      add :inserted_at, :timestamp, default: fragment("NOW()")
      add :updated_at, :timestamp, default: fragment("NOW()")
    end

    create table(:counties) do 
      add :name, :string
      add :code, :string

      add :inserted_at, :timestamp, default: fragment("NOW()")
      add :updated_at, :timestamp, default: fragment("NOW()")
    end

    create table(:cities) do 
      add :county_id, references(:counties)
      add :name, :string
      add :siruta_code, :integer
      add :el_circle_code, :integer

      add :inserted_at, :timestamp, default: fragment("NOW()")
      add :updated_at, :timestamp, default: fragment("NOW()")
    end
 
    create table(:precincts) do 
      add :county_id, references(:counties)
      add :city_id, references(:cities)
      add :siruta_code, :integer
      add :circ_no, :integer
      add :precinct_no, :integer
      add :headquarter, :string
      add :address, :string

      add :inserted_at, :timestamp, default: fragment("NOW()")
      add :updated_at, :timestamp, default: fragment("NOW()")
    end

    create table(:incident_types) do 
      add :label, :string
      add :code, :string
      add :name, :string

      add :inserted_at, :timestamp, default: fragment("NOW()")
      add :updated_at, :timestamp, default: fragment("NOW()")
    end

    create table(:incidents) do
      add :first_name, :string
      add :last_name, :string
      add :county_id, references(:counties)
      add :city_id, references(:cities)
      add :precinct_id, references(:precincts)
      add :incident_type_id, references(:incident_types)
      add :description, :string
      add :image_url, :string
      add :status, :string, default: "pending" 

      add :inserted_at, :timestamp, default: fragment("NOW()")
      add :updated_at, :timestamp, default: fragment("NOW()")
    end

  end
end
