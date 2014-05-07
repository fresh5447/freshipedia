class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #:confirmable

  after_create :make_free
  
  #extend FriendlyId
  #friendly_id :name, use: :slugged

    # def should_generate_new_friendly_id?
     #   slug.blank? || name_changed?
    # end
    # 
def role?(base_role)
  role == base_role.to_s
end 

def admin?
  role?(:admin)
end

def free?
  role?(:free)
end

def make_free
  self.update_attribute(:role, "free")
end

def premium_or_admin?
end



 # User.create! name: "Joe Schmoe"


end
