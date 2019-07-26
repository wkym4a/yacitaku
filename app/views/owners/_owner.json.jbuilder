json.extract! owner, :id, :name, :name_kana, :post_code, :address, :tel, :tel2, :fax, :property_name, :property_name_kana, :property_post_code, :property_address, :property_type, :bank, :branch, :account_type, :account_num, :account_name, :memo, :created_at, :updated_at
json.url owner_url(owner, format: :json)
