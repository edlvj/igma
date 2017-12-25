require_relative '../../../spec_helper'

describe Web::Views::Trackings::Destroy do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/trackings/destroy.html.haml') }
  let(:view)      { Web::Views::Trackings::Destroy.new(template, exposures) }
  let(:rendered)  { view.render }

end
