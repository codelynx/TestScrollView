//
//  ViewController.swift
//  TestScrollView
//
//  Created by Kaz Yoshikawa on 2/4/18.
//	Copyright (c) 2018 Electricwoods LLC. All rights reserved.

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var segmentedControl: UISegmentedControl!

	let image = #imageLiteral(resourceName: "Sample.png")

	static let scale: CGFloat = 0.75
	var contentSize: CGSize = CGSize.zero

	let sizes: [(title: String, scale: CGFloat)] = [
		("S", 0.25),
		("M", 1.0),
		("L", 2.0)
	]


	override func viewDidLoad() {
		self.scrollView.layer.borderColor = UIColor.red.cgColor
		self.scrollView.layer.borderWidth = 2
		super.viewDidLoad()
		self.segmentedControl.removeAllSegments()
		for (index, size) in sizes.enumerated() {
			self.segmentedControl.insertSegment(withTitle: size.title, at: index, animated: false)
		}
		self.segmentedControl.selectedSegmentIndex = 1
		self.contentSize = image.size * sizes[segmentedControl.selectedSegmentIndex].scale
		self.view.backgroundColor = UIColor.lightGray
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.scrollView.translatesAutoresizingMaskIntoConstraints = false
		self.scrollView.contentInsetAdjustmentBehavior = .never
		self.scrollView.contentSize = contentSize
		self.imageView.frame = CGRect(origin: CGPoint.zero, size: contentSize)
		let margin = (self.scrollView.bounds.size - self.contentSize) * 0.5
		let insets = [margin.width, margin.height].map { $0 > 0 ? $0 : 0 }
		self.scrollView.contentInset = UIEdgeInsets(top: insets[1], left: insets[0], bottom: insets[1], right: insets[0])
	}

	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return imageView
	}

	@IBAction func resizeAction(_ sender: UISegmentedControl) {
		assert(sender.selectedSegmentIndex < sizes.count)
		self.contentSize = image.size * sizes[segmentedControl.selectedSegmentIndex].scale
		self.view.setNeedsLayout()
	}

	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
	}
}

