# Notes toro project

## 06.12.2021

Die Motor-Treiber (L293B) können irgendwie nicht mit dem 12V-Schaltregler (MAX5035). Es gibt eine spezielle Version (L293E) des Treibers für "switchmode control". Vielleicht müsste man die verwenden. Aktuell sind die L293 jetzt direkt mit dem 18V-Akku verbunden. Das erhöht das Drehmoment und die Motorspannung und auch die Wärmeentwicklung. Nach 2 Min haben die L293 ICs ca. 55°C bei 18°C Umgebungstemperatur. Die max Temperatur wird mit 70°C angegeben, allerdings haben die L293s auch "thermal shutdown" und sind austauschbar platziert. Evtl muss man in Zukunft Kühlkörper anbringen oder die Platine mit Schutzdioden ausstatten (4 pro Channel, d.h. 16 insgesamt). Die Motoren erreichen nun ca. 230 mNm (anstatt vorher 60 mNm).

## 01.10.2021

Die Motor-Treiber-Platine hat irgendwo einen Wackelkontakt.
Manchmal drehen die Motoren nicht sauber, dann hilft es, einmal die Platine zu lüpfen und wieder fallen zu lassen.
