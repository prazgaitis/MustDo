require 'spec_helper'

describe "mustdo_lists/show" do
  before(:each) do
    @mustdo_list = assign(:mustdo_list, stub_model(MustdoList,
      :title => "Title",
      :category => "Category",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Category/)
    rendered.should match(/MyText/)
  end
end
