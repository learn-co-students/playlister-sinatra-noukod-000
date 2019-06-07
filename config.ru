require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
<<<<<<< HEAD
run ApplicationController
=======
use ArtistsController
use SongsController
use GenresController
run ApplicationController
>>>>>>> 9632ee844d4e1a04c0fd36cb603c1325dc07741d
