require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Amount", with: @order.amount
    fill_in "Content", with: @order.content
    fill_in "Date delivered", with: @order.date_delivered
    fill_in "Date recieved", with: @order.date_recieved
    fill_in "Distributed by", with: @order.distributed_by
    fill_in "Name", with: @order.name
    fill_in "Po number", with: @order.po_number
    fill_in "Purchaser", with: @order.purchaser_id
    fill_in "Vendor", with: @order.vendor
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @order.amount
    fill_in "Content", with: @order.content
    fill_in "Date delivered", with: @order.date_delivered
    fill_in "Date recieved", with: @order.date_recieved
    fill_in "Distributed by", with: @order.distributed_by
    fill_in "Name", with: @order.name
    fill_in "Po number", with: @order.po_number
    fill_in "Purchaser", with: @order.purchaser_id
    fill_in "Vendor", with: @order.vendor
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
