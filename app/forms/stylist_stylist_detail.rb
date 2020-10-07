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