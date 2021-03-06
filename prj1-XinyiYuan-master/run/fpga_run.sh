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
�|�`^fpga_run.sh �XmS�H�l���V��-��^U�Z��B��vH��+1�ƶyF���w����G�&`��|��f��_�~��?�q�pL�-�ftsz>�������_�����3���x<�'��ٗs��?�O��ϳ�ԟ�+�����3�S�6���?��Ͻ�q�0�z5��g����:p�����G/�biv��N���$q�S�j�4�3�-�j|���;�t���?���D"ҽ�r�l>���-K�4�A�����TƖ�~4�/FWC�I=*�7����Uk^���$f�u�f��tz9��h�����]F�恥ܲ.&�����e���� fJ��d��l�S�p��zs�q��`�ɤo��Ǹo1��
��R��˒D�N[l��*��O?_{w�CxG��UO�� X���%���2�9D
R��G�zm��"-�G7��@�C����\X�%��4��	\K@�,}��4*ܴ��(�-��2"SR��[�B>XK�,e
J�AK���B�4��t����%�l��vT�}���4O��f�KW\�
a4�)W�y�k�yg�v�,�+�˺�#��4��@����H�E���N#��
Aŝ\3)��#�e):�r��E�7/0BT�F)L�:y2�F���@e�������4��2��<Jd��}��L�H��(#&؆�f.��.`��O\!t���=�C���p��$���8���MD��c�k��N�6�j�!5�8�<$1�C�'OX-?�9S��h�{e�@3$�H� � \�� p��$�%�v:W
Ҋ��8�����&�e��١�2=6�^s�%Lg�/�o7���+�om���~�=L\)��t��ΐW��V�% ��r��W����H��1V{�	�T�A�mþ-Y���"[}_�o�ODvj	)&V���u�Tj��rTM���m���w���i���5ҟH2mj����(�g�
�F��X�#�wp�c���'�9�`OQ:g����`Y��w��I!C�L�Eݡ��ࠗ@�t�ͦ�����э�=z�����2ٳ=!_�w����HP-B�P �8���J�x��q����p�t�5��d2�_G�y�J7Ie�
�ݐo�4��!��jd%�$U��Kg��(�[�=(�Ocgf+�y��)����!�W����iu��O���M��h�3�1�4���SEI$�������kx������W������{�2��Vl���b�R��0����#Í�S�����"k\�,��2/��:T8 �t�ri$��@Bl�)r�sŵ����E�4��
�f�H����OC�u˖5�}(�U���kl����Ƒ�Zt�V<l�����ҳ���4
��E>��36�	�w�ܱ��jh�O�&�����IѴ��t�T��3�ڣ,�M�ZN�+(���ҭ�,�0��i�V}�`��#_�c����!H�Cj���� ͻ�e<ϰeƜ�42����q���O��@�L�]Ҹ�N#ņc�n#x��;�k���U�@-x2�b(��y:�%����S�@��8
�2#�6g�7&�;|�<���4OؽHaj��]��1����+0U7і!s�5�0���F1�Nq3/
J��p (�_@Хr�UAW�
��S�㠋w7�NA�-���g�ۭ1�Ǜ��	�֣��E ��m��\7���A��	\�L���D�!�T��&����1f8��r�6�TY���$���72�G��)j�)ǈ9l�e,�"-�L"ZT�W�}L��¢���Gw�Xbz���ϣ*����Df7�kW/�=3�>���ʑ��l�f(���O���zp(�����a�Ň�fm��iT�1�55�D!�p�����=Y��WKO��o!�᥊�	��9�P���ߋ^A�?��ٽ�J�|�(D��ن�u�/�0�7M�?6��fn'j�?�i̽�  