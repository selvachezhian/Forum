require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should ensure_length_of(:first_name).is_at_most(100) }
  it { should ensure_length_of(:last_name).is_at_most(100) }
  it { should ensure_length_of(:email).is_at_most(200) }

  it { should allow_value('selvachezhian@kreatio.com', 'selvachezhian.labam@gmail.com', 'abc@xyz.co.uk', 'selva-chezhian@yahoo.com.sg').for(:email) }
  it { should_not allow_value('invalid').for(:email) }

  context 'functionality' do

    new_user = { first_name: 'First Name', last_name: 'Last Name', email: 'new-user@email.com', password: 'password' }

    it 'full_name should be a concatenation of first and last name' do
      user = User.create(new_user)
      expect(user.full_name).to eq('First Name Last Name')
    end

    it 'should encrypt the password before saving' do
      user = User.create(new_user)
      expect(user.password).to eq(Digest::MD5.hexdigest('password'))
    end
  end
end
