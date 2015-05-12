class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:capitalize_title)
  validates(:title, {:presence => true, :length => {:maximum => 50}})
  #scope for no answer?

private
  define_method(:capitalize_title) do
    self.title = title.capitalize()
  end
end
