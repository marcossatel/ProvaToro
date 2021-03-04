Before do
  @home = HomePage.new
  @login = LoginPage.new

  page.current_window.resize_to(1440, 900)
end

After do |scenario|
  sleep 2
  tira_print(scenario)

  tem = page.has_css?('#userMenu')

  if tem
    visit '/sair'
    wait_until_css('.swal2-modal')
  end
end


def tira_print(scenario)
  nome = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
  nome = nome.tr(' ', '_').downcase!
  screenshot = "log/screenshots/#{nome}.png"
  page.save_screenshot(screenshot)
  #embed(screenshot, 'image/png', 'Ta aqui o print :)')
  attach(screenshot, 'image/jpeg;base64')

end


