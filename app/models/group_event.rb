class GroupEvent < ApplicationRecord
  scope :active, -> { where(active: true) }
  validate :require_if_publish

  def self.random_five
    ids = self.pluck(:id).shuffle[0..4]
    where(id: ids)
  end

  def require_if_publish
    if self.status=="Publish"
      if self.start_at.present? & self.end_at.present?
        invalid_date_range = start_at.to_datetime >= end_at.to_datetime
        return errors.add("Start & End Date", " are invalid.") if invalid_date_range 
      end
      valid = self.name.present? & self.description.present? & self.start_at.present? & self.end_at.present? & self.location.present?
      errors.add("All fields", " are required") unless valid
    end
  end

end
