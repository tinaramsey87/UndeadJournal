require 'rails_helper'

describe "the add new post process" do
  it "adds a new post" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit posts_path
    click_on 'add one?'
    fill_in 'Title', :with => "Zombies"
    fill_in 'Body', :with => "They're what's for dinner."
    click_on 'Create Post'
    expect(page).to have_content 'successfully'
  end

  it "gives an error when a field is not filled in" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit new_post_path
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end
end

describe "the edit post process" do
  it "edits a current post" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post, user: user)
    visit post_path(post)
    click_on 'Edit this post'
    fill_in 'Body', :with => "They're a good protein source."
    click_on 'Update Post'
    expect(page).to have_content 'successfully'
  end
end

describe "the destroy post process" do
  it "permanentely deletes a post" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post, user: user)
    visit post_path(post)
    click_on 'Delete this post'
    :confirm
    expect(page).to have_content 'permanently'
  end
end
