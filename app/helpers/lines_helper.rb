module LinesHelper
  def show_magic lines
    arr = []
lines.each do |line|
arr <<  line.content
end
str = arr.join('=')
  end
end
