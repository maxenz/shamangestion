require 'test_helper'

class ClientesLicenciasControllerTest < ActionController::TestCase
  setup do
    @clientes_licencia = clientes_licencias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes_licencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clientes_licencia" do
    assert_difference('ClientesLicencia.count') do
      post :create, clientes_licencia: { cliente_id: @clientes_licencia.cliente_id, cnn_catalog: @clientes_licencia.cnn_catalog, cnn_data_source: @clientes_licencia.cnn_data_source, cnn_password: @clientes_licencia.cnn_password, cnn_user: @clientes_licencia.cnn_user, licencia_id: @clientes_licencia.licencia_id }
    end

    assert_redirected_to clientes_licencia_path(assigns(:clientes_licencia))
  end

  test "should show clientes_licencia" do
    get :show, id: @clientes_licencia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clientes_licencia
    assert_response :success
  end

  test "should update clientes_licencia" do
    put :update, id: @clientes_licencia, clientes_licencia: { cliente_id: @clientes_licencia.cliente_id, cnn_catalog: @clientes_licencia.cnn_catalog, cnn_data_source: @clientes_licencia.cnn_data_source, cnn_password: @clientes_licencia.cnn_password, cnn_user: @clientes_licencia.cnn_user, licencia_id: @clientes_licencia.licencia_id }
    assert_redirected_to clientes_licencia_path(assigns(:clientes_licencia))
  end

  test "should destroy clientes_licencia" do
    assert_difference('ClientesLicencia.count', -1) do
      delete :destroy, id: @clientes_licencia
    end

    assert_redirected_to clientes_licencias_path
  end
end
