module Support
  module FormHelper
    def fill_sign_up_form(form_id, options)
      within form_id do
        fill_in 'user[name]',  with: options[:name]
        fill_in 'user[email]', with: options[:email]
        fill_in 'user[password]', with: options[:password]

        click_button 'Sign up'
      end
    end

    def fill_sign_in_form(form_id, options)
      within form_id do
        fill_in 'session[email]', with: options[:email]
        fill_in 'session[password]', with: options[:password]

        click_button 'Sign in'
      end
    end

    def fill_search_form(form_id, option)
      within form_id do
        fill_in 'search[username]',  with: option
        click_button 'Search'
      end
    end
  end
end