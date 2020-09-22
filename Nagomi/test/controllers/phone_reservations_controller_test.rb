require 'test_helper'

class PhoneReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get phone_reservations_index_url
    assert_response :success
  end

  test "should get new" do
    get phone_reservations_new_url
    assert_response :success
  end

  test "should get show" do
    get phone_reservations_show_url
    assert_response :success
  end

  test "should get edit" do
    get phone_reservations_edit_url
    assert_response :success
  end

  test "should get update" do
    get phone_reservations_update_url
    assert_response :success
  end

  test "should get create" do
    get phone_reservations_create_url
    assert_response :success
  end

end
