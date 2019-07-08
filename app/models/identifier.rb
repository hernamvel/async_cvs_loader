class Identifier < ApplicationRecord

  has_many :users

  validates_presence_of :identifier
  validate :identifier_format

  private

  def identifier_format
    if (identifier =~ /^[A-Za-z0-9]+$/).nil?
      errors.add(:identifier, :only_alnum)
    end
  end

end
