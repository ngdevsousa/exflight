defmodule Exflight.Bookings.CreateOrUpdate do
  alias Exflight.Bookings.{Agent, Booking}

  def call(%{cidade_origem: cidade_origem, cidade_destino: cidade_destino, id_usuario: id_usuario}) do
    cidade_origem
    |> Booking.build(cidade_destino, id_usuario)
    |> create_or_update()
  end

  defp create_or_update({:ok, %Booking{id: booking_id} = booking}) do
    booking
    |> Agent.save()

    {:ok, booking_id}
  end

  defp create_or_update({:error, _reason} = error), do: error
end
