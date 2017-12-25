require_relative '../../../spec_helper'

describe Web::Views::Posts::Show do
  let(:exposures) { Hash[post: { media_id: '23232323', likes_count: 23, image_url: 'dsdsd' } ] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/posts/show.html.haml') }
  let(:view)      { Web::Views::Posts::Show.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #post' do
     expect(view.post).to eq(exposures.fetch(:post))
  end
end
