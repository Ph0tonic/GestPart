require 'test_helper'

class CompositorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compositor = compositors(:one)
  end

  test "should get index" do
    get compositors_url
    assert_response :success
  end

  test "should get new" do
    get new_compositor_url
    assert_response :success
  end

  test "should create compositor" do
    assert_difference('Compositor.count') do
      post compositors_url, params: { compositor: { name: @compositor.name } }
    end

    assert_redirected_to compositor_url(Compositor.last)
  end

  test "should show compositor" do
    get compositor_url(@compositor)
    assert_response :success
  end

  test "should get edit" do
    get edit_compositor_url(@compositor)
    assert_response :success
  end

  test "should update compositor" do
    patch compositor_url(@compositor), params: { compositor: { name: @compositor.name } }
    assert_redirected_to compositor_url(@compositor)
  end

  test "should destroy compositor" do
    assert_difference('Compositor.count', -1) do
      delete compositor_url(@compositor)
    end

    assert_redirected_to compositors_url
  end
end
