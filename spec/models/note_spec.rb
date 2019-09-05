require 'rails_helper'

RSpec.describe Note, type: :model do
  
  # 9章 モック(double)とスタブ(allow)
  # データベースにアクセスしないので処理が速くなる
  # テストデータの代役になる
  
  it "delegatea name to the user who created it" do
    user = FactoryBot.create(:user, first_name: "Fake", last_name: "User")
    note = Note.new(user: user)
    
    expect(note.user_name).to eq "Fake User"
  end
  
  # このテストは失敗する
  # it "delegatea name to the user who created it" do
  #   user = double("user", name: "Fake User")
  #   note = Note.new
  #   allow(:note).to receive(:user).and_return(user)
    
  #   expect(note.user_name).to eq "Fake User"
  #   expect(note.user.first_name).to eq "Fake"
  # end
  
  # 検証機能付きテストダブル
  it "delegatea name to the user who created it" do
   user = instance_double("User", name: "Fake User")
   note = Note.new
   allow(note).to receive(:user).and_return(user)
   
   expect(note.user_name).to eq "Fake User"
  end
  
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  # 8章 let
  
  # let(:user) { FactoryBot.create(:user) }
  # let(:project) { FactoryBot.create(:project, owner: user) }
  
  # it "is valid with a user, project, and message" do
  #   note = Note.new(message: "This is a sample note", user: user, project: project)
  #   expect(note).to be_valid
  # end
  
  # it "is invalid without a message" do
  #   note = Note.new(message: nil)
  #   note.valid?
    
  #   expect(note.errors[:message]).to include("can't be blank")
  # end
  
  # describe "search messagefor a term" do
  #   let!(:note1) { FactoryBot.create(:note, project: project, user: user, message: "This is the first note.") }
  #   let!(:note2) { FactoryBot.create(:note, project: project, user: user, message: "This is the second note.") }
  #   let!(:note3) { FactoryBot.create(:note, project: project, user: user, message: "First, preheat the oven.")}
    
  #   context "when a match is found" do
  #     it "returns notes that match the search term" do
  #       expect(Note.search("first")).to include(note1, note3)
  #     end
  #   end
    
  #   context "when no match is found" do
      
  #     it "returns an empty collection" do
  #       expect(Note.search("message")).to be_empty
  #     end
      
  #     it "returns an empty collection" do
  #       expect(Note.search("message")).to be_empty
  #       expect(Note.count).to eq 3
  #     end
      
  #   end
  # end
  
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  # it "generates associated date from a factory" do
  #   note = FactoryBot.create(:note)
    
  #   puts "This note's project is #{note.project.inspect}"
  #   puts "This note's user is #{note.user.inspect}"
  # end
  
  # context before 練習
  
  # before do
  #   @user = User.create(
  #     first_name: "Joe",
  #     last_name: "Tester",
  #     email: "joetester@example.com",
  #     password: "dottle-nouveau-pavilion-tights-furze"
  #   )
    
  #   @project = @user.projects.create(
  #     name: "Test Project"
  #   )
  # end
  
  # it "is valid with a user, project, and message" do
  #   note = Note.new(
  #     message: "This is a sample note.",
  #     user: @user,
  #     project: @project
  #   )
    
  #   expect(note).to be_valid
  # end
  
  # it "is invalid without a message" do
  #   note = Note.new(message: nil)
    
  #   note.valid?
    
  #   expect(note.errors[:message]).to include("can't be blank")
  # end
  
  # describe "search message for a term" do
    
  #   before do
  #     @note1 = @project.notes.create(
  #       message: "This is the first note.",
  #       user: @user
  #     )
      
  #     @note2 = @project.notes.create(
  #       message: "This is the second note.",
  #       user: @user
  #     )
      
  #     @note3 = @project.notes.create(
  #       message: "First, preheat the oven.",
  #       user: @user
  #     )
  #   end
    
  #   context "when a match is found" do
  #     it "returns notes that match the search term" do
  #       expect(Note.search("first")).to include(@note1, @note3)
  #     end
  #   end
    
  #   context "when no match is found" do
  #     it "results an empty collection" do
  #       expect(Note.search("message")).to be_empty
  #     end
  #   end
  # end
  
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  # 普通
  
  # it "returns notes that match the search term" do
  #   user = User.create(
  #     first_name: "Joe",
  #     last_name:  "Tester",
  #     email:      "joetester@example.com",
  #     password:   "dottle-nouveau-pavilion-tights-furze"
  #   )
    
  #   project = user.projects.create(
  #     name: "Test Project"
  #   )
    
  #   note1 = project.notes.create(
  #     message: "This is the first note.",
  #     user: user
  #   )
    
  #   note2 = project.notes.create(
  #     message: "This is the second note.",
  #     user: user
  #   )
    
  #   note3 = project.notes.create(
  #     message: "First, preheat the oven.",
  #     user: user
  #   )
    
  #   expect(Note.search("first")).to include(note1, note3)
  #   expect(Note.search("first")).to_not include(note2)
  # end
  
  # it "returns an empty collection when no results are found" do
  #   user = User.create(
  #     first_name: "Joe",
  #     last_name:  "Tester",
  #     email:      "joetester@example.com",
  #     password:   "dottle-nouveau-pavilion-tights-furze"
  #   )
    
  #   project = user.projects.create(
  #     name: "Test Project"
  #   )
    
  #   note1 = project.notes.create(
  #     message: "This is the first note."
  #   )
    
  #   note2 = project.notes.create(
  #     message: "This is the second note.",
  #     user: user
  #   )
    
  #   note3 = project.notes.create(
  #     message: "First, preheat the oven.",
  #     user: user
  #   )
    
  #   expect(Note.search("message")).to be_empty
  # end
end
