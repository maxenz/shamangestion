require 'test_helper'

class UsuariosClientesControllerTest < ActionController::TestCase
  setup do
    @usuarios_cliente = usuarios_clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuarios_clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuarios_cliente" do
    assert_difference('UsuariosCliente.count') do
      post :create, usuarios_cliente: { cliente_id: @usuarios_cliente.cliente_id, shaman_express_id: @usuarios_cliente.shaman_express_id, shaman_full_id: @usuarios_cliente.shaman_full_id, usuario_id: @usuarios_cliente.usuario_id }
    end

    assert_redirected_to usuarios_cliente_path(assigns(:usuarios_cliente))
  end

  test "should show usuarios_cliente" do
    get :show, id: @usuarios_cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuarios_cliente
    assert_response :success
  end

  test "should update usuarios_cliente" do
    put :update, id: @usuarios_cliente, usuarios_cliente: { cliente_id: @usuarios_cliente.cliente_id, shaman_express_id: @usuarios_cliente.shaman_express_id, shaman_full_id: @usuarios_cliente.shaman_full_id, usuario_id: @usuarios_cliente.usuario_id }
    assert_redirected_to usuarios_cliente_path(assigns(:usuarios_cliente))
  end

  test "should destroy usuarios_cliente" do
    assert_difference('UsuariosCliente.count', -1) do
      delete :destroy, id: @usuarios_cliente
    end

    assert_redirected_to usuarios_clientes_path
  end
end
