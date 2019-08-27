# README

### Features
- Users with `devise`
- Facebook oauth
- Flash messages as notification using `noty` js
- Files uploads using `active storage`
- Gigs management
- Gigs creation with `Bulma` multi steps
- File drag & drop using `dropzone` 
- Payment captured by `Stripe`

### Theme
We use **Bulma** as CSS theme for this project

### Jquery
We install `Jquery` by `yarn` and import it in `config/webpack/environment.js`

### Notification
We use `Noty` js library, installed by `yarn`
 
JS file is required in `app/javascripts/packs/application.js`

CSS files are imported in `app/assets/stylesheets/application.css` 

### User
We use devise to manage user
We use `omniauth` & `omniauth-facebook` for Facebook integration. We will need to register Facebook developer and a Facebook app for oauth 

**- Facebook**

- On development mode, u can test with your own FB account only. If we want to test with more account, we need to add the account as *developer* or *tester* in Facebook app 

**- Avatar**
- We use `active storage` to proceed user's avatar

### Gig
- We use `active storage` to proceed gig's photos
- We use `action text` to proceed gig's description

### Order
- We use `PgcryptoExtension` to enable orders' `id` as `uuid`. Check the `EnablePgcryptoExtension` migration

### Payment
- We use `Stripe` to handle user payment method. The test credit card is `4242 4242 4242 4242`
- You can look at this [commit](https://github.com/quyetdc/Fiverr/commit/fef55596be97e1ba208d0f8e0e601ec7c4b9db41) and [commit](https://github.com/quyetdc/Fiverr/commit/3877194a33489b643ee6c32c33b9da9f63aab929)

### Admin

The project uses Trestle for Admin management

## Troubleshooting

#### Heroku

Install bulma - instead of using Gem We should add it via yarn `yarn add bulma`, and import our css into `app/javascript/packs/src/application.css`
Of course, we need to import the template css file into our `packs/application.js`

Optional build-pack commands

```cassandraql
heroku buildpacks:set heroku/nodejs
heroku buildpacks:set heroku/ruby --index 2
```