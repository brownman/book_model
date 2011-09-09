class Page < ActiveRecord::Base
belongs_to :chapter
has_many :lines , :dependent => :destroy
end
