defmodule Exflight.Bookings.Booking do
  @keys [:id, :data_completa, :cidade_origem, :cidade_destino, :id_usuario]
  @enforce_keys @keys

  defstruct @keys

  def build(cidade_origem, cidade_destino, id_usuario) when is_binary(id_usuario) do
    id = UUID.uuid4()
    now = NaiveDateTime.utc_now()

    {:ok,
     %__MODULE__{
       id: id,
       data_completa: now,
       cidade_origem: cidade_origem,
       cidade_destino: cidade_destino,
       id_usuario: id_usuario
     }}
  end

  def build(_from, _to, _user_id), do: {:error, "Invalid params!"}
end
