require_relative '../../../spec_helper'

describe Web::Views::Sessions::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/sessions/new.html.haml') }
  let(:view)      { Web::Views::Sessions::New.new(template, exposures) }
  let(:rendered)  { view.render }
end
