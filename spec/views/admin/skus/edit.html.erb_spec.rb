require 'rails_helper'

RSpec.describe "admin/skus/edit", type: :view do
  let(:admin_sku) {
    Admin::Sku.create!()
  }

  before(:each) do
    assign(:admin_sku, admin_sku)
  end

  it "renders the edit admin_sku form" do
    render

    assert_select "form[action=?][method=?]", admin_sku_path(admin_sku), "post" do
    end
  end
end
