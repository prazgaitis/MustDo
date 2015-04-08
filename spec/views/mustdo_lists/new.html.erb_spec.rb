require 'spec_helper'

describe "mustdo_lists/new" do
  before(:each) do
    assign(:mustdo_list, stub_model(MustdoList,
      :title => "MyString",
      :category => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new mustdo_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mustdo_lists_path, "post" do
      assert_select "input#mustdo_list_title[name=?]", "mustdo_list[title]"
      assert_select "input#mustdo_list_category[name=?]", "mustdo_list[category]"
      assert_select "textarea#mustdo_list_description[name=?]", "mustdo_list[description]"
    end
  end
end
