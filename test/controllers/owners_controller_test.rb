require 'test_helper'

class OwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @owner = owners(:one)
  end

  test "should get index" do
    get owners_url
    assert_response :success
  end

  test "should get new" do
    get new_owner_url
    assert_response :success
  end

  test "should create owner" do
    assert_difference('Owner.count') do
      post owners_url, params: { owner: { account_name: @owner.account_name, account_num: @owner.account_num, account_type: @owner.account_type, address: @owner.address, bank: @owner.bank, branch: @owner.branch, fax: @owner.fax, memo: @owner.memo, name: @owner.name, name_kana: @owner.name_kana, post_code: @owner.post_code, property_address: @owner.property_address, property_name: @owner.property_name, property_name_kana: @owner.property_name_kana, property_post_code: @owner.property_post_code, property_type: @owner.property_type, tel: @owner.tel, tel2: @owner.tel2 } }
    end

    assert_redirected_to owner_url(Owner.last)
  end

  test "should show owner" do
    get owner_url(@owner)
    assert_response :success
  end

  test "should get edit" do
    get edit_owner_url(@owner)
    assert_response :success
  end

  test "should update owner" do
    patch owner_url(@owner), params: { owner: { account_name: @owner.account_name, account_num: @owner.account_num, account_type: @owner.account_type, address: @owner.address, bank: @owner.bank, branch: @owner.branch, fax: @owner.fax, memo: @owner.memo, name: @owner.name, name_kana: @owner.name_kana, post_code: @owner.post_code, property_address: @owner.property_address, property_name: @owner.property_name, property_name_kana: @owner.property_name_kana, property_post_code: @owner.property_post_code, property_type: @owner.property_type, tel: @owner.tel, tel2: @owner.tel2 } }
    assert_redirected_to owner_url(@owner)
  end

  test "should destroy owner" do
    assert_difference('Owner.count', -1) do
      delete owner_url(@owner)
    end

    assert_redirected_to owners_url
  end
end
