class Book < ActiveRecord::Base
  before_save :set_keywords

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

  scope :search, ->(keyword) { where('keywords LIKE ?', "%#{keyword.downcase}%") }
  # def self.search(keyword)
  #   if keyword.present?
  #     where(title: keyword)
  #   else
  #     all
  #   end
  # end

  def finished?
    finished_on.present? 
  end

  protected
    def set_keywords
      self.keywords = [title, author, description].map(&:downcase).join(' ')      
    end
end
