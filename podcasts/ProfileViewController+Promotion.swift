extension ProfileViewController: PromotionRedeemedDelegate {
    func showPromotionViewController(promoCode: String?) {
        let promoVC = PromotionViewController()
        promoVC.promoCode = promoCode
        promoVC.delegate = self
        present(SJUIUtils.popupNavController(for: promoVC), animated: true, completion: nil)
    }

    func showPromotionRedeemedAcknowledgement() {
        let promoAcknowledgementVC = PromotionAcknowledgementViewController(serverMessage: promoRedeemedMessage)
        promoAcknowledgementVC.configureBottomSheetModal()
        
        present(promoAcknowledgementVC, animated: true, completion: nil)
    }

    func promotionRedeemed(message: String) {
        promoRedeemedMessage = message
    }
}
