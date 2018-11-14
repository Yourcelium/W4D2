# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord

  STATUSES = %w( APPROVED, DENIED, PENDING )
  
  validates :cat_id, :start_date, :end_date, presence: true
  
  validate :does_not_overlap_approved_request
  
  def overlapping_requests
    requests = CatRentalRequest.where(cat_id: self.cat_id).where.not('start_date > ? OR end_date < ?', self.end_date, self.start_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end
  
  def does_not_overlap_approved_request
    
    if overlapping_approved_requests.exists?
      self.errors[:overlapping] << "these dates overlapp and are unavailable"
    end
    
  end
end

