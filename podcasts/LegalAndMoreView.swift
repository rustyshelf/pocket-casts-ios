import SwiftUI

struct LegalAndMore: View {
    @EnvironmentObject var theme: Theme

    var body: some View {
        ZStack {
            ThemeColor.primaryUi04(for: theme.activeTheme).color
                .ignoresSafeArea()
            List {
                Section {
                    AboutRow(mainText: L10n.aboutTermsOfService, showChevronIcon: true) {
                        UIApplication.shared.open(Constants.termsOfUseURL)
                    }
                    AboutRow(mainText: L10n.aboutPrivacyPolicy, showChevronIcon: true) {
                        UIApplication.shared.open(Constants.privacyPolicyURL)
                    }
                    AboutRow(mainText: L10n.aboutAcknowledgements, showChevronIcon: true) {
                        UIApplication.shared.open(Constants.acknowledgementsURL)
                    }
                }
            }
            .listStyle(.insetGrouped)
        }
        .navigationBarTitle(L10n.aboutLegalAndMore, displayMode: .inline)
    }

    private enum Constants {
        static let termsOfUseURL = URL(string: "https://support.pocketcasts.com/article/terms-of-use-overview/")!
        static let privacyPolicyURL = URL(string: "https://support.pocketcasts.com/article/privacy-policy/")!
        static let acknowledgementsURL = Bundle.main.url(forResource: "acknowledgements", withExtension: "html")!
    }
}
