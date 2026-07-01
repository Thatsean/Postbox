cmake_minimum_required(VERSION 3.16)

project(Postbox VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

set_source_files_properties(qml/Theme.qml PROPERTIES
    QT_QML_SINGLETON_TYPE TRUE
)

qt_add_executable(Postbox
    src/main.cpp
    app.rc
)

qt_add_qml_module(Postbox
    URI Postbox
    VERSION 1.0
    QML_FILES
        qml/Main.qml
        qml/Theme.qml
)

# Add Themes here

qt_add_resources(Postbox "PostboxThemes"
    PREFIX
        "/Postbox/Themes"
    FILES
        qml/Themes/ThemeDark.qml
        qml/Themes/ThemeLight.qml
)

qt_add_resources(Postbox "Postbox"
    PREFIX
        "/Assets/Icon"
    FILES
        Assets/Icon/Postbox.ico
)

qt_add_resources(Postbox "PostboxRuntimeIcon"
    PREFIX
        "/Postbox/Assets"
    FILES
        Assets/Logo.png
)

set_target_properties(Postbox PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(Postbox
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS Postbox
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
