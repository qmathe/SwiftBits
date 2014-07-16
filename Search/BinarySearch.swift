//
//  BinarySearch.swift
//  SwiftBits
//
//  Created by Quentin Mathé on 15/07/2014.
//  Copyright (c) 2014 Quentin Mathé. All rights reserved.
//

import Foundation

func midpoint<T: Integer>(min: T, max: T) -> T
{
	assert(min <= max);
	return min + (max - min) / 2
}

/** 
 * C.IndexType must be declared as Integer to support arithmetic computations
 * such as midpoint() or assert(min <= max). As a counter example, 
 * BidirectionalIndex supports navigation but not computation.
 */
func binarySearchInRange<C: Swift.Collection, T: Comparable where T == C.GeneratorType.Element, C.IndexType: Integer>(sequence: C, value: T, min: C.IndexType, max: C.IndexType) -> T?
{
	assert(min <= max);

	if min == max
	{
		return value == sequence[min] ? value : nil
	}

	let middle = midpoint(min, max);

	if value < sequence[middle]
	{
		return binarySearchInRange(sequence, value, min, middle - 1)
	}
	else if value > sequence[middle]
	{
		return binarySearchInRange(sequence, value, middle + 1, max)
	}
	else
	{
		assert(value == sequence[middle])
		return value
	}
}

func binarySearch<T: Comparable>(sequence: [T], value: T) -> T?
{
	return binarySearchInRange(sequence, value, 0, sequence.count - 1)
}

func binarySearchInRangeIterative<C: Swift.Collection, T: Comparable where T == C.GeneratorType.Element, C.IndexType: Integer>(sequence: C, value: T, minIndex: C.IndexType, maxIndex: C.IndexType) -> T?
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

		if value < sequence[middle]
		{
			max = middle - 1
		}
		else if value > sequence[middle]
		{
			min = middle + 1
		}
		else
		{
			assert(value == sequence[middle])
			return value
		}
	}

	return nil
}
