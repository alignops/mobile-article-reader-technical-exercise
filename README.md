# Article Reader — Mobile Take-Home Exercise

Welcome, and thanks for taking the time. This is a short, focused exercise
(target: **3–6 hours total**) to see how you read unfamiliar code, debug, and
finish a small feature on **native Android and iOS**.

There are two tiny apps in this repo — one Android (Kotlin/Jetpack Compose) and
one iOS (Swift/SwiftUI). They are **partially complete**: each one builds and
runs, but neither works correctly yet. Each app contains **a few intentional
bugs and one unfinished feature**. Your job is to get both apps behaving as
described in the spec below.

---

## What the app should do

Both apps are the same product, built natively on each platform:

1. **Fetch** a list of articles from a remote JSON endpoint on launch.
2. **Display** them in a scrollable list, showing each article's **title** and
   **body**.
3. Let the user **bookmark / un-bookmark** an article by tapping a bookmark
   control on each row. The bookmarked state must be **visibly reflected in the
   UI immediately** and persist while the app is running (in-memory is fine).
4. Handle the **loading** and **error** states gracefully (a spinner while
   loading, and a readable message + retry if the request fails).

### The data source

Both apps read from this public mock endpoint (no auth, no key needed):

```
https://jsonplaceholder.typicode.com/posts
```

It returns a JSON array of objects shaped like this:

```json
[
  {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident",
    "body": "quia et suscipit\nsuscipit recusandae..."
  }
]
```

Treat each object as an **Article**: use `id`, `title`, and `body`. You can
ignore `userId`. (There is no "bookmarked" field in the data — bookmark state
lives only in the app.)

> No internet? A copy of the payload is included at
> [`mock/articles.json`](mock/articles.json). See that folder's note for how to
> serve it locally and point the apps at it.

---

## What we're looking for

This exercise is deliberately small. We care much more about **how** you work
than about volume:

- You can find and fix the bugs, and you understand **why** each one was a bug.
- You complete the bookmark feature so the UI updates correctly and reliably.
- Your fixes are idiomatic for the platform (state management, threading,
  serialization, app configuration).
- Clean, readable diffs. Small, sensible commits beat one giant commit.

You are **not** expected to redesign the UI, add a database, write exhaustive
tests, or add new screens. If you finish early and want to show off, see
**Bonus** below — but the core fixes come first.

---

## Getting started

### Android (`android/`)
- Open the `android/` folder in **Android Studio** (Koala / 2024.1+).
- Let it sync Gradle, then run on an emulator or device (minSdk 24).
- Entry points to read first: `ArticleViewModel.kt` and `ArticleListScreen.kt`.

### iOS (`ios/`)
- Open `ios/ArticleReader.xcodeproj` in **Xcode 15+**.
- Run on any iOS 16+ simulator.
- Entry points to read first: `ArticleListViewModel.swift` and
  `ArticleListView.swift`.

---

## Submitting

1. Fork or clone this repo.
2. Commit your work in logical steps with clear messages.
3. Fill in **[`SUBMISSION.md`](SUBMISSION.md)** — a short write-up of:
   - each bug you found and how you fixed it,
   - how you implemented the bookmark feature,
   - anything you'd improve with more time.
4. Send us a link to your repo (or a zip).

The write-up matters: a clear explanation of a bug you *couldn't* fully solve is
worth more to us than a silent fix.

---

## Bonus (only if you have time)

Pick **at most one** — these are optional signals, not requirements:

- A unit test for the bookmark-toggle logic.
- Persist bookmarks across app restarts.
- A "Bookmarked only" filter toggle.

Good luck
