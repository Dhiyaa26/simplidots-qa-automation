# TMDb - Mark as Favorite | QA Technical Test

**Submission for:** SimpliDOTS QA Engineer Internship  
**Feature Tested:** Mark as Favorite (TMDb - https://www.themoviedb.org)  
**Automation Tool:** Cypress  

---

## 📁 Project Structure

```
simplidots-qa-automation/
├── cypress/
│   └── e2e/
│       └── tmdb_favorite.cy.js    ← All automation test scripts
├── features/
│   └── tmdb_favorite.feature      ← Test scenarios in Gherkin format (BDD)
├── docs/
│   └── screenshots/               ← Test result screenshots
├── TEST_CASES.md                  ← Complete test cases (manual + automated)
├── cypress.config.js              ← Cypress configuration
├── package.json
├── .gitignore
└── README.md
```

---

## 📋 Test Scope

| User Story | # Test Cases | Automated? |
|---|---|---|
| US1 - Ubah Bahasa | 7 | Partial (4/7) |
| US2 - Mark as Favorite | 9 | Yes (8/9) |
| US3 - View Favorite Movie List | 7 | Yes (5/7) |
| US4 - Sorting Favorite Movies | 7 | Yes (5/7) |
| US5 - Remove Movie from Favorite | 8 | Yes (6/8) |
| Exploratory | 6 | Manual only |
| **Total** | **44** | **28 automated** |

---

## 🚀 How to Run

### Prerequisites

- Node.js v16+
- npm v8+
- A TMDb account (sign up free at https://www.themoviedb.org/signup)

### 1. Clone the Repository

```bash
git clone https://github.com/Dhiyaa26/simplidots-qa-automation.git
cd simplidots-qa-automation
```

### 2. Install Dependencies

```bash
npm install
```

### 4. Run Tests

**Open Cypress Test Runner (interactive):**
```bash
npm run cypress:open
```

**Run all tests headlessly:**
```bash
npm run cypress:run
```

**Run with browser visible:**
```bash
npm run cypress:run:headed
```

**Run specific spec file:**
```bash
npm run test
```

---

## 🎥 Demo / Showcase

> [Link to screen recording will be added here]

The recording covers:
- Overview of the project structure
- Running the Cypress test suite
- Review of test cases in TEST_CASES.md
- Review of Gherkin scenarios in features/

---

## ✅ Validation Approach

For each automated test, the following are verified:

| Aspect | How We Validate |
|---|---|
| **Visual indicator** | Assert `.glyphicons_like` has class `yellow` (active state) |
| **List membership** | Navigate to favorites URL, assert movie card exists via `.contains()` |
| **No duplicate** | Filter cards by movie title, assert length equals 1 |
| **Cross-page state** | After action on page A, navigate to page B and assert same state |
| **Persistence** | Reload page or re-login, verify state unchanged |
| **Empty state** | After removing last item, assert empty state text exists |
| **Redirect on unauth** | Clear cookies, attempt action, assert URL includes `/login` |

---

## 🐛 Bugs Found During Testing

| ID | Severity | Description | Steps to Reproduce | Expected | Actual |
|---|---|---|---|---|---|---|
| BUG-01 | High | Sorting by Release Date tidak berfungsi dengan benar | Buka Favorites > Pilih sort "Release Date" | Movie diurutkan berdasarkan release date terbaru ke terlama | Movie tidak diurutkan dengan benar sesuai release date |
| BUG-02 | High | Sort preference tidak tersimpan setelah refresh | Pilih sort > Refresh halaman | Sort preference tetap seperti yang dipilih | Sort kembali ke default после refresh |
| BUG-03 | High | Sort preference tidak persist setelah re-login | Pilih sort > Logout > Login ulang | Sort preference tetap tersimpan | Sort preference hilang setelah re-login |
| BUG-04 | High | Sort after adding new movie tidak berfungsi | Set sort by Popularity > Tambah movie baru | Movie baru muncul sesuai popularity | Movie baru tidak muncul di posisi yang benar |
| BUG-05 | Medium | Remove dari Favorites List tidak langsung update UI | Remove movie dari Favorites page | Movie langsung hilang tanpa refresh | Movie masih tampil sampai page di-refresh |
| BUG-06 | Medium | Tidak ada guide message untuk login di private page | Akses Favorites tanpa login | Tampilkan pesan/redirect untuk login | Hanya tampil "This page is private" tanpa guide |

---

## 💡 UX/UI Improvements Suggestions

### Favorite Tab & Icons (Profile Page)

1. **Tambah Favorite Tab langsung di Profile List** - Saat ini user harus klik profile > Overview > baru能看到 tab Favorites. UX terlalu panjang. Suggestion: Tambah langsung tab "Favorites" di list tab pada profile page (bukan di profile detail page).

2. **Icon pada setiap Tab** - Tambah icon di samping setiap tab name untuk better discoverability:
   - Tab "Overview" → icon user/home
   - Tab "Favorites" → icon heart/love
   - Tab "Watchlist" → icon bookmark
   - Karena tidak semua user memperhatikan nama/title pada feature, icon visual lebih mudah dikenali user

3. **Favorite icon discoverability** — Heart icon di movie listing hanya visible on hover (desktop). On mobile, ini sulit ditemukan. Suggestion: Always show small persistent icon atau context menu.

4. **Confirmation on remove** — Tidak ada undo atau konfirmasi saat remove movie dari favorites. Suggestion: Brief "Removed. Undo?" toast akan improve UX.

5. **Sort persistence clarity** — Tidak ada konfirmasi ke user bahwa sort preference disimpan. Suggestion: "Preferences saved" message.

6. **Empty state messaging** — Empty favorites state bisa lebih actionable: "You haven't favorited any movies yet. [Browse Popular Movies →]"

7. **Language selector location** — Language change setting buried di `/settings/general`. Consider quick-switch di top navigation.

8. **No tooltip after mark favorite** — US2-02: Tidak ada tooltip/notif setelah movie added ke favorite. Suggestion: Tambah feedback visual.

9. **Mobile responsive** — Website tidak responsif di mobile viewport. explorer EXP-05 fails.

---

## 💡 UI/UX Feedback & Suggestions

Based on exploration of the TMDb feature:

1. **Favorite icon discoverability** — The heart icon on the movie listing page is only visible on hover (desktop). On mobile, this may be hard to find. Suggestion: always show a small persistent icon or add a context menu.

2. **Confirmation on remove** — There is no undo or confirmation dialog when removing a movie from favorites. A brief "Removed. Undo?" toast would improve UX.

3. **Sort persistence clarity** — It is not clearly communicated to the user that their sort preference is being saved. A subtle "Preferences saved" message would help.

4. **Empty state messaging** — The empty favorites state could be more actionable, e.g. "You haven't favorited any movies yet. [Browse Popular Movies →]"

5. **Language selector location** — The language change setting is buried in `/settings/general`. Consider adding a quick-switch in the top navigation for better accessibility.

---

## 📝 Technical Notes for Reviewer

### Why API-Based Approach Was Commented Out

The original test suite attempted to use TMDb's website endpoints for:
- Adding favorites via POST to `/account/{id}/favorite`
- Removing favorites via POST to `/account/{id}/favorite`
- Clearing favorites via API before each test

**This approach did NOT work because:**
1. TMDb's website (`www.themoviedb.org`) does NOT expose API endpoints
2. The website requires a valid TMDb API key (from https://www.themoviedb.org/settings/api) to use API routes
3. Without proper API authentication, API calls return 404 or 401 errors
4. The website uses different authentication (session cookies) than the API (Bearer tokens)

**What was disabled:**
```javascript
// These functions were commented out:
// const clearFavorites = () => { ... }  // Used website URL, not API URL
// const addFavoriteViaAPI = (movieId) => { ... }  // Same issue
```

### Current Simplified Approach

The new test suite uses **UI-based testing** which works with the website directly:
1. **Login via UI** — Uses cy.session() to cache login state through the website login form
2. **Manual interaction** — Tests click the favorite button through the UI
3. **Simplified assertions** — Verifies visual indicators and page states without API dependency

**Benefits:**
- No API key required
- Tests actual user experience
- More reliable for website-focused testing

**Limitations:**
- Cannot prepopulate favorites before tests (requires manual setup or API)
- Some edge cases require manual testing

### For Full Automation (Future Enhancement)

To restore full API-based testing:
1. Get a TMDb API key from https://www.themoviedb.org/settings/api
2. Update the API base URL to `https://api.themoviedb.org/3`
3. Add authentication via `api_key` query param or Bearer token
4. Uncomment the API helper functions

### Test Execution Notes

- **Login approach:** Uses `cy.session()` to cache login state across tests, avoiding repeated login which would slow down the suite and risk rate-limiting.
- **Selector strategy:** TMDb does not expose `data-testid` attributes on most elements, so CSS class selectors are used. If TMDb updates their HTML, selectors may need updating — this is called out inline in the test file.
- **US1-03 (offline):** The "no internet" scenario is listed as a manual-only test because simulating network failure in Cypress requires `cy.intercept()` with force-fail, which may produce different results than a true offline state.
- **Gherkin format:** `features/tmdb_favorite.feature` is written for documentation and communication purposes (BDD format). To actually run Gherkin, a Cucumber Cypress plugin would be needed — this is beyond the core scope but the file is included as a bonus.

---

## 🔧 Tech Stack

- **Automation:** [Cypress](https://www.cypress.io/) v13
- **Language:** JavaScript
- **Test Format:** BDD Gherkin (documentation) + Cypress spec files (execution)
- **CI:** Can be connected to GitHub Actions (`.github/workflows/cypress.yml` can be added)

---

*Made with <3 for SimpliDOTS QA Internship Application*
