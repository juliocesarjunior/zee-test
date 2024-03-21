require 'rails_helper'

RSpec.describe "admin/skus/show", type: :view do
  before(:each) do
    assign(:admin_sku, Admin::Sku.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
