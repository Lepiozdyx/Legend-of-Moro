import Foundation
import SwiftUI

struct LegendOfMoroEntryScreen: View {
    @StateObject private var loader: LegendOfMoroWebLoader

    init(loader: LegendOfMoroWebLoader) {
        _loader = StateObject(wrappedValue: loader)
    }

    var body: some View {
        ZStack {
            LegendOfMoroWebViewBox(loader: loader)
                .opacity(loader.state == .finished ? 1 : 0.5)
            switch loader.state {
            case .progressing(let percent):
                LegendOfMoroProgressIndicator(value: percent)
            case .failure(let err):
                LegendOfMoroErrorIndicator(err: err)
            case .noConnection:
                LegendOfMoroOfflineIndicator()
            default:
                EmptyView()
            }
        }
    }
}

private struct LegendOfMoroProgressIndicator: View {
    let value: Double
    var body: some View {
        GeometryReader { geo in
            LegendOfMoroLoadingOverlay(progress: value)
                .frame(width: geo.size.width, height: geo.size.height)
                .background(Color.black)
        }
    }
}

private struct LegendOfMoroErrorIndicator: View {
    let err: String  // было Error, стало String
    var body: some View {
        Text("Ошибка: \(err)").foregroundColor(.red)
    }
}

private struct LegendOfMoroOfflineIndicator: View {
    var body: some View {
        Text("Нет соединения").foregroundColor(.gray)
    }
}
