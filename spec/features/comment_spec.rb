require 'rails_helper'

describe "the add comment process", js: true do
  it "adds a new comment to a post" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post, user: user)
    visit post_path(post)
    click_on "Add Comment"
    fill_in 'Content', :with => "test comment"
    click_on 'Create Comment'
    expect(page).to have_content 'test comment'
  end

  it "sends a message to the post author when a comment is added" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post, user: user)
    visit post_path(post)
    click_on "Add Comment"
    fill_in "Content", :with => "test comment"
    click_on 'Create Comment'
    expect(page).to have_content 'SMS'
  end

  it "gives an error when a field is not filled in" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post, user: user)
    visit post_path(post)
    click_on "Add Comment"
    click_on "Create Comment"
    expect(page).to have_content 'blank'
  end
end

describe "the edit comment process", js: true do
  it "edits a comment" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post, user: user)
    comment = FactoryGirl.create(:comment, post: post, user: user)
    visit post_path(post)
    click_on 'Edit'
    click_on 'Update Comment'
    expect(page).to have_content 'Test Content'
  end
end

describe "the destroy comment process", js: true do
  it "permanentely deletes a comment" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    post = FactoryGirl.create(:post, user: user)
    comment = FactoryGirl.create(:comment, post: post, user: user)
    visit post_path(post)
    click_on 'Delete'
    :confirm
    expect(page).not_to have_content 'Test Content'
  end
end
