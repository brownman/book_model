class Chapter < ActiveRecord::Base
belongs_to :book
has_many :compares , :dependent => :destroy
end
