class Category < ActiveRecord::Base
	extend FriendlyId
	has_many :variants

	friendly_id :title, use: [:slugged, :finders]

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end
