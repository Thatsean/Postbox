cmake_minimum_required(VERSION 3.16)

project(Postbox VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.8 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appPostbox
    src/main.cpp
    app.rc
)

qt_add_qml_module(appPostbox
    URI Postbox
    VERSION 1.0
    QML_FILES
        qml/Main.qml
)

qt_add_resources(appPostbox "Postbox"
    PREFIX
        "/Assets/Icon"
    FILES
        Assets/Icon/Postbox.ico
)

qt_add_resources(appPostbox "PostboxRuntimeIcon"
    PREFIX
        "/Postbox/Assets"
    FILES
        Assets/Logo.png
)

set_target_properties(appPostbox PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appPostbox
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appPostbox
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
