defmodule Mixgpt.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Mixgpt
    ]

    opts = [strategy: :one_for_one, name: Mixgpt.Supervisor]
    res = Supervisor.start_link(children, opts)

    Mixgpt.wait_for_input_and_send()

    res
  end
end
