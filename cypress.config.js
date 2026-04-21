const { defineConfig } = require('cypress');

module.exports = defineConfig({
  projectId: 'y7ghsm',
  e2e: {
    baseUrl: 'https://www.themoviedb.org',
    viewportWidth: 1280,
    viewportHeight: 800,
    defaultCommandTimeout: 10000,
    requestTimeout: 15000,
    responseTimeout: 15000,
    video: true,
    screenshotOnRunFailure: true,
    specPattern: 'cypress/e2e/**/*.cy.js',
    setupNodeEvents(on, config) {
      on('after:screenshot', (details) => {
        console.log('Screenshot taken:', details.path);
      });
    },
  },
  env: {
    // Set these in cypress.env.json (do NOT commit that file)
    TMDB_USERNAME: '@dhiyaa_101',
    TMDB_PASSWORD: 'Dhiyaa_101',
    TMDB_ACCOUNT_ID: '',
  },
});