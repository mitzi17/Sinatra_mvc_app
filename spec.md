# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class
        Have User and Movement model classes
- [x] Include at least one has_many relationship on your User model
        User has_many Movements
- [x] Include at least one belongs_to relationship on another model
        Movements belong_to an User
- [x] Include user accounts with unique login attribute 
        User has unique username attribute
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        Movements_controller contains routes for creating, reading, updating, and destroying movements
- [x] Ensure that users can't modify content created by other users
        Application_controller contains private methods that prohibit users from modifying content created by other users (added functionality where some users, "managers", are able to edit and delete other user's content)
- [x] Include user input validations
        Added validations and uniqueness to both models
- [x] BONUS - not required - Display validation failures to user with error message
        Used the Sinatra_flash gem to display error messages
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message