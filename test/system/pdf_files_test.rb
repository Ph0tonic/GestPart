require "application_system_test_case"

class PdfFilesTest < ApplicationSystemTestCase
  setup do
    @pdf_file = pdf_files(:one)
  end

  test "visiting the index" do
    visit pdf_files_url
    assert_selector "h1", text: "Pdf Files"
  end

  test "creating a Pdf file" do
    visit pdf_files_url
    click_on "New Pdf File"

    fill_in "Filename", with: @pdf_file.filename
    fill_in "References", with: @pdf_file.references
    click_on "Create Pdf file"

    assert_text "Pdf file was successfully created"
    click_on "Back"
  end

  test "updating a Pdf file" do
    visit pdf_files_url
    click_on "Edit", match: :first

    fill_in "Filename", with: @pdf_file.filename
    fill_in "References", with: @pdf_file.references
    click_on "Update Pdf file"

    assert_text "Pdf file was successfully updated"
    click_on "Back"
  end

  test "destroying a Pdf file" do
    visit pdf_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pdf file was successfully destroyed"
  end
end
