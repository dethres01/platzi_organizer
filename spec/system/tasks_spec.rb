require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  let(:user) {create :user}
  before(:each) {sign_in user}

  describe 'GET /tasks' do
    it 'has the correct title' do
      visit '/tasks'
      expect(page).to have_content 'Lista de Tareas'
    end
  end
  describe 'POST /tasks/new' do
    let!(:category){create :category}
    it 'has the correct title' do
      visit '/tasks/new'
      expect(page).to have_content 'Nueva Tarea'
    end
    it 'has to fill in',js:true do
      visit '/tasks/new'
      fill_in('task[name]', with: 'Tarea Capybara 1')
      fill_in('task[due_date]', with: Date.today+5.days)
      fill_in('task[description]', with: 'descripcion Tarea Capybara 1')
      select(category.name,from: 'task[category_id]')
      click_link('Agregar un participante')
      binding.pry
    end
  end
end
