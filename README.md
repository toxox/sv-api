# StreamViewer API

Ruby version: `2.6.3`, Rails version: `5.2.3`

Run this project locally:

- get your Google Client ID: [Instructions](https://developers.google.com/adwords/api/docs/guides/authentication#create_a_client_id_and_client_secret)
- `bundle install`
- check development database settings in `config/database.yml` and run `rails db:create && rails db:migrate`
- create credentials with `EDITOR="code --wait" bin/rails credentials:edit` (may substitute `code` with another editor). Required fields: `google_client_id` and `auth_secret`
- `rails s`

