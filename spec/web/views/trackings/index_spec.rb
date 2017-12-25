require_relative '../../../spec_helper'

describe Web::Views::Trackings::Index do
  let(:exposures) { Hash[trackings: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/trackings/index.html.haml') }
  let(:view)      { Web::Views::Trackings::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #trackings' do
    expect(view.trackings).to eq(exposures.fetch(:trackings))
  end
end
