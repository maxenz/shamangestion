require 'test_helper'

class LicenciasControllerTest < ActionController::TestCase
  setup do
    @licencia = licencias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:licencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create licencia" do
    assert_difference('Licencia.count') do
      post :create, licencia: { serial: @licencia.serial }
    end

    assert_redirected_to licencia_path(assigns(:licencia))
  end

  test "should show licencia" do
    get :show, id: @licencia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @licencia
    assert_response :success
  end

  test "should update licencia" do
    put :update, id: @licencia, licencia: { serial: @licencia.serial }
    assert_redirected_to licencia_path(assigns(:licencia))
  end

  test "should destroy licencia" do
    assert_difference('Licencia.count', -1) do
      delete :destroy, id: @licencia
    end

    assert_redirected_to licencias_path
  end
end
