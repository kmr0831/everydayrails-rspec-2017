require 'rails_helper'

RSpec.describe "Projects", type: :request do
  # describe "GET /projects" do
  #   it "works! (now write some real specs)" do
  #     get projects_path
  #     expect(response).to have_http_status(200)
  #   end
  # end
  
  context "as an authenticated user" do
    
    before do
      @user = FactoryBot.create(:user)
    end
    
    context "with a valid attributes" do
      
      it "adds a project" do
        project_params = FactoryBot.attributes_for(:project)
        sign_in @user
        
        expect { post projects_path, params: { project: project_params } }.to change(@user.projects, :count).by(1)
      end
      
    end
    
    context "with a invalid attributes" do
      
      it "does not add a project" do
        project_params = FactoryBot.attributes_for(:project, :invalid)
        sign_in @user
        
        expect { post projects_path, params: { project: project_params } }.to_not change(@user.projects, :count)
      end
      
    end
    
  end
  
end
