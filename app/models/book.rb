class Book < ActiveRecord::Base
  # Scopes allow us to make queries which can be referenced as 
  # method calls on the model. They work like class methods:
  #     scope :finished, lambda { where('finished_on IS NOT NULL') }
  # We can make it not so SQL:"
  scope :finished, lambda { where.not(:finished_on => nil) }

  # Another syntax for lambdas:
  scope :recent, -> { where('finished_on > ?', 2.days.ago) }
  
  # Let's rewrite ':recent' as a class method:
  # 
  # def self.recent
  #   where('finished_on > ?', 2.days.ago)
  # end

  def finished?
    finished_on.present? 
  end
end
