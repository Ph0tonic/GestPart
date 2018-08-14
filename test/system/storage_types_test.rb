require "application_system_test_case"

class StorageTypesTest < ApplicationSystemTestCase
  setup do
    @storage_type = storage_types(:one)
  end

  test "visiting the index" do
    visit storage_types_url
    assert_selector "h1", text: "Storage Types"
  end

  test "creating a Storage type" do
    visit storage_types_url
    click_on "New Storage Type"

    fill_in "Description", with: @storage_type.description
    fill_in "Icon", with: @storage_type.icon
    fill_in "Name", with: @storage_type.name
    click_on "Create Storage type"

    assert_text "Storage type was successfully created"
    click_on "Back"
  end

  test "updating a Storage type" do
    visit storage_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @storage_type.description
    fill_in "Icon", with: @storage_type.icon
    fill_in "Name", with: @storage_type.name
    click_on "Update Storage type"

    assert_text "Storage type was successfully updated"
    click_on "Back"
  end

  test "destroying a Storage type" do
    visit storage_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Storage type was successfully destroyed"
  end
end
