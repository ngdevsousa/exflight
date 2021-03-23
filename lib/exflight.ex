defmodule Exflight do
  alias Exflight.Bookings.Agent, as: BookingsAgent
  alias Exflight.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking
  alias Exflight.Users.Agent, as: UserAgent
  alias Exflight.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents() do
    BookingsAgent.start_link(nil)
    UserAgent.start_link(nil)
  end

  defdelegate create_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_booking(params), to: CreateOrUpdateBooking, as: :call
  defdelegate get_user(params), to: UserAgent, as: :get
  defdelegate get_booking(params), to: BookingsAgent, as: :get
end
