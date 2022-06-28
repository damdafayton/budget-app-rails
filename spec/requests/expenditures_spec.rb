require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/expenditures', type: :request do
  before :each  do
    @user = User.all[0]
    sign_in @user
  end
  # This should return the minimal set of attributes required to create a valid
  # Expenditure. As you add validations to Expenditure, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {name: 'Pizza', amount: 4.8, author_id: @user.id}
  end

  let(:invalid_attributes) do
    {name: 'Pizza'}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Expenditure.create! valid_attributes
      get expenditures_url
      expect(response.body).to include('Pizza')
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      expenditure = Expenditure.create! valid_attributes
      get expenditure_url(expenditure)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_expenditure_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      expenditure = Expenditure.create! valid_attributes
      get edit_expenditure_url(expenditure)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Expenditure' do
        expect do
          post expenditures_url, params: { expenditure: valid_attributes }
        end.to change(Expenditure, :count).by(1)
      end

      it 'redirects to the created expenditure' do
        post expenditures_url, params: { expenditure: valid_attributes }
        expect(response).to redirect_to(expenditure_url(Expenditure.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Expenditure' do
        expect do
          post expenditures_url, params: { expenditure: invalid_attributes }
        end.to change(Expenditure, :count).by(0)
      end

      # it "renders a response with 422 status (i.e. to display the 'new' template)" do
      #   post expenditures_url, params: { expenditure: invalid_attributes }
      #   expect(response).to have_http_status(:unprocessable_entity)
      # end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {name: 'Pizza', amount: 99999, author_id: @user.id}
      end

      # it 'updates the requested expenditure' do
      #   expenditure = Expenditure.create! valid_attributes
      #   patch expenditure_url(expenditure), params: { expenditure: new_attributes }
      #   expenditure.reload
      #   expect(response.body).to include('99999')
      # end

      it 'redirects to the expenditure' do
        expenditure = Expenditure.create! valid_attributes
        patch expenditure_url(expenditure), params: { expenditure: new_attributes }
        expenditure.reload
        expect(response).to redirect_to(expenditure_url(expenditure))
      end
    end

    context 'with invalid parameters' do
      # it "renders a response with 422 status (i.e. to display the 'edit' template)" do
      #   expenditure = Expenditure.create! valid_attributes
      #   patch expenditure_url(expenditure), params: { expenditure: invalid_attributes }
      #   expect(response).to have_http_status(:unprocessable_entity)
      # end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested expenditure' do
      expenditure = Expenditure.create! valid_attributes
      expect do
        delete expenditure_url(expenditure)
      end.to change(Expenditure, :count).by(-1)
    end

    it 'redirects to the expenditures list' do
      expenditure = Expenditure.create! valid_attributes
      delete expenditure_url(expenditure)
      expect(response).to redirect_to(expenditures_url)
    end
  end
end
