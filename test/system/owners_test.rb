require "application_system_test_case"

class OwnersTest < ApplicationSystemTestCase
  setup do
    @owner = owners(:one)
  end

  test "visiting the index" do
    visit owners_url
    assert_selector "h1", text: "Owners"
  end

  test "creating a Owner" do
    visit owners_url
    click_on "New Owner"

    fill_in "Account name", with: @owner.account_name
    fill_in "Account num", with: @owner.account_num
    fill_in "Account type", with: @owner.account_type
    fill_in "Address", with: @owner.address
    fill_in "Bank", with: @owner.bank
    fill_in "Branch", with: @owner.branch
    fill_in "Fax", with: @owner.fax
    fill_in "Memo", with: @owner.memo
    fill_in "Name", with: @owner.name
    fill_in "Name kana", with: @owner.name_kana
    fill_in "Post code", with: @owner.post_code
    fill_in "Property address", with: @owner.property_address
    fill_in "Property name", with: @owner.property_name
    fill_in "Property name kana", with: @owner.property_name_kana
    fill_in "Property post code", with: @owner.property_post_code
    fill_in "Property type", with: @owner.property_type
    fill_in "Tel", with: @owner.tel
    fill_in "Tel2", with: @owner.tel2
    click_on "Create Owner"

    assert_text "Owner was successfully created"
    click_on "Back"
  end

  test "updating a Owner" do
    visit owners_url
    click_on "Edit", match: :first

    fill_in "Account name", with: @owner.account_name
    fill_in "Account num", with: @owner.account_num
    fill_in "Account type", with: @owner.account_type
    fill_in "Address", with: @owner.address
    fill_in "Bank", with: @owner.bank
    fill_in "Branch", with: @owner.branch
    fill_in "Fax", with: @owner.fax
    fill_in "Memo", with: @owner.memo
    fill_in "Name", with: @owner.name
    fill_in "Name kana", with: @owner.name_kana
    fill_in "Post code", with: @owner.post_code
    fill_in "Property address", with: @owner.property_address
    fill_in "Property name", with: @owner.property_name
    fill_in "Property name kana", with: @owner.property_name_kana
    fill_in "Property post code", with: @owner.property_post_code
    fill_in "Property type", with: @owner.property_type
    fill_in "Tel", with: @owner.tel
    fill_in "Tel2", with: @owner.tel2
    click_on "Update Owner"

    assert_text "Owner was successfully updated"
    click_on "Back"
  end

  test "destroying a Owner" do
    visit owners_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Owner was successfully destroyed"
  end
end
