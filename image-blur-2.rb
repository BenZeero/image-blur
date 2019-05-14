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

  def blur(x,y)
    [x,y].each do |a,b|
      if a>=array.length || b>=array.length
        puts "Input is greater than array size."
        next
      else
        array[a][b]=1
        array[a-1][b]=1 unless a == 0
        array[a+1][b]=1 unless a >= array.length-1
        array[a][b-1]=1 unless b == 0
        array[a][b+1]=1 unless b >= array.length-1
      end
    end
  end
end


image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.blur([0,0],[4,3])
image.output_image
puts image.array.length