require 'rails_helper'

RSpec.describe "admin/skus/new", type: :view do
  before(:each) do
    assign(:admin_sku, Admin::Sku.new())
  end

  it "renders new admin_sku form" do
    render

    assert_select "form[action=?][method=?]", admin_skus_path, "post" do
    end
  end
end
