# Quicksort algorithm for 32-bit ARM platform
## About
#### Form of input
	quicksort [sort mode] elem0, elem1, elem2, ...

	sort mode:
		a - ascending sort
		d - descending sort
## Build
#### Prerequirements
- ARM platform *(32-bit)*
- GNU/Linux
- GCC Compiler
#### From root directory
	make/make all - build quicksort with bin/build directories
	make dir - creare bin/build direcroties
	make rdir - remove bin/build directories
	make clean - clean bin/build directories
## Usage
#### From root directory
	./bin/quicksort a 5 4 3 2 1
	Array[5]: 1 2 3 4 5

	./bin/quicksort d 1 2 3 4 5
	Sorted array[5]: 5 4 3 2 1 
