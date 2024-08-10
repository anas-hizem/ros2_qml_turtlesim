#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "rclcomm.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    RclComm rclComm;
    rclComm._set_pub("turtle1/cmd_vel");
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("rclComm", &rclComm);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
