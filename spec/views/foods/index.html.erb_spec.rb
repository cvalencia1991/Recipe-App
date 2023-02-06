require 'rails_helper'

RSpec.describe "foods/index", type: :view do
  before(:each) do
    assign(:foods, [
      Food.create!(
        name: "Name",
        measuement_unit: "Measuement Unit",
        price: 2,
        quantity: 3,
        user: nil
      ),
      Food.create!(
        name: "Name",
        measuement_unit: "Measuement Unit",
        price: 2,
        quantity: 3,
        user: nil
      )
    ])
  end

  it "renders a list of foods" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Measuement Unit".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
