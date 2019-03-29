# SnackAttack Rails App!

**Commit** after each bullet point!

## Steps to follow

(If you don't read closely you can't complain)

* `rails new SnackAttack --database=postgresql`
* Add *everything* and commit. (This is only the time you _should_ `add -A`)
* `rails g model Snack`
  * Open up the newest migration in in the `db/migrate` directory.
  * Add a `name` and `string` column
  ```ruby
    def change
      create_table :snacks do |t|
        t.string :name
        t.integer :calories

        t.timestamps # add a `created_at` and `updated_at`
      end
    end
  ```
* `rails db:migrate`
* you may need to create your database.
* Create some seeds in `db/seeds.rb`
  ```ruby
  Snack.create!(name: 'Duane Reade Snack Mix', calories: 100)
  Snack.create!(name: 'Duane Reade Rocky Road Ice Cream', calories: 300)

  Snack.create!(name: 'Microwave Pizza', calories: 400)

  Snack.create!(name: 'M&Ms', calories: 300)
  Snack.create!(name: 'Skittles', calories: 300)
  Snack.create!(name: 'Snickers', calories: 300)

  puts "created #{Snack.count} snacks!"
  ```
* `rake db:seed` will run this file!  Now we have stuff in our database!
* Open up a new *tab* in your terminal.  Run `rails c` (short for `rails console`)
* Let's see what we got in there!  Try running all these commands and see what you get.  Look at the SQL that is being executed for *you*
  * `Snack.count`
  * `Snack.first`
  * `Snack.find_by(name: 'M&Ms')`
  * `Snack.where(calories: 300)`
  * `Snack.where(calories: (200..500))`
  * `Snack.where.not(calories: (200..500))`
* SOOO COOOLLL
* Now let's try to update some records.
  * Assume we mis-entered the number of calories for M&Ms
  * `snack = Snack.find_by(name: 'M&Ms')`
  * `snack.update!(calories: 200)`

### Adding more stuff

Looks like a log of these snacks have some Brands in common.  Lets create a `brands` table!

* `rails g model Brand`
* Open up the newest migration in in the `db/migrate` directory.
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
* `rake db:migrate`

Now let's add some Brands.  Normally we wouldn't keep editing the seeds file but since we are just playing around this is ok.

First let's start with a clean slate and destroy every `Snack`.  In the console run `Snack.destroy_all`.  We are safe doing this today because we are just playing around with our seed data.  In general this is *not* a safe action.

Now let's make some brands!

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

Now to actually link these models together we just need two easy things.

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

Now let's update our seeds file so the relations exist.  We will add a `brand_id` to each snack.

Again since we are are just playing around, we can drop all the snacks so we can run `Snack.destroy_all` and then `Branding.destroy_all` in the console.

Now let's run our migration seeds again: `rails db:seed`

And let's hop back in the console:

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
The source code looks _something_ looks something like
```ruby
class ActiveRecord::Base
  def self.create(cols_and_vals)
    record = new(cols_and_vals)
    record.save
    record
  end
end
```

* `create!` does what you would expect. Raises an error if it cannot save
```ruby
class ActiveRecord::Base
  def self.create(cols_and_vals)
    record = new(cols_and_vals)
    record.save!
    record
  end
end
```
> In reality this method is more complicated but this is how you can picture it
