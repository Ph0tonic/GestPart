require "application_system_test_case"

class PiecesTest < ApplicationSystemTestCase
  setup do
    @piece = pieces(:one)
  end

  test "visiting the index" do
    visit pieces_url
    assert_selector "h1", text: "Pieces"
  end

  test "creating a Piece" do
    visit pieces_url
    click_on "New Piece"

    fill_in "Distribution", with: @piece.distribution
    fill_in "Divers", with: @piece.divers
    fill_in "Edition", with: @piece.edition
    fill_in "No", with: @piece.no
    fill_in "Title", with: @piece.title
    click_on "Create Piece"

    assert_text "Piece was successfully created"
    click_on "Back"
  end

  test "updating a Piece" do
    visit pieces_url
    click_on "Edit", match: :first

    fill_in "Distribution", with: @piece.distribution
    fill_in "Divers", with: @piece.divers
    fill_in "Edition", with: @piece.edition
    fill_in "No", with: @piece.no
    fill_in "Title", with: @piece.title
    click_on "Update Piece"

    assert_text "Piece was successfully updated"
    click_on "Back"
  end

  test "destroying a Piece" do
    visit pieces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Piece was successfully destroyed"
  end
end
