require 'rails_helper'

describe "the add comment process" do
  it "adds a new comment to a post" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post, user: user)
    visit post_path(post)
    fill_in 'Content', :with => "Mmmm...brains."
    click_on 'Create Comment'
    expect(page).to have_content 'successfully'
  end

  it "gives an error when a field is not filled in" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post, user: user)
    visit new_post_comment_path(post)
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end
end

describe "the edit comment process" do
  it "edits a comment" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post, user: user)
    comment = FactoryGirl.create(:comment, post: post, user: user)
    visit post_path(post)
    click_on 'Edit'
    click_on 'Update Comment'
    expect(page).to have_content 'successfully'
  end
end

describe "the destroy comment process" do
  it "permanentely deletes a comment" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post, user: user)
    comment = FactoryGirl.create(:comment, post: post, user: user)
    visit post_path(post)
    click_on 'Delete'
    :confirm
    expect(page).to have_content 'permanently'
  end
end
