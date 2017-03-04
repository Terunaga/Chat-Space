require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    context 'with valid attributes' do
      it 'is valid with all information' do
        expect(build(:message)).to be_valid
      end
    end

    context 'without valid attributes' do
      it 'is invalid without text attribute' do
        message = build(:message, text: nil)
        message.valid?
        expect(message.errors[:text]).to include 'を入力してください。'
      end

      it 'is invalid without group_id attribute' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group_id]).to include 'を入力してください。'
      end

      it 'is invalid without user_id attribute' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user_id]).to include 'を入力してください。'
      end
    end
  end
end
