require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: "mashrur", email: "mashrur@example.com")
    @recipe = Recipe.create(name: "vegateable saute", description: "great vegtable saute, add oil", chef: @chef)
    @recipe2 = @chef.recipes.build(name: "chicken saute", description: "great chicken")
    @recipe2.save

  end



  test "should get Recipes index" do
    get recipes_url
    assert_response :success
   end 


  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end


end
