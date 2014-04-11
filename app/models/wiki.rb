class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  extend FriendlyId
  friendly_id :name, use: :slugged #(rails g migration add_slug_to_wikis slug:string)

  scope :visible_to, ->(user) { user && user.role?("premium") ? scoped : where(private: false) }


 
end

# @wiki = Wiki.create(:name => "this is a wiki!")
# @wiki.friendly_id
# redirect_to @wiki 