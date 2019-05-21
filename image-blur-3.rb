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
        array[row-1][col]=1 unless row == 0
        array[row+1][col]=1 unless row >= array.length-1
        array[row][col-1]=1 unless col == 0
        array[row][col+1]=1 unless col >= array[0].length-1
      end
    end
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
  [0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 1, 1, 0]
])
p image.find_ones
image.blur(4)
image.output_image
