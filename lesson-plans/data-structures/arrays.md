# Data Structures: Arrays
An array is one of the most primitive but powerful data structures. An array is just a series of variables of some type (e.g. `int`, `char`, `double`) declared back to back
in memory. These variables (called elements) can be individually accessed with their [index](https://js.educative.io/edpresso/how-to-access-the-elements-of-an-array-by-index-number-in-cpp), which is a number that represents their position in the array. It's important to know that array are zero-indexed, meaning that the index `0` represents the first element in 
the array, not `1` like you would expect. Arrays are useful for succinctly representing many variables with a similer/the same purpose, allowing you to avoid having to write 
`double score1, score2, score3, score4;` and so on.

```C++
//Declare an array: <datatype> <name>[<amount>] = <values>
int size = 10;
int arr[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

//Access the first element in the array (arrays are zero-indexed!)
std::cout << "The first element in the array is: " << arr[0] << '\n';

//Print each element in the array: "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
std::cout << "Array elements: ";
for(std::size_t i=0; i < size; ++i)
{
    std::cout << arr[i] << (i != size-1 ? ", " : "");
}
```
> Output: <br />
> The first element in the array is: 1 <br />
> Array elements: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 <br />

# Array Internals 
Internally, an array is just a pointer.

# Arrays as a Physical Data Structure
An array is an example of a [physical data structure](https://www.udemy.com/tutorial/datastructurescncpp/physical-vs-logical-data-structures/),

# Arrays Performance: Cache Locality
