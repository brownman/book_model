module PagesHelper

  def show_magic lines
    arr = []
lines.each do |line|
arr <<  line.content
end
str = arr.join('=')
str
  end
end
