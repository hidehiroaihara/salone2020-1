class StyleCategoryTwo < ApplicationRecord
  belongs_to :menu
  belongs_to :style_category_list
  # def self.filter(selected_menus_ids)
  #   selected_list_ids = StyleCategoryTwo.where(menu_id: selected_menus_ids).plunk(:Style_category_list_id).uniq.sort
  #   return StyleCategoryList.all unless selected_menus_ids
  #   style_category_list_filtered = []
  #   selected_list_ids.each do |id|
  #     loop_count = 0 
  #     while selected_menus_ids.length > loop_count do
  #       break unless StyleCategoryList.includes(:menus).find(id).menus.plunk(:id).includes?(selected_menus_ids[loop_count].to_i)
  #       loop_count += 1;
  #     end
  #     style_category_list_filtered << id if loop_count == selected_menus_ids.length
  #   end
  #   return style_category_list_filtered
  # end
end
