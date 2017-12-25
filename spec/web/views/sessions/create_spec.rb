require_relative '../../../spec_helper'

describe Web::Views::Sessions::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/sessions/create.html.haml') }
  let(:view)      { Web::Views::Sessions::Create.new(template, exposures) }
  let(:rendered)  { view.render }

end
