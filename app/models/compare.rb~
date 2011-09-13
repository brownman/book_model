class Compare < ActiveRecord::Base
has_many :pages
belongs_to :chapter


  def feed
    # This is preliminary. See Chapter 12 for the full implementation.
    Page.where("page_id = ?", id)
  end
end
