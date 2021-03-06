package main

import (
	"C"
)

type BiGram struct{ a, b rune }

func CreateBiGrams(s string) map[BiGram]bool {
	result := make(map[BiGram]bool)
	end := rune(0)
	for i, c := range s {
		if i > 0 {
			result[BiGram{end, c}] = true
		}
		end = c
	}
	return result
}

//export dice_similarity
func dice_similarity(s1in, s2in *C.char) float32 {
	s1 := C.GoString(s1in)
	s2 := C.GoString(s2in)
	bigram1, bigram2 := CreateBiGrams(s1), CreateBiGrams(s2)
	// ruby only supports float32
	var numIntersects float32
	for first, _ := range bigram1 {
		if bigram2[first] {
			numIntersects += 1
		}
	}
	return 2.0 * numIntersects / float32(len(bigram1)+len(bigram2))
}

func main() {}

// all of the following is taken and slightly adjusted to compile with exported function
// from https://github.com/arbovm/levenshtein/blob/master/levenshtein.go

//Copyright (c) 2015, Arbo von Monkiewitsch All rights reserved.

//Redistribution and use in source and binary forms, with or without
//modification, are permitted provided that the following conditions are
//met:

//1. Redistributions of source code must retain the above copyright
//notice, this list of conditions and the following disclaimer.

//2. Redistributions in binary form must reproduce the above copyright
//notice, this list of conditions and the following disclaimer in the
//documentation and/or other materials provided with the distribution.

//3. Neither the name of the copyright holder nor the names of its
//contributors may be used to endorse or promote products derived from
//this software without specific prior written permission.

//THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
//LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
//A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
//HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
//SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
//LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
//THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Calculate the Levenshtein distance between two strings

//export levenshtein_distance
func levenshtein_distance(s1in, s2in *C.char) int {
	s1 := C.GoString(s1in)
	s2 := C.GoString(s2in)
	var cost, lastdiag, olddiag int
	len_s1 := len([]rune(s1))
	len_s2 := len([]rune(s2))

	column := make([]int, len_s1+1)

	for y := 1; y <= len_s1; y++ {
		column[y] = y
	}

	for x := 1; x <= len_s2; x++ {
		column[0] = x
		lastdiag = x - 1
		for y := 1; y <= len_s1; y++ {
			olddiag = column[y]
			cost = 0
			if s1[y-1] != s2[x-1] {
				cost = 1
			}
			column[y] = min(
				column[y]+1,
				column[y-1]+1,
				lastdiag+cost)
			lastdiag = olddiag
		}
	}
	return column[len_s1]
}
func min(a, b, c int) int {
	if a < b {
		if a < c {
			return a
		}
	} else {
		if b < c {
			return b
		}
	}
	return c
}
