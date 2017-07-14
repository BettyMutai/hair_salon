require('capybara/rspec')
  require('./app')
  require('spec_helper')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('adding a new stylist',{:type => :feature}) do
    it('allows a salon to add a new stylist') do
    visit('/')
    fill_in('stylist_name', :with => 'George')
    click_button('Add Stylist')
    expect(page).to have_content('Hair Salon')
  end
 end
 describe('viewing all the stylists', {:type => :feature}) do
   it('allows a salon to see all the stylists') do
     stylist = Stylist.new({:stylist_name => 'George', :id => nil})
     stylist.save()
     visit('/')
     expect(page).to have_content(stylist.stylist_name)
   end
 end
 describe('seeing details of a single stylist',{:type => :feature}) do
   it('allows a salon to click a stylist and see their clients') do
     test_stylist = Stylist.new({:stylist_name => 'George', :id => nil})
     test_stylist.save()
     test_client = Client.new({:client_name => 'Paul', :contact => '0722456283', :stylist_id => test_stylist.id()})
     test_client.save()
     visit('/')
     click_link(test_stylist.stylist_name())
     expect(page).to have_content(test_client.client_name)
   end
 end
 describe('adding clients to a stylist', {:type => :feature}) do
   it('allows the salon to add clients to a specific stylist') do
     test_stylist = Stylist.new({:sylist_name => 'George', :id => nil})
     test_stylist.save()
     visit('/')
     fill_in("Name of Client:", {:with => "Paul"})
     click_button("Add Client")
     expect(page).to have_content("Clients")
   end
 end
