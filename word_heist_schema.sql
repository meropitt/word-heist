-- Word Heist: The Vault — Leaderboard schema
-- Run this in Supabase: Project → SQL Editor → New query → paste → Run

create table if not exists leaderboard (
  id bigint generated always as identity primary key,
  team_name text not null unique,
  score integer not null default 0,
  best_streak integer not null default 0,
  updated_at timestamptz not null default now()
);

-- Enable Row Level Security (required by Supabase)
alter table leaderboard enable row level security;

-- Allow anyone to read the leaderboard (needed for the live scoreboard)
create policy "public can read leaderboard"
  on leaderboard for select
  using (true);

-- Allow anyone to insert their team's score
create policy "public can insert leaderboard"
  on leaderboard for insert
  with check (true);

-- Allow anyone to update their team's score (needed to upsert new high scores)
create policy "public can update leaderboard"
  on leaderboard for update
  using (true);

-- Optional: reset the leaderboard before a new class session
-- delete from leaderboard;
