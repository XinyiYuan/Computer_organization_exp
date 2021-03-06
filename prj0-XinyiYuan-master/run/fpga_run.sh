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
��M^fpga_run.sh �Xmo�8�l���Vh����m�p��4qR�il�nZ�rPh����IA��f�v��7�i�t��["g8/�<3�O��9���!��듳Q4�.C��|�����>!��h�O��/g�wh�<�?��>O�h:����t��f"�(�۵���l���;��wx�{S�|��Ϣ���y0�ҾΒ�K���Ά'�ή,˂��\�)����~B.G���ٽ�l�E�W�.��U�U����eli�Qd�w��˔���Yt>�XM�Ai���QF�^{�`ue)Ձ�
�����`��a��y�����挐���Itz~Q��� N�R�"[�hM]��>�q��^�b�'�~cҷmaܷ�f���B��f�
����3)�M>_���}rkJ�˞�1?A�b��T�Â��������^٧L*�e�@p��t�1���b�tX����\��p%��?�Ҩp����7�ɂSr��[wB�XI�,dJ�@K01���yB�5t�g�å�n��vT~��O5���FsM�S4_2](��h��L��5X�=��!xq*7�W{]�M�#��� _nr��,��Ns;N$[��;�f�LfP�!��(~�E���̾������,�i���R����$�S��F���=���"J���{� �c�'\,�QVL�5��F�d�ۘ�6<q��i^�z�s����������qpkN�����nԚ8w�x�֨�X�����g���.0p��5��Q��Mqσ� �,	 ��)W�a�\�4+dX;W�%w1:MMd��.7�
�Z����kfb	%�y����m�o����?��fW�!�#���6ȫ��F�� 3_�*��:3_�F�nD���ګMȬ��ok�mAy
G7"a����:��x�}$�SKH1�2y��^M�Aj#WBՆ�+q�h�Oo'���|W�3�����D�Ѷ��:���2�|�T���zCSX�x���a�E�N?�({��+��0�ʿ�VO
��d��(��<���K�4��g7$���n����7}��ٞ��Kq�J�񶎄�E�d&�N�9F�����x\�;j�|L�c쀚%�3�����tV�2�r�� a�*K(��D~��e�i��,T�cV�U҃��46f�D�����2�"��4Iҙ>�f�h8o��`;k[e'T�rL���Tp�.8<
,�7��Z�s�0{l�w��w]�|�=�-7�T��kK��'�gV�Yi��y��;G�+!,mƮ���4PpO˗��b�H���X��w+�����0\��ȹ�lT��#F.��^|}���,2�~('��]�����b�������f�xxv����E�u%NN9��<>��Sc46/�c��J�`SnL���d��C��s�TG�S3��V��.h�_�

�r�\c���TO���;�����%��C��C�%Y���.܋�U<O�?��@�qd^ѷ�0e)�-`��0�mvi���)�t�)�a��۷`h�^W������b�P�^��T"��J;s�ej�ڞU\�@��{��	qOؽ5aj�b����sx[`����"s���4����<1&���^����)P�"��k��]�+��~si�.^��;M���}S�[k@��\҉�֣�\��w�h�g��l���%�gU�b��Q�x�+��xuS8)����M�im��.3.�,����3ij�i�G8$~��1�d��O6-���>2��By��vb3��Tb�y�����:�������9���EҞ9�W�ת��l[e"���L�����8�����1�N�a�<�H:N9Yc^R�O0�;��ݾ���e����dx��_�+wπ�%����m�������c;�W�F3�"
�1p��xq�K?A�M3����/����o�TÕ  