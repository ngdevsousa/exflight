defmodule Exflight.Users.CreateOrUpdate do
  alias Exflight.Users.{Agent, User}

  def call(%{name: name, email: email, cpf: cpf}) do
    name
    |> User.build(email, cpf)
    |> create_or_update()
  end

  defp create_or_update({:ok, %User{id: user_id} = user}) do
    user
    |> Agent.save()

    {:ok, user_id}
  end

  defp create_or_update({:error, _reason} = error), do: error
end
