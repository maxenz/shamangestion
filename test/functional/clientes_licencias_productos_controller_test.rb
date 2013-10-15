require 'test_helper'

class ClientesLicenciasProductosControllerTest < ActionController::TestCase
  setup do
    @clientes_licencias_producto = clientes_licencias_productos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes_licencias_productos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clientes_licencias_producto" do
    assert_difference('ClientesLicenciasProducto.count') do
      post :create, clientes_licencias_producto: {  }
    end

    assert_redirected_to clientes_licencias_producto_path(assigns(:clientes_licencias_producto))
  end

  test "should show clientes_licencias_producto" do
    get :show, id: @clientes_licencias_producto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clientes_licencias_producto
    assert_response :success
  end

  test "should update clientes_licencias_producto" do
    put :update, id: @clientes_licencias_producto, clientes_licencias_producto: {  }
    assert_redirected_to clientes_licencias_producto_path(assigns(:clientes_licencias_producto))
  end

  test "should destroy clientes_licencias_producto" do
    assert_difference('ClientesLicenciasProducto.count', -1) do
      delete :destroy, id: @clientes_licencias_producto
    end

    assert_redirected_to clientes_licencias_productos_path
  end
end
