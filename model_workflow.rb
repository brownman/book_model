


User has_many books
Books has_many chapters
Chapeter has_many pages
Page has acts_as_tree lines

Page has Converter action: (user can save his on going efforts to simple .txt file)
from text to lines (encode symbol '=' as endl)
from page lines to text 



