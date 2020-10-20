class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :member
  belongs_to_active_hash :age
  has_many :reservations
  has_one :address
  has_one :user_information
  has_one :user_detail
  has_one :user_option
  has_many :menus, through: :user_menus
  belongs_to :stylist, optional: true

  def set_user_name
    self.first_name + self.last_name
  end

  def set_user_name_cana
    self.first_name_cana + self.last_name_cana
  end
  
  scope :search, -> (search_params) do
    return if search_params.blank?
    
    first_like(search_params[:first_name]).last_like(search_params[:last_name]).first_cana_like(search_params[:first_name_cana]).last_cana_like(search_params[:last_name_cana]).phone_like(search_params[:phone_number]).email_like(search_params[:email]).customer_number_like(search_params[:customer_number]).member_like(search_params[:menber_id]).visit_from(search_params[:visit_from]).visit_to(search_params[:visit_to]).visit_time_like(search_params[:visit_time]).birthday_from(search_params[:birthday_from]).birthday_to(search_params[:birthday_to]).age_like(search_params[:age_id]).gender_like(search_params[:gender_id]).job_like(search_params[:job_id]).stylist_like(search_params[:stylist_id])
  end

  scope :first_like, -> (first_name) { where('first_name LIKE ?', "%#{first_name}%") if first_name.present? }
  scope :last_like, -> (last_name) { where('last_name LIKE ?', "%#{last_name}%") if last_name.present? }
  scope :first_cana_like, -> (first_name_cana) { where('first_name_cana LIKE ?', "%#{first_name_cana}%") if first_name_cana.present? }
  scope :last_cana_like, -> (last_name_cana) { where('last_name_cana LIKE ?', "%#{last_name_cana}%") if last_name_cana.present? }
  scope :phone_like, -> (phone_number) { where('phone_number LIKE ?', "%#{phone_number}%") if phone_number.present? }
  scope :email_like, -> (email) { where('email LIKE ?', "%#{email}%") if email.present? }
  scope :customer_number_like, -> (customer_number) { where('customer_number LIKE ?', "%#{customer_number}%") if customer_number.present? }
  scope :member_like, -> (member_id) { where(member_id: member_id) if member_id.present? }
  scope :visit_from, -> (from) { where('? <= visit', from) if from.present? }
  scope :visit_to, -> (to) { where('visit <= ?', to) if to.present? }
  scope :visit_time_like, -> (visit_time) { where('visit_time LIKE ?', "%#{visit_time}%") if visit_time.present? }
  scope :birthday_from, -> (from) { where('? <= birthday', from) if from.present? }
  scope :birthday_to, -> (to) { where('birthday <= ?', to) if to.present? }
  scope :age_like, -> (age_id) { where(age_id: age_id) if age_id.present? } 
  scope :gender_like, -> (gender_id) { where(gender_id: gender_id) if gender_id.present? }
  scope :job_like, -> (job_id) { where(job_id: job_id) if job_id.present? }
  scope :stylist_like, -> (stylist_id) { where(stylist_id: stylist_id) if stylist_id.present? }

  with_options presence: true do
    validates :birthday
    validates :last_name
    validates :first_name
    validates :last_name_cana
    validates :first_name_cana
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'にはハイフン無しの半角数字で１１桁以内入力して下さい'} 
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
 end
      NAME_REGEX = /\A[ぁ-んァ-ンー-龥]+\z/.freeze
      validates_format_of :last_name, with: NAME_REGEX, message: '全角文字かな/カナ/漢字を使用してください'
      validates_format_of :first_name, with: NAME_REGEX, message: '全角文字かな/カナ/漢字を使用してください'

      NAME_CANA_REGEX = /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/.freeze
      validates_format_of :last_name_cana, with: NAME_CANA_REGEX, message: '全角カタカナのみ入力して下さい'
      validates_format_of :first_name_cana, with: NAME_CANA_REGEX, message: '全角カタカナのみ入力して下さい'

      PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
      validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

end
