//
//  BinarySearch.swift
//  SwiftBits
//
//  Created by Quentin Mathé on 15/07/2014.
//  Copyright (c) 2014 Quentin Mathé. All rights reserved.
//

import Foundation

func midpoint(min: Int, max: Int) -> Int
{
	assert(min <= max);
	return min + (max - min) / 2
}

func binarySearchInRange<T: Comparable>(sequence: T[], value: T, min: Int, max: Int) -> T?
{
	assert(min <= max);

	if min == max
	{
		return value == sequence[min] ? value : nil
	}

	let middle = midpoint(min, max);

	if value == sequence[middle]
	{
		return value
	}
	else if value < sequence[middle]
	{
		return binarySearchInRange(sequence, value, min, middle - 1)
	}
	else if value > sequence[middle]
	{
		return binarySearchInRange(sequence, value, middle + 1, max)
	}
	else
	{
		return nil
	}
}

func binarySearch<T: Comparable>(sequence: T[], value: T) -> T?
{
	return binarySearchInRange(sequence, value, 0, sequence.count - 1)
}

func binarySearchInRangeIterative<T: Comparable>(sequence: T[], value: T, minIndex: Int, maxIndex: Int) -> T?
{
	var min = minIndex;
	var max = maxIndex;
	
	assert(min <= max);

	while min <= max
	{
		if min == max
		{
			return value == sequence[min] ? value : nil
		}

		let middle = midpoint(min, max)
	
		if value == sequence[middle]
		{
			return value
		}
		else if value < sequence[middle]
		{
			max = middle - 1
		}
		else if value > sequence[middle]
		{
			min = middle + 1
		}
		else
		{
			return nil
		}
	}

	return nil
}