#!/bin/bash
go build -buildmode=c-shared -o levenshtein.so levenshtein.go
