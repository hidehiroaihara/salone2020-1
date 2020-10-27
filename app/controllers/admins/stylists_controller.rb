class StylistStylistDetail

  include ActiveModel::Model
  attr_accessor :stylist_first_name, :stylist_last_name, :stylist_first_name_cana, :stylist_last_name_cana, :rank_id, :gender_id, :catchphrase, :self_introduction, :rank_text, :stylist_history_id, :nomination_id, :nomination_price, :style_type_id, :style_technique, :hobby, :stylist_id, :image, :portraits

  with_options presence: true do
    validates :stylist_first_name
    validates :stylist_last_name
    validates :stylist_last_name_cana
    validates :stylist_first_name_cana
    validates :catchphrase
    validates :self_introduction
    validates :rank_id
  end
  # validates :stylist_number, uniqueness: true
  validates :gender_id, numericality: { other_than: 0, message: "can't be blank" }

  validate :check_rank

  def check_rank
    if rank_id.to_i == 1 && stylist_history_id.to_i == 0 || rank_id.to_i == 1 && nomination_id.to_i == 0 || rank_id.to_i == 1 && style_type_id.nil?
      errors.add(:rank_id,"スタイリスト歴、指名、得意なイメージの内容を確認してください")
    end
  end

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :nomination_price, with: PRICE_REGEX, message: 'には半角数字で入力して下さい'

  NAME_REGEX = /\A[ぁ-んァ-ンー-龥]+\z/.freeze
  validates_format_of :stylist_first_name, with: NAME_REGEX, message: '全角文字かな/カナ/漢字を使用してください'
  validates_format_of :stylist_last_name, with: NAME_REGEX, message: '全角文字かな/カナ/漢字を使用してください'

  NAME_CANA_REGEX = /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/.freeze
  validates_format_of :stylist_last_name_cana, with: NAME_CANA_REGEX, message: '全角カタカナのみ入力して下さい'
  validates_format_of :stylist_first_name_cana, with: NAME_CANA_REGEX, message: '全角カタカナのみ入力して下さい'


  def save
    stylist = Stylist.create(stylist_first_name: stylist_first_name, stylist_last_name: stylist_last_name, stylist_first_name_cana: stylist_first_name_cana, stylist_last_name_cana: stylist_last_name_cana, rank_id: rank_id, gender_id: gender_id, catchphrase: catchphrase, self_introduction: self_introduction, image: image, portraits: portraits)
    StylistDetail.create(rank_text: rank_text, stylist_history_id: stylist_history_id, nomination_id: nomination_id, nomination_price: nomination_price, style_type_id: style_type_id, style_technique: style_technique, hobby: hobby, stylist_id: stylist.id)
  end
  
  def save_update(stylist_id)
    stylist = Stylist.find(stylist_id)
    stylistdetail = stylist.stylist_detail
    stylist.update(stylist_first_name: stylist_first_name, stylist_last_name: stylist_last_name, stylist_first_name_cana: stylist_first_name_cana, stylist_last_name_cana: stylist_last_name_cana, rank_id: rank_id, gender_id: gender_id, catchphrase: catchphrase, self_introduction: self_introduction, image: image, portraits: portraits)
    stylistdetail.update(rank_text: rank_text, stylist_history_id: stylist_history_id, nomination_id: nomination_id, nomination_price: nomination_price, style_type_id: style_type_id, style_technique: style_technique, hobby: hobby)
  end
    
  def stylist_destroy(stylist_id)
    stylist = Stylist.find(stylist_id)
    stylistdetail = stylist.stylist_detail
    stylist.destroy
    stylistdetail.destroy
  end
end 

class Admins::StylistsController < ApplicationController
  before_action :set_stylist, only: [:edit, :update, :destroy, :show, :update_image] 
  def index
    @stylists = Stylist.all
  end

  def new
    @stylist = StylistStylistDetail.new
  end

  def create
    @stylist = StylistStylistDetail.new(stylist_params)
    if @stylist.valid?
       @stylist.save
      return redirect_to admins_stylists_path
    else 
      render :new
    end
  end

  def edit 
    # binding.pry
    @stylist_detail = StylistStylistDetail.new(stylist_first_name: @stylist.stylist_first_name, stylist_last_name: @stylist.stylist_last_name, stylist_first_name_cana: @stylist.stylist_first_name_cana, stylist_last_name_cana: @stylist.stylist_last_name_cana, rank_id: @stylist.rank_id, gender_id: @stylist.gender_id, catchphrase: @stylist.catchphrase, self_introduction: @stylist.self_introduction, rank_text: @stylist.stylist_detail.rank_text, stylist_history_id: @stylist.stylist_detail.stylist_history_id, nomination_id: @stylist.stylist_detail.nomination_id, nomination_price: @stylist.stylist_detail.nomination_price, style_technique: @stylist.stylist_detail.style_technique, hobby: @stylist.stylist_detail.hobby, style_type_id: @stylist.stylist_detail.style_type_id, image: @stylist.image,portraits: @stylist.portraits )

  end

  def update
    @stylist_detail = StylistStylistDetail.new(stylist_params)
    # binding.pry
    if @stylist_detail.save_update(params[:id])
      redirect_to admins_stylists_path, notice: '更新完了しました'
    else
      render :edit
    end
  end

  def destroy
    @stylist_detail = StylistStylistDetail.new
     if @stylist_detail.stylist_destroy(params[:id])
      redirect_to admins_reservations_path
     else
      render :show
     end
  end
  private

  def stylist_params
    params.require(:stylist_stylist_detail).permit(:stylist_first_name, :stylist_last_name, :stylist_first_name_cana, :stylist_last_name_cana, :rank_id, :gender_id, :catchphrase, :self_introduction, :stylist_number, :rank_text, :stylist_history_id, :nomination_id, :nomination_price, :style_technique, :hobby, :style_type_id,:image , portraits: [])
  end

  def set_stylist
    @stylist = Stylist.find(params[:id])
  end
end
