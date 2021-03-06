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
�(i�^fpga_run.sh �X[o��~ń�H^�DɎ�ր�:��ǶK� MA�ȕĚ��R��i��;���RN,%�D93;�of���"L��ז�a���b��'��3��}�.�^�#˺�L���l6�x1���F���~6��f����t{�4�g�����|4��7x����������;��^].}�Kt$Ӡ���"Y*���ٵA����r����cz�޲�'�H�PＦæ���&��U�Uo��w�Cw�27+�J!�����LD��v<�.��#%)��ǽ�B����~�҈I�1����j4�Pߡ�wf�#˸e]N�μ��+���~���]�+��,a+��}��Ӈs���t?��e�{����yC
�b)��ei��N�m��Uݻ{;�O�{2(X�z�G'����.�2�a�!�!�,�>�k�+y(E������j��?-�����Z�=�2��­ Ȳ-~�\���-�F�/���!���Xl8<$�1���eK�A��A
 ��B�,������h=E��_�C�3�S��d!YĲ�Z���� �y�m	�d�9�a��"�k���:�-@y�1��y�� �.�iU�eu�(�+��	WE�d(�p���Ď���T���!a"�BU���s�C,uss� ]JA�q_ŵ�yNw?md:&PXu�Ю%R��� ��,����s$&�{�}&����&[����^�����H�0A�����GY�O9��;ƧL��T.ige#ݑ	,��#HKt}���ɦ���O#�rN4�!�V��
80�b�!Lq��TY��Q�y)�;Jqrӊ'�8��E䛧�&�E��ف�*B6U���M(�ц�~�\���]��F�g�U�0t�v�.�I�@,���$_"hr���_�)}e�\NR}��^i�HkF_�ٗ%#8��|Q���#�����:՞|�7OXv+�ã���Rw|��U��_��*v�ϻ��!f'J/nS�3y=_#�&i!U��Ve9� ���0�� f�:L�N��ET�$KMحr�!O7�#����}���#�ߗ��M��D.� ��@#t}�ѫ�J�W��F����q��r)�=�)��eH�G�8�=AEJ����D��Ǵ����=&�Ϙ�N����S���*y`u�ө7�4��u^�i&|7����
���	� �ٞ���t�	}^�ZЃ%%v}��£����ӧ뮱Ӑ����f2y���>\j�TzV:c�ʯ���U�^��+�4����Y�|�Ř���LARl���z	�����#���+n���ݣ��Ze�e�5�zQ34��D#Rˤq��N`W����\*-�Oq|�ň��,V�TSM&����܌��c�����]9	�o��H.l٨�@7m��V��gWC�+pX�B_�ù�7�=��Fe���Ev��_�4���g��;���:�t�]�c���CC`�*z�)����x*�A��RF�f>V\(�4�(�r�D3�]�p�iDiH�]dOd��"al�la���U�2Ǆ��&Ӧ`u�2.j�v���I��Э%��P�k�YXgQ�R���z��=.y\Ӕ��+V'Xh�#��ZbM�^-�,G���g�b��z�P�Ӭ�^���&�Y��q�6�\�N��O��bi�s���Cgͺ��Ws���(3�N���1E�+e{�[�AG;�(N
�9�з��u�L��܇m8�(�?ȐA�D�s�#.��iYd�O��S�q�m�<t�1�u������	�N"��q�b�+�^�8R��m�:��"��'��o�N�P�[9�,��,2��2��D��<��җ v��a�`��{����M�(�����q���a�!�0����X�;:��)/������ޕ 3~ż�.5/X!ts|�È�\y@W�Z���/~�����F)�e�Z?��C��y��k����Y���v3�Π�����[��*��FH�<�m���eE�"��,T��DKZ0�<�R=��4������+����
-P���7V��u���/���4����x�x0O�.C�e��p��e��:��s?S	{+�D�k�l��k*�}
&�-|#�BY��xt̲��BYZ�vt{�n�)�y��o��%����[��K��i������利m����k��:�LeY��ut�Pa��<����9⬛i*�wL6fA���a�{��j�G�д`���l; ]O��̤���fJ<�Q�j�?
�'�挢6b��H���@���q�5����nk�b�5`|c�����֒�r+�D�ԃU��@��-Ċ1PØ�ž��Vǀr��!� �N���$�Y�/-v<^���K�i56��As�՞��w�d�SuR]��Mf!v+�A�mlu�Iw �wr�A��tϢ�O  