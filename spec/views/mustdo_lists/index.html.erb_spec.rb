require 'spec_helper'

describe "mustdo_lists/index" do
  before(:each) do
    assign(:mustdo_lists, [
      stub_model(MustdoList,
        :title => "Title",
        :category => "Category",
        :description => "MyText"
      ),
      stub_model(MustdoList,
        :title => "Title",
        :category => "Category",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of mustdo_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
