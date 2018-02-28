require_relative 'updaters/standard_updater'

# stores all updaters for each type
class UpdaterRepository
  def initialize
    @updaters = {}
  end

  def add_updater(matcher, updater)
    @updaters[matcher] = updater
    self
  end

  def get_updater(item)
    matched_updater = false
    @updaters.each do |matcher, updater|
      matched_updater = updater if matcher.matches? item
      break if matched_updater
    end
    matched_updater ? matched_updater : StandardUpdater.new
  end
end