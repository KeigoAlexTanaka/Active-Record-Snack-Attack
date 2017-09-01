# 🎶 ACTIVE RECORD 🎶

> you have to sing it. otherwise it doesn't do what you want

### Learning Objectives!

- What is Active Record?
- Exploring models & migrations in Rails
- Creating and seeding a database
- Managing the relationships between our tables with ✨ Active Record magic ✨
- Snacks! Snacks! Snacks!

# What _is_ Active Record???

Active Record is what we're going to use to manage our database for our Rails app. (Like `pg-promise` but extremely way cooler.) It comes built in to Rails, but you can also use it with Sinatra.

Active Record is what's called an ORM, or **O**bject **R**elational **M**apping (tool). It allows us to represent all of the information in our database as objects. 

Here's a sneak peak of what that looks like.

Instead of writing the following SQL query: 

```sql
SELECT * FROM snacks;
```

We can just write this:

```rb
Snack.all()
```

Pretty cool, right?

# Building a Snack Attack app!!!!


