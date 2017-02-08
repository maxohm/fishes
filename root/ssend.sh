#!/bin/sh
#
PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin
ADMIN="ershov_mn@inbox.ru"

CODE="$1"
SENDER="$2"
shift 2
FILE=motd # Имя файла бэкапа
LOG="/etc/$FILE"  # Файл, который будем пересылать
TMP=/tmp # Директория для временных файлов

TMPMAIL=$TMP/new_mail.$$
#trap "rm -f $TMPMAIL; exit" 0 1 2 15

BOUNDARY="newlog-`date +%s`-$$"

# Create mail header:
echo "To: $ADMIN" > $TMPMAIL
echo "Subject: Log from SERVER " >> $TMPMAIL
echo "Mime-Version: 1.0" >> $TMPMAIL
echo "Content-Type: multipart/mixed; boundary=$BOUNDARY" >> $TMPMAIL

# Create first part of the mail
echo "--$BOUNDARY" >> $TMPMAIL
echo "Content-Type: text/plain; charset=utf-8" >> $TMPMAIL #кодировка письма
echo "" >> $TMPMAIL
echo "log" >> $TMPMAIL
echo "`date`." >> $TMPMAIL
echo "" >> $TMPMAIL

echo "--$BOUNDARY" >> $TMPMAIL
echo "Content-Type: application/octet-stream" >> $TMPMAIL # тип содержимого
echo "Content-Transfer-Encoding: base64" >> $TMPMAIL
echo "Content-Disposition: attachment; filename=\"$FILE.txt\"" >> $TMPMAIL
echo "" >> $TMPMAIL

b64encode $LOG ->> $TMPMAIL
echo "" >> $TMPMAIL

echo "--$BOUNDARY--" >> $TMPMAIL

ssmtp -v4 ershov.mn@yandex.ru <$TMPMAIL
exit 0
