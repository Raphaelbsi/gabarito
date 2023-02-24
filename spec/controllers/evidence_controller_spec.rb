require 'rails_helper'

RSpec.describe EvidencesController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { evidence: { name: 'Evidence of Math' } } }

      it 'creates a new evidence' do
        expect do
          post :create, params: valid_params
        end.to change(Evidence, :count).by(1)
      end

      it 'redirects to the created Evidence' do
        post :create, params: valid_params
        expect(response).to redirect_to(evidence_path(assigns[:evidence]))
      end

      it 'sets a success notice' do
        post :create, params: valid_params
        expect(flash[:notice]).to eq('Prova criada com sucesso!')
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { evidence: { name: '' } } }

      it 'does not create a new prova' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Evidence, :count)
      end

      it 're-renders the new template' do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end
end
