# Development Log

---

# Session 7 — Git Fights Back

**Date:** 2026-07-13

## Objective

Introduce a documentation structure to the repository and commit the new files.

## What happened

`git add .` failed with:

```text
error: insufficient permission for adding an object to repository database .git/objects
```

A subsequent `git commit` succeeded, but only committed files that had already been staged. The newly created documentation files were not included.

## Investigation

The repository initially appeared healthy.

By inspecting Git's object database, we discovered that one object directory was owned by `root`:

```text
.git/objects/e6
```

The remainder of the repository was owned by the normal user (`pynezz`).

The issue was traced to a previous command that had created Git objects as `root`, leaving Git unable to write new objects.

During troubleshooting we also ran into a second issue: several commands failed because they were executed from `~/cozy-config/docs` rather than the repository root. This reinforced the importance of understanding the current working directory before running filesystem operations.

## Resolution

Repository ownership was restored:

```bash
sudo chown -R "$USER:users" .git
```

Ownership was verified:

```bash
find .git \! -user "$USER" -ls
```

No unexpected files remained, confirming the repository was once again fully owned by the development user.

## Lessons Learned

- Never use `sudo` with Git commands.
- Always verify your current working directory (`pwd`) before manipulating files.
- `git add` stages changes, while `git commit` only records what has already been staged.
- Git stores repository data inside `.git/objects`, making file ownership critical to repository health.

## Reflection

This was a useful reminder that debugging is rarely about memorizing commands. The solution came from understanding how Git stores data, verifying assumptions step by step, and confirming each fix before moving on.

Small setbacks like this become valuable learning opportunities when they are investigated methodically and documented for future reference.

## Today's Lesson

> The goal isn't to avoid mistakes; it's to make them small, understandable, and recoverable.

## Vocabulary

- **Object database** – Git's internal storage for commits, trees, blobs, and tags.
- **Working tree** – The files currently checked out on disk.
- **Index (staging area)** – The snapshot that will become the next commit.
- **Repository root** – The directory containing `.git`.

## Discovery: Flakes Evaluate the Git Snapshot

While adding `vscode.nix`, the build failed with:

```text
Path 'home-manager/modules/development/vscode.nix' is not tracked by Git.
```

### Cause

Nix Flakes evaluate the repository's Git snapshot rather than every file
currently on disk.

New files are invisible until they are staged with Git.

### Resolution

```bash
git add home-manager/modules/development/vscode.nix
```

or simply:

```bash
git add .
```

before rebuilding.

### Takeaway

When working with Flakes:

1. Create or modify files.
2. Stage new files with `git add`.
3. Build or switch.
4. Commit only after verifying everything works.

This keeps the build reproducible while allowing changes to be tested before
they become part of Git history.
