# Snack Attack Rails App!

## Steps to follow

### Create a new Rails project
Create a new project:

```
$ rails new SnackAttack --database=postgresql
$ cd SnackAttack
```

Set up an empty database:

```
$  rails db:create
```

Open the project in the current directory using your text editor:

```
$ subl .
```

Start the server and open up the project in the browser, localhost:3000:

```
$ rails server
```

Commit to GitHub:

```
git add .
```

### Generate Model

Create a Snack model with `name` and `calories` attributes as well as the optional string parameters. **Remember:** in Rails, models are singlular and capitalized. Controllers and routes are plural and lowercase.

```
$ rails g model Snack name:string calories:integer

# run the migration to update the database with this change
$ rails db:migrate
```

Before running the migration, check the `db/migrate/[timestamp]_create_snacks.rb` folder to make sure the migration is accurate:

```ruby
class CreateSnacks < ActiveRecord::Migration[5.2]
	def change
	  create_table :snacks do |t|
	    t.string :name
	    t.integer :calories
	
	    t.timestamps # add a `created_at` and `updated_at`
	  end
	end
end
```
Then, check the schema file:

```ruby
  create_table "snacks", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
```

Navigate to the `app/models/Snack.rb` file:

```ruby
class Snack < ApplicationRecord
end
```
Then, step into the Rails console to create a new User:

```
$ rails c --sandbox

# create a new user object
>> User.new
=> #<User id: nil, name: nil, email: nil, created_at: nil, updated_at: nil>
```

Alternatively, you can add some seed data in `db/seeds.rb`:

```ruby
#
# db/seeds.rb
#

Snack.create(name: 'Duane Reade Snack Mix', calories: 100)
Snack.create(name: 'Duane Reade Rocky Road Ice Cream', calories: 300)

Snack.create(name: 'Snickers', calories: 400)
Snack.create(name: 'Milky Way', calories: 425)

Snack.create(name: 'Peanut Butter Filled Pretzels', calories: 300)
Snack.create(name: 'Hold the Cone Mini Vanilla Ice Cream Cones', calories: 300)
Snack.create(name: 'Mini Mochi', calories: 300)

puts "created #{Snack.count} snacks!"
```

In the Terminal (not inside rails console!), run `rails db:seed`. **Note:** the seed file will also run every time you run `rails db:reset` to reset your database.

Open up a new *tab* in your terminal and run `rails c` (short for `rails console`)

Let's see what's in the database. Try running the following commands and see what you get. Look at the SQL that is being executed for *you* in the console.
  
  * `Snack.count`
  * `Snack.first`
  * `Snack.find_by(name: 'M&Ms')`
  * `Snack.where(calories: 300)`
  * `Snack.where(calories: (200..500))`
  * `Snack.where.not(calories: (200..500))`

Now let's try to update some records:

  * Assume we mis-entered the number of calories for "Mini Mochi"
   - `snack = Snack.find_by(name: 'Mini Mochi')`
   - `snack.update_attributes(:calories => 200)`

### Generate Another Model

Looks like a log of these snacks have some Brands in common.  Lets create a `brands` table.

* `rails g model Brand`
* Open up the newest migration in the `db/migrate` directory.
* Add a `name` and `logo` column

```ruby
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :logo

      t.timestamps
    end
  end
```

Before running the migration, check the `db/migrate/[timestamp]_create_brands.rb` folder to make sure the migration is accurate:

```
$ rails db:migrate
```

Now let's add some Brands to the `seed.rb` file.  Normally we wouldn't keep editing the seeds file but since we are just playing around this is ok.

First let's start with a clean slate and destroy every `Snack`.  In the console (or add to the beginning of your seed file), run `Snack.destroy_all`.  We are safe doing this today because we are just playing around with our seed data.  In general this is *not* a safe action.

Now, create some brands.

## Relations

A single brand can have many snacks. Would you agree?  Wouldn't it be nice to link a snack to its brand?

`rails g migration AddBrandIdToSnacks`

Now in the last migration:

```ruby
  def change
    add_column :snacks, :brand_id, :integer
    add_index :snacks, :brand_id
  end
```

### `has_many` and `belongs_to`

Now to actually link these models together we need two things:

`app/models/brand`

```ruby
  class Brand < ApplicationRecord
    has_many :snacks
  end
```

`app/models/snack`

```ruby
  class Snack < ApplicationRecord
    belongs_to :brand
  end
```

Update the seed file so the relations exist.  We will add a `brand_id` to each snack. For example:

```
snickers = Snack.create(name: 'Snickers', calories: 300, brand_id: mars.id)
```

Again since we are just playing around, we can drop all the snacks so we can run `Snack.destroy_all` and then `Brand.destroy_all` in the console.

Run the seed file again: `rails db:seed`

Then, hop back in the console:

```ruby
reload! # reload all the new code

snack = Snack.find_by(name: 'M&Ms')
snack.brand
# => the mars model! magic! no SQL needed! how cool!?

brand = Brand.find_by(name: 'Mars')
brand.snacks # => look at all these snacks! so coooll!!
```

## Things to know

* We will have class for every table in our database.  Each class inherits from `ActiveRecord::Base`.  To create a new instance we simply do `Snack.new`, for example.  It takes one argument: a hash of column names and values.
  * `snack = Snack.new(name: 'M&Ms', calories: 300)`

* To save the model to the database, we just call `snack.save` to save it to the database. **We don't need to write any SQL!**
  * `save` returns `true` if was successful and `false` otherwise
  * `save!` raises and error if it cannot save

* The `create` method makes a new instance *and* tries to save it.
* `create!` raises an error if it cannot save.
