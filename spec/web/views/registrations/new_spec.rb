require_relative '../../../spec_helper'

describe Web::Views::Registrations::New do
  let(:exposures) { Hash[] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/registrations/new.html.haml') }
  let(:view)      { Web::Views::Registrations::New.new(template, exposures) }
  let(:rendered)  { view.render }
end
