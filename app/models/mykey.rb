class Mykey < ActiveRecord::Base
 

 validate :has_already
 validate :is_long_enough
 validates :content, uniqueness: true 
 validates :content, format: { with: /\A[a-zA-Z0-0]+\z/  , message: "Please only numbers or letters" }

  def has_already
    if  Mykey.where(["user_id = '%s'", user_id.to_s]).to_a.size > 0
      errors.add(:error, "You have already a key!")
    end
  end


  def is_long_enough 
   if content.length < 40 or content.length > 50
      errors.add(:error, "   the key must be at least 40 characters and no more than 50 ")
   end
  end

end
