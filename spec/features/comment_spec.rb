require 'rails_helper'

describe "the add comment process" do
  it "adds a new comment to a post" do
    post = Post.create({ title: "Zombies", body: "They're what's for dinner."})
    visit post_path(post)
    fill_in 'Name', :with => "Tandy"
    fill_in 'Content', :with => "Mmmm...brains."
    click_on 'Create Comment'
    expect(page).to have_content 'successfully'
  end

  it "gives an error when a field is not filled in" do
    post = Post.create({ title: "Zombies", body: "They're what's for dinner."})
    visit new_post_comment_path(post)
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end
end

describe "the edit comment process" do
  it "edits a comment" do
    post = Post.create({ title: "Zombies", body: "They're what's for dinner." })
    comment = post.comments.create({ name: "Peter", content: "MMMM...brains." })
    visit post_path(post)
    click_on 'Edit'
    click_on 'Update Comment'
    expect(page).to have_content 'successfully'
  end
end

describe "the destroy comment process" do
  it "permanentely deletes a comment" do
    post = Post.create({ title: "Zombies", body: "They're what's for dinner."})
    comment = post.comments.create({ name: "Peter", content: "MMMM...brains." })
    visit post_path(post)
    click_on 'Delete'
    :confirm
    expect(page).to have_content 'permanently'
  end
end
