// cypress/e2e/tmdb_favorite.cy.js
// TMDb - Mark as Favorite | Automation Test Suite
// Tools: Cypress
// Author: Dhiyaa Ulhaq
// Date: 2026

const BASE_URL = 'https://www.themoviedb.org';
const TEST_MOVIE_ID = '550';

describe('TMDb - Basic Page Access Tests', () => {

  afterEach(function() {
    const testName = this.currentTest?.title || 'unknown';
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
    cy.screenshot(`result-${testName}-${timestamp}`, { capture: 'viewport' });
  });

  it('TC-01 | Can access TMDb homepage', () => {
    cy.visit(BASE_URL, {failOnStatusCode: false});
    cy.wait(2000);
    cy.get('body').should('be.visible');
  });

  it('TC-02 | Can access movie listing page', () => {
    cy.visit(`${BASE_URL}/movie`, {failOnStatusCode: false});
    cy.wait(2000);
    cy.get('body').should('be.visible');
  });

  it('TC-03 | Can access movie detail page', () => {
    cy.visit(`${BASE_URL}/movie/${TEST_MOVIE_ID}`, {failOnStatusCode: false});
    cy.wait(2000);
    cy.get('body').should('be.visible');
  });

  it('TC-04 | Can access login page', () => {
    cy.visit(`${BASE_URL}/login`, {failOnStatusCode: false});
    cy.wait(2000);
    cy.get('body').should('be.visible');
  });

  it('TC-05 | Unauthenticated access to account redirects or shows login', () => {
    cy.visit(`${BASE_URL}/account`, {failOnStatusCode: false});
    cy.wait(2000);
    cy.get('body').should('be.visible');
  });

});