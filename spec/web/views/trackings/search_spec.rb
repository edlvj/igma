require_relative '../../../spec_helper'

describe Web::Views::Trackings::Search do
  let(:exposures) { Hash[users: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/trackings/search.html.haml') }
  let(:view)      { Web::Views::Trackings::Search.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #users' do
    expect(view.users).to eq(exposures.fetch(:users))
  end
end
