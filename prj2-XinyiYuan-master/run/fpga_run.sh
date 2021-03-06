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
�b5�^fpga_run.sh �Xmo�H��E�ך|Y0&!����$$A�	(0��nNNc7��۲�dro�����I �ڋP wUu�>U�O��9��d+˺ݝ����x|=p<����r��,�v<�����������������tx�O���+�v�	����v�y6xz���;]����7���7�����do�@���:�^7��$qJ�̕4�xMG�[���	k�cu����8�1rg�S�V���n�n��R!�����TD��q4�/F�C-){�$�;s�ޫ����z���H�i2h�����p棾7bsw�����Բ.&����ť9C�n�,sɒ�1�dIS���`�zw�~��C�+�����F��'J�L,��pI�d��ɶ��*���~��'��2(�/;2@'����PQ`���O��JKDƤH�,$�;��6��'�K�(�Z4X	��i*���I��o2�(0ޔn#�w&�S��4k
\<rX�Lf�)d�
� �S���VC{�u;x�jr_�����(}*i�	��(�H�����H�4�^�����C`��C������sdY��S� T�e��D�]4Z��jxr�BPp�HV�D�eB���X��d4��zH,�,��S��i�:��<ОB��2�f�[-}�0nR$���!� i��Rݥ�8�)+�J�"7��K̝�!> �о �g����#O�?�(_�)���k��խ�%�IVFwp!�D�x���]��&wL�j�IDIF�$H�$r�5��1�
f,AO�$\�(1�*_[-���MK�)RQ�;��o�G[).�`����U�K��	����ɵ�ٕ��l$�A�㇡+y�K�paN�9B+t�q.B�@���<'�#���O��W{�q�T������"��!��˗e���x��e��e�L�A'�����:Wk�"Y���"S�S� ����!(8M�;2v�B�I.uuU�T�/� BZ���,�9� &��q���&>U���l+�4�d�?�,J�LC,�e���yQw�e7`hW Ԭ� lMt�I|���ѐ�=r���C&E��<Q��	ReE3+O�Z�<Q��~�F��ǌ���#;,6򎻛}�� ����՚L&���h:3Y�&�\N��u&���+t��b{�FVw��
���'�9�%"���)��¥]u_��z�պ~φ�h2�g�|Z�ReLV�B)O"@d�w�z}˪iU%u�U
�eJ�y�J����Cs���q��X#��x�D�P��T���;R��&[�6F�^T���pF0p�a҈�����lS���3*����P<�c����T�ԃG*�,\�?��8������W̓����$
+l��Tˀv��[S\\�^��y*e���q�7�t��p�k�1�Vw�"i�O�*����IѴ��t?W�35/mN�8
4s�r
[!�1�)�j��eO��Yk0s��WDN
ݭ9��[9����i��R^G<_S���U��ۚ/�Ch�H,Y�0�aVmL�X&(�j.,��m2��7��u��8��QU��#���8<�)���ť+�Z�@OKU1�c�<��7kF W��s}O�S]��uUJ��Y-d�Й|j��P�2��R�J�Wa�OU�w����6/{=���wB��+.ϣ��MK4z�[D@�e�����*~d(����q��Ȍ1-��`�9�v�'؅�z%�6��h]ԷZ��1
�Z�x��_�Ə�4��4O�͆�'��N���'�,�[0LQlY�1�p1�p	�0�)�=koB�uB��{{=F4ωw}s���$}���$�t:脏Û��A׫�Ӑ�����e���c-	{h�Ś���t�{�>t�����@�W�a�<�zv5Q�X7�-EI�&<��UK������w^�c�>��;��T�$�6*�:�ª����h�7 Uq��G�Ei}�Ŵі�(F�F}!��N�:8=���ϣ�l'�����n�]=4���R��R�\*�:`��FtO�r�š��j8�7�U� P#׫�&�Z�*jeނ�	1�[�j߿��f�_7��fx��OZ�P�V)��[
Q���7d���#˟5Ԯ�Y���s6I����d��cK�[vH�����I:  