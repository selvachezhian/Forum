require 'spec_helper'
require 'forum'

describe Forum do
  context 'forum validations' do

    new_forum = { name: 'Forum1' }

    # validations
    it 'should require forum name' do
      invalid_forum = Forum.new(new_forum.merge(name: ''))
      invalid_forum.should_not be_valid
    end

    it 'name should not exceed 200 characters' do
      invalid_forum = Forum.new(new_forum.merge(name: "#{SecureRandom.hex * 7}"))
      invalid_forum.should_not be_valid
    end

    #it 'should require forum name2' do
    #  expect(Forum.new).to have(1).errors_on(:name)
    #end

    it 'should have 0 threads when created' do
      forum = Forum.create!(new_forum)
      expect(forum.forum_threads_count).to eq(0)
    end
  end
end