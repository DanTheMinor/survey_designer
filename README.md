(rake db:drop) if already connected to a db
rake db:create
rake db:create_migration NAME=create_questions
rake db:create_migration NAME=create_lists
rake db:migrate
rake db:test:prepare
