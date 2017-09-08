class GroupEvent < ApplicationRecord
  scope :active, -> { where(active: true) }
  validate :require_if_publish

  def self.random_five
    ids = self.pluck(:id).shuffle[0..4]
    where(id: ids)
  end

  def require_if_publish
    if self.status=="Publish"
      if start_at.present? & end_at.present?
        invalid_date_range = start_at.to_datetime >= end_at.to_datetime
        errors.add("Start & End Date", " are invalid.") if invalid_date_range 
      end
      valid = name.present? & description.present? & start_at.present? & end_at.present? & location.present?
      errors.add("All fields", " are required") unless valid
    end
  end

end
