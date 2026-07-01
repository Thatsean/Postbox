pragma Singleton
import QtQuick

QtObject {
    property string currentTheme: "Light"

    //Define themes here, DO NOT FORGET TO UPDATE

    readonly property var themes: ({
        "Dark": ThemeDark,
        "Light": ThemeLight,
    })

    readonly property var activeTheme: themes[currentTheme] || themes["Dark"]

    readonly property color backgroundColor: activeTheme.backgroundColor
    readonly property color elementColor: activeTheme.elementColor
    readonly property color focusedColor: activeTheme.focusedColor
    readonly property color accentColor: activeTheme.accentColor
    readonly property color bodyTextColor: activeTheme.bodyTextColor
    readonly property color subTextColor: activeTheme.subTextColor
    readonly property color outlineColor: activeTheme.outlineColor || "transparent"

    function setTheme(themeName) {
        if (themes[themeName]) {
            currentTheme = themeName
        }
    }
}