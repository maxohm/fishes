#!/bin/sh
#
#
PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin
#
ADMIN=$3
FILE=$2
LOG=$1/$2
TMP=/tmp
PASS=`/usr/bin/uname -n`
MYIP=`curl -s https://api.ipify.org`
#
TMPMAIL=$TMP/new_mail.$$
BOUNDARY="newlog-`date +%s`-$$"
#
trap "rm -f $TMPMAIL; exit" 0 1 2 15
#
# Create mail header:
echo "To: $ADMIN" > $TMPMAIL
echo "Subject: $PASS $MYIP" >> $TMPMAIL
echo "Mime-Version: 1.0" >> $TMPMAIL
echo "Content-Type: multipart/mixed; boundary=$BOUNDARY" >> $TMPMAIL

# Create first part of the mail
#echo "--$BOUNDARY" >> $TMPMAIL
#echo "Content-Type: text/plain; charset=utf-8" >> $TMPMAIL
#echo "" >> $TMPMAIL
#cat $LOG >> $TMPMAIL
#echo "" >> $TMPMAIL

echo "--$BOUNDARY" >> $TMPMAIL
echo "Content-Type: text/plain; charset=utf-8" >> $TMPMAIL
echo "Content-Type: application/octet-stream" >> $TMPMAIL
echo "Content-Transfer-Encoding: base64" >> $TMPMAIL
echo "Content-Disposition: attachment; filename=\"$FILE.txt\"" >> $TMPMAIL
echo "" >> $TMPMAIL

cat $LOG >> $TMPMAIL
echo "" >> $TMPMAIL

echo "--$BOUNDARY--" >> $TMPMAIL

ssmtp -v4 $3 <$TMPMAIL
exit 0

