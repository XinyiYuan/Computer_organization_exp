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
�)ٰ^fpga_run.sh �Xks�J��~EGW�|� ����*vױ�M]�P�<�6[� ����J#��۷{FO� Ie].��~��3��+{�G���+��8�x~9vf�����7���w��o���̙�O��.fO��(?�s>L���t8�"�vgGN��D������N��;�t�����̹�]l.]�kЗ����"Z(����mM*�c;�<Im�S��t��a܎/P���zM�M.�w�;mǏ|�)V+�^��o��%v�E�C�����D��n4s�F�Ce)ݤ���9�������zr�I۪+(�����p栿;����O�'�pø�\�;W���݀������	YĖ<Q_�5��/0��1���׵�`�ט��9���$��qj[M���F^t�����!~�( o��H���+�>���"xX�?��3o�@�ԷX����@��+hs(s3�GF��+�0IDrw� K6�O��M�&*|����ɕ��b��1O�D*SX��tR ��%����^�������������>�<����QP,Yr��h����߶��6�#`���<����7��0 T���C�y�Sо[�a�Z!�Ц�Y¤/�`�(�V-�#�LK{C�D��b�B���b�K���U����	wUi[�]��qeӪc��R�
�Z
 �v򀹮H<?Z�ZJ/b!Ga�����e�i�\b�U�{z�������_q�G���ϛ���*)�b}*�T�V��fcV�1����@<q����G��o�Ε�$�,�$#�lD����(D(�.g�Iո+�Z�z�բ.�4-y�Q�c�Y@�y^mr\d�
�-4,*d�f���	9@��o���1����(�C^�KW����43�c�~�"���&����sE�G��՗(F��\����Tt���}]0?��/����rw�̠w�[�e�=����l��R��j�ѝ�XUGWzyK�B�y?o7����*�B����w��l��řT{��oE�� X֠`�'2c��]���Vݱ�Ԥb��	V*5�陒b�E|z��R�����Q�;Qˬ�ծ����z����Z�6��=v��4@*E�G<�X��ҀcGe&h�BS"��X�%�1m��5�'dwG��`�ۜH���.NX�=�5�L����t��Ҏ������E�P��@(^i���X��Nk���%�y�QR��gK��<��T�D��ؚ�F�~�~<:����_h�Tn.c������Mj���މ��UiuWT4\
�F�D�BAQ������G8B����J�+m�d�v��2�B64��T��J�H��F���C9A4�ɟr���1��"\��XnR��DY<��l���0�ӛ��/�R%[�Z���h�@;n��TW����-��%�+o����7���� xDсݫ�7���s'	��sA@��M�P=�Vn?�ct��NAD��V��n�]+e�P��B� 2Ge
 ���?2�f�&#�C��Y��H�"��Y��O�a����F�Ffذ�kzm-+����VQ�z:�h��Y���um���.*SJҝN��'%O+"�ϳb�<��{L C�ׇ�=��Y���Ll�V�D���'�vΌ*�Ƞki.OO���Yͣ�ֹS���g��[Ǯ+셂ľ�T��e3��r�Ϻ�Q��ߢ�H�r ��k�=��!����M8<(�?(�^7Ǌ����.jDd�o��3�r�3?_t���7(���n��(��)�Q1�#�^�+�T�Q,W�Z����V;�P�ouTu�o�T���R��S"'j-}� bk���� ���5�(xm�8*P>�k�Sq���| ���@�I�Ķ�K�|XD��x�P?b_B�F,3�)�AfbUW Жn�ѥM�L3i�p��z��V�2����^���ܲ,�����d
���M�<dt1�5���m��-
��%�ڈ(����{�B��IL46�NA`θ��]��i*�����Q�mY9|��
u�/�p8:WLc���2�=������L}�&~,a��;Q;y����VH�2�f�zs���,yD���<�wû��A�W�2m2䞟�;lj����N�%$�u~�4�=���{�c�@��o��tG��^z}�<�j�T��-G��f�˽�"�Og�`�c<�@�zo�J-J�+�T�]���8���;=/��ODN�ȯ�;�<w0��D��w{Y��$W���B�_u��8u�7�y���hY'��<`j��CL���C����7Hҏ��u&��=����l�\�3d2�ܾ�0k��,�A��{������r�9!�릟���Z"p���#֦9�1R�7ͩn�j#Z9sȐ�}K�5�͇��#y�����+���ŝ�
aR�tZѦvq����L]u��t�]�,�K6?v@�I]�w�u�5���4��]7  