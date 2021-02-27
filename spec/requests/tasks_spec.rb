require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user) {create :user}

  
  describe "GET" do
    before(:each) {sign_in user}
    describe "/tasks" do
      it "works! (now write some real specs)" do
        get tasks_path
        expect(response).to have_http_status(200)
      end
    end
    describe "/tasks/new" do
      it "works" do
        get new_task_path
        expect(response).to render_template(:new)
      end
    end
  end
  describe "POST" do
    before(:each) {sign_in user}
    describe "/tasks/new" do
      let(:category) {create :category}
      let(:participant) {create :user}
      let(:params) do
        {
          "task"=>
          {
            "name"=>"test 7", 
            "due_date"=>Date.today+5.days, 
            "category_id"=>category.id.to_s, 
            "description"=>"descripcion test", 
            "participating_users_attributes"=>
            {
              "1614355438664"=>
              {
                "user_id"=>participant.id.to_s, 
                "role"=>"1", 
                "_destroy"=>"false"
              }
            }
          }
        }
      end
      it 'creates a new task and redirect to show page' do
        post "/tasks", params: params

        expect(response).to redirect_to(assigns(:task))
        follow_redirect!

        expect(response).to render_template(:show)
        expect(response.body).to include('Task was successfully created.')
      end
    end
  end
end
