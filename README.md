# Welcome to Stage Orders

Stage Orders is a web-application framework that helps stage race
support captains manage race resources.

## Getting Started

At the command prompt, clone the Rails app:

```bash
git clone git@github.com:nomadicoder/stageorders.git
```

Install the GEMs:

```bash
bundle install
```

Migrate the database:

```bash
rake db:migrate`
```

Seed the database:

```bash
rake db:seed
```

Go to http://localhost:3000/ and you'll see:

    "Welcome aboard: You're riding Ruby on Rails!"

Go to http://localhost:3000/results and you'll see the stage results page

Go to http://localhost:3000/status and you'll see the stage readiness page


## User Accounts

To see restricted information or update results and status, you need to have
an user account. Accounts may only be created from the rails console.

1. Enter rails console mode:

```bash
rails console
```

2. Create an account:

```bash
u = User.new( email: "sample@example.com", name: "sample", password: "mypassword", password_confirmation: "mypassword")`
u.save
```

3. Make a user an admin or staff, who can update data:

```bash
u.update_attribute :admin, true
u.update_attribute :staff, true
```

4. To locate a user based on email address:

```bash
u = User.find( email: "sample@example.com")
```
      
5. To locate a user based on name:

```bash
u = User.find( name: "sample")
```
