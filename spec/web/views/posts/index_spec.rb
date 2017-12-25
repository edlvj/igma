require_relative '../../../spec_helper'

describe Web::Views::Posts::Index do
  let(:exposures) { Hash[posts: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/posts/index.html.haml') }
  let(:view)      { Web::Views::Posts::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #posts' do
    expect(view.posts).to eq(exposures.fetch(:posts))
  end
end
