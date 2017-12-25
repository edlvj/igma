require "spec_helper"

RSpec.describe Web::Views::ApplicationLayout, type: :view do
  let(:exposures) { Hash[logged: []] }
  let(:template) { Hanami::View::Template.new('apps/web/templates/application.html.haml') }
  let(:layout)   { Web::Views::ApplicationLayout.new(template, exposures) }
  let(:rendered) { layout.render }

end
