install:
	bundle install; yarn install
	
run:
	bin/rails db:create db:migrate db:seed

create:
	bin/rails db:create

migrate:
	bin/rails db:migrate

seed:
	bin/rails db:seed

console:
	bin/rails console

reset:
	bin/rails db:drop db:create db:migrate db:seed

start:
	bin/rails s 

rollback:
	rails db:rollback