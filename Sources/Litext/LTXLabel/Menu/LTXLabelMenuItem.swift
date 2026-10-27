//
//  LTXLabelMenuItem.swift
//  Litext
//
//  Created by OpenAI Codex.
//

#if canImport(UIKit) && !os(tvOS) && !os(watchOS)

    import UIKit

    enum LTXLabelMenuItem: CaseIterable {
        case copy
        case selectAll
        case share

        var action: Selector? {
            switch self {
            case .copy:
                #selector(LTXLabel.copyMenuItemTapped)
            case .selectAll:
                #selector(LTXLabel.selectAllTapped)
            case .share:
                #selector(LTXLabel.shareMenuItemTapped)
            }
        }

        var title: String {
            switch self {
            case .copy:
                LocalizedText.copy
            case .selectAll:
                LocalizedText.selectAll
            case .share:
                LocalizedText.share
            }
        }

        var image: UIImage? {
            switch self {
            case .copy:
                UIImage(systemName: "doc.on.doc")
            case .selectAll:
                UIImage(systemName: "selection.pin.in.out")
            case .share:
                UIImage(systemName: "square.and.arrow.up")
            }
        }

        static func textSelectionMenu() -> [LTXLabelMenuItem] {
            // System injects the standard Copy item into the selection menu on
            // iOS 16+; keep only the custom items that have no system twin.
            allCases.filter { $0 != .copy }
        }
    }

#endif
