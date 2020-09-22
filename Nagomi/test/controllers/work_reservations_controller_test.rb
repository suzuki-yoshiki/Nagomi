require 'test_helper'

class WorkReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get work_reservations_index_url
    assert_response :success
  end

  test "should get new" do
    get work_reservations_new_url
    assert_response :success
  end

  test "should get show" do
    get work_reservations_show_url
    assert_response :success
  end

  test "should get edit" do
    get work_reservations_edit_url
    assert_response :success
  end

  test "should get update" do
    get work_reservations_update_url
    assert_response :success
  end

  test "should get create" do
    get work_reservations_create_url
    assert_response :success
  end

end
