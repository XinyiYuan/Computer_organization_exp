#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��AF^mips_bench_run.sh �Um��F�����RZ�6���J�P��8�
~��5ڈ�a���.�^���{}g+��|�ٙgf�gg���Y��Y�rMH�9��}��uJ�T�Lq�E�d�(C�&a*Y�!��,=��{��<�8��ϝ���v���'�	�{���o�TRV�a����.��mͣ�k_����sۀhO�G���r
����V�a�����5��	���v�Ҳ\�,�S�}T�>7~o�Ҏ��R"����>����G���\RB>z��P���.y�3�6�}U���� �yG��K��6G��4��B�%!8%�eG���v탁A�W��d?�o�?�-v?�|y��[|]x�B�&R��D��Kb5��*�5bU{^'ASQV�+���F�h`��� ���%r����WB,���@�.(�/Ī�<G�x��@=��� 	%W���o�%W`�K�x,��U�r+*ޅ?�5K9+9�ad��r��,x$��gx���AC�,����{�6e�"2׶���lЃ�d*�T�S&x��3��A^#�ʠ���T� *b%�/|���>�"H����;�LB��.">;9��
���܉�����5OSY�Ti�`����w�T�-u�/pq���d��3��X��d�sCut+3���6+��n�P��}�����
����N�r<Xǈ���"ַK3�8;���'��s%�]��+��l:}�7�oڙ{����CI�1B��oO	�\���`%q!U�t��;�����n�#\���xZ�`Kfb!��nw�C��1���{��`��in�s����H�T� ��\���e�	i�ֿ�C�Ρ<��a���E�/�i[�c  