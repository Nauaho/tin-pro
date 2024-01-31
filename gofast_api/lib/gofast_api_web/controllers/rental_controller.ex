defmodule GofastApiWeb.RentalController do
  use GofastApiWeb, :controller
  alias GofastApi.Rentals
	alias GofastApi.Rentals.Rentals
  action_fallback GofastApiWeb.FallbackController

end
