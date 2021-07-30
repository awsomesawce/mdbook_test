#!/usr/bin/env bash

if command -v pwsh > /dev/null; then
    pwsh -File ./buildsite.ps1 -Git
else
    echo "Cannot find pwsh on path" >&2
    exit 1
fi
exit 0
