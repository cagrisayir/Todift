//
//  Extensions.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 25.01.2024.
//

import Foundation

extension String {
    func firstLetters() -> String {
        return split(separator: " ").map { String($0.first!) }.joined()
    }
}
