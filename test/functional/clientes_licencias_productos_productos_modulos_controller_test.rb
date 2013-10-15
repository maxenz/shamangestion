require 'test_helper'

class ClientesLicenciasProductosProductosModulosControllerTest < ActionController::TestCase
  setup do
    @clientes_licencias_productos_productos_modulo = clientes_licencias_productos_productos_modulos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes_licencias_productos_productos_modulos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clientes_licencias_productos_productos_modulo" do
    assert_difference('ClientesLicenciasProductosProductosModulo.count') do
      post :create, clientes_licencias_productos_productos_modulo: { clientes_licencias_producto_id: @clientes_licencias_productos_productos_modulo.clientes_licencias_producto_id, productos_modulo_id: @clientes_licencias_productos_productos_modulo.productos_modulo_id }
    end

    assert_redirected_to clientes_licencias_productos_productos_modulo_path(assigns(:clientes_licencias_productos_productos_modulo))
  end

  test "should show clientes_licencias_productos_productos_modulo" do
    get :show, id: @clientes_licencias_productos_productos_modulo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clientes_licencias_productos_productos_modulo
    assert_response :success
  end

  test "should update clientes_licencias_productos_productos_modulo" do
    put :update, id: @clientes_licencias_productos_productos_modulo, clientes_licencias_productos_productos_modulo: { clientes_licencias_producto_id: @clientes_licencias_productos_productos_modulo.clientes_licencias_producto_id, productos_modulo_id: @clientes_licencias_productos_productos_modulo.productos_modulo_id }
    assert_redirected_to clientes_licencias_productos_productos_modulo_path(assigns(:clientes_licencias_productos_productos_modulo))
  end

  test "should destroy clientes_licencias_productos_productos_modulo" do
    assert_difference('ClientesLicenciasProductosProductosModulo.count', -1) do
      delete :destroy, id: @clientes_licencias_productos_productos_modulo
    end

    assert_redirected_to clientes_licencias_productos_productos_modulos_path
  end
end
