require 'spec_helper'

describe "Deleting mustdo lists" do
	let!(:mustdo_list) { MustdoList.create(title: "the Girl and the Goat",
										category: "Restaurants",
								 	 description: "Possibly the best restaurant on the city") }

 	it "is successful when clicking destroy link" do
 		visit "/mustdo_lists"


 		within "#mustdo_list_#{mustdo_list.id}" do
 			click_link "Destroy"
 		end

		expect(page).to_not have_content(mustdo_list.title)
		expect(MustdoList.count).to eq(0)
 	end
 end