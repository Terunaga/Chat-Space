require 'rails_helper'

RSpec.describe Groups::MessagesController, type: :controller do
  before { login_user }

  let(:user)    { create(:user) }
  let(:group)   { create(:group) }
  let(:message) { create(:message) }
  let(:params) {{
    id: message.id,
    message: attributes_for(:message, text: 'hoge')
  }}
  let(:invalid_params) {{
    id: message.id,
    message: attributes_for(:message, text: nil)
  }}

  describe 'GET #index' do
    before do
      get :index, group_id: group
    end

    it 'assigns the requested message to @message' do
      expect(assigns(:message)).to be_a_new Message
    end

    it 'assigns the requested messages to @messages' do
      expect(assigns(:messages)).to include message
    end

    it 'assigns the requested group to @group' do
      expect(assigns(:group)).to eq group
    end

    it 'assigns the requested groups to @groups' do
      expect(assigns(:groups)).to include group
    end

    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'with valid pamras' do
      before do
        post :create, params
      end

      it 'saves the new message into the database' do
        expect { post :create, params }.to change(Message, :count).by(1)
      end

      it 'shows a flash message to show message was saved successfully' do
        expect(flash[:notice]).to eq 'Message was successfully posted.'
      end

      it 'redirects to group_messages_path' do
        expect(response).to redirect_to group_messages_path(group)
      end

    end

    context 'with invalid params' do
      before do
        post :create, invalid_params
      end

      it 'does not save the new message into the database' do
        expect { post :create, invalid_params }.not_to change(Message, :count)
      end

      it 'shows a flash message to show message was not saved successfully' do
        expect(flash[:alert]).to eq 'Textを入力してください。'
      end

      it 'redirects to group_messages_path' do
        expect(response).to redirect_to group_messages_path(group)
      end
    end
  end
end
