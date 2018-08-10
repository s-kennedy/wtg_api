require 'rails_helper'

# Test suite for the Todo model
RSpec.describe User, type: :model do
  it { should have_many(:guides).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(2) }
  it { should validate_length_of(:name).is_at_most(255) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_length_of(:email).is_at_least(2) }
  it { should validate_length_of(:email).is_at_most(255) }
  it { should have_secure_password }
end