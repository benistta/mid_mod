require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many(:movie_actors) }
    it { should have_many(:movies).through :movie_actors }
  end

  describe 'class methods' do
    it 'actors by age' do
      ford = Actor.create(name: 'Harrison Ford', age: 78)
      kilmer = Actor.create(name: 'Val Kilmer', age: 68)

      expected = [kilmer, ford]
      expect(Actor.by_age).to eq(expected)
    end
  end
end
