require 'spec_helper'

describe "editing a mustdo list" do

	let!(:mustdo_list) { MustdoList.create(title: "the Girl and the Goat",
										category: "Restaurants",
								 	 description: "Possibly the best restaurant on the city")
 						}

	def update_a_mustdo_list(options={})
		options[:title] ||= "My Musto List"
		options[:category] ||= "Restaurants"
		options[:description] ||= "This is a description"

		mustdo_list = options[:mustdo_list]

		visit "/mustdo_lists"
		
		within "#mustdo_list_#{mustdo_list.id}" do
			click_link "Edit"
		end

		fill_in "Title", with: options[:title]
		fill_in "Category", with: options[:category]
		fill_in "Description", with: options[:description]
		click_button "Update Mustdo list"
	end

	it "updates a mustdo list successfully with the correct information" do 
		update_a_mustdo_list mustdo_list: mustdo_list,
								   title: "New title", 
								category: "Restaurants", 
						     description: "New Description" 

		mustdo_list.reload

		expect(page).to have_content("Mustdo list was successfully updated.")
		expect(mustdo_list.title).to eq("New title")
		expect(mustdo_list.category).to eq("Restaurants")
		expect(mustdo_list.description).to eq("New Description")
	end

	it "displays an error when there is no title" do
	   update_a_mustdo_list mustdo_list: mustdo_list, title: ""
	   title = mustdo_list.title

	   mustdo_list.reload
	   expect(mustdo_list.title).to eq(title)
	   expect(page).to have_content("error")
	end

	it "displays an error when the title is too short" do
	   update_a_mustdo_list mustdo_list: mustdo_list, title: "hi"
	   expect(page).to have_content("error")
	end

	it "displays an error when there is no description" do
	   update_a_mustdo_list mustdo_list: mustdo_list, description: ""
	   expect(page).to have_content("error")
	end

	it "displays an error when the description is too short" do
	   update_a_mustdo_list mustdo_list: mustdo_list, description: "hi"
	   expect(page).to have_content("error")
	end

	
end