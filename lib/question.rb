class Question < ActiveRecord::Base
  belongs_to(:survey)
#   before_save(:capitalize_description)
#   validates(:description, {:presence => true, :length => {:maximum => 50}})
#   scope(:not_done, -> do
#     where({:done => false})
#   end)
#
# private
#   define_method(:capitalize_description) do
#     self.description = description.capitalize()
#   end

end
