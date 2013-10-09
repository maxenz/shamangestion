require 'test_helper'

class ProductosModulosControllerTest < ActionController::TestCase
  setup do
    @productos_modulo = productos_modulos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productos_modulos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productos_modulo" do
    assert_difference('ProductosModulo.count') do
      post :create, productos_modulo: { abreviatura_id: @productos_modulo.abreviatura_id, descripcion: @productos_modulo.descripcion }
    end

    assert_redirected_to productos_modulo_path(assigns(:productos_modulo))
  end

  test "should show productos_modulo" do
    get :show, id: @productos_modulo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @productos_modulo
    assert_response :success
  end

  test "should update productos_modulo" do
    put :update, id: @productos_modulo, productos_modulo: { abreviatura_id: @productos_modulo.abreviatura_id, descripcion: @productos_modulo.descripcion }
    assert_redirected_to productos_modulo_path(assigns(:productos_modulo))
  end

  test "should destroy productos_modulo" do
    assert_difference('ProductosModulo.count', -1) do
      delete :destroy, id: @productos_modulo
    end

    assert_redirected_to productos_modulos_path
  end
end
