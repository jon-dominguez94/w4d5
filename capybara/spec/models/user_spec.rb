require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create!(username: 'jon', password: 'password')}

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }

    it { should validate_uniqueness_of(:username) }

    context 'session_token tests' do
      it 'assigns the session_token if one is not given' do
        savio = User.create(username: 'savio', password: 'password')
        expect(savio.session_token).not_to be_nil
      end
    end

    context 'password digest' do
      it 'assigns password digest given a password' do
        expect(user.password_digest).not_to be_nil
        expect(user.password_digest).not_to eq('password')
      end

      it 'does not store the password' do
        expect(user.password).to be_nil
      end
    end

  end

  describe '::find_by_credentials' do
    it 'finds a user' do
      user2 = User.find_by_credentials('jon', 'password')
      expect(user.id).to eq(user2.id)
    end
  end
end
