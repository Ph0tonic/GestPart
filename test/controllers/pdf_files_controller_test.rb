require 'test_helper'

class PdfFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pdf_file = pdf_files(:one)
  end

  test "should get index" do
    get pdf_files_url
    assert_response :success
  end

  test "should get new" do
    get new_pdf_file_url
    assert_response :success
  end

  test "should create pdf_file" do
    assert_difference('PdfFile.count') do
      post pdf_files_url, params: { pdf_file: { filename: @pdf_file.filename, references: @pdf_file.references } }
    end

    assert_redirected_to pdf_file_url(PdfFile.last)
  end

  test "should show pdf_file" do
    get pdf_file_url(@pdf_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_pdf_file_url(@pdf_file)
    assert_response :success
  end

  test "should update pdf_file" do
    patch pdf_file_url(@pdf_file), params: { pdf_file: { filename: @pdf_file.filename, references: @pdf_file.references } }
    assert_redirected_to pdf_file_url(@pdf_file)
  end

  test "should destroy pdf_file" do
    assert_difference('PdfFile.count', -1) do
      delete pdf_file_url(@pdf_file)
    end

    assert_redirected_to pdf_files_url
  end
end
