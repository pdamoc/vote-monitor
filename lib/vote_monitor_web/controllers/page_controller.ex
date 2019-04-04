defmodule VoteMonitorWeb.PageController do
  use VoteMonitorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
