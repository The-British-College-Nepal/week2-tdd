#!/bin/bash
# Simple script to clone the TDD exercise repository into a fresh directory.
# Usage: ./start_exercise.sh

REPO_URL="https://github.com/The-British-College-Nepal/week1-tdd-exercise.git"
TARGET_DIR="week1-tdd-exercise"

if [ -d "$TARGET_DIR" ]; then
  echo "Directory '$TARGET_DIR' already exists. Delete or rename it before cloning."
  exit 1
fi

git clone "$REPO_URL" "$TARGET_DIR"

if [ $? -eq 0 ]; then
  echo "Repository cloned successfully into '$TARGET_DIR'."
else
  echo "Failed to clone repository. Check the URL and your network connection."
fi
