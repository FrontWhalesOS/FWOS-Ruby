require 'test_helper'

class GuessTest < ActiveSupport::TestCase
  test "Making sure guess is filled out" do
   guess = guesses(:guess_one)
   assert guess.save
  end

  test "Must have user_id" do
      guess = Guess.new(guess: "blah", post_id: 1)
      guess2 = Guess.new(guess: "blah", user_id: 1, post_id: 2)
      refute guess.save, "Cannot save without a user_id"
      assert guess2.save
  end



    test "Must have post_id" do
        guess3 = Guess.new(guess: "Cat", user_id: 1)
        guess4 = Guess.new(guess: "Dog", user_id: 1, post_id: 3)
        refute guess3.save, "unable to save without a post_id"
        assert guess4.save
    end


end
