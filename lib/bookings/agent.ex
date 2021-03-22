defmodule Exflight.Bookings.Agent do
  use Agent

  alias Exflight.Bookings.Booking

  def start_link(_init_state), do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def get(id), do: Agent.get(__MODULE__, &get_by_id(&1, id))
  def save(%Booking{} = booking), do: Agent.update(__MODULE__, &update_state(&1, booking))

  defp get_by_id(state, id) do
    case Map.get(state, id) do
      nil -> {:error, "Booking not found!"}
      booking -> {:ok, booking}
    end
  end

  defp update_state(state, %Booking{id: id} = booking), do: Map.put(state, id, booking)
end
