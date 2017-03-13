require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get listavestido" do
    get admin_listavestido_url
    assert_response :success
  end

  test "should get idvestido" do
    get admin_idvestido_url
    assert_response :success
  end

  test "should get borrarv" do
    get admin_borrarv_url
    assert_response :success
  end

  test "should get actualizarv" do
    get admin_actualizarv_url
    assert_response :success
  end

  test "should get guardarv" do
    get admin_guardarv_url
    assert_response :success
  end

  test "should get borrarp" do
    get admin_borrarp_url
    assert_response :success
  end

  test "should get listapedido" do
    get admin_listapedido_url
    assert_response :success
  end

  test "should get buscarp" do
    get admin_buscarp_url
    assert_response :success
  end

  test "should get index" do
    get admin_index_url
    assert_response :success
  end

end
