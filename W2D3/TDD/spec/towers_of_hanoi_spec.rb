require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe '#move' do
    it 'move a piece to another pile' do
      game.move(0, 1)
      expect(game.piles).to eq([[2, 3], [1], []])
    end

    it "doesn't allow bigger piece to be above a smaller piece" do
      game.move(0, 2)
      expect { game.move(0, 2) }.to raise_error(StandardError)
    end
  end

  describe '#won' do
    it "doesn't return true for the first pile" do
      expect(game.won?).to be false
    end

    it 'returns true when a different pile is full' do
      game.piles = [[], [1, 2, 3], []]
      expect(game.won?).to be true
    end
  end
end
