require_relative '../../../spec_helper'

describe Web::Views::Trackings::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/trackings/new.html.haml') }
  let(:view)      { Web::Views::Trackings::New.new(template, exposures) }
  let(:rendered)  { view.render }
end
