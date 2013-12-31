require 'spec_helper'
#require 'forum_thread'

describe ForumThread do
  context 'thread validations' do

    new_thread = { name: 'Thread1', description: 'Description1' }

    # validations
    it 'name and description should not be empty' do
      invalid_thread = ForumThread.new(new_thread.merge(name: '', description: ''))
      invalid_thread.should_not be_valid
    end

    it 'name should not be empty' do
      invalid_thread = ForumThread.new(new_thread.merge(name: ''))
      invalid_thread.should_not be_valid
    end

    it 'name should not exceed 200 characters' do
      invalid_thread = ForumThread.new(new_thread.merge(name: "#{SecureRandom.hex * 7}"))
      invalid_thread.should_not be_valid
    end

    it 'description should not be empty' do
      invalid_thread = ForumThread.new(new_thread.merge(description: ''))
      invalid_thread.should_not be_valid
    end
  end

  context 'functionality' do
    new_thread = { name: 'Thread1', description: 'Description1' }

    # functionality
    it 'should update thread count on forum table by one on creation' do
      forum = Forum.create!(name: 'Forum with threads')
      expect(forum.forum_threads_count).to eq(0)

      forum.forum_threads.create!(new_thread)
      forum.reload
      expect(forum.forum_threads_count).to eq(1)
    end
  end

end