require 'rails_helper'

RSpec.feature 'MakeAndModels', type: :feature do

it "should show the text 'Welcome to the Car Simulator' on the page", js: true do
  visit 'car/new_car'
  expect(page).to have_content('Welcome to the Car Simulator')
end

it 'should ask(input text) for make and year of the car to be simulated.', js: true do
  visit 'car/new_car'
  expect(page).to have_field('make')
  expect(page).to have_field('year')
end
 it 'should, after entering make and year and clicking on a button labelled Simulate Car, take me to a status page', js: true do
   visit_car_page_fill_make_and_year
   click_button 'Simulate Car'
   expect(page.current_path). to eq('/simulator/create_car')
 end
it 'should have the simulator/create_car page display the make and year of car', js: true do
  visit_car_page_fill_make_and_year
  click_button 'Simulate Car'
  expect(page).to have_content('Toyota 2002')
end

it 'should reload the same page if incorrect information is entered for make and year', js: true do
  visit 'car/new_car'
  within('form#make_year') do
    fill_in('make', with: '' )
    fill_in('year', with: '' )
  end
    click_button 'Simulate Car'
    expect(page.current_path). to eq('/car/new_car')
end

it 'should go to simulator/create_car page if the inputs are filled in correctly', js: true do
visit_car_page_fill_make_and_year
click_button 'Simulate Car'
expect(page.current_path). to eq('/simulator/create_car')
end

it 'I visit the status page for a selected car, it shows whether the lights on the car is on or off. They start off. but can be toggled', js: true do
  visit_car_page_fill_make_and_year
  click_button 'Simulate Car'
  expect(page).to have_content('off')
  click_button 'Light Switch'
  expect(page).to have_content('on')
  click_button 'Light Switch'
  expect(page).to have_content('off')
end

it 'when I visit the car status page, I can see the cars current speed. It starts a zero.', js: true do
  visit_car_page_fill_make_and_year
  click_button 'Simulate Car'
  expect(page).to have_content('Speed: 0')
end

it 'when you click the speed button, speed should increase by 10', js: true do
  visit_car_page_fill_make_and_year
  click_button 'Simulate Car'
  click_button 'Speed'
  expect(page).to have_content('Speed: 10')
  click_button 'Speed'
  expect(page).to have_content('Speed: 20')

end

it 'when you click brake button, speed decreases and does not go below 0', js: true do
  visit_car_page_fill_make_and_year
  click_button 'Simulate Car'
  click_button 'Speed'
  click_button 'Brake'
  expect(page).to have_content('Speed: 4')
  click_button 'Brake'
    expect(page).to have_content('Speed: 0')
end

it 'can toggle on and off a parking brake using a radio button that keeps speed from increasing', js: true do
  visit_car_page_fill_make_and_year
  click_button 'Simulate Car'
  choose 'park_on'
  click_button 'Parking Brake'
  click_button 'Speed'
  expect(page).to have_content('Speed: 0')
  choose 'park_off'
  click_button 'Parking Brake'
  click_button 'Speed'
  expect(page).to have_content('Speed: 10')
end

def pic
  screenshot_and_open_image
end

def visit_car_page_fill_make_and_year
  visit 'car/new_car'
  within('form#make_year') do
    fill_in('make', with: 'Toyota' )
    fill_in('year', with: '2002' )
  end
end




end
