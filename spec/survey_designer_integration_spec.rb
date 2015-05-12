require('capybara/rspec')
require('./app')
require('pry')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path to designing and taking surveys', {:type => :feature}) do
  it('allows user to add new survey') do
    visit('/')
    test_survey = Survey.new({:title => 'Basic Math'})
    test_survey.save()
    click_link('Create new survey')
    expect(page).to have_content('Basic Math')
  end
  it('allows user to update a survey') do
    test_survey = Survey.new({:title => 'Basic Math'})
    test_survey.save()
    visit('/surveys')
    click_link("Update this survey")
    fill_in('title', :with => 'Hard math')
    click_button('Update Survey')
    expect(page).to have_content('Hard math')
  end
  it('allows user to delete a survey') do
    test_survey = Survey.new({:title => 'Basic Math'})
    test_survey.save()
    visit('/surveys')
    click_link("Update this survey")
    click_button('Delete Survey')
    expect(page).to have_content('You currently have no surveys!')
  end
  it('allows user to add, update and delete questions') do
    test_survey = Survey.new({:title => 'Basic Math'})
    test_survey.save()
    #test_question = Question.new({:description => "What is 2 + 2", :answer => 4})
    visit('/surveys')
    click_link("Basic Math")
    click_link("Update this question")
    #
    expect(page).to have_content('Hard math')
  end

end
