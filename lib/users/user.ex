defmodule Exflight.Users.User do
  @keys [:id, :name, :email, :cpf]
  @enforce_keys [:name, :email, :cpf]

  defstruct @keys

  def build(name, email, cpf) when is_binary(name) do
    id = UUID.uuid4()
    {:ok, %__MODULE__{id: id, name: name, email: email, cpf: cpf}}
  end

  def build(_name, _email, _cpf), do: {:error, "Invalid params!"}
end
