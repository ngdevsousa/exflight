defmodule Exflight.Users.Agent do
  use Agent

  alias Exflight.Users.User

  def start_link(_init_state), do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def get(id), do: Agent.get(__MODULE__, &get_by_id(&1, id))
  def save(%User{} = user), do: Agent.update(__MODULE__, &update_state(&1, user))

  defp get_by_id(state, id) do
    case Map.get(state, id) do
      nil -> {:error, "User not found!"}
      user -> {:ok, user}
    end
  end

  defp update_state(state, %User{id: id} = user), do: Map.put(state, id, user)
end
