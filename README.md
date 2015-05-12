(rake db:drop) if already connected to a db
rake db:create
rake db:create_migration NAME=create_questions
rake db:create_migration NAME=create_lists
rake db:create_migration NAME=add_four_choices_to_questions
rake db:create_migration NAME=remove_correct_answer_from_questions
rake db:create_migration NAME=results
rake db:create_migration NAME=add_surveyid_to_results
rake db:migrate
rake db:test:prepare

what next:
