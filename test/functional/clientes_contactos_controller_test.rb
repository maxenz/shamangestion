require 'test_helper'

class ClientesContactosControllerTest < ActionController::TestCase
  setup do
    @clientes_contacto = clientes_contactos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes_contactos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clientes_contacto" do
    assert_difference('ClientesContacto.count') do
      post :create, clientes_contacto: { email: @clientes_contacto.email, flgPrincipal: @clientes_contacto.flgPrincipal, nombre: @clientes_contacto.nombre, telefono: @clientes_contacto.telefono }
    end

    assert_redirected_to clientes_contacto_path(assigns(:clientes_contacto))
  end

  test "should show clientes_contacto" do
    get :show, id: @clientes_contacto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clientes_contacto
    assert_response :success
  end

  test "should update clientes_contacto" do
    put :update, id: @clientes_contacto, clientes_contacto: { email: @clientes_contacto.email, flgPrincipal: @clientes_contacto.flgPrincipal, nombre: @clientes_contacto.nombre, telefono: @clientes_contacto.telefono }
    assert_redirected_to clientes_contacto_path(assigns(:clientes_contacto))
  end

  test "should destroy clientes_contacto" do
    assert_difference('ClientesContacto.count', -1) do
      delete :destroy, id: @clientes_contacto
    end

    assert_redirected_to clientes_contactos_path
  end
end
