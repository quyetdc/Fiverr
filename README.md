# README

### Features
- Users with `devise`
- Facebook oauth
- Flash messages as notification using `noty` js
- Files uploads using `active storage`
- Gigs management
- Gigs creation with `Bulma` multi steps
- File drag & drop using `dropzone` 

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

