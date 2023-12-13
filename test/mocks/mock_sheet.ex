defmodule MockSheet do
  use LiveViewNative.Stylesheet, :swiftui

  ~SHEET"""
  "color-red" do
    color(.red)
  end

  # this is a comment and isn't included in the output

  "button-" <> style do
    # this is also a comment that isn't included in the output
    buttonStyle(.#{style})
  end

  "h-" <> height do
    height(#{height})
  end
  """

  def class("color-" <> color_name, _target) do
    ~RULES"""
    color(.#{color_name})
    """
  end

  def class(_other, _), do: {:unmatched, ""}

  # TODO: Remove when to_number is added to the stylesheet lib
  def to_number(expr) when is_binary(expr) do
    try do
      {integer, ""} = Integer.parse(expr)
      integer
    rescue
      _ ->
      try do
        {float, ""} = Float.parse(expr)
        float
      rescue
        _ ->
        expr
      end
    end
  end
end
