class Image < ActiveRecord::Base
  has_attached_file :asset, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/

  validates :file_name, presence: true, uniqueness: true
  validates :title, presence: true

  belongs_to :product

end
