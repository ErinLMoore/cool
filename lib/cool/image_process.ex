defmodule Cool.ImageProcess do
  alias ExPng.Image

  def something(infile, outfile, [func_one, func_two, func_three]  = _func_list) do
    {:ok, png} = Image.from_file("./assets/images/#{infile}.png")

    #[[<<>>, <<>>], [<<>>, <<>>]]
    new_pixels =
      png.pixels
      |> func_one.()
      |> Enum.map(fn pixels_list ->
        func_two.(pixels_list)
        |> modify_pixels(func_three)
      end)

    new_image = %Image{png | pixels: new_pixels}
    Image.to_file(new_image, "./assets/images/#{outfile}.png")
  end

  def modify_pixels(pixels_list, inner_func) do
    Enum.map(pixels_list, fn pixel ->
      pixel
      |> :binary.bin_to_list()
      |> inner_func.()
      |> :binary.list_to_bin()
    end)
  end

  def no_op(z), do: z


  def pixels_in_half(z), do: Enum.map(z, &(Kernel.round(&1/2)) )

  def pixels_random(z), do: Enum.map(z, fn _ -> :rand.uniform(255) end)

  def pixels_randomly_random(z) do
    Enum.map(z, fn a ->
     new_num = a + (:rand.uniform(500) - 255)
     cond do
       new_num > 255 -> 255
       new_num < 0 -> 0
       true -> new_num
     end
   end)
 end

  def double_list(z), do: Enum.flat_map(z, &([&1, &1]))

  def reverse_list(z), do: Enum.reverse(z)

  def shuffle_list(z), do: Enum.shuffle(z)

end
