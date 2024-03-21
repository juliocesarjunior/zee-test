require 'rails_helper'

RSpec.describe "admin/skus/index", type: :view do
  before(:each) do
    assign(:admin_skus, [
      Admin::Sku.create!(),
      Admin::Sku.create!()
    ])
  end

  it "renders a list of admin/skus" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
