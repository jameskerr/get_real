require 'test_helper'

class InstagramControllerTest < ActionController::TestCase

  test "post with authenticity token" do
    assert_difference 'Post.count', 1 do
      post :user_updates, {"_json"=>[{"changed_aspect"=>"media", "object"=>"user", "object_id"=>"2211664171", "time"=>1443222911, "subscription_id"=>20107946, "data"=>{"media_id"=>"1082154666374017855_2211664171"}}], "instagram"=>{"_json"=>[{"changed_aspect"=>"media", "object"=>"user", "object_id"=>"2211664171", "time"=>1443222911, "subscription_id"=>20107946, "data"=>{"media_id"=>"1082154666374017855_2211664171"}}]}}
    end
  end
end
