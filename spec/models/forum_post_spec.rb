require 'spec_helper'

describe ForumPost do
  #pending "add some examples to (or delete) #{__FILE__}"

  context 'validations' do
    before(:each) do
      @new_post = { description: 'Description1' }
    end

    it 'description should not be empty' do
      invalid_post = ForumPost.new(@new_post.merge(description: ''))
      invalid_post.should_not be_valid
    end
  end

  context 'functionality' do

    before(:each) do
      @new_thread = { name: 'Thread1', description: 'Description1' }
      @new_post = { description: 'Description1' }

      @forum = Forum.create!(name: 'Forum with threads and posts and replies')
      @forum_thread = @forum.forum_threads.create!(@new_thread)
      @forum_post = @forum_thread.forum_posts.create!(@new_post)
    end

    # functionality
    it 'should update post count on thread table by one on creation' do
      @forum_thread.reload
      expect(@forum_thread.forum_posts_count).to eq(1)
    end

    it 'should update post count on forum table by one on creation' do
      @forum.reload
      expect(@forum.no_of_posts).to eq(1)
    end

    it 'should not have thread id 0 for replies' do
      reply = @forum_post.create_reply({ description: 'Reply for post1' })
      expect(reply.forum_thread_id).not_to eq(0)
    end

    it 'should have same thread id for replies' do
      reply = @forum_post.create_reply({ description: 'Reply for post1' })
      expect(reply.forum_thread_id).to eq(@forum_post.forum_thread_id)
    end

    it 'should have same post id on parent_id for replies' do
      reply = @forum_post.create_reply({ description: 'Reply for post1' })
      expect(reply.parent_id).to eq(@forum_post.id)
    end
  end
end
