import SwiftUI
import WidgetKit

struct AppIconWidget: Widget {
    var body: some WidgetConfiguration {
        return StaticConfiguration(kind: "App_Icon_Widget", provider: StaticWidgetProvider()) { entry in
            AppIconWidgetEntryView(entry: entry)
        }
        .configurationDisplayName(L10n.widgetsAppIconName)
        .description(L10n.widgetsAppIconDescription)
        .supportedFamilies([.accessoryCircular])
    }
}

struct AppIconWidgetEntryView: View {
    @State var entry: StaticWidgetProvider.Entry

    var body: some View {
        ZStack {
            Color.black
            Image("logo-transparent-medium")
                .resizable()
                .frame(width: 55, height: 55)
        }
        .widgetURL(URL(string: "pktc://last_opened"))
    }
}
