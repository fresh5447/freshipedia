class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  extend FriendlyId
  friendly_id :name, use: :slugged #(rails g migration add_slug_to_wikis slug:string)

      def should_generate_new_friendly_id?
        slug.blank? || name_changed?
      end
end

# @wiki = Wiki.create(:name => "this is a wiki!")
# @wiki.friendly_id
# redirect_to @wiki 