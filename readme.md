# Bitmap Holes

Consider an MxN bitmap where the cells are 0 or 1. '1' means filled and '0' means empty.

Find the number of 'holes' in the bitmap, where a hole is a contiguous region of empty cells.

For example, this has two holes:

11111
10101
10101
11111

... and this has only one:

11111
10001
10101
11111

## Haskell Solution

The Haskell solution provided in this repository consists of a single Haskell source file, `BitmapHoles.hs`.

The main function in the file is `bitmapHoles :: [String] -> Int`, which takes a list of strings representing a bitmap and returns the number of holes in the bitmap.

The implementation uses the `Array` data type from the `Data.Array` module to represent the bitmap and recursive functions to find and count holes.

To run the Haskell solution, follow these steps:

1. Make sure you have the GHC (Glasgow Haskell Compiler) installed on your system.
2. Navigate Powershell or CMD to the file and enter `ghci`
3. load the file by the following `:load bitmap.hs`.
4. Enter main to run the file

The program will output the number of holes for the example bitmap provided in the `main` function.

Feel free to modify the input bitmap in the `main` function to test the solution with different examples.
