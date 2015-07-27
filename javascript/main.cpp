#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QDir>
#include <QQmlContext>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QString direccion ="file:///"+ QDir::currentPath();
    qDebug()<<direccion;
    QQmlContext * ctxt = engine.rootContext();
    ctxt->setContextProperty("Direccion",direccion);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
