require 'spec_helper'
require 'rails_helper'

describe MoviesController do
  describe 'find similar movies' do
    it 'should pass correct params when link clicked' do
      @fake_result = double('movie1')
      @fake_set = [double('movie2'), double('movie3')]
      expect(Movie).to receive(:find).and_return(@fake_result)
      allow(@fake_result).to receive(:director).and_return('Spielberg')
      expect(Movie).to receive(:movies_by_director).and_return(@fake_set)
      get :find_by_director
      expect(response.location).to match('/movies/')
    end
  end
  
  describe 'edit director' do
    it 'should use the edit method when updating director' do
      expect(controller).to receive(:edit)
      get :edit, id: 1
    end
    it 'should receive the show route in show method' do
      @movie = Movie.create(title: "Aladdin")
      @movie.save
      @fake_set = [double('movie2'), double('movie3')]
      expect(controller).to receive(:show)
      get :show, id: 1, params: {similar_movies: @fake_set}
      expect(assigns(:similar_movies)).to eq(nil)
    end
    it 'passes the correct params' do
      @movie = Movie.create(title: "Aladdin")
      @movie.save
      @fake_set = [double('movie2'), double('movie3')]
      get :show, id: 1, params: {similar_movies: @fake_set}
      expect(assigns(:similar_movies)).to eq(nil)
    end
  end
end