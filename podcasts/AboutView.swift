import PocketCastsServer
import SwiftUI

struct AboutView: View {
    @EnvironmentObject var theme: Theme

    @ObservedObject private var model = AboutViewModel()

    var dismissAction: () -> Void

    init(dismissAction: @escaping (() -> Void)) {
        self.dismissAction = dismissAction
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        NavigationView {
            ZStack {
                ThemeColor.primaryUi04(for: theme.activeTheme).color
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        ModalCloseButton(action: dismissAction)
                        Image(AppTheme.pcLogoVerticalImageName())
                            .accessibilityHidden(true)
                        Text(Settings.displayableVersion())
                            .font(.subheadline)
                            .textStyle(SecondaryText())
                            .padding(.top, 5)
                    }
                    .padding(.top, 30)
                    List {
                        Section {
                            AboutRow(mainText: L10n.aboutWebsite, secondaryText: L10n.websiteShort) {
                                openUrl(ServerConstants.Urls.pocketcastsDotCom)
                            }
                            AboutRow(mainText: L10n.instagram, secondaryText: L10n.socialHandle) {
                                SocialsHelper.openInstagram()
                            }
                            AboutRow(mainText: L10n.twitter, secondaryText: L10n.socialHandle) {
                                SocialsHelper.openTwitter()
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }

    private func openUrl(_ urlStr: String) {
        guard let url = URL(string: urlStr) else { return }

        let application = UIApplication.shared
        if application.canOpenURL(url) {
            application.open(url, options: [:], completionHandler: nil)
        }
    }
}

struct AboutRow: View {
    @EnvironmentObject var theme: Theme

    @State var mainText = ""
    @State var secondaryText: String? = nil
    @State var showChevronIcon: Bool = false
    @State var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Text(mainText)
                    .textStyle(PrimaryText())
                Spacer()
                if let secondaryText = secondaryText {
                    Text(secondaryText)
                        .textStyle(SecondaryText())
                }
                if showChevronIcon {
                    Image("chevron")
                        .renderingMode(.template)
                        .foregroundColor(ThemeColor.primaryIcon02(for: theme.activeTheme).color)
                }
            }
        }
        .listRowBackground(ThemeColor.primaryUi02(for: theme.activeTheme).color)
    }
}
