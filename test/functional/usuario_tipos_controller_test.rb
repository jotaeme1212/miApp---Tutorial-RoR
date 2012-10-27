require 'test_helper'

class UsuarioTiposControllerTest < ActionController::TestCase
  setup do
    @usuario_tipo = usuario_tipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuario_tipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usuario_tipo" do
    assert_difference('UsuarioTipo.count') do
      post :create, usuario_tipo: @usuario_tipo.attributes
    end

    assert_redirected_to usuario_tipo_path(assigns(:usuario_tipo))
  end

  test "should show usuario_tipo" do
    get :show, id: @usuario_tipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usuario_tipo
    assert_response :success
  end

  test "should update usuario_tipo" do
    put :update, id: @usuario_tipo, usuario_tipo: @usuario_tipo.attributes
    assert_redirected_to usuario_tipo_path(assigns(:usuario_tipo))
  end

  test "should destroy usuario_tipo" do
    assert_difference('UsuarioTipo.count', -1) do
      delete :destroy, id: @usuario_tipo
    end

    assert_redirected_to usuario_tipos_path
  end
end
