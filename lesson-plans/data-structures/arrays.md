## Jump!
1: [Data Structures: Arrays](https://github.com/EthanC2/code-club/blob/main/lesson-plans/data-structures/arrays.md#data-structures-arrays) <br />
2: [Arrays as a Physical Data Structure](https://github.com/EthanC2/code-club/blob/main/lesson-plans/data-structures/arrays.md#arrays-as-a-physical-data-structure) <br />
3: [Array Internals](https://github.com/EthanC2/code-club/blob/main/lesson-plans/data-structures/arrays.md#array-internals) <br />

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
for(size_t i=0; i < size; ++i)
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
you will use an array-based data structure instead of a linked list based one if the size is static (unchanging) because of their better performance. Below is an example
of an array-based stack that I based on C++'s [std::stack](https://en.cppreference.com/w/cpp/container/stack) from the standard template library (STL).

```C++
template <typename T, size_t N>
class Stack
{
  private:
      T data[N];
      size_t current_size;
      size_t max_size;

  public:
      //Special functions
      Stack();

      //Accessors
      size_t size() const;
      size_t capacity() const;
      [[nodiscard]] bool empty() const;
      bool full() const;
      T top() const;

      //Mutators
      void push(T);
      void pop();
      void clear();
};

template <typename T, size_t N>
Stack<T,N>::Stack()
{
    current_size = 0;
    max_size = N;
}

template <typename T, size_t N>
size_t Stack<T,N>::size() const
{
    return current_size;
}

template <typename T, size_t N>
size_t Stack<T,N>::capacity() const
{
    return max_size;
}

template <typename T, size_t N>
bool Stack<T,N>::empty() const
{
    return current_size == 0;
}

template <typename T, size_t N>
bool Stack<T,N>::full() const
{
    return current_size == max_size;
}

template <typename T, size_t N>
T Stack<T,N>::top() const
{
    return data[current_size-1];
}

template <typename T, size_t N>
void Stack<T,N>::push(T value)
{
    if (full())
      std::clog << "Error! stack is already at max size!\n";
    else
    {
        data[current_size] = value;
        current_size++;
    }
}

template <typename T, size_t N>
void Stack<T,N>::pop()
{
    current_size--;
}

template <typename T, size_t N>
void Stack<T,N>::clear()
{
    current_size = 0;
}
```

# Array Internals 
"An array is a sequence of objects (variables) of the same type that occupy a contiguous area of memory" \[[1](https://docs.microsoft.com/en-us/cpp/cpp/arrays-cpp?view=msvc-170)\].
Since all the elements of the array are back-to-back in memory, it would be a waste to maintain a reference to every single one; it's far more efficient to store a reference
to the beginning of the memory along with the amount of elements and then just do the math via pointer arithmetic \[[1](https://www.educba.com/pointer-arithmetic-in-c/)\] 
\[[2](https://docs.microsoft.com/en-us/cpp/c-language/pointer-arithmetic?view=msvc-170)\]. So, that's exactly what C++ does. If you're curious, this is why arrays are zero-indexed: 
because the index of an element is determined by the offset from the first element in the array \[[1](https://towardsdatascience.com/c-basics-array-data-structure-c25b8ad4d32c)\].
To prove this, let's show that `array[index]` is just a shorthand for the more accurate `*(array + index)`.

```C++
int arr[5] {1, 2, 3, 4, 5};

for(int i=0; i < 5; ++i)
{
    std::cout << arr[i] << " == " << *(arr + i) << '\n';
}
```
> Output: <br />
> 1 == 1 <br />
> 2 == 2 <br />
> 3 == 3 <br />
> 4 == 4 <br />
> 5 == 5 <br />

# Arrays Performance: Cache Locality
In _Arrays as a Physical Data Structure_, I mentioned that arrays have better performance than linked lists, but why? The answer is __cache locality__ \[[1](https://www.geeksforgeeks.org/locality-of-reference-and-cache-operation-in-cache-memory/)\]\[[2](https://www.quora.com/What-is-meant-by-cache-locality-of-arrays?share=1)\].
You see, the CPU can only store a very small amount of data in its [registers](https://www.learncomputerscienceonline.com/what-are-cpu-registers/), so it has to store the majority
of data in main memory \[[1](https://ulmerstudios.com/popular/what-is-main-memory-in-computer-architecture/)]\]\[[2](https://www.cs.uic.edu/~jbell/CourseNotes/OperatingSystems/8_MainMemory.html)\]. Unfortunately, accessing main memory (like most I/O operations) is very slow and could cause a CPU to idle for hundred or even thousands of CPU cycles, 
so there the CPU takes advantage of an intermediary storage facilities called
[caches](https://cpuninja.com/cpu-cache/) \[[1](https://www.youtube.com/watch?v=WDIkqP4JbkE&t=964s)\].

# C-Style Arrays vs _std::array\<T,N\>_

# C-Style Arrays vs _std::vector\<T\>_
