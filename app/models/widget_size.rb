class WidgetSize < Enum
  Small(:small) do
    def width = 1
    def height = 1
  end

  Medium(:medium) do
    def width = 2
    def height = 1
  end

  Large(:large) do
    def width = 2
    def height = 2
  end
end
