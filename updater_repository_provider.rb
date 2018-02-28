require_relative 'updaters/conjured_updater'
require_relative 'updaters/legendary_updater'
require_relative 'updaters/pass_updater'
require_relative 'updaters/maturing_updater'
require_relative 'matchers/expression_matcher'
require_relative 'updater_repository'

# provides the updater repository
class UpdaterRepositoryProvider
  attr_accessor :updater_repository

  MATCHERS = {
    ExpressionMatcher.new(proc { |item| item.name.include? 'Sulfuras' }) => LegendaryUpdater.new,
    ExpressionMatcher.new(proc { |item| item.name.include? 'Backstage passes' }) => PassUpdater.new,
    ExpressionMatcher.new(proc { |item| item.name.include? 'Conjured' }) => ConjuredUpdater.new,
    ExpressionMatcher.new(proc { |item| item.name.include? 'Aged Brie' }) => MaturingUpdater.new,
  }.freeze

  def initialize
    @updater_repository = UpdaterRepository.new
    MATCHERS.each do |matcher, updater|
      @updater_repository.add_updater(matcher, updater)
    end
  end
end