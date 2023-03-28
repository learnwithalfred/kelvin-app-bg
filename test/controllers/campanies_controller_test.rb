require "test_helper"

class CampaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campany = campanies(:one)
  end

  test "should get index" do
    get campanies_url, as: :json
    assert_response :success
  end

  test "should create campany" do
    assert_difference("Campany.count") do
      post campanies_url, params: { campany: { name: @campany.name } }, as: :json
    end

    assert_response :created
  end

  test "should show campany" do
    get campany_url(@campany), as: :json
    assert_response :success
  end

  test "should update campany" do
    patch campany_url(@campany), params: { campany: { name: @campany.name } }, as: :json
    assert_response :success
  end

  test "should destroy campany" do
    assert_difference("Campany.count", -1) do
      delete campany_url(@campany), as: :json
    end

    assert_response :no_content
  end
end
