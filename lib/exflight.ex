defmodule Exflight do
  alias Exflight.Users.Agent, as: UserAgent
  alias Exflight.Users.CreateOrUpdate

  def start_agents() do
    UserAgent.start_link(nil)
  end

  defdelegate create_user(params), to: CreateOrUpdate, as: :call
end
