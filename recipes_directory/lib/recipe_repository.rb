require 'recipe'

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    arr_all = []
    # Executes the SQL query:
    sql = 'SELECT id, name, average_cooking_time, rating FROM recipes;'
    
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record| 

      recipe = Recipe.new

      recipe.id = record['id'].to_i
      recipe.name = record['name']
      recipe.average_cooking_time = record['average_cooking_time']
      recipe.rating = record['rating']

      arr_all << recipe

    end
    return arr_all
    # Returns an array of Book objects.
  end
  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    params = [id]
    sql = 'SELECT id, name, average_cooking_time, rating FROM recipes WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, params)

    record = result_set[0]

    recipes = Recipe.new

    recipes.id = record['id'].to_i
    recipes.name = record['name']
    recipes.average_cooking_time = record['average_cooking_time']
    recipes.rating = record['rating']

    return recipes
    # Returns a single Student object.
  end
end