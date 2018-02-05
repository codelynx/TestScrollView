//
//  CoreGraphics+Z.swift
//  TestScrollView
//
//  Created by Kaz Yoshikawa on 2/4/18.
//	Copyright (c) 2018 Electricwoods LLC. All rights reserved.
//

import CoreGraphics

infix operator •
infix operator ×

// MARK: -

protocol FloatCovertible {
	var floatValue: Float { get }
}

extension CGFloat: FloatCovertible {
	var floatValue: Float { return Float(self) }
}

extension Int: FloatCovertible {
	var floatValue: Float { return Float(self) }
}

extension Float: FloatCovertible {
	var floatValue: Float { return self }
}

// MARK: -

protocol CGFloatCovertible {
	var cgFloatValue: CGFloat { get }
}

extension CGFloat: CGFloatCovertible {
	var cgFloatValue: CGFloat { return self }
}

extension Int: CGFloatCovertible {
	var cgFloatValue: CGFloat { return CGFloat(self) }
}

extension Float: CGFloatCovertible {
	var cgFloatValue: CGFloat { return CGFloat(self) }
}

// MARK: -

extension CGPoint {

	static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
		return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
	}

	static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
		return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
	}

	static func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
		return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
	}

	static func / (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
		return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
	}
	
	static func • (lhs: CGPoint, rhs: CGPoint) -> CGFloat { // dot product
		return lhs.x * rhs.x + lhs.y * rhs.y
	}

	static func × (lhs: CGPoint, rhs: CGPoint) -> CGFloat { // cross product
		return lhs.x * rhs.y - lhs.y * rhs.x
	}
	
	var length²: CGFloat {
		return (x * x) + (y * y)
	}

	var length: CGFloat {
		return sqrt(self.length²)
	}

	var normalized: CGPoint {
		let length = self.length
		return CGPoint(x: x/length, y: y/length)
	}

}

extension CGPoint {

	init<X: CGFloatCovertible, Y: CGFloatCovertible>(_ x: X, _ y: Y) {
		self.x = x.cgFloatValue
		self.y = y.cgFloatValue
	}

}


extension CGSize {

	init<W: CGFloatCovertible, H: CGFloatCovertible>(_ width: W, _ height: H) {
		self.width = width.cgFloatValue
		self.height = height.cgFloatValue
	}

	static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
		return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
	}

	static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
		return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
	}

	static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
		return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
	}

	static func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
		return CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
	}

}


extension CGRect {

	init<X: CGFloatCovertible, Y: CGFloatCovertible, W: CGFloatCovertible, H: CGFloatCovertible>(_ x: X, _ y: Y, _ width: W, _ height: H) {
		self.origin = CGPoint(x, y)
		self.size = CGSize(width, height)
	}

}

