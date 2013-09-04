require 'test_helper'

class TipoTerminalesControllerTest < ActionController::TestCase
  setup do
    @tipo_terminal = tipo_terminales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_terminales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_terminal" do
    assert_difference('TipoTerminal.count') do
      post :create, tipo_terminal: { descripcion: @tipo_terminal.descripcion }
    end

    assert_redirected_to tipo_terminal_path(assigns(:tipo_terminal))
  end

  test "should show tipo_terminal" do
    get :show, id: @tipo_terminal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_terminal
    assert_response :success
  end

  test "should update tipo_terminal" do
    put :update, id: @tipo_terminal, tipo_terminal: { descripcion: @tipo_terminal.descripcion }
    assert_redirected_to tipo_terminal_path(assigns(:tipo_terminal))
  end

  test "should destroy tipo_terminal" do
    assert_difference('TipoTerminal.count', -1) do
      delete :destroy, id: @tipo_terminal
    end

    assert_redirected_to tipo_terminales_path
  end
end
