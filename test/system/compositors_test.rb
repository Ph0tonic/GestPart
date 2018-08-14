require "application_system_test_case"

class CompositorsTest < ApplicationSystemTestCase
  setup do
    @compositor = compositors(:one)
  end

  test "visiting the index" do
    visit compositors_url
    assert_selector "h1", text: "Compositors"
  end

  test "creating a Compositor" do
    visit compositors_url
    click_on "New Compositor"

    fill_in "Name", with: @compositor.name
    click_on "Create Compositor"

    assert_text "Compositor was successfully created"
    click_on "Back"
  end

  test "updating a Compositor" do
    visit compositors_url
    click_on "Edit", match: :first

    fill_in "Name", with: @compositor.name
    click_on "Update Compositor"

    assert_text "Compositor was successfully updated"
    click_on "Back"
  end

  test "destroying a Compositor" do
    visit compositors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Compositor was successfully destroyed"
  end
end
