require_relative '../../../spec_helper'

describe Web::Views::Registrations::Create do
  let(:exposures) { Hash[] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/registrations/create.html.haml') }
  let(:view)      { Web::Views::Registrations::Create.new(template, exposures) }
  let(:rendered)  { view.render }
end
