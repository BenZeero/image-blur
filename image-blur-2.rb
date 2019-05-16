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

  def blur
    find_ones.each do |a,b|
      array[a-1][b]=1 unless a == 0
      array[a+1][b]=1 unless a >= array.length-1
      array[a][b-1]=1 unless b == 0
      array[a][b+1]=1 unless b >= array.length-1
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
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 1]
])
p image.find_ones
image.blur
image.output_image
