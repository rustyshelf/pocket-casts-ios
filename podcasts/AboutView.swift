import PocketCastsServer
import PocketCastsUtils
import SwiftUI

struct AboutView: View {
    @EnvironmentObject var theme: Theme

    @ObservedObject private var model = AboutViewModel()

    @State private var showLegalAndMore = false

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
                        Section {
                            AboutRow(mainText: L10n.aboutLegalAndMore, showChevronIcon: true) {
                                showLegalAndMore = true
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                }
                NavigationLink(destination: LegalAndMore(), isActive: $showLegalAndMore) {}
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

struct LogoView: View {
    @EnvironmentObject var theme: Theme

    private let maxRotationDegrees: Double = 30

    var logo: AboutLogo
    var index: Int
    var logoSize: CGFloat
    var logoOffset: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(logo.color)
            Image(logo.logoName)
                .rotationEffect(logo.randomRotation(maxDegrees: maxRotationDegrees))
                .tint(logo.logoTint(onDark: theme.activeTheme.isDark)) // tint is only available from iOS 15 onwards
        }
        .offset(x: -logoOffset * CGFloat(index), y: index % 2 == 0 ? -logoOffset : logoOffset)
        .frame(width: logoSize, height: logoSize)
        .accessibilityLabel(logo.description)
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

// MARK: Previews

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView {}
    }
}
