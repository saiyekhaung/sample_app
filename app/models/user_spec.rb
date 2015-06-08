describe "with DB" do

  describe "column having unique-key constraint" do

    describe "when email address is already taken" do
      before { @user.save! }

      it "should raise error ActiveRecord::RecordNotUnique" do
        expect do
          user_with_same_email = @user.dup
          user_with_same_email.email = @user.email
          user_with_same_email.save! validate: false
        end.to raise_error( ActiveRecord::RecordNotUnique )
      end
    end

  end

  #...
end
