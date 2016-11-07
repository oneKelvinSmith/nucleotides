defmodule NucleotidesTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  doctest Nucleotides

  describe "parse/1" do
    test "parses a dna string into a map" do
      dna = "ATCG"
      assert Nucleotides.parse(dna) == %{a: 1, t: 1, c: 1, g: 1}
    end

    test "parses a longer dna string into a map" do
      dna = "AAATTCGGGG"
      assert Nucleotides.parse(dna) == %{a: 3, t: 2, c: 1, g: 4}
    end
  end

  describe "print/1" do
    test "prints a given tuple of strings" do
      assert capture_io(fn ->
        Nucleotides.print(%{a: 1, t: 1, c: 1, g: 1})
      end) == """
      1 1 1 1
      """
    end

    test "handles tuple of numbers in order" do
      assert capture_io(fn ->
        Nucleotides.print(%{a: 1, c: 2, g: 3, t: 4})
      end) == """
      1 2 3 4
      """
    end

    test "handles tuple of numbers out of order" do
      assert capture_io(fn ->
        Nucleotides.print(%{g: 3, a: 1, t: 4, c: 2})
      end) == """
      1 2 3 4
      """
    end

    test "handles everything else" do
      tuple = {}
      assert capture_io(fn ->
        Nucleotides.print(tuple)
      end) == """
      Invalid
      """
    end
  end

  describe "solve/1" do
    test "solves the puzzle" do
      dna = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
      assert capture_io(fn ->
        Nucleotides.solve(dna)
      end) == """
      20 12 17 21
      """
    end
  end
end
