require 'test_helper'

class ListavestidoControllerTest < ActionDispatch::IntegrationTest
  test "should get idvestido" do
    get listavestido_idvestido_url
    assert_response :success
  end

  test "should get borrarv" do
    get listavestido_borrarv_url
    assert_response :success
  end

  test "should get actualizarv" do
    get listavestido_actualizarv_url
    assert_response :success
  end

  test "should get guardarv" do
    get listavestido_guardarv_url
    assert_response :success
  end

  test "should get borrarp" do
    get listavestido_borrarp_url
    assert_response :success
  end

  test "should get listapedido" do
    get listavestido_listapedido_url
    assert_response :success
  end

  test "should get buscarp" do
    get listavestido_buscarp_url
    assert_response :success
  end

  test "should get index" do
    get listavestido_index_url
    assert_response :success
  end

end
