require 'spec_helper'

describe "creating mustdo lists" do

	def create_a_mustdo_list(options={})
		options[:title] ||= "My Musto List"
		options[:category] ||= "Restaurants"
		options[:description] ||= "This is a description"

		visit "/mustdo_lists"
		click_link "New Mustdo list"

		expect(page).to have_content "New mustdo_list"

		fill_in "Title", with: options[:title]
		fill_in "Category", with: options[:category]
		fill_in "Description", with: options[:description]
		click_button "Create Mustdo list"
	end

	it "redirects to mustdo list index page on success" do
		create_a_mustdo_list

		expect(page).to have_content "Mustdo list was successfully created."
	end

	it "displays an error when the must-do list has no title" do
		expect(MustdoList.count).to eq(0)

		create_a_mustdo_list title: ""

		expect(page).to have_content("error")
		expect(MustdoList.count).to eq(0)

		visit "/mustdo_lists"
		expect(page).to_not have_content "The girl and the goat"
	end

	it "displays an error when the mustdo list has a title less than three characters" do
		expect(MustdoList.count).to eq(0)

		create_a_mustdo_list title: "Hi"

		expect(page).to have_content("error")
		expect(MustdoList.count).to eq(0)

		visit "/mustdo_lists"
		expect(page).to_not have_content "The girl and the goat"
	end

	it "displays an error when the Mustdo list has no category" do
		expect(MustdoList.count).to eq(0)

		create_a_mustdo_list category: ""

		expect(page).to have_content("error")
		expect(MustdoList.count).to eq(0)

		visit "/mustdo_lists"
		expect(page).to_not have_content "The girl and the goat"
	end

	it "displays an error when the Mustdo list is not a valid option" do
		expect(MustdoList.count).to eq(0)

		create_a_mustdo_list category: "NotACategory"
		expect(page).to have_content("error")
		expect(MustdoList.count).to eq(0)

		visit "/mustdo_lists"
		expect(page).to_not have_content "The girl and the goat"
	end

	it "displays an error when the must-do list has no description" do
		expect(MustdoList.count).to eq(0)

		create_a_mustdo_list description: ""

		expect(page).to have_content("error")
		expect(MustdoList.count).to eq(0)

		visit "/mustdo_lists"
		expect(page).to_not have_content "The girl and the goat"
	end
end