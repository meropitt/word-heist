# Word Heist: The Vault — Setup Guide

Three steps: create a free database (Supabase), plug in two keys, upload to GitHub Pages.

## 1. Create your Supabase project (2 minutes)

1. Go to https://supabase.com → **Start your project** → sign in with GitHub.
2. Click **New project**. Pick any name (e.g. `word-heist`) and a password (you won't need it again). Choose the region closest to you.
3. Wait ~1 minute for the project to spin up.

## 2. Create the leaderboard table

1. In your Supabase project, open **SQL Editor** (left sidebar) → **New query**.
2. Paste the entire contents of `schema.sql` (included alongside this file) and click **Run**.
3. Confirm it worked: go to **Table Editor** → you should see a `leaderboard` table with columns `team_name`, `score`, `best_streak`.

## 3. Get your API keys

1. In Supabase, go to **Project Settings** (gear icon) → **API**.
2. Copy the **Project URL** (looks like `https://xxxxxxxx.supabase.co`).
3. Copy the **anon public** key (a long string starting with `eyJ...`).

## 4. Plug the keys into the game

Open `index.html` and find these two lines near the top of the `<script>` section:

```js
const SUPABASE_URL = "YOUR_SUPABASE_URL";
const SUPABASE_ANON_KEY = "YOUR_SUPABASE_ANON_KEY";
```

Replace them with your actual values, e.g.:

```js
const SUPABASE_URL = "https://xxxxxxxx.supabase.co";
const SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...";
```

Save the file.

## 5. Put it on GitHub Pages

1. Create a new repository on GitHub (public is fine, e.g. `word-heist`).
2. Upload `index.html` to the repo (drag-and-drop on the GitHub website works, or `git push`).
3. Go to the repo's **Settings → Pages**.
4. Under **Source**, choose the `main` branch and `/ (root)` folder → **Save**.
5. GitHub gives you a live link after ~1 minute, usually:
   `https://YOUR_USERNAME.github.io/word-heist/`

Share that link with your class — everyone who opens it can play and their score posts to the same live leaderboard.

## Notes

- The `anon` key is meant to be public in frontend code — that's how Supabase is designed to work. Just don't share your database password.
- The leaderboard keeps each team's **best** score only (playing again won't overwrite a higher score with a lower one).
- To reset the leaderboard before a new class session, run `delete from leaderboard;` in the Supabase SQL Editor.
- If you ever want to lock things down further (e.g. only allow scores in a reasonable range), that's done by editing the RLS policies in Supabase — happy to help with that if you get there.
