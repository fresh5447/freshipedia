class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  #extend FriendlyId
  #friendly_id :name, use: :slugged

    # def should_generate_new_friendly_id?
     #   slug.blank? || name_changed?
    # end
    # 



  ROLES = %w[member moderator admin]    #is this right?
def role?(base_role)
  role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
end 

 # User.create! name: "Joe Schmoe"


end
