require 'spec_helper'

describe "mustdo_lists/edit" do
  before(:each) do
    @mustdo_list = assign(:mustdo_list, stub_model(MustdoList,
      :title => "MyString",
      :category => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit mustdo_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mustdo_list_path(@mustdo_list), "post" do
      assert_select "input#mustdo_list_title[name=?]", "mustdo_list[title]"
      assert_select "input#mustdo_list_category[name=?]", "mustdo_list[category]"
      assert_select "textarea#mustdo_list_description[name=?]", "mustdo_list[description]"
    end
  end
end
