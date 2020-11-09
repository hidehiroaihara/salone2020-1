class UserDetail < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :blood
  belongs_to_active_hash :job
  belongs_to_active_hash :consent
  belongs_to :user, optional: true

  validates :consent, presence: true, on: :registration

  # scope :search, -> (search_params) do
  #   return if search_params.blank?
  #   gender_like(search_params[:gender_id]).job_like(search_params[:job_id])
  # end

  # scope :gender_like, -> (gender_id) { where(gender_id: gender_id) if gender_id.present? }
  # scope :job_like, -> (job_id) { where(job_id: job_id) if job_id.present? }
end
