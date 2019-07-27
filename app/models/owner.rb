class Owner < ApplicationRecord

  scope :search_by_name_partial, lambda {|name|where("name like ?", "%#{name}%")}
  scope :search_by_name_kana_forward, lambda {|name_kana|where("name_kana like ?", "#{name_kana}%")}

  scope :search_by_property_name_partial, lambda {|property_name|where("property_name like ?", "%#{property_name}%")}
  scope :search_by_property_name_kana_forward, lambda {|property_name_kana|where("property_name_kana like ?", "#{property_name_kana}%")}

end
