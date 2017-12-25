require_relative '../../../spec_helper'

describe Web::Views::Trackings::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/trackings/create.html.haml') }
  let(:view)      { Web::Views::Trackings::Create.new(template, exposures) }
  let(:rendered)  { view.render }
end
