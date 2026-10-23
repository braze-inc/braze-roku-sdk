function BrazeDefaultInAppMessageStyles() as object
    colors = {
        white: "0xFFFFFFFF"
        darkGray: "0x333333FF"
        blue: "0x0072DDFF"
        translucentBlack: "0x00000099"
        transparent: "0x00000000"
        almostTransparent: "0x00000001"
    }

    return {
        cardWidth: 720
        cardFallbackHeight: 200
        cardScreenMargin: 20
        cardContentSpacing: 20
        cardBottomPadding: 24
        relayoutDelaySeconds: 0.05
        imageDefaultHeight: 200
        imageMaxHeight: 280
        buttonWidth: 264
        buttonHeight: 60
        buttonBorderWidth: 4
        buttonSpacing: 24
        defaultScreenWidth: 1280
        defaultScreenHeight: 720
        overlayColor: colors.translucentBlack
        cardBackgroundColor: colors.white
        headerTextColor: colors.darkGray
        messageTextColor: colors.darkGray
        buttonBackgroundColor: colors.blue
        buttonTextColor: colors.white
        buttonSelectedBorderColor: colors.blue
        buttonUnselectedBorderColor: colors.transparent
        buttonRowColor: colors.transparent
        closeButtonSize: 40
        closeButtonMargin: 12
        closeButtonBackgroundColor: colors.transparent
        closeButtonTextColor: colors.darkGray
        cardBottomSpacerColor: colors.almostTransparent
    }
end function
