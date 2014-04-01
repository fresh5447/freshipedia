class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  #extend FriendlyId
  #FriendlyId :name, use: :slugged (rails g migration add_slug_to_wikis slug:string)
end
