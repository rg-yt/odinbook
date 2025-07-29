# Odinbook

1. Use PostgreSQL for your database from the beginning (not SQLite3), that way your deployment will go much more smoothly.
2. Users must sign in to see anything except the sign in page.
3. User sign-in should use the Devise gem. Devise gives you all sorts of helpful methods so you no longer have to write your own user passwords, sessions, and #current_user methods. See the Railscast on Devise (which uses Rails 3) for a step-by-step introduction. The docs will be fully current.
4. Users can send follow requests to other users.
5. Users can create posts (begin with text only).
6. Users can like posts.
7. Users can comment on posts.
8. Posts should always display the post content, author, comments, and likes.
9. There should be an index page for posts, which shows all the recent posts from the current user and users they are following.
10. Users can create a profile with a profile picture. You may be able to get the profile picture when users sign in using OmniAuth. If this isn’t the case you can use Gravatar to generate the photo.
11. A user’s profile page should contain their profile information, profile photo, and posts.
12. There should be an index page for users, which shows all users and buttons for sending follow requests to users the user is not already following or have a pending request.
13. Set up a mailer to send a welcome email when a new user signs up. Use the Letter Opener gem to test it in development mode.
14. Deploy your App to a hosting provider.
15. Set up an email provider and start sending real emails.

Extra credit

1. Make posts also allow images (either just via a URL or, more complicated, by uploading one).
2. Use Active Storage to allow users to upload a photo to their profile.
3. Make your post able to be either a text OR a photo by using a polymorphic association (so users can still like or comment on it while being none-the-wiser).
4. Style it up nicely! We’ll dive into HTML/CSS in the next course.

Getting started

1. Think through the data architecture required to make this work. There are a lot of models and a lot of associations, so take the time to plan out your approach.
2. Build the new PostgreSQL Rails app $ rails new odinbook --database=postgresql, initialize the Git repo and update the README to link back to this page.
3. Work your way down the list above! Each step will involve a new challenge but you’ve got the tools.
4. You can populate data like users and posts using the Faker gem, which is basically just a library of sample names and emails. It may just be easier, though, for you to write your own seeds in the db/seeds.rb file, which gets run if you type $ rake db:seed.
