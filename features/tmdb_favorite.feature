# features/tmdb_favorite.feature
# TMDb - Mark as Favorite Feature
# Format: Gherkin (BDD)

Feature: Mark as Favorite
  As a logged-in user
  I want to mark movies as favorites
  So I can easily access movies I enjoy

  Background:
    Given I am logged in to TMDb
    And I am on the TMDb homepage

  # ── US2: Mark as Favorite ──────────────────────────────────────

  @positive @US2
  Scenario: US2-01 - Mark movie as favorite from listing page
    Given I am on the movie listing page
    When I hover over a movie card
    And I click the favorite icon
    Then the favorite icon should become active (filled)
    And the movie should appear in my Favorites list

  @positive @US2
  Scenario: US2-02 - Mark movie as favorite from detail page
    Given I am on the detail page of "Fight Club"
    When I click the "Mark as Favorite" button
    Then the favorite button should show active state
    And "Fight Club" should appear in my Favorites list

  @positive @US2
  Scenario: US2-03 - Mark multiple movies as favorite
    Given I am on the movie listing page
    When I mark "Fight Club" as favorite
    And I mark "The Shawshank Redemption" as favorite
    Then both movies should appear in my Favorites list

  @positive @US2
  Scenario: US2-04 - Favorite indicator is consistent across pages
    Given I have marked "Fight Club" as favorite
    When I view the movie listing page
    Then the favorite icon for "Fight Club" should be active
    When I open the detail page of "Fight Club"
    Then the favorite button should show active state

  @negative @US2
  Scenario: US2-05 - Cannot mark favorite when not logged in
    Given I am not logged in
    And I am on the detail page of "Fight Club"
    When I click the favorite icon
    Then I should be redirected to the login page
    And "Fight Club" should not be added to any favorites list

  @negative @US2
  Scenario: US2-06 - Marking an already-favorited movie does not create duplicate
    Given "Fight Club" is already in my Favorites list
    When I mark "Fight Club" as favorite again
    Then "Fight Club" should appear only once in my Favorites list

  @edge @US2
  Scenario: US2-08 - Mark 5 movies in quick succession
    Given I am on the movie listing page
    When I quickly mark 5 different movies as favorites
    Then all 5 movies should appear in my Favorites list
    And the most recently marked movie should appear first

  # ── US3: View Favorite Movie List ─────────────────────────────

  @positive @US3
  Scenario: US3-01 - Access favorites page and see list
    Given I have at least one movie in my Favorites
    When I navigate to my Favorites Movies page
    Then I should see a list of favorited movies

  @positive @US3
  Scenario: US3-02 - Movie information is consistent
    Given "Fight Club" is in my Favorites list
    When I view my Favorites Movies page
    Then the title and poster of "Fight Club" should match the movie listing page

  @positive @US3
  Scenario: US3-03 - Most recently favorited movie appears first
    Given I have favorited "Fight Club" then "The Shawshank Redemption"
    When I view my Favorites Movies page
    Then "The Shawshank Redemption" should appear before "Fight Club"

  @negative @US3
  Scenario: US3-05 - Empty state when no favorites exist
    Given I have no movies in my Favorites list
    When I navigate to my Favorites Movies page
    Then I should see an empty state message
    And no movie cards should be displayed

  @negative @US3
  Scenario: US3-06 - Unauthenticated access to favorites redirects to login
    Given I am not logged in
    When I navigate to the Favorites Movies page directly
    Then I should be redirected to the login page

  # ── US4: Sorting ───────────────────────────────────────────────

  @positive @US4
  Scenario: US4-01 - Sort favorites by popularity
    Given I have multiple movies in my Favorites list
    When I select "Popularity" from the sort dropdown
    Then the movies should be ordered by popularity score descending

  @positive @US4
  Scenario: US4-02 - Sort favorites by release date
    Given I have multiple movies in my Favorites list
    When I select "Release Date" from the sort dropdown
    Then the movies should be ordered from newest to oldest release date

  @positive @US4
  Scenario: US4-03 - Sort preference persists after page refresh
    Given I have sorted my Favorites by "Release Date"
    When I refresh the Favorites page
    Then the sort should still be set to "Release Date"

  @positive @US4
  Scenario: US4-04 - Sort preference persists after re-login
    Given I have sorted my Favorites by "Release Date"
    And I log out
    When I log in again
    And I navigate to my Favorites Movies page
    Then the sort should still be "Release Date"

  @negative @US4
  Scenario: US4-05 - Sorting an empty favorites list shows no error
    Given I have no movies in my Favorites list
    When I select "Popularity" from the sort dropdown
    Then no error should be displayed
    And the empty state message should still be visible

  # ── US5: Remove Movie from Favorite ───────────────────────────

  @positive @US5
  Scenario: US5-01 - Remove movie from Favorites List page
    Given "Fight Club" is in my Favorites list
    And I am on the Favorites Movies page
    When I click the remove icon for "Fight Club"
    Then "Fight Club" should immediately disappear from the list

  @positive @US5
  Scenario: US5-02 - Remove movie from Movie Detail page
    Given "Fight Club" is in my Favorites list
    And I am on the detail page of "Fight Club"
    When I click the "Mark as Favorite" button to toggle it off
    Then "Fight Club" should no longer appear in my Favorites list

  @positive @US5
  Scenario: US5-04 - Favorite status changes across all pages after remove
    Given "Fight Club" is in my Favorites list
    When I remove "Fight Club" from the Favorites page
    And I navigate to the movie listing page
    Then the favorite icon for "Fight Club" should be inactive
    When I open the detail page of "Fight Club"
    Then the favorite button should show inactive state

  @positive @US5
  Scenario: US5-05 - Re-add a movie after removing it
    Given "Fight Club" was previously in my Favorites and was removed
    When I mark "Fight Club" as favorite again
    Then "Fight Club" should appear in my Favorites list exactly once

  @negative @US5
  Scenario: US5-06 - Cannot remove favorite when not logged in
    Given I am not logged in
    And I navigate to a movie detail page
    When I try to click the favorite icon
    Then I should be redirected to the login page

  @edge @US5
  Scenario: US5-07 - Removing the last movie shows empty state
    Given I have exactly one movie in my Favorites list
    When I remove that movie
    Then the Favorites list should be empty
    And an empty state message should be displayed

  # ── US1: Ubah Bahasa ──────────────────────────────────────────

  @positive @US1
  Scenario: US1-01 - Switch language to Bahasa Indonesia
    Given I am on the Settings page
    When I select "Bahasa Indonesia" from the language dropdown
    And I save the settings
    Then the UI should display text in Bahasa Indonesia
    And I should still be logged in

  @positive @US1
  Scenario: US1-03 - Favorites data remains after language change
    Given I have movies in my Favorites list
    When I change the language to "Bahasa Indonesia"
    And I navigate to my Favorites Movies page
    Then all previously favorited movies should still be present

  @edge @US1
  Scenario: US1-07 - Rapid language switching does not cause errors
    Given I am on the Settings page
    When I switch language to "Bahasa Indonesia" and immediately switch back to "English" three times
    Then no error should occur
    And the UI should reflect the last selected language