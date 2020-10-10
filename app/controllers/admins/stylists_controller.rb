class StylistStylistDetail

  include ActiveModel::Model
  attr_accessor :stylist_first_name, :stylist_last_name, :stylist_first_name_cana, :stylist_last_name_cana, :rank_id, :gender_id, :catchphrase, :self_introduction, :stylist_number, :rank_text, :stylist_history_id, :nomination_id, :nomination_price, :style_type_id, :style_technique, :hobby, :stylist_id, :image, :portraits

  def save
    stylist = Stylist.create(stylist_first_name: stylist_first_name, stylist_last_name: stylist_last_name, stylist_first_name_cana: stylist_first_name_cana, stylist_last_name_cana: stylist_last_name_cana, rank_id: rank_id, gender_id: gender_id, catchphrase: catchphrase, self_introduction: self_introduction, stylist_number: stylist_number, image: image, portraits: portraits)
    StylistDetail.create(rank_text: rank_text, stylist_history_id: stylist_history_id, nomination_id: nomination_id, nomination_price: nomination_price, style_type_id: style_type_id, style_technique: style_technique, hobby: hobby, stylist_id: stylist.id)
  end
  
  def save_update(stylist_id)
    stylist = Stylist.find(stylist_id)
    stylistdetail = stylist.stylist_detail
    stylist.update(stylist_first_name: stylist_first_name, stylist_last_name: stylist_last_name, stylist_first_name_cana: stylist_first_name_cana, stylist_last_name_cana: stylist_last_name_cana, rank_id: rank_id, gender_id: gender_id, catchphrase: catchphrase, self_introduction: self_introduction, stylist_number: stylist_number, image: image, portraits: portraits)
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
    if @stylist.save
      return redirect_to admins_stylists_path
    else 
      render :new
    end
  end

  def edit 
    # binding.pry
    @stylist_detail = StylistStylistDetail.new(stylist_first_name: @stylist.stylist_first_name, stylist_last_name: @stylist.stylist_last_name, stylist_first_name_cana: @stylist.stylist_first_name_cana, stylist_last_name_cana: @stylist.stylist_last_name_cana, rank_id: @stylist.rank_id, gender_id: @stylist.gender_id, catchphrase: @stylist.catchphrase, self_introduction: @stylist.self_introduction, stylist_number: @stylist.stylist_number, rank_text: @stylist.stylist_detail.rank_text, stylist_history_id: @stylist.stylist_detail.stylist_history_id, nomination_id: @stylist.stylist_detail.nomination_id, nomination_price: @stylist.stylist_detail.nomination_price, style_technique: @stylist.stylist_detail.style_technique, hobby: @stylist.stylist_detail.hobby, style_type_id: @stylist.stylist_detail.style_type_id, image: @stylist.image,portraits: @stylist.portraits )

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