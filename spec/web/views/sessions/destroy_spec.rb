require_relative '../../../spec_helper'

describe Web::Views::Sessions::Destroy do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/sessions/destroy.html.haml') }
  let(:view)      { Web::Views::Sessions::Destroy.new(template, exposures) }
  let(:rendered)  { view.render }

end
