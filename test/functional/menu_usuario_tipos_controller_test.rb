require 'test_helper'

class MenuUsuarioTiposControllerTest < ActionController::TestCase
  setup do
    @menu_usuario_tipo = menu_usuario_tipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_usuario_tipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_usuario_tipo" do
    assert_difference('MenuUsuarioTipo.count') do
      post :create, menu_usuario_tipo: @menu_usuario_tipo.attributes
    end

    assert_redirected_to menu_usuario_tipo_path(assigns(:menu_usuario_tipo))
  end

  test "should show menu_usuario_tipo" do
    get :show, id: @menu_usuario_tipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @menu_usuario_tipo
    assert_response :success
  end

  test "should update menu_usuario_tipo" do
    put :update, id: @menu_usuario_tipo, menu_usuario_tipo: @menu_usuario_tipo.attributes
    assert_redirected_to menu_usuario_tipo_path(assigns(:menu_usuario_tipo))
  end

  test "should destroy menu_usuario_tipo" do
    assert_difference('MenuUsuarioTipo.count', -1) do
      delete :destroy, id: @menu_usuario_tipo
    end

    assert_redirected_to menu_usuario_tipos_path
  end
end
