#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QtQml/qqml.h>
#include <QUrl>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/Postbox/Assets/Logo.png"));

    qmlRegisterSingletonType(
        QUrl("qrc:/Postbox/Themes/qml/Themes/ThemeDark.qml"),
        "Postbox",
        1,
        0,
        "ThemeDark");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Postbox", "Main");

    return app.exec();
}
