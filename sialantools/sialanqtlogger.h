/*
    Copyright (C) 2014 Sialan Labs
    http://labs.sialan.org

    This project is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This project is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef SIALANQTLOGGER_H
#define SIALANQTLOGGER_H

#include <QObject>

class SialanQtLoggerPrivate;
class SialanQtLogger : public QObject
{
    Q_OBJECT
public:
    SialanQtLogger(const QString & path, QObject *parent = 0);
    ~SialanQtLogger();

    virtual void logMsg(QtMsgType type , const QMessageLogContext &context, const QString &msg);

public slots:
    void debug( const QVariant & var );

private:
    SialanQtLoggerPrivate *p;
};

#endif // SIALANQTLOGGER_H
