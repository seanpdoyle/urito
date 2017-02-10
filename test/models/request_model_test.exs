defmodule Urito.RequestModelTest do
  use Urito.ModelCase

  alias Urito.Request

  test "validations" do
    invalid_attributes = %{mapped_url_id: nil}

    assert [
      {:mapped_url_id, "can't be blank"},
    ] == errors_on(%Request{}, invalid_attributes)
  end
end
