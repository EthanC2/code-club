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

# Arrays as a Physical Data Structure
An array is an example of a [physical data structure](https://www.udemy.com/tutorial/datastructurescncpp/physical-vs-logical-data-structures/); along with a linked list,
arrays are the building blocks of most other data structures (e.g. stack, queue, heap) \[[1](http://faculty.cs.niu.edu/~mcmahon/CS241/Notes/array_based_stack.html)\]\[[2](http://faculty.cs.niu.edu/~mcmahon/CS241/Notes/Data_Structures/array_based_queue.html)\]\[[3](https://www.algolist.net/Data_structures/Binary_heap/Array-based_int_repr)\]. Typically,
you will use an array-based data structure instead of a linked list based one if the size is static (unchanging) because of their better performance.

# Array Internals 
Internally, an array is just a pointer.

# Arrays Performance: Cache Locality
In _Arrays as a Physical Data Structure_, I mentioned that arrays have better performance than linked lists, but why? The answer is __cache locality__ \[[1](https://www.geeksforgeeks.org/locality-of-reference-and-cache-operation-in-cache-memory/)\]\[[2](https://www.quora.com/What-is-meant-by-cache-locality-of-arrays?share=1)\].
