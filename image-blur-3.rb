class Image
  attr_accessor :array
  def initialize(array)
    @array = array
  end

  def output_image
    @array.each do |row|
      puts row.join
    end
  end

  def blur(radius=1)
    radius.times do
      find_ones.each do |row,col|
        pixel_blur(row,col)
      end
    end
  end

  def pixel_blur(row,col)
    directions = [pixel_north(row,col), pixel_south(row,col), pixel_east(row,col), pixel_west(row,col)]
    directions.each do |direction|
      direction
    end
  end  

  def pixel_north(row,col)
    array[row-1][col]=1 if row-1 != 0 && col <= array[row-1].length-1
  end

  def pixel_south(row,col)
    array[row+1][col]=1 if row+1 <= array.length-1 && col <= array[row+1].length-1 
  end

  def pixel_east(row,col)
    array[row][col+1]=1 unless col >= array[0].length-1
  end

  def pixel_west(row,col)
    array[row][col-1]=1 unless col == 0
  end

  def find_ones
    coordinates = Array.new
    @array.each_index do |row|
      subarray = @array[row]
      subarray.each_index do |col|
        if @array[row][col] == 1
          coordinates << [row,col]
        end
      end
    end
    coordinates
  end


end


image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
p image.find_ones
image.blur(2)
image.output_image
actual = image.array
expected = 
[
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [1, 1, 1, 0],
  [1, 1, 1, 1],
  [1, 1, 1, 0],
  [0, 1, 0, 0]
]
puts expected==actual
