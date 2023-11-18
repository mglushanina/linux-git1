#!/bin/bash

if [ -z "$1" ]; then
    echo "Please provide a username as an argument."
    exit 1
fi

USERNAME="mglushanina"
ACCESS_TOKEN="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"

# Set the repository and the username whose pull requests you want to count
REPO="datamove/linux-git2"
USER="$1"
HOST="datamove"

# Make a request to the GitHub API to fetch pull requests by the specified user in the repository
pull_count=$(curl -u "$USERNAME:$ACCESS_TOKEN" -s "https://api.github.com/search/issues?q=repo:$REPO%20author:$USER%20type:pr" | jq -r '.total_count')

if [ "$pull_count" -eq 0 ]; then
    echo "PULLS 0"
    echo "EARLIEST 0"
    echo "MERGED 0"
else
    echo "PULLS $pull_count"

    # Fetch information about the earliest pull request by the specified user in the repository
    earliest_pull_request=$(curl -u "$USERNAME:$ACCESS_TOKEN" -s "https://api.github.com/search/issues?q=repo:$REPO%20author:$USER%20type:pr&sort=created&order=asc" | jq -r '.items[0].number')

    # Get the merge status of the earliest pull request
    merge_status=$(curl -u "$USERNAME:$ACCESS_TOKEN" -s "https://api.github.com/repos/$REPO/pulls/$earliest_pull_request" | jq -r '.merged')

    echo "EARLIEST $earliest_pull_request"
    
    if [ "$merge_status" = "true" ]; then
        echo "MERGED 1"
    else
        echo "MERGED 0"
    fi
fi

