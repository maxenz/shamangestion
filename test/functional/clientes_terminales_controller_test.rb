require 'test_helper'

class ClientesTerminalesControllerTest < ActionController::TestCase
  setup do
    @clientes_terminal = clientes_terminales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes_terminales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clientes_terminal" do
    assert_difference('ClientesTerminal.count') do
      post :create, clientes_terminal: { cliente_id: @clientes_terminal.cliente_id, referencia: @clientes_terminal.referencia, tipo_id: @clientes_terminal.tipo_id, valor1: @clientes_terminal.valor1, valor2: @clientes_terminal.valor2, valor3: @clientes_terminal.valor3, valor4: @clientes_terminal.valor4 }
    end

    assert_redirected_to clientes_terminal_path(assigns(:clientes_terminal))
  end

  test "should show clientes_terminal" do
    get :show, id: @clientes_terminal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clientes_terminal
    assert_response :success
  end

  test "should update clientes_terminal" do
    put :update, id: @clientes_terminal, clientes_terminal: { cliente_id: @clientes_terminal.cliente_id, referencia: @clientes_terminal.referencia, tipo_id: @clientes_terminal.tipo_id, valor1: @clientes_terminal.valor1, valor2: @clientes_terminal.valor2, valor3: @clientes_terminal.valor3, valor4: @clientes_terminal.valor4 }
    assert_redirected_to clientes_terminal_path(assigns(:clientes_terminal))
  end

  test "should destroy clientes_terminal" do
    assert_difference('ClientesTerminal.count', -1) do
      delete :destroy, id: @clientes_terminal
    end

    assert_redirected_to clientes_terminales_path
  end
end
