#!/bin/bash
gacpb () {
	git add .
	git commit -m "$1"
	git push $2
}

gacpb final_commit project2
