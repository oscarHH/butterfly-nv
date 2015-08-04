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

    QQmlContext * ctxt = engine.rootContext();
    ctxt->setContextProperty("Direccion",direccion);


    //engine.load(QUrl(direccion+"/buterffly-nv-engine/main.qml"));
    engine.load(QUrl(direccion+"/buterffly-nv-engine/main.qml"));

    return app.exec();
}
