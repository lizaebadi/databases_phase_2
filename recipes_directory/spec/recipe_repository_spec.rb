require 'recipe_repository'


RSpec.describe RecipeRepository do 

  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_recipes_table
  end

  it 'lists all recipes' do 

    repo = RecipeRepository.new

    recipe = repo.all
    
    expect(recipe[0].id).to eq  1
    expect(recipe[0].name).to eq 'Spaghetti Bolognese'
    expect(recipe[0].average_cooking_time).to eq '25'
    expect(recipe[0].rating).to eq '5'
    
    expect(recipe[1].id).to eq 2
    expect(recipe[1].name).to eq 'Tuna Sandwich'
    expect(recipe[1].average_cooking_time).to eq '10'
    expect(recipe[1].rating).to eq '3'
  end 

  it 'lists the recipe by ID' do 
    repo = RecipeRepository.new 

    recipes = repo.find(2) 
    
    expect(recipes.id).to eq 2
    expect(recipes.name).to eq 'Tuna Sandwich'
    expect(recipes.average_cooking_time).to eq '10'
    expect(recipes.rating).to eq '3'
  end
end 