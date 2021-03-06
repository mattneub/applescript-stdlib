FasdUAS 1.101.10   ��   ��    k             l      ��  ��    � � List -- manipulate AppleScript lists 

Notes:

- To split and join lists of text, use the Text library's `split text` and `join text` commands.

     � 	 	$   L i s t   - -   m a n i p u l a t e   A p p l e S c r i p t   l i s t s   
 
 N o t e s : 
 
 -   T o   s p l i t   a n d   j o i n   l i s t s   o f   t e x t ,   u s e   t h e   T e x t   l i b r a r y ' s   ` s p l i t   t e x t `   a n d   ` j o i n   t e x t `   c o m m a n d s . 
 
   
  
 l     ��������  ��  ��        x     
�� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �      s u p p o r t      l     ��������  ��  ��        l         !  j   
 �� "�� 0 _support   " N   
  # # 4   
 �� $
�� 
scpt $ m     % % � & &  T y p e S u p p o r t   "  used for parameter checking    ! � ' ' 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g   ( ) ( l     ��������  ��  ��   )  * + * i    , - , I      �� .���� 
0 _error   .  / 0 / o      ���� 0 handlername handlerName 0  1 2 1 o      ���� 0 etext eText 2  3 4 3 o      ���� 0 enumber eNumber 4  5 6 5 o      ���� 0 efrom eFrom 6  7�� 7 o      ���� 
0 eto eTo��  ��   - I     �� 8���� 20 _errorwithpartialresult _errorWithPartialResult 8  9 : 9 o    ���� 0 handlername handlerName :  ; < ; o    ���� 0 etext eText <  = > = o    ���� 0 enumber eNumber >  ? @ ? o    ���� 0 efrom eFrom @  A B A o    ���� 
0 eto eTo B  C�� C m    ��
�� 
msng��  ��   +  D E D l     ��������  ��  ��   E  F G F i    H I H I      �� J���� 20 _errorwithpartialresult _errorWithPartialResult J  K L K o      ���� 0 handlername handlerName L  M N M o      ���� 0 etext eText N  O P O o      ���� 0 enumber eNumber P  Q R Q o      ���� 0 efrom eFrom R  S T S o      ���� 
0 eto eTo T  U�� U o      ���� 0 epartial ePartial��  ��   I n     V W V I    �� X���� 0 rethrowerror rethrowError X  Y Z Y m     [ [ � \ \  L i s t Z  ] ^ ] o    ���� 0 handlername handlerName ^  _ ` _ o    ���� 0 etext eText `  a b a o    	���� 0 enumber eNumber b  c d c o   	 
���� 0 efrom eFrom d  e f e o   
 ���� 
0 eto eTo f  g h g m    ��
�� 
msng h  i�� i o    ���� 0 epartial ePartial��  ��   W o     ���� 0 _support   G  j k j l     ��������  ��  ��   k  l m l l     ��������  ��  ��   m  n o n l     �� p q��   p  -----    q � r r 
 - - - - - o  s t s l     ��������  ��  ��   t  u v u i    w x w I      �� y���� "0 _makelistobject _makeListObject y  z { z o      ���� 0 len   {  |�� | o      ���� 0 padvalue padValue��  ��   x l    _ } ~  } k     _ � �  � � � h     �� ��� 0 
listobject 
listObject � j     �� ��� 
0 _list_   � J     ����   �  � � � Z    Y � ����� � ?     � � � o    	���� 0 len   � m   	 
����   � k    U � �  � � � r     � � � J     � �  � � � o    ���� 0 padvalue padValue �  � � � o    ���� 0 padvalue padValue �  � � � o    ���� 0 padvalue padValue �  ��� � o    ���� 0 padvalue padValue��   � n      � � � o    ���� 
0 _list_   � o    ���� 0 
listobject 
listObject �  � � � V    5 � � � r   % 0 � � � b   % , � � � n  % ( � � � o   & (���� 
0 _list_   � o   % &���� 0 
listobject 
listObject � n  ( + � � � o   ) +���� 
0 _list_   � o   ( )���� 0 
listobject 
listObject � n      � � � o   - /���� 
0 _list_   � o   , -���� 0 
listobject 
listObject � A    $ � � � n   " � � � 1     "��
�� 
leng � n     � � � o     ���� 
0 _list_   � o    ���� 0 
listobject 
listObject � o   " #���� 0 len   �  ��� � Z  6 U � ����� � ?   6 = � � � n  6 ; � � � 1   9 ;��
�� 
leng � n  6 9 � � � o   7 9���� 
0 _list_   � o   6 7���� 0 
listobject 
listObject � o   ; <���� 0 len   � r   @ Q � � � n   @ M � � � 7  C M�� � �
�� 
cobj � m   G I����  � o   J L���� 0 len   � n  @ C � � � o   A C���� 
0 _list_   � o   @ A���� 0 
listobject 
listObject � n      � � � o   N P���� 
0 _list_   � o   M N���� 0 
listobject 
listObject��  ��  ��  ��  ��   �  ��� � L   Z _ � � n  Z ^ � � � o   [ ]���� 
0 _list_   � o   Z [���� 0 
listobject 
listObject��   ~ � � make a new list of specified length using the supplied value as padding; caution: padValue will not be copied, so should be an immutable type (e.g. number, string, constant; not date/list/record/script/reference)     � � ��   m a k e   a   n e w   l i s t   o f   s p e c i f i e d   l e n g t h   u s i n g   t h e   s u p p l i e d   v a l u e   a s   p a d d i n g ;   c a u t i o n :   p a d V a l u e   w i l l   n o t   b e   c o p i e d ,   s o   s h o u l d   b e   a n   i m m u t a b l e   t y p e   ( e . g .   n u m b e r ,   s t r i n g ,   c o n s t a n t ;   n o t   d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e ) v  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   basic operations    � � � � "   b a s i c   o p e r a t i o n s �  � � � l     ��������  ��  ��   �  � � � i     � � � I     � � �
� .Lst:Instnull���     **** � o      �~�~ 0 thelist theList � �} � �
�} 
Valu � o      �|�| 0 thevalue theValue � �{ � �
�{ 
Befo � |�z�y ��x ��z  �y   � o      �w�w 0 beforeindex beforeIndex�x   � l      ��v�u � m      �t
�t 
msng�v  �u   � �s � �
�s 
Afte � |�r�q ��p ��r  �q   � o      �o�o 0 
afterindex 
afterIndex�p   � l      ��n�m � m      �l
�l 
msng�n  �m   � �k ��j
�k 
Conc � |�i�h ��g ��i  �h   � o      �f�f 0 isjoin isJoin�g   � l      ��e�d � m      �c
�c boovfals�e  �d  �j   � k    � � �  � � � l     �b � ��b   �.( In addition to inserting before/after the list's actual indexes, this also recognizes three 'virtual' indexes: the `after item` parameter uses index 0 and index `-length - 1` to indicate the start of the list; the `before item` parameter uses index `length + 1` to indicate the end of the list.     � � � �P   I n   a d d i t i o n   t o   i n s e r t i n g   b e f o r e / a f t e r   t h e   l i s t ' s   a c t u a l   i n d e x e s ,   t h i s   a l s o   r e c o g n i z e s   t h r e e   ' v i r t u a l '   i n d e x e s :   t h e   ` a f t e r   i t e m `   p a r a m e t e r   u s e s   i n d e x   0   a n d   i n d e x   ` - l e n g t h   -   1 `   t o   i n d i c a t e   t h e   s t a r t   o f   t h e   l i s t ;   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   u s e s   i n d e x   ` l e n g t h   +   1 `   t o   i n d i c a t e   t h e   e n d   o f   t h e   l i s t .   �  � � � l     �a � ��a   �~x Note that the `before item` parameter cannot indicate the end of a list using a negative index. (Problem: the next 'virtual' index after -1 would be 0, but index 0 is already used by the `after item` parameter to represent the *start* of a list, and it's easier to disallow `before item 0` than explain to user how 'index 0' can be at both the start *and* the end of a list.)    � � � ��   N o t e   t h a t   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i n d i c a t e   t h e   e n d   o f   a   l i s t   u s i n g   a   n e g a t i v e   i n d e x .   ( P r o b l e m :   t h e   n e x t   ' v i r t u a l '   i n d e x   a f t e r   - 1   w o u l d   b e   0 ,   b u t   i n d e x   0   i s   a l r e a d y   u s e d   b y   t h e   ` a f t e r   i t e m `   p a r a m e t e r   t o   r e p r e s e n t   t h e   * s t a r t *   o f   a   l i s t ,   a n d   i t ' s   e a s i e r   t o   d i s a l l o w   ` b e f o r e   i t e m   0 `   t h a n   e x p l a i n   t o   u s e r   h o w   ' i n d e x   0 '   c a n   b e   a t   b o t h   t h e   s t a r t   * a n d *   t h e   e n d   o f   a   l i s t . ) �  ��` � Q    � � � � � k   w � �  � � � h    
�_ ��_ 0 
listobject 
listObject � j     �^ ��^ 
0 _list_   � n       I    �]�\�] "0 aslistparameter asListParameter  o    
�[�[ 0 thelist theList �Z m   
  �  �Z  �\   o     �Y�Y 0 _support   � 	 Z   )
�X�W
 G     H     o    �V�V 0 isjoin isJoin =     l   �U�T I   �S
�S .corecnte****       **** J     �R o    �Q�Q 0 thevalue theValue�R   �P�O
�P 
kocl m    �N
�N 
list�O  �U  �T   m    �M�M   r     % J     # �L o     !�K�K 0 thevalue theValue�L   o      �J�J 0 thevalue theValue�X  �W  	  Z   *.  >  * -!"! o   * +�I�I 0 
afterindex 
afterIndex" m   + ,�H
�H 
msng k   0 �## $%$ Z  0 @&'�G�F& >  0 3()( o   0 1�E�E 0 beforeindex beforeIndex) m   1 2�D
�D 
msng' R   6 <�C*+
�C .ascrerr ****      � ***** m   : ;,, �-- � E x p e c t e d    b e f o r e   i t e m    O R    a f t e r   i t e m    p a r a m e t e r ,   b u t   r e c e i v e d   b o t h .+ �B.�A
�B 
errn. m   8 9�@�@�Y�A  �G  �F  % /0/ r   A N121 n  A L343 I   F L�?5�>�? (0 asintegerparameter asIntegerParameter5 676 o   F G�=�= 0 
afterindex 
afterIndex7 8�<8 m   G H99 �::  a f t e r   i t e m�<  �>  4 o   A F�;�; 0 _support  2 o      �:�: 0 
afterindex 
afterIndex0 ;<; r   O \=>= n  O Z?@? I   T Z�9A�8�9 (0 asbooleanparameter asBooleanParameterA BCB o   T U�7�7 0 isjoin isJoinC D�6D m   U VEE �FF  c o n c a t e n a t i o n�6  �8  @ o   O T�5�5 0 _support  > o      �4�4 0 isjoin isJoin< GHG Z  ] tIJ�3�2I A   ] `KLK o   ] ^�1�1 0 
afterindex 
afterIndexL m   ^ _�0�0  J r   c pMNM [   c nOPO [   c lQRQ l  c jS�/�.S n  c jTUT 1   f j�-
�- 
lengU n  c fVWV o   d f�,�, 
0 _list_  W o   c d�+�+ 0 
listobject 
listObject�/  �.  R o   j k�*�* 0 
afterindex 
afterIndexP m   l m�)�) N o      �(�( 0 
afterindex 
afterIndex�3  �2  H X�'X Z   u �YZ�&�%Y ?   u ~[\[ o   u v�$�$ 0 
afterindex 
afterIndex\ l  v }]�#�"] n  v }^_^ 1   y }�!
�! 
leng_ n  v y`a` o   w y� �  
0 _list_  a o   v w�� 0 
listobject 
listObject�#  �"  Z n  � �bcb I   � ��d�� 80 throwinvalidparameterindex throwInvalidParameterIndexd efe N   � �gg n   � �hih 9   � ��
� 
insli n   � �jkj 4   � ��l
� 
cobjl o   � ��� 0 
afterindex 
afterIndexk l  � �m��m e   � �nn n  � �opo o   � ��� 
0 _list_  p o   � ��� 0 
listobject 
listObject�  �  f q�q m   � �rr �ss  a f t e r   i t e m�  �  c o   � ��� 0 _support  �&  �%  �'   tut >  � �vwv o   � ��� 0 beforeindex beforeIndexw m   � ��
� 
msngu x�x k   �'yy z{z r   � �|}| n  � �~~ I   � ����� (0 asintegerparameter asIntegerParameter� ��� o   � ��� 0 beforeindex beforeIndex� ��� m   � ��� ���  b e f o r e   i t e m�  �   o   � ��� 0 _support  } o      �� 0 beforeindex beforeIndex{ ��� Z   � ������ ?   � ���� o   � ��
�
 0 beforeindex beforeIndex� m   � ��	�	  � r   � ���� \   � ���� o   � ��� 0 beforeindex beforeIndex� m   � ��� � o      �� 0 
afterindex 
afterIndex� ��� A   � ���� o   � ��� 0 beforeindex beforeIndex� m   � ���  � ��� r   � ���� [   � ���� l  � ����� n  � ���� 1   � �� 
�  
leng� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject�  �  � o   � ����� 0 beforeindex beforeIndex� o      ���� 0 
afterindex 
afterIndex�  � l  � ����� n  � ���� I   � �������� 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� N   � ��� n   � ���� 8   � ���
�� 
insl� n   � ���� 4   � ����
�� 
cobj� o   � ����� 0 beforeindex beforeIndex� l  � ������� e   � ��� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  � ���� m   � ��� ���  b e f o r e   i t e m��  ��  � o   � ����� 0 _support  � � � the `before item` parameter cannot identify the end of a list by negative index, so throw 'invalid index' error if `before item 0` is used   � ���   t h e   ` b e f o r e   i t e m `   p a r a m e t e r   c a n n o t   i d e n t i f y   t h e   e n d   o f   a   l i s t   b y   n e g a t i v e   i n d e x ,   s o   t h r o w   ' i n v a l i d   i n d e x '   e r r o r   i f   ` b e f o r e   i t e m   0 `   i s   u s e d� ���� Z   �'������� G   ���� ?   � ���� o   � ����� 0 
afterindex 
afterIndex� l  � ������� n  � ���� 1   � ���
�� 
leng� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  � A  ��� o  ���� 0 
afterindex 
afterIndex� m  ����  � n 	#��� I  #������� 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� N  �� n  ��� 8  ��
�� 
insl� n  ��� 4  ���
�� 
cobj� o  ���� 0 beforeindex beforeIndex� l ������ e  �� n ��� o  ���� 
0 _list_  � o  ���� 0 
listobject 
listObject��  ��  � ���� m  �� ���  b e f o r e   i t e m��  ��  � o  	���� 0 _support  ��  ��  ��  �    l *.���� L  *.�� b  *-��� o  *+���� 0 thelist theList� o  +,���� 0 thevalue theValue� #  default is to append to list   � ��� :   d e f a u l t   i s   t o   a p p e n d   t o   l i s t ���� Z  /w����� =  /2��� o  /0���� 0 
afterindex 
afterIndex� m  01����  � L  5;�� b  5:��� o  56���� 0 thevalue theValue� n 69��� o  79���� 
0 _list_  � o  67���� 0 
listobject 
listObject� ��� =  >G��� o  >?���� 0 
afterindex 
afterIndex� n ?F��� 1  BF��
�� 
leng� n ?B��� o  @B���� 
0 _list_  � o  ?@���� 0 
listobject 
listObject� ���� L  JP�� b  JO��� n JM��� o  KM���� 
0 _list_  � o  JK���� 0 
listobject 
listObject� o  MN���� 0 thevalue theValue��  � L  Sw�� b  Sv��� b  Sd��� l Sb������ n  Sb��� 7 Vb��� 
�� 
cobj� m  \^����   o  _a���� 0 
afterindex 
afterIndex� n SV o  TV���� 
0 _list_   o  ST���� 0 
listobject 
listObject��  ��  � o  bc���� 0 thevalue theValue� l du���� n  du 7 gu��
�� 
cobj l mq���� [  mq	
	 o  no���� 0 
afterindex 
afterIndex
 m  op���� ��  ��   m  rt������ n dg o  eg���� 
0 _list_   o  de���� 0 
listobject 
listObject��  ��  ��   � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   � I  ������� 
0 _error    m  �� �   i n s e r t   i n t o   l i s t  o  ������ 0 etext eText  o  ������ 0 enumber eNumber  o  ������ 0 efrom eFrom �� o  ������ 
0 eto eTo��  ��  �`   �  !  l     ��������  ��  ��  ! "#" l     ��������  ��  ��  # $%$ i  ! $&'& I     ��()
�� .Lst:Delenull���     ****( o      ���� 0 thelist theList) ��*+
�� 
Indx* |����,��-��  ��  , o      ���� 0 theindex theIndex��  - l     .����. d      // m      ���� ��  ��  + ��01
�� 
FIdx0 |����2��3��  ��  2 o      ���� 0 
startindex 
startIndex��  3 l     4����4 m      ��
�� 
msng��  ��  1 ��5��
�� 
TIdx5 |����6��7��  ��  6 o      ���� 0 endindex endIndex��  7 l     8����8 m      ��
�� 
msng��  ��  ��  ' Q    �9:;9 k   �<< =>= h    
��?�� 0 
listobject 
listObject? j     ��@�� 
0 _list_  @ n    ABA I    ��C���� "0 aslistparameter asListParameterC DED o    
���� 0 thelist theListE F��F m   
 GG �HH  ��  ��  B o     ���� 0 _support  > IJI r    KLK n   MNM 1    ��
�� 
lengN n   OPO o    �� 
0 _list_  P o    �~�~ 0 
listobject 
listObjectL o      �}�} 0 
listlength 
listLengthJ QRQ Z   *ST�|�{S >   UVU o    �z�z 0 
startindex 
startIndexV m    �y
�y 
msngT r    &WXW n   $YZY I    $�x[�w�x (0 asintegerparameter asIntegerParameter[ \]\ o    �v�v 0 
startindex 
startIndex] ^�u^ m     __ �``  f r o m   i t e m�u  �w  Z o    �t�t 0 _support  X o      �s�s 0 
startindex 
startIndex�|  �{  R aba Z  + Bcd�r�qc >  + .efe o   + ,�p�p 0 endindex endIndexf m   , -�o
�o 
msngd r   1 >ghg n  1 <iji I   6 <�nk�m�n (0 asintegerparameter asIntegerParameterk lml o   6 7�l�l 0 endindex endIndexm n�kn m   7 8oo �pp  t o   i t e m�k  �m  j o   1 6�j�j 0 _support  h o      �i�i 0 endindex endIndex�r  �q  b qrq Z   C3st�hus F   C Nvwv =  C Fxyx o   C D�g�g 0 
startindex 
startIndexy m   D E�f
�f 
msngw =  I Lz{z o   I J�e�e 0 endindex endIndex{ m   J K�d
�d 
msngt k   Q �|| }~} r   Q ^� n  Q \��� I   V \�c��b�c (0 asintegerparameter asIntegerParameter� ��� o   V W�a�a 0 theindex theIndex� ��`� m   W X�� ���  i t e m�`  �b  � o   Q V�_�_ 0 _support  � o      �^�^ 0 
startindex 
startIndex~ ��� Z  _ p���]�\� A   _ b��� o   _ `�[�[ 0 
startindex 
startIndex� m   ` a�Z�Z  � r   e l��� [   e j��� [   e h��� o   e f�Y�Y 0 
listlength 
listLength� m   f g�X�X � o   h i�W�W 0 
startindex 
startIndex� o      �V�V 0 
startindex 
startIndex�]  �\  � ��� Z   q ����U�T� G   q |��� =   q t��� o   q r�S�S 0 
startindex 
startIndex� m   r s�R�R  � ?   w z��� o   w x�Q�Q 0 
startindex 
startIndex� o   x y�P�P 0 
listlength 
listLength� n   ���� I   � ��O��N�O 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� N   � ��� n   � ���� 4   � ��M�
�M 
cobj� o   � ��L�L 0 
startindex 
startIndex� l  � ���K�J� e   � ��� n  � ���� o   � ��I�I 
0 _list_  � o   � ��H�H 0 
listobject 
listObject�K  �J  � ��G� m   � ��� ���  i t e m�G  �N  � o    ��F�F 0 _support  �U  �T  � ��E� r   � ���� o   � ��D�D 0 
startindex 
startIndex� o      �C�C 0 endindex endIndex�E  �h  u k   �3�� ��� Z   � �����B� =  � ���� o   � ��A�A 0 
startindex 
startIndex� m   � ��@
�@ 
msng� r   � ���� m   � ��?�? � o      �>�> 0 
startindex 
startIndex� ��� =  � ���� o   � ��=�= 0 endindex endIndex� m   � ��<
�< 
msng� ��;� r   � ���� o   � ��:�: 0 
listlength 
listLength� o      �9�9 0 endindex endIndex�;  �B  � ��� Z  � ����8�7� A   � ���� o   � ��6�6 0 
startindex 
startIndex� m   � ��5�5  � r   � ���� [   � ���� [   � ���� o   � ��4�4 0 
listlength 
listLength� m   � ��3�3 � o   � ��2�2 0 
startindex 
startIndex� o      �1�1 0 
startindex 
startIndex�8  �7  � ��� Z  � ����0�/� A   � ���� o   � ��.�. 0 endindex endIndex� m   � ��-�-  � r   � ���� [   � ���� [   � ���� o   � ��,�, 0 
listlength 
listLength� m   � ��+�+ � o   � ��*�* 0 endindex endIndex� o      �)�) 0 endindex endIndex�0  �/  � ��� Z   �!����(� G   � ���� =   � ���� o   � ��'�' 0 
startindex 
startIndex� m   � ��&�&  � ?   � ���� o   � ��%�% 0 
startindex 
startIndex� o   � ��$�$ 0 
listlength 
listLength� n  � ���� I   � ��#��"�# 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� N   � ��� n   � ���� 4   � ��!�
�! 
cobj� o   � �� �  0 
startindex 
startIndex� l  � ����� e   � ��� n  � ���� o   � ��� 
0 _list_  � o   � ��� 0 
listobject 
listObject�  �  � ��� m   � ��� ���  f r o m   i t e m�  �"  � o   � ��� 0 _support  � ��� G   ���� =   � ��� o   � ��� 0 endindex endIndex� m   � ���  � ?  ��� o  �� 0 endindex endIndex� o  �� 0 
listlength 
listLength� ��� n � � I  ��� 80 throwinvalidparameterindex throwInvalidParameterIndex  N   n   4  �
� 
cobj o  �� 0 endindex endIndex l �� e  		 n 

 o  �� 
0 _list_   o  �� 0 
listobject 
listObject�  �   � m   �  t o   i t e m�  �    o  �� 0 _support  �  �(  � �
 Z "3�	� ?  "% o  "#�� 0 
startindex 
startIndex o  #$�� 0 endindex endIndex L  (/ n (. 2 +-�
� 
cobj n (+ o  )+�� 
0 _list_   o  ()�� 0 
listobject 
listObject�	  �  �
  r  Z  4h� =  47 o  45�� 0 
startindex 
startIndex m  56� �   k  :T   !"! Z :O#$����# G  :E%&% =  :='(' o  :;���� 0 
startindex 
startIndex( o  ;<���� 0 
listlength 
listLength& =  @C)*) o  @A���� 0 endindex endIndex* o  AB���� 0 
listlength 
listLength$ L  HK++ J  HJ����  ��  ��  " ,��, r  PT-.- J  PR����  . o      ���� 0 	startlist 	startList��  �   r  Wh/0/ n Wf121 7 Zf��34
�� 
cobj3 m  ^`���� 4 l ae5����5 \  ae676 o  bc���� 0 
startindex 
startIndex7 m  cd���� ��  ��  2 n WZ898 o  XZ���� 
0 _list_  9 o  WX���� 0 
listobject 
listObject0 o      ���� 0 	startlist 	startList :;: Z  i�<=��>< =  il?@? o  ij���� 0 endindex endIndex@ o  jk���� 0 
listlength 
listLength= r  osABA J  oq����  B o      ���� 0 endlist endList��  > r  v�CDC n v�EFE 7 y���GH
�� 
cobjG l }�I����I [  }�JKJ o  ~���� 0 endindex endIndexK m  ����� ��  ��  H m  ��������F n vyLML o  wy���� 
0 _list_  M o  vw���� 0 
listobject 
listObjectD o      ���� 0 endlist endList; N��N L  ��OO b  ��PQP o  ������ 0 	startlist 	startListQ o  ������ 0 endlist endList��  : R      ��RS
�� .ascrerr ****      � ****R o      ���� 0 etext eTextS ��TU
�� 
errnT o      ���� 0 enumber eNumberU ��VW
�� 
erobV o      ���� 0 efrom eFromW ��X��
�� 
errtX o      ���� 
0 eto eTo��  ; I  ����Y���� 
0 _error  Y Z[Z m  ��\\ �]]   d e l e t e   f r o m   l i s t[ ^_^ o  ������ 0 etext eText_ `a` o  ������ 0 enumber eNumbera bcb o  ������ 0 efrom eFromc d��d o  ������ 
0 eto eTo��  ��  % efe l     ��������  ��  ��  f ghg l     ��������  ��  ��  h iji i  % (klk I     ��m��
�� .Lst:RDuLnull���     ****m o      ���� 0 thelist theList��  l Q     �nopn k    �qq rsr h    
��t�� 0 
listobject 
listObjectt j     ��u�� 
0 _list_  u n    vwv 2   ��
�� 
cobjw n    xyx I    ��z���� "0 aslistparameter asListParameterz {|{ o    
���� 0 thelist theList| }��} m   
 ~~ �  ��  ��  y o     ���� 0 _support  s ��� l   ������  �jd not the fastest algorithm as it's O(Nn) (the repeat loop is O(N) and each `is in` test is O(n)), but simple and consistent with AS's existing behaviors (for large lists it'd be more efficient to put each item into an NSMutableSet where practical then check for uniqueness against that, but that wouldn't respect AS's current considering/ignoring settings)   � ����   n o t   t h e   f a s t e s t   a l g o r i t h m   a s   i t ' s   O ( N n )   ( t h e   r e p e a t   l o o p   i s   O ( N )   a n d   e a c h   ` i s   i n `   t e s t   i s   O ( n ) ) ,   b u t   s i m p l e   a n d   c o n s i s t e n t   w i t h   A S ' s   e x i s t i n g   b e h a v i o r s   ( f o r   l a r g e   l i s t s   i t ' d   b e   m o r e   e f f i c i e n t   t o   p u t   e a c h   i t e m   i n t o   a n   N S M u t a b l e S e t   w h e r e   p r a c t i c a l   t h e n   c h e c k   f o r   u n i q u e n e s s   a g a i n s t   t h a t ,   b u t   t h a t   w o u l d n ' t   r e s p e c t   A S ' s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s )� ��� r    *��� J    �� ��� m    ���� � ��� m    ���� � ���� n   ��� 1    ��
�� 
leng� n   ��� o    ���� 
0 _list_  � o    ���� 0 
listobject 
listObject��  � J      �� ��� o      ���� 0 i  � ��� o      ���� 0 u  � ���� o      ���� 0 
listlength 
listLength��  � ��� Z  + 8������� =   + .��� o   + ,���� 0 
listlength 
listLength� m   , -����  � L   1 4�� J   1 3����  ��  ��  � ��� W   9 ���� k   A ��� ��� V   A ���� k   \ {�� ��� r   \ a��� [   \ _��� o   \ ]���� 0 i  � m   ] ^���� � o      ���� 0 i  � ���� Z  b {������� ?   b e��� o   b c���� 0 i  � o   c d���� 0 
listlength 
listLength� L   h w�� n  h v��� 7  k u����
�� 
cobj� m   o q���� � o   r t���� 0 u  � n  h k��� o   i k���� 
0 _list_  � o   h i���� 0 
listobject 
listObject��  ��  ��  � E  E [��� n  E R��� 7  H R����
�� 
cobj� m   L N���� � o   O Q���� 0 u  � n  E H��� o   F H���� 
0 _list_  � o   E F���� 0 
listobject 
listObject� J   R Z�� ���� n  R X��� 4   U X���
�� 
cobj� o   V W���� 0 i  � n  R U��� o   S U���� 
0 _list_  � o   R S���� 0 
listobject 
listObject��  � ��� r   � ���� [   � ���� o   � ����� 0 u  � m   � ����� � o      ���� 0 u  � ��� r   � ���� n  � ���� 4   � ����
�� 
cobj� o   � ����� 0 i  � n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject� n     ��� 4   � ����
�� 
cobj� o   � ����� 0 u  � n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject� ���� r   � ���� [   � ���� o   � ����� 0 i  � m   � ����� � o      ���� 0 i  ��  � ?   = @��� o   = >���� 0 i  � o   > ?���� 0 
listlength 
listLength� ���� L   � ��� n  � ���� 7  � �����
�� 
cobj� m   � ����� � o   � ��� 0 u  � n  � ���� o   � ��~�~ 
0 _list_  � o   � ��}�} 0 
listobject 
listObject��  o R      �|��
�| .ascrerr ****      � ****� o      �{�{ 0 etext eText� �z��
�z 
errn� o      �y�y 0 enumber eNumber� �x��
�x 
erob� o      �w�w 0 efrom eFrom� �v��u
�v 
errt� o      �t�t 
0 eto eTo�u  p I   � ��s��r�s 
0 _error  � ��� m   � ��� ��� 6 r e m o v e   d u p l i c a t e s   f r o m   l i s t� ��� o   � ��q�q 0 etext eText� ��� o   � ��p�p 0 enumber eNumber� ��� o   � ��o�o 0 efrom eFrom�  �n  o   � ��m�m 
0 eto eTo�n  �r  j  l     �l�k�j�l  �k  �j    l     �i�h�g�i  �h  �g    i  ) , I     �f	

�f .Lst:SliLnull���     ****	 o      �e�e 0 thelist theList
 �d
�d 
FIdx |�c�b�a�c  �b   o      �`�` 0 
startindex 
startIndex�a   l     �_�^ m      �]
�] 
msng�_  �^   �\�[
�\ 
TIdx |�Z�Y�X�Z  �Y   o      �W�W 0 endindex endIndex�X   l     �V�U m      �T
�T 
msng�V  �U  �[   Q    � k   �  r     n    I    �S�R�S "0 aslistparameter asListParameter   o    	�Q�Q 0 thelist theList  !�P! m   	 
"" �##  �P  �R   o    �O�O 0 _support   o      �N�N 0 thelist theList $%$ r    &'& n   ()( 1    �M
�M 
leng) o    �L�L 0 thelist theList' o      �K�K 0 	thelength 	theLength% *+* Z    �,-.�J, >   /0/ o    �I�I 0 
startindex 
startIndex0 m    �H
�H 
msng- k    u11 232 r    *454 n   (676 I   " (�G8�F�G (0 asintegerparameter asIntegerParameter8 9:9 o   " #�E�E 0 
startindex 
startIndex: ;�D; m   # $<< �==  f r o m   i t e m�D  �F  7 o    "�C�C 0 _support  5 o      �B�B 0 
startindex 
startIndex3 >?> l  + +�A@A�A  @ J D note: index 0 is disallowed as it makes behavior confusing to users   A �BB �   n o t e :   i n d e x   0   i s   d i s a l l o w e d   a s   i t   m a k e s   b e h a v i o r   c o n f u s i n g   t o   u s e r s? CDC Z  + BEF�@�?E =   + .GHG o   + ,�>�> 0 
startindex 
startIndexH m   , -�=�=  F n  1 >IJI I   6 >�<K�;�< .0 throwinvalidparameter throwInvalidParameterK LML o   6 7�:�: 0 
startindex 
startIndexM NON m   7 8PP �QQ  f r o m   i t e mO RSR m   8 9�9
�9 
longS T�8T m   9 :UU �VV " I n d e x   c a n  t   b e   0 .�8  �;  J o   1 6�7�7 0 _support  �@  �?  D W�6W Z   C uXY�5�4X =  C FZ[Z o   C D�3�3 0 endindex endIndex[ m   D E�2
�2 
msngY Z   I q\]^_\ A   I M`a` o   I J�1�1 0 
startindex 
startIndexa d   J Lbb o   J K�0�0 0 	thelength 	theLength] L   P Ucc n  P Tded 2  Q S�/
�/ 
cobje o   P Q�.�. 0 thelist theList^ fgf ?   X [hih o   X Y�-�- 0 
startindex 
startIndexi o   Y Z�,�, 0 	thelength 	theLengthg j�+j L   ^ akk J   ^ `�*�*  �+  _ L   d qll n  d pmnm 7  e o�)op
�) 
cobjo o   i k�(�( 0 
startindex 
startIndexp m   l n�'�'��n o   d e�&�& 0 thelist theList�5  �4  �6  . qrq =  x {sts o   x y�%�% 0 endindex endIndext m   y z�$
�$ 
msngr u�#u R   ~ ��"vw
�" .ascrerr ****      � ****v m   � �xx �yy � E x p e c t e d    f r o m   i t e m    a n d / o r    t o   i t e m    p a r a m e t e r   b u t   r e c e i v e d   n e i t h e r .w �!z� 
�! 
errnz m   � ����[�   �#  �J  + {|{ Z   � �}~��} >  � �� o   � ��� 0 endindex endIndex� m   � ��
� 
msng~ k   � ��� ��� r   � ���� n  � ���� I   � ����� (0 asintegerparameter asIntegerParameter� ��� o   � ��� 0 endindex endIndex� ��� m   � ��� ���  t o   i t e m�  �  � o   � ��� 0 _support  � o      �� 0 endindex endIndex� ��� Z  � ������ =   � ���� o   � ��� 0 endindex endIndex� m   � ���  � n  � ���� I   � ����� .0 throwinvalidparameter throwInvalidParameter� ��� o   � ��� 0 endindex endIndex� ��� m   � ��� ���  t o   i t e m� ��� m   � ��
� 
long� ��� m   � ��� ��� " I n d e x   c a n  t   b e   0 .�  �  � o   � ��� 0 _support  �  �  � ��
� Z   � ����	�� =  � ���� o   � ��� 0 
startindex 
startIndex� m   � ��
� 
msng� Z   � ������ A   � ���� o   � ��� 0 endindex endIndex� d   � ��� o   � ��� 0 	thelength 	theLength� L   � ��� J   � ���  � ��� ?   � ���� o   � ��� 0 endindex endIndex� o   � ��� 0 	thelength 	theLength� �� � L   � ��� n  � ���� 2  � ���
�� 
cobj� o   � ����� 0 thelist theList�   � L   � ��� n  � ���� 7  � �����
�� 
cobj� m   � ����� � o   � ����� 0 endindex endIndex� o   � ����� 0 thelist theList�	  �  �
  �  �  | ��� l  � �������  � + % both start and end indexes are given   � ��� J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e n� ��� Z  �������� A   � ���� o   � ����� 0 
startindex 
startIndex� m   � �����  � r   � ���� [   � ���� [   � ���� o   � ����� 0 	thelength 	theLength� m   � ����� � o   � ����� 0 
startindex 
startIndex� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z ������� A  ��� o  ���� 0 endindex endIndex� m  ����  � r  ��� [  ��� [  ��� o  	���� 0 	thelength 	theLength� m  	
���� � o  ���� 0 endindex endIndex� o      ���� 0 endindex endIndex��  ��  � ��� Z I������� G  ?��� G  +��� ?  ��� o  ���� 0 
startindex 
startIndex� o  ���� 0 endindex endIndex� F  '��� A  ��� o  ���� 0 
startindex 
startIndex� m  ���� � A   #��� o   !���� 0 endindex endIndex� l 
!"������ m  !"���� ��  ��  � F  .;��� ?  .1��� o  ./���� 0 
startindex 
startIndex� o  /0���� 0 	thelength 	theLength� ?  47��� o  45���� 0 endindex endIndex� o  56���� 0 	thelength 	theLength� L  BE�� J  BD����  ��  ��  � ��� Z  Jc������ A  JM��� o  JK���� 0 
startindex 
startIndex� m  KL���� � r  PS��� m  PQ���� � o      ���� 0 
startindex 
startIndex� ��� ?  VY��� o  VW���� 0 
startindex 
startIndex� o  WX���� 0 	thelength 	theLength� ���� r  \_� � o  \]���� 0 	thelength 	theLength  o      ���� 0 
startindex 
startIndex��  ��  �  Z  d}�� A  dg o  de���� 0 endindex endIndex m  ef����  r  jm	 m  jk���� 	 o      ���� 0 endindex endIndex 

 ?  ps o  pq���� 0 endindex endIndex o  qr���� 0 	thelength 	theLength �� r  vy o  vw���� 0 	thelength 	theLength o      ���� 0 endindex endIndex��  ��   �� L  ~� n  ~� 7 ���
�� 
cobj o  ������ 0 
startindex 
startIndex o  ������ 0 endindex endIndex o  ~���� 0 thelist theList��   R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   I  �������� 
0 _error     m  ��!! �""  s l i c e   l i s t  #$# o  ������ 0 etext eText$ %&% o  ������ 0 enumber eNumber& '(' o  ������ 0 efrom eFrom( )��) o  ������ 
0 eto eTo��  ��   *+* l     ��������  ��  ��  + ,-, l     ��������  ��  ��  - ./. i  - 0010 I     ��23
�� .Lst:Trannull���     ****2 o      ���� 0 thelist theList3 ��45
�� 
Whil4 |����6��7��  ��  6 o      ���� 0 unevenoption unevenOption��  7 l     8����8 m      ��
�� LTrhLTrR��  ��  5 ��9��
�� 
PadI9 |����:��;��  ��  : o      ���� 0 padvalue padValue��  ; l     <����< m      ��
�� 
msng��  ��  ��  1 Q    �=>?= k   �@@ ABA Z   CD����C =   EFE o    ���� 0 thelist theListF J    ����  D L   
 GG J   
 ����  ��  ��  B HIH Z    CJK����J G    /LML =    NON l   P����P I   ��QR
�� .corecnte****       ****Q J    SS T��T o    ���� 0 thelist theList��  R ��U��
�� 
koclU m    ��
�� 
list��  ��  ��  O m    ����  M >     -VWV l    'X����X I    '��YZ
�� .corecnte****       ****Y o     !���� 0 thelist theListZ ��[��
�� 
kocl[ m   " #��
�� 
list��  ��  ��  W l  ' ,\���\ I  ' ,�~]�}
�~ .corecnte****       ****] o   ' (�|�| 0 thelist theList�}  ��  �  K n  2 ?^_^ I   7 ?�{`�z�{ .0 throwinvalidparameter throwInvalidParameter` aba o   7 8�y�y 0 thelist theListb cdc m   8 9ee �ff  d ghg m   9 :�x
�x 
listh i�wi m   : ;jj �kk ( N o t   a   l i s t   o f   l i s t s .�w  �z  _ o   2 7�v�v 0 _support  ��  ��  I lml h   D K�un�u 0 
listobject 
listObjectn k      oo pqp j     �tr�t 
0 _list_  r o     �s�s 0 thelist theListq s�rs j    
�qt�q 0 _resultlist_ _resultList_t J    	�p�p  �r  m uvu r   L Vwxw n   L Tyzy 1   R T�o
�o 
lengz n  L R{|{ 4   O R�n}
�n 
cobj} m   P Q�m�m | n  L O~~ o   M O�l�l 
0 _list_   o   L M�k�k 0 
listobject 
listObjectx o      �j�j $0 resultlistlength resultListLengthv ��� l  W W�i���i  � K E find the longest/shortest sublist; this will be length of resultList   � ��� �   f i n d   t h e   l o n g e s t / s h o r t e s t   s u b l i s t ;   t h i s   w i l l   b e   l e n g t h   o f   r e s u l t L i s t� ��� Z   W����� =  W Z��� o   W X�h�h 0 unevenoption unevenOption� m   X Y�g
�g LTrhLTrR� X   ] ���f�� Z  o ����e�d� >   o t��� n  o r��� 1   p r�c
�c 
leng� o   o p�b�b 0 aref aRef� o   r s�a�a $0 resultlistlength resultListLength� n  w ���� I   | ��`��_�` .0 throwinvalidparameter throwInvalidParameter� ��� o   | }�^�^ 0 thelist theList� ��� m   } ~�� ���  � ��� m   ~ �]
�] 
list� ��\� m    ��� ��� B S u b l i s t s   a r e   n o t   a l l   s a m e   l e n g t h .�\  �_  � o   w |�[�[ 0 _support  �e  �d  �f 0 aref aRef� n  ` c��� o   a c�Z�Z 
0 _list_  � o   ` a�Y�Y 0 
listobject 
listObject� ��� =  � ���� o   � ��X�X 0 unevenoption unevenOption� m   � ��W
�W LTrhLTrP� ��� X   � ���V�� Z  � ����U�T� ?   � ���� n  � ���� 1   � ��S
�S 
leng� o   � ��R�R 0 aref aRef� o   � ��Q�Q $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��P
�P 
leng� o   � ��O�O 0 aref aRef� o      �N�N $0 resultlistlength resultListLength�U  �T  �V 0 aref aRef� n  � ���� o   � ��M�M 
0 _list_  � o   � ��L�L 0 
listobject 
listObject� ��� =  � ���� o   � ��K�K 0 unevenoption unevenOption� m   � ��J
�J LTrhLTrT� ��I� X   � ���H�� Z  � ����G�F� A   � ���� n  � ���� 1   � ��E
�E 
leng� o   � ��D�D 0 aref aRef� o   � ��C�C $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��B
�B 
leng� o   � ��A�A 0 aref aRef� o      �@�@ $0 resultlistlength resultListLength�G  �F  �H 0 aref aRef� n  � ���� o   � ��?�? 
0 _list_  � o   � ��>�> 0 
listobject 
listObject�I  � n  ���� I   ��=��<�= >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ��;�; 0 unevenoption unevenOption� ��:� m   ��� ���  b y�:  �<  � o   � ��9�9 0 _support  � ��� Z  ����8�7� ?  	��� o  �6�6 $0 resultlistlength resultListLength� m  �5�5  � k  ��� ��� l �4���4  � � � build empty matrix (due to inefficiencies of AS's list implementation, when populating large lists, it's probably quicker to create a padded list then set its items rather than start with an empty list and append items)   � ����   b u i l d   e m p t y   m a t r i x   ( d u e   t o   i n e f f i c i e n c i e s   o f   A S ' s   l i s t   i m p l e m e n t a t i o n ,   w h e n   p o p u l a t i n g   l a r g e   l i s t s ,   i t ' s   p r o b a b l y   q u i c k e r   t o   c r e a t e   a   p a d d e d   l i s t   t h e n   s e t   i t s   i t e m s   r a t h e r   t h a n   s t a r t   w i t h   a n   e m p t y   l i s t   a n d   a p p e n d   i t e m s )� ��� r  ��� n  ��� 1  �3
�3 
leng� n ��� o  �2�2 
0 _list_  � o  �1�1 0 
listobject 
listObject� o      �0�0 *0 resultsublistlength resultSubListLength� ��� r  ��� I  �/��.�/ "0 _makelistobject _makeListObject� ��� o  �-�- *0 resultsublistlength resultSubListLength� ��,� o  �+�+ 0 padvalue padValue�,  �.  � o      �*�* 0 resultsublist resultSubList� ��� r  &��� o  �)�) 0 resultsublist resultSubList� n      ���  ;  $%� n $��� o   $�(�( 0 _resultlist_ _resultList_� o   �'�' 0 
listobject 
listObject� ��� Y  'A��&���%� l 1<���� r  1<   l 15�$�# e  15 n 15 2 24�"
�" 
cobj o  12�!�! 0 resultsublist resultSubList�$  �#   n        ;  :; n 5:	 o  6:� �  0 _resultlist_ _resultList_	 o  56�� 0 
listobject 
listObject�   shallow copy   � �

    s h a l l o w   c o p y�& 0 i  � m  *+�� � o  +,�� $0 resultlistlength resultListLength�%  �  l BB��     populate matrix    �     p o p u l a t e   m a t r i x � Z  B�� = BG o  BC�� 0 unevenoption unevenOption m  CF�
� LTrhLTrP Y  J��� Y  T��� r  f{ n  fo 4  lo� 
� 
cobj  o  mn�� 0 j   n  fl!"! 4  il�#
� 
cobj# o  jk�� 0 i  " n fi$%$ o  gi�� 
0 _list_  % o  fg�� 0 
listobject 
listObject n      &'& 4  wz�(
� 
cobj( o  xy�� 0 i  ' n  ow)*) 4  tw�+
� 
cobj+ o  uv�
�
 0 j  * n ot,-, o  pt�	�	 0 _resultlist_ _resultList_- o  op�� 0 
listobject 
listObject� 0 j   m  WX��  n  Xa./. 1  ^`�
� 
leng/ n X^010 4  [^�2
� 
cobj2 o  \]�� 0 i  1 n X[343 o  Y[�� 
0 _list_  4 o  XY�� 0 
listobject 
listObject�  � 0 i   m  MN��  o  NO� �  *0 resultsublistlength resultSubListLength�  �   Y  ��5��67��5 Y  ��8��9:��8 r  ��;<; n  ��=>= 4  ����?
�� 
cobj? o  ������ 0 j  > n  ��@A@ 4  ����B
�� 
cobjB o  ������ 0 i  A n ��CDC o  ������ 
0 _list_  D o  ������ 0 
listobject 
listObject< n      EFE 4  ����G
�� 
cobjG o  ������ 0 i  F n  ��HIH 4  ����J
�� 
cobjJ o  ������ 0 j  I n ��KLK o  ������ 0 _resultlist_ _resultList_L o  ������ 0 
listobject 
listObject�� 0 j  9 m  ������ : o  ������ $0 resultlistlength resultListLength��  �� 0 i  6 m  ������ 7 o  ������ *0 resultsublistlength resultSubListLength��  �  �8  �7  � M��M L  ��NN n ��OPO o  ������ 0 _resultlist_ _resultList_P o  ������ 0 
listobject 
listObject��  > R      ��QR
�� .ascrerr ****      � ****Q o      ���� 0 etext eTextR ��ST
�� 
errnS o      ���� 0 enumber eNumberT ��UV
�� 
erobU o      ���� 0 efrom eFromV ��W��
�� 
errtW o      ���� 
0 eto eTo��  ? I  ����X���� 
0 _error  X YZY m  ��[[ �\\  t r a n s p o s e   l i s tZ ]^] o  ������ 0 etext eText^ _`_ o  ������ 0 enumber eNumber` aba o  ������ 0 efrom eFromb c��c o  ������ 
0 eto eTo��  ��  / ded l     ��������  ��  ��  e fgf l     ��������  ��  ��  g hih i  1 4jkj I     ��l��
�� .Lst:LiUSnull���     ****l o      ���� 0 thelist theList��  k Q     tmnom k    bpp qrq h    
��s�� $0 resultlistobject resultListObjects j     ��t�� 
0 _list_  t n     uvu 2   ��
�� 
cobjv n    wxw I    ��y���� "0 aslistparameter asListParametery z{z o    
���� 0 thelist theList{ |��| m   
 }} �~~  ��  ��  x o     ���� 0 _support  r � r    ��� n    ��� 1    ��
�� 
leng� n   ��� o    ���� 
0 _list_  � o    ���� $0 resultlistobject resultListObject� o      ���� 0 len  � ��� Y    \�������� k    W�� ��� r    -��� I   +����� z����
�� .sysorandnmbr    ��� nmbr
�� misccura��  � ����
�� 
from� m   # $���� � �����
�� 
to  � o   % &���� 0 len  ��  � o      ���� 0 idx2  � ���� r   . W��� J   . >�� ��� e   . 5�� n  . 5��� 4   1 4���
�� 
cobj� o   2 3���� 0 idx2  � n  . 1��� o   / 1���� 
0 _list_  � o   . /���� $0 resultlistobject resultListObject� ���� e   5 <�� n  5 <��� 4   8 ;���
�� 
cobj� o   9 :���� 0 idx1  � n  5 8��� o   6 8���� 
0 _list_  � o   5 6���� $0 resultlistobject resultListObject��  � J      �� ��� n     ��� 4   F I���
�� 
cobj� o   G H���� 0 idx1  � n  C F��� o   D F���� 
0 _list_  � o   C D���� $0 resultlistobject resultListObject� ���� n     ��� 4   R U���
�� 
cobj� o   S T���� 0 idx2  � n  O R��� o   P R���� 
0 _list_  � o   O P���� $0 resultlistobject resultListObject��  ��  �� 0 idx1  � m    ���� � o    ���� 0 len  ��  � ���� L   ] b�� n  ] a��� o   ^ `���� 
0 _list_  � o   ] ^���� $0 resultlistobject resultListObject��  n R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  o I   j t������� 
0 _error  � ��� m   k l�� ���  u n s o r t   l i s t� ��� o   l m���� 0 etext eText� ��� o   m n���� 0 enumber eNumber� ��� o   n o���� 0 efrom eFrom� ���� o   o p���� 
0 eto eTo��  ��  i ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   search   � ���    s e a r c h� ��� l     ��������  ��  ��  � ��� i  5 8��� I     ����
�� .Lst:Findnull���     ****� o      ���� 0 thelist theList� ����
�� 
Valu� |����������  ��  � o      �� 0 theitem theItem��  � l     ��~�}� m      �|
�| 
msng�~  �}  � �{��
�{ 
Usin� |�z�y��x��z  �y  � o      �w�w 0 filterobject filterObject�x  � l     ��v�u� m      �t
�t 
msng�v  �u  � �s��r
�s 
Retu� |�q�p��o��q  �p  � o      �n�n (0 findingoccurrences findingOccurrences�o  � l     ��m�l� m      �k
�k LFWhLFWA�m  �l  �r  � Q    ����� k   ��� ��� h    
�j��j 0 
listobject 
listObject� k      �� ��� j     �i��i 
0 _list_  � n    ��� I    �h��g�h "0 aslistparameter asListParameter�    o    
�f�f 0 thelist theList �e m   
  �  �e  �g  � o     �d�d 0 _support  � �c j    �b�b 0 _result_   J    �a�a  �c  �  Z   	
	 =    o    �`�` (0 findingoccurrences findingOccurrences m    �_
�_ LFWhLFWA
 Z    }�^ =    o    �]�] 0 filterobject filterObject m    �\
�\ 
msng Y    @�[�Z Z   & ;�Y�X =  & . n   & , 4   ) ,�W
�W 
cobj o   * +�V�V 0 i   n  & ) o   ' )�U�U 
0 _list_   o   & '�T�T 0 
listobject 
listObject o   , -�S�S 0 theitem theItem r   1 7 !  o   1 2�R�R 0 i  ! n      "#"  ;   5 6# n  2 5$%$ o   3 5�Q�Q 0 _result_  % o   2 3�P�P 0 
listobject 
listObject�Y  �X  �[ 0 i   m    �O�O  n    !&'& 1     �N
�N 
leng' n   ()( o    �M�M 
0 _list_  ) o    �L�L 0 
listobject 
listObject�Z  �^   k   C }** +,+ r   C P-.- n  C N/0/ I   H N�K1�J�K &0 asscriptparameter asScriptParameter1 232 o   H I�I�I 0 filterobject filterObject3 4�H4 m   I J55 �66 
 u s i n g�H  �J  0 o   C H�G�G 0 _support  . o      �F�F 0 filterobject filterObject, 7�E7 Y   Q }8�D9:�C8 Z   ` x;<�B�A; n  ` k=>= I   a k�@?�?�@ 0 
filteritem 
filterItem? @�>@ n   a gABA 4   d g�=C
�= 
cobjC o   e f�<�< 0 i  B n  a dDED o   b d�;�; 
0 _list_  E o   a b�:�: 0 
listobject 
listObject�>  �?  > o   ` a�9�9 0 filterobject filterObject< r   n tFGF o   n o�8�8 0 i  G n      HIH  ;   r sI n  o rJKJ o   p r�7�7 0 _result_  K o   o p�6�6 0 
listobject 
listObject�B  �A  �D 0 i  9 m   T U�5�5 : n   U [LML 1   X Z�4
�4 
lengM n  U XNON o   V X�3�3 
0 _list_  O o   U V�2�2 0 
listobject 
listObject�C  �E   PQP =  � �RSR o   � ��1�1 (0 findingoccurrences findingOccurrencesS m   � ��0
�0 LFWhLFWFQ TUT Z   � �VW�/XV =  � �YZY o   � ��.�. 0 filterobject filterObjectZ m   � ��-
�- 
msngW Y   � �[�,\]�+[ Z   � �^_�*�)^ =  � �`a` n   � �bcb 4   � ��(d
�( 
cobjd o   � ��'�' 0 i  c n  � �efe o   � ��&�& 
0 _list_  f o   � ��%�% 0 
listobject 
listObjecta o   � ��$�$ 0 theitem theItem_ k   � �gg hih r   � �jkj o   � ��#�# 0 i  k n      lml  ;   � �m n  � �non o   � ��"�" 0 _result_  o o   � ��!�! 0 
listobject 
listObjecti p� p  S   � ��   �*  �)  �, 0 i  \ m   � ��� ] n   � �qrq 1   � ��
� 
lengr n  � �sts o   � ��� 
0 _list_  t o   � ��� 0 
listobject 
listObject�+  �/  X k   � �uu vwv r   � �xyx n  � �z{z I   � ��|�� &0 asscriptparameter asScriptParameter| }~} o   � ��� 0 filterobject filterObject~ � m   � ��� ��� 
 u s i n g�  �  { o   � ��� 0 _support  y o      �� 0 filterobject filterObjectw ��� Y   � ������� Z   � ������ n  � ���� I   � ����� 0 
filteritem 
filterItem� ��� n   � ���� 4   � ���
� 
cobj� o   � ��� 0 i  � n  � ���� o   � ��� 
0 _list_  � o   � ��
�
 0 
listobject 
listObject�  �  � o   � ��	�	 0 filterobject filterObject� k   � ��� ��� r   � ���� o   � ��� 0 i  � n      ���  ;   � �� n  � ���� o   � ��� 0 _result_  � o   � ��� 0 
listobject 
listObject� ���  S   � ��  �  �  � 0 i  � m   � ��� � n   � ���� 1   � ��
� 
leng� n  � ���� o   � ��� 
0 _list_  � o   � ��� 0 
listobject 
listObject�  �  U ��� =  � ���� o   � �� �  (0 findingoccurrences findingOccurrences� m   � ���
�� LFWhLFWL� ���� Z   �o������ =  ���� o   � ���� 0 filterobject filterObject� m   ��
�� 
msng� Y  0������� Z  +������� = ��� n  ��� 4  ���
�� 
cobj� o  ���� 0 i  � n ��� o  ���� 
0 _list_  � o  ���� 0 
listobject 
listObject� o  ���� 0 theitem theItem� k  '�� ��� r  %��� o   ���� 0 i  � n      ���  ;  #$� n  #��� o  !#���� 0 _result_  � o   !���� 0 
listobject 
listObject� ����  S  &'��  ��  ��  �� 0 i  � n  ��� 1  ��
�� 
leng� n ��� o  	���� 
0 _list_  � o  	���� 0 
listobject 
listObject� m  ���� � m  ��������  � k  3o�� ��� r  3@��� n 3>��� I  8>������� &0 asscriptparameter asScriptParameter� ��� o  89���� 0 filterobject filterObject� ���� m  9:�� ��� 
 u s i n g��  ��  � o  38���� 0 _support  � o      ���� 0 filterobject filterObject� ���� Y  Ao������� Z  Pj������� n P[��� I  Q[������� 0 
filteritem 
filterItem� ���� n  QW��� 4  TW���
�� 
cobj� o  UV���� 0 i  � n QT��� o  RT���� 
0 _list_  � o  QR���� 0 
listobject 
listObject��  ��  � o  PQ���� 0 filterobject filterObject� k  ^f�� ��� r  ^d��� o  ^_���� 0 i  � n      ���  ;  bc� n _b��� o  `b���� 0 _result_  � o  _`���� 0 
listobject 
listObject� ����  S  ef��  ��  ��  �� 0 i  � n  DJ��� 1  GI��
�� 
leng� n DG��� o  EG���� 
0 _list_  � o  DE���� 0 
listobject 
listObject� m  JK���� � m  KL��������  ��   n r��� I  w������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o  wx���� (0 findingoccurrences findingOccurrences� ���� m  x{�� ���  r e t u r n i n g��  ��  � o  rw���� 0 _support   ���� L  ���� n ����� o  ������ 0 _result_  � o  ������ 0 
listobject 
listObject��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ��� 
�� 
erob� o      ���� 0 efrom eFrom  ����
�� 
errt o      ���� 
0 eto eTo��  � I  �������� 
0 _error    m  �� �  f i n d   i n   l i s t  o  ������ 0 etext eText 	
	 o  ������ 0 enumber eNumber
  o  ������ 0 efrom eFrom �� o  ������ 
0 eto eTo��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    l     ����   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����  ZT map, filter, reduce (these operations are relatively trivial to perform in AS without the need for callbacks; however, these handlers are more flexible when the convert/check/combine operations are parameterized and also provide more advanced users with idiomatic examples of how to parameterize a general-purpose handler's exact behavior)    ��   m a p ,   f i l t e r ,   r e d u c e   ( t h e s e   o p e r a t i o n s   a r e   r e l a t i v e l y   t r i v i a l   t o   p e r f o r m   i n   A S   w i t h o u t   t h e   n e e d   f o r   c a l l b a c k s ;   h o w e v e r ,   t h e s e   h a n d l e r s   a r e   m o r e   f l e x i b l e   w h e n   t h e   c o n v e r t / c h e c k / c o m b i n e   o p e r a t i o n s   a r e   p a r a m e t e r i z e d   a n d   a l s o   p r o v i d e   m o r e   a d v a n c e d   u s e r s   w i t h   i d i o m a t i c   e x a m p l e s   o f   h o w   t o   p a r a m e t e r i z e   a   g e n e r a l - p u r p o s e   h a n d l e r ' s   e x a c t   b e h a v i o r )  l     ��������  ��  ��    l     �� !��    � � note: while these handlers prevent the script object from modifying the input list directly, it cannot stop them modifying mutable (date/list/record/script/reference) items within the input list (doing so would be very bad practice, however)   ! �""�   n o t e :   w h i l e   t h e s e   h a n d l e r s   p r e v e n t   t h e   s c r i p t   o b j e c t   f r o m   m o d i f y i n g   t h e   i n p u t   l i s t   d i r e c t l y ,   i t   c a n n o t   s t o p   t h e m   m o d i f y i n g   m u t a b l e   ( d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e )   i t e m s   w i t h i n   t h e   i n p u t   l i s t   ( d o i n g   s o   w o u l d   b e   v e r y   b a d   p r a c t i c e ,   h o w e v e r ) #$# l     ��������  ��  ��  $ %&% i  9 <'(' I     ��)*
�� .Lst:Map_null���     ****) o      ���� 0 thelist theList* ��+��
�� 
Usin+ o      ���� 0 	mapobject 	mapObject��  ( Q     �,-., k    �// 010 h    
��2�� $0 resultlistobject resultListObject2 j     ��3�� 
0 _list_  3 n     454 2   ��
�� 
cobj5 n    676 I    ��8���� "0 aslistparameter asListParameter8 9:9 o    
���� 0 thelist theList: ;��; m   
 << �==  ��  ��  7 o     ���� 0 _support  1 >?> r    @A@ n   BCB I    ��D���� &0 asscriptparameter asScriptParameterD EFE o    ���� 0 	mapobject 	mapObjectF G��G m    HH �II 
 u s i n g��  ��  C o    ���� 0 _support  A o      ���� 0 	mapobject 	mapObject? JKJ Q    �LMNL Y    BO��PQ��O l  + =RSTR r   + =UVU n  + 6WXW I   , 6��Y���� 0 mapitem mapItemY Z��Z n   , 2[\[ 4   / 2��]
�� 
cobj] o   0 1���� 0 i  \ n  , /^_^ o   - /���� 
0 _list_  _ o   , -���� $0 resultlistobject resultListObject��  ��  X o   + ,���� 0 	mapobject 	mapObjectV n      `a` 4   9 <��b
�� 
cobjb o   : ;���� 0 i  a n  6 9cdc o   7 9���� 
0 _list_  d o   6 7���� $0 resultlistobject resultListObjectS � ~ use counting loop rather than `repeat with aRef in theList` as the item's index is also used when constructing error messages   T �ee �   u s e   c o u n t i n g   l o o p   r a t h e r   t h a n   ` r e p e a t   w i t h   a R e f   i n   t h e L i s t `   a s   t h e   i t e m ' s   i n d e x   i s   a l s o   u s e d   w h e n   c o n s t r u c t i n g   e r r o r   m e s s a g e s�� 0 i  P m     ���� Q n     &fgf 1   # %��
�� 
lengg n    #hih o   ! #���� 
0 _list_  i o     !���� $0 resultlistobject resultListObject��  M R      ��jk
�� .ascrerr ****      � ****j o      ���� 0 etext eTextk ��lm
�� 
errnl o      �� 0 enumber eNumberm �~n�}
�~ 
errtn o      �|�| 
0 eto eTo�}  N k   J �oo pqp Z   J hrs�{tr ?   J Muvu o   J K�z�z 0 i  v m   K L�y�y s r   P awxw n   P _yzy 7  S _�x{|
�x 
cobj{ m   W Y�w�w | l  Z ^}�v�u} \   Z ^~~ o   [ \�t�t 0 i   m   \ ]�s�s �v  �u  z n  P S��� o   Q S�r�r 
0 _list_  � o   P Q�q�q $0 resultlistobject resultListObjectx o      �p�p 0 epartial ePartial�{  t r   d h��� J   d f�o�o  � o      �n�n 0 epartial ePartialq ��m� R   i ��l��
�l .ascrerr ****      � ****� b   � ���� b   � ���� b   � ���� m   � ��� ��� $ C o u l d n  t   m a p   i t e m  � o   � ��k�k 0 i  � m   � ��� ���  :  � o   � ��j�j 0 etext eText� �i��
�i 
errn� l 
 k l��h�g� o   k l�f�f 0 enumber eNumber�h  �g  � �e��
�e 
erob� l  m |��d�c� N   m |�� n   m {��� 4   x {�b�
�b 
cobj� o   y z�a�a 0 i  � n  m x��� I   r x�`��_�` "0 aslistparameter asListParameter� ��� o   r s�^�^ 0 thelist theList� ��]� m   s t�� ���  �]  �_  � o   m r�\�\ 0 _support  �d  �c  � �[��
�[ 
errt� o   } ~�Z�Z 
0 eto eTo� �Y��X
�Y 
ptlr� o   � ��W�W 0 epartial ePartial�X  �m  K ��V� L   � ��� n  � ���� o   � ��U�U 
0 _list_  � o   � ��T�T $0 resultlistobject resultListObject�V  - R      �S��
�S .ascrerr ****      � ****� o      �R�R 0 etext eText� �Q��
�Q 
errn� o      �P�P 0 enumber eNumber� �O��
�O 
erob� o      �N�N 0 efrom eFrom� �M��
�M 
errt� o      �L�L 
0 eto eTo� �K��J
�K 
ptlr� o      �I�I 0 epartial ePartial�J  . I   � ��H��G�H 20 _errorwithpartialresult _errorWithPartialResult� ��� m   � ��� ���  m a p   l i s t� ��� o   � ��F�F 0 etext eText� ��� o   � ��E�E 0 enumber eNumber� ��� o   � ��D�D 0 efrom eFrom� ��� o   � ��C�C 
0 eto eTo� ��B� o   � ��A�A 0 epartial ePartial�B  �G  & ��� l     �@�?�>�@  �?  �>  � ��� l     �=�<�;�=  �<  �;  � ��� i  = @��� I     �:��
�: .Lst:Filtnull���     ****� o      �9�9 0 thelist theList� �8��7
�8 
Usin� o      �6�6 0 filterobject filterObject�7  � Q     ����� k    ��� ��� h    
�5��5 $0 resultlistobject resultListObject� j     �4��4 
0 _list_  � n     ��� 2   �3
�3 
cobj� n    ��� I    �2��1�2 "0 aslistparameter asListParameter� ��� o    
�0�0 0 thelist theList� ��/� m   
 �� ���  �/  �1  � o     �.�. 0 _support  � ��� r    ��� n   ��� I    �-��,�- &0 asscriptparameter asScriptParameter� ��� o    �+�+ 0 filterobject filterObject� ��*� m    �� ��� 
 u s i n g�*  �,  � o    �)�) 0 _support  � o      �(�( 0 filterobject filterObject� ��� r    ��� m    �'�'  � o      �&�& 0 	lastindex 	lastIndex� ��� Q    ����� Y     X��%���$� k   / S�� ��� r   / 7��� n   / 5��� 4   2 5�#�
�# 
cobj� o   3 4�"�" 0 i  � n  / 2��� o   0 2�!�! 
0 _list_  � o   / 0� �  $0 resultlistobject resultListObject� o      �� 0 theitem theItem� 	 �	  Z   8 S		��	 n  8 >			 I   9 >�	�� 0 
filteritem 
filterItem	 	�	 o   9 :�� 0 theitem theItem�  �  	 o   8 9�� 0 filterobject filterObject	 k   A O		 				 r   A F	
		
 [   A D			 o   A B�� 0 	lastindex 	lastIndex	 m   B C�� 	 o      �� 0 	lastindex 	lastIndex		 	�	 r   G O			 o   G H�� 0 theitem theItem	 n      			 4   K N�	
� 
cobj	 o   L M�� 0 	lastindex 	lastIndex	 n  H K			 o   I K�� 
0 _list_  	 o   H I�� $0 resultlistobject resultListObject�  �  �  �  �% 0 i  � m   # $�� � n   $ *			 1   ' )�
� 
leng	 n  $ '			 o   % '�� 
0 _list_  	 o   $ %�
�
 $0 resultlistobject resultListObject�$  � R      �			
�	 .ascrerr ****      � ****	 o      �� 0 etext eText	 �		
� 
errn	 o      �� 0 enumber eNumber	 �	�
� 
errt	 o      �� 
0 eto eTo�  � k   ` �		 	 	!	  Z   ` ~	"	#�	$	" ?   ` c	%	&	% o   ` a�� 0 	lastindex 	lastIndex	& m   a b� �  	# r   f w	'	(	' n   f u	)	*	) 7  i u��	+	,
�� 
cobj	+ m   m o���� 	, l  p t	-����	- \   p t	.	/	. o   q r���� 0 	lastindex 	lastIndex	/ m   r s���� ��  ��  	* n  f i	0	1	0 o   g i���� 
0 _list_  	1 o   f g���� $0 resultlistobject resultListObject	( o      ���� 0 epartial ePartial�  	$ r   z ~	2	3	2 J   z |����  	3 o      ���� 0 epartial ePartial	! 	4��	4 R    ���	5	6
�� .ascrerr ****      � ****	5 b   � �	7	8	7 b   � �	9	:	9 b   � �	;	<	; m   � �	=	= �	>	> * C o u l d n  t   f i l t e r   i t e m  	< o   � ����� 0 i  	: m   � �	?	? �	@	@  :  	8 o   � ����� 0 etext eText	6 ��	A	B
�� 
errn	A l 
 � �	C����	C o   � ����� 0 enumber eNumber��  ��  	B ��	D	E
�� 
erob	D l  � �	F����	F N   � �	G	G n   � �	H	I	H 4   � ���	J
�� 
cobj	J o   � ����� 0 i  	I n  � �	K	L	K I   � ���	M���� "0 aslistparameter asListParameter	M 	N	O	N o   � ����� 0 thelist theList	O 	P��	P m   � �	Q	Q �	R	R  ��  ��  	L o   � ����� 0 _support  ��  ��  	E ��	S	T
�� 
errt	S o   � ����� 
0 eto eTo	T ��	U��
�� 
ptlr	U o   � ����� 0 epartial ePartial��  ��  � 	V	W	V Z  � �	X	Y����	X =   � �	Z	[	Z o   � ����� 0 	lastindex 	lastIndex	[ m   � �����  	Y L   � �	\	\ J   � �����  ��  ��  	W 	]��	] L   � �	^	^ n  � �	_	`	_ 7  � ���	a	b
�� 
cobj	a m   � ����� 	b o   � ����� 0 	lastindex 	lastIndex	` n  � �	c	d	c o   � ����� 
0 _list_  	d o   � ����� $0 resultlistobject resultListObject��  � R      ��	e	f
�� .ascrerr ****      � ****	e o      ���� 0 etext eText	f ��	g	h
�� 
errn	g o      ���� 0 enumber eNumber	h ��	i	j
�� 
erob	i o      ���� 0 efrom eFrom	j ��	k	l
�� 
errt	k o      ���� 
0 eto eTo	l ��	m��
�� 
ptlr	m o      ���� 0 epartial ePartial��  � I   � ���	n���� 20 _errorwithpartialresult _errorWithPartialResult	n 	o	p	o m   � �	q	q �	r	r  f i l t e r   l i s t	p 	s	t	s o   � ����� 0 etext eText	t 	u	v	u o   � ����� 0 enumber eNumber	v 	w	x	w o   � ����� 0 efrom eFrom	x 	y	z	y o   � ����� 
0 eto eTo	z 	{��	{ o   � ����� 0 epartial ePartial��  ��  � 	|	}	| l     ��������  ��  ��  	} 	~		~ l     ��������  ��  ��  	 	�	�	� i  A D	�	�	� I     ��	�	�
�� .Lst:Redunull���     ****	� o      ���� 0 thelist theList	� ��	���
�� 
Usin	� o      ���� 0 reduceobject reduceObject��  	� k     �	�	� 	�	�	� r     	�	�	� m     ��
�� 
msng	� o      ���� 0 	theresult 	theResult	� 	���	� Q    �	�	�	�	� k    �	�	� 	�	�	� h    ��	��� 0 
listobject 
listObject	� j     ��	��� 
0 _list_  	� n    	�	�	� I    ��	����� "0 aslistparameter asListParameter	� 	�	�	� o    
���� 0 thelist theList	� 	���	� m   
 	�	� �	�	�  ��  ��  	� o     ���� 0 _support  	� 	�	�	� Z   *	�	�����	� =    	�	�	� n    	�	�	� 1    ��
�� 
leng	� n   	�	�	� o    ���� 
0 _list_  	� o    ���� 0 
listobject 
listObject	� m    ����  	� n   &	�	�	� I    &��	����� .0 throwinvalidparameter throwInvalidParameter	� 	�	�	� o    ���� 0 thelist theList	� 	�	�	� m     	�	� �	�	�  	� 	�	�	� m     !��
�� 
list	� 	���	� m   ! "	�	� �	�	� ( L i s t   c a n  t   b e   e m p t y .��  ��  	� o    ���� 0 _support  ��  ��  	� 	�	�	� r   + 8	�	�	� n  + 6	�	�	� I   0 6��	����� &0 asscriptparameter asScriptParameter	� 	�	�	� o   0 1���� 0 reduceobject reduceObject	� 	���	� m   1 2	�	� �	�	� 
 u s i n g��  ��  	� o   + 0���� 0 _support  	� o      ���� 0 reduceobject reduceObject	� 	�	�	� r   9 A	�	�	� n   9 ?	�	�	� 4   < ?��	�
�� 
cobj	� m   = >���� 	� n  9 <	�	�	� o   : <���� 
0 _list_  	� o   9 :���� 0 
listobject 
listObject	� o      ���� 0 	theresult 	theResult	� 	�	�	� Q   B �	�	�	�	� Y   E g	���	�	���	� r   T b	�	�	� n  T `	�	�	� I   U `��	����� 0 
reduceitem 
reduceItem	� 	�	�	� o   U V���� 0 	theresult 	theResult	� 	���	� n   V \	�	�	� 4   Y \��	�
�� 
cobj	� o   Z [���� 0 i  	� n  V Y	�	�	� o   W Y���� 
0 _list_  	� o   V W���� 0 
listobject 
listObject��  ��  	� o   T U���� 0 reduceobject reduceObject	� o      ���� 0 	theresult 	theResult�� 0 i  	� m   H I���� 	� n   I O	�	�	� 1   L N��
�� 
leng	� n  I L	�	�	� o   J L���� 
0 _list_  	� o   I J���� 0 
listobject 
listObject��  	� R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� �	��~
� 
errt	� o      �}�} 
0 eto eTo�~  	� R   o ��|	�	�
�| .ascrerr ****      � ****	� b   � �	�	�	� b   � �	�	�	� b   � �	�	�	� m   � �	�	� �	�	� * C o u l d n  t   r e d u c e   i t e m  	� o   � ��{�{ 0 i  	� m   � �	�	� �	�	�  :  	� o   � ��z�z 0 etext eText	� �y	�	�
�y 
errn	� l 
 s t	��x�w	� o   s t�v�v 0 enumber eNumber�x  �w  	� �u	�	�
�u 
erob	� l  w �	��t�s	� N   w �	�	� n   w �	�	�	� 4   � ��r	�
�r 
cobj	� o   � ��q�q 0 i  	� n  w �	�	�	� I   | ��p
 �o�p "0 aslistparameter asListParameter
  


 o   | }�n�n 0 thelist theList
 
�m
 m   } �

 �

  �m  �o  	� o   w |�l�l 0 _support  �t  �s  	� �k
�j
�k 
errt
 o   � ��i�i 
0 eto eTo�j  	� 
�h
 L   � �

 o   � ��g�g 0 	theresult 	theResult�h  	� R      �f
	


�f .ascrerr ****      � ****
	 o      �e�e 0 etext eText

 �d


�d 
errn
 o      �c�c 0 enumber eNumber
 �b


�b 
erob
 o      �a�a 0 efrom eFrom
 �`
�_
�` 
errt
 o      �^�^ 
0 eto eTo�_  	� I   � ��]
�\�] 20 _errorwithpartialresult _errorWithPartialResult
 


 m   � �

 �

  r e d u c e   l i s t
 


 o   � ��[�[ 0 etext eText
 


 o   � ��Z�Z 0 enumber eNumber
 


 o   � ��Y�Y 0 efrom eFrom
 


 o   � ��X�X 
0 eto eTo
 
�W
 o   � ��V�V 0 	theresult 	theResult�W  �\  ��  	� 


 l     �U�T�S�U  �T  �S  
 
 
!
  l     �R�Q�P�R  �Q  �P  
! 
"
#
" l     �O
$
%�O  
$ J D--------------------------------------------------------------------   
% �
&
& � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# 
'
(
' l     �N
)
*�N  
)   sort   
* �
+
+ 
   s o r t
( 
,
-
, l     �M�L�K�M  �L  �K  
- 
.
/
. l      �J
0
1�J  
0�� Notes: 

- Quicksort provides between [best case] O(n * log n) and [worst case] O(n * n) efficiency, typically leaning towards the former in all but the most pathological cases.

- One limitation of quicksort is that it isn't stable, i.e. items that compare as equal can appear in any order in the resulting list; their original order isn't preserved. An alternate algorithm such as Heapsort would avoid this, but would likely be significantly slower on average (while heapsort is guaranteed to be O(n * log n), it has much higher constant overhead than quicksort which tends to be fast in all but the most degenerate cases).

- This implementation trades some speed for greater robustness and flexibility, sorting a 10,000-number list in ~1sec, whereas a bare-bones quicksort might be 2x faster. OTOH, if you want fast code then AppleScript's the absolute last language you want to be using anyway, (e.g. Python's `sorted` function is 100x faster). For sorting simple lists of number/text/date values it's probably much quicker to send the AS list across the ASOC bridge and use -[NSArray sortedArray...], but that doesn't generalize to other use cases so isn't used here.

   
1 �
2
2	0   N o t e s :   
 
 -   Q u i c k s o r t   p r o v i d e s   b e t w e e n   [ b e s t   c a s e ]   O ( n   *   l o g   n )   a n d   [ w o r s t   c a s e ]   O ( n   *   n )   e f f i c i e n c y ,   t y p i c a l l y   l e a n i n g   t o w a r d s   t h e   f o r m e r   i n   a l l   b u t   t h e   m o s t   p a t h o l o g i c a l   c a s e s . 
 
 -   O n e   l i m i t a t i o n   o f   q u i c k s o r t   i s   t h a t   i t   i s n ' t   s t a b l e ,   i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   c a n   a p p e a r   i n   a n y   o r d e r   i n   t h e   r e s u l t i n g   l i s t ;   t h e i r   o r i g i n a l   o r d e r   i s n ' t   p r e s e r v e d .   A n   a l t e r n a t e   a l g o r i t h m   s u c h   a s   H e a p s o r t   w o u l d   a v o i d   t h i s ,   b u t   w o u l d   l i k e l y   b e   s i g n i f i c a n t l y   s l o w e r   o n   a v e r a g e   ( w h i l e   h e a p s o r t   i s   g u a r a n t e e d   t o   b e   O ( n   *   l o g   n ) ,   i t   h a s   m u c h   h i g h e r   c o n s t a n t   o v e r h e a d   t h a n   q u i c k s o r t   w h i c h   t e n d s   t o   b e   f a s t   i n   a l l   b u t   t h e   m o s t   d e g e n e r a t e   c a s e s ) . 
 
 -   T h i s   i m p l e m e n t a t i o n   t r a d e s   s o m e   s p e e d   f o r   g r e a t e r   r o b u s t n e s s   a n d   f l e x i b i l i t y ,   s o r t i n g   a   1 0 , 0 0 0 - n u m b e r   l i s t   i n   ~ 1 s e c ,   w h e r e a s   a   b a r e - b o n e s   q u i c k s o r t   m i g h t   b e   2 x   f a s t e r .   O T O H ,   i f   y o u   w a n t   f a s t   c o d e   t h e n   A p p l e S c r i p t ' s   t h e   a b s o l u t e   l a s t   l a n g u a g e   y o u   w a n t   t o   b e   u s i n g   a n y w a y ,   ( e . g .   P y t h o n ' s   ` s o r t e d `   f u n c t i o n   i s   1 0 0 x   f a s t e r ) .   F o r   s o r t i n g   s i m p l e   l i s t s   o f   n u m b e r / t e x t / d a t e   v a l u e s   i t ' s   p r o b a b l y   m u c h   q u i c k e r   t o   s e n d   t h e   A S   l i s t   a c r o s s   t h e   A S O C   b r i d g e   a n d   u s e   - [ N S A r r a y   s o r t e d A r r a y . . . ] ,   b u t   t h a t   d o e s n ' t   g e n e r a l i z e   t o   o t h e r   u s e   c a s e s   s o   i s n ' t   u s e d   h e r e . 
 

/ 
3
4
3 l     �I�H�G�I  �H  �G  
4 
5
6
5 l     �F�E�D�F  �E  �D  
6 
7
8
7 l     
9
:
;
9 j   E I�C
<�C *0 _quicksortthreshold _quicksortThreshold
< m   E H�B�B 
: T N shorter ranges are sorted using insertion sort; longer ranges using quicksort   
; �
=
= �   s h o r t e r   r a n g e s   a r e   s o r t e d   u s i n g   i n s e r t i o n   s o r t ;   l o n g e r   r a n g e s   u s i n g   q u i c k s o r t
8 
>
?
> l     �A�@�?�A  �@  �?  
? 
@
A
@ i  J M
B
C
B I      �>
D�=�> 	0 _sort  
D 
E
F
E o      �<�< $0 resultlistobject resultListObject
F 
G
H
G o      �;�; 0 
startindex 
startIndex
H 
I
J
I o      �:�: 0 endindex endIndex
J 
K
L
K o      �9�9  0 sortcomparator sortComparator
L 
M�8
M o      �7�7 0 usequicksort useQuickSort�8  �=  
C l   
N
O
P
N k    
Q
Q 
R
S
R Z    t
T
U�6�5
T o     �4�4 0 usequicksort useQuickSort
U l  p
V
W
X
V k   p
Y
Y 
Z
[
Z Z   
\
]�3�2
\ A    	
^
_
^ \    
`
a
` o    �1�1 0 endindex endIndex
a o    �0�0 0 
startindex 
startIndex
_ m    �/�/ 
] L    �.�.  �3  �2  
[ 
b
c
b r    &
d
e
d J    
f
f 
g
h
g o    �-�- 0 
startindex 
startIndex
h 
i�,
i o    �+�+ 0 endindex endIndex�,  
e J      
j
j 
k
l
k o      �*�* 0 	leftindex 	leftIndex
l 
m�)
m o      �(�( 0 
rightindex 
rightIndex�)  
c 
n
o
n r   ' 8
p
q
p n   ' 6
r
s
r 3   4 6�'
�' 
cobj
s n   ' 4
t
u
t 7  * 4�&
v
w
�& 
cobj
v o   . 0�%�% 0 
startindex 
startIndex
w o   1 3�$�$ 0 endindex endIndex
u n  ' *
x
y
x o   ( *�#�# 
0 _keys_  
y o   ' (�"�" $0 resultlistobject resultListObject
q o      �!�! 0 
pivotvalue 
pivotValue
o 
z
{
z V   9;
|
}
| k   A6
~
~ 

�
 Q   A �
�
�
�
� V   D d
�
�
� l  Z _
�
�
�
� r   Z _
�
�
� [   Z ]
�
�
� o   Z [� �  0 	leftindex 	leftIndex
� m   [ \�� 
� o      �� 0 	leftindex 	leftIndex
� � z while cmp returns -1; note that if compareKeys() returns a non-numeric value/no result, this will throw -1700/-2763 error   
� �
�
� �   w h i l e   c m p   r e t u r n s   - 1 ;   n o t e   t h a t   i f   c o m p a r e K e y s ( )   r e t u r n s   a   n o n - n u m e r i c   v a l u e / n o   r e s u l t ,   t h i s   w i l l   t h r o w   - 1 7 0 0 / - 2 7 6 3   e r r o r
� A   H Y
�
�
� c   H W
�
�
� n  H U
�
�
� I   I U�
��� 0 comparekeys compareKeys
� 
�
�
� e   I P
�
� n   I P
�
�
� 4   L O�
�
� 
cobj
� o   M N�� 0 	leftindex 	leftIndex
� n  I L
�
�
� o   J L�� 
0 _keys_  
� o   I J�� $0 resultlistobject resultListObject
� 
��
� o   P Q�� 0 
pivotvalue 
pivotValue�  �  
� o   H I��  0 sortcomparator sortComparator
� m   U V�
� 
nmbr
� m   W X��  
� R      �
�
�
� .ascrerr ****      � ****
� o      �� 0 etext eText
� �
�
�
� 
errn
� o      �� 0 enum eNum
� �
�
�
� 
erob
� o      �� 0 efrom eFrom
� �
��
� 
errt
� o      �
�
 
0 eto eTo�  
� R   l ��	
�
�
�	 .ascrerr ****      � ****
� b   | 
�
�
� m   | }
�
� �
�
� < C o u l d n  t   c o m p a r e   o b j e c t   k e y s :  
� o   } ~�� 0 etext eText
� �
�
�
� 
errn
� o   n o�� 0 enum eNum
� �
�
�
� 
erob
� J   p y
�
� 
�
�
� n   p v
�
�
� 4   s v�
�
� 
cobj
� o   t u�� 0 	leftindex 	leftIndex
� n  p s
�
�
� o   q s�� 
0 _keys_  
� o   p q�� $0 resultlistobject resultListObject
� 
�� 
� o   v w���� 0 
pivotvalue 
pivotValue�   
� ��
���
�� 
errt
� o   z {���� 
0 eto eTo��  
� 
�
�
� Q   � �
�
�
�
� V   � �
�
�
� l  � �
�
�
�
� r   � �
�
�
� \   � �
�
�
� o   � ����� 0 
rightindex 
rightIndex
� m   � ����� 
� o      ���� 0 
rightindex 
rightIndex
�   while cmp returns 1;    
� �
�
� ,   w h i l e   c m p   r e t u r n s   1 ;  
� ?   � �
�
�
� c   � �
�
�
� n  � �
�
�
� I   � ���
����� 0 comparekeys compareKeys
� 
�
�
� n   � �
�
�
� 4   � ���
�
�� 
cobj
� o   � ����� 0 
rightindex 
rightIndex
� n  � �
�
�
� o   � ����� 
0 _keys_  
� o   � ����� $0 resultlistobject resultListObject
� 
���
� o   � ����� 0 
pivotvalue 
pivotValue��  ��  
� o   � �����  0 sortcomparator sortComparator
� m   � ���
�� 
nmbr
� m   � �����  
� R      ��
�
�
�� .ascrerr ****      � ****
� o      ���� 0 etext eText
� ��
�
�
�� 
errn
� o      ���� 0 enum eNum
� ��
�
�
�� 
erob
� o      ���� 0 efrom eFrom
� ��
���
�� 
errt
� o      ���� 
0 eto eTo��  
� R   � ���
�
�
�� .ascrerr ****      � ****
� b   � �
�
�
� m   � �
�
� �
�
� < C o u l d n  t   c o m p a r e   o b j e c t   k e y s :  
� o   � ����� 0 etext eText
� ��
�
�
�� 
errn
� o   � ����� 0 enum eNum
� ��
�
�
�� 
erob
� J   � �
�
� 
�
�
� n   � �
�
�
� 4   � ���
�
�� 
cobj
� o   � ����� 0 
rightindex 
rightIndex
� n  � �
�
�
� o   � ����� 
0 _keys_  
� o   � ����� $0 resultlistobject resultListObject
� 
���
� o   � ����� 0 
pivotvalue 
pivotValue��  
� ��
���
�� 
errt
� o   � ����� 
0 eto eTo��  
� 
���
� Z   �6
�
�����
� l  � �
�����
� H   � �
�
� ?   � �
�
�
� o   � ����� 0 	leftindex 	leftIndex
� o   � ����� 0 
rightindex 
rightIndex��  ��  
� k   �2
�
� 
�
�
� r   � �
�
�
� J   � �
�
� 
� 
� e   � � n   � � 4   � ���
�� 
cobj o   � ����� 0 
rightindex 
rightIndex n  � � o   � ����� 
0 _keys_   o   � ����� $0 resultlistobject resultListObject  �� e   � � n   � �	
	 4   � ���
�� 
cobj o   � ����� 0 	leftindex 	leftIndex
 n  � � o   � ����� 
0 _keys_   o   � ����� $0 resultlistobject resultListObject��  
� J        n       4   � ���
�� 
cobj o   � ����� 0 	leftindex 	leftIndex n  � � o   � ����� 
0 _keys_   o   � ����� $0 resultlistobject resultListObject �� n       4   � ���
�� 
cobj o   � ����� 0 
rightindex 
rightIndex n  � � o   � ����� 
0 _keys_   o   � ����� $0 resultlistobject resultListObject��  
�  r   � J   �   !"! e   � �## n   � �$%$ 4   � ���&
�� 
cobj& o   � ����� 0 
rightindex 
rightIndex% n  � �'(' o   � ����� 
0 _list_  ( o   � ����� $0 resultlistobject resultListObject" )��) e   � �** n   � �+,+ 4   � ���-
�� 
cobj- o   � ����� 0 	leftindex 	leftIndex, n  � �./. o   � ����� 
0 _list_  / o   � ����� $0 resultlistobject resultListObject��   J      00 121 n      343 4  	��5
�� 
cobj5 o  
���� 0 	leftindex 	leftIndex4 n 	676 o  	���� 
0 _list_  7 o  ���� $0 resultlistobject resultListObject2 8��8 n      9:9 4  ��;
�� 
cobj; o  ���� 0 
rightindex 
rightIndex: n <=< o  ���� 
0 _list_  = o  ���� $0 resultlistobject resultListObject��   >��> r  2?@? J  #AA BCB [  DED o  ���� 0 	leftindex 	leftIndexE m  ���� C F��F \  !GHG o  ���� 0 
rightindex 
rightIndexH m   ���� ��  @ J      II JKJ o      ���� 0 	leftindex 	leftIndexK L��L o      ���� 0 
rightindex 
rightIndex��  ��  ��  ��  ��  
} B   = @MNM o   = >���� 0 	leftindex 	leftIndexN o   > ?���� 0 
rightindex 
rightIndex
{ O��O Q  <pPQRP k  ?gSS TUT I  ?Q��V���� 	0 _sort  V WXW o  @A���� $0 resultlistobject resultListObjectX YZY o  AB���� 0 
startindex 
startIndexZ [\[ o  BC���� 0 
rightindex 
rightIndex\ ]^] o  CD����  0 sortcomparator sortComparator^ _��_ ?  DM`a` \  DGbcb o  DE���� 0 
rightindex 
rightIndexc o  EF���� 0 
startindex 
startIndexa o  GL���� *0 _quicksortthreshold _quicksortThreshold��  ��  U ded I  Rd��f���� 	0 _sort  f ghg o  ST���� $0 resultlistobject resultListObjecth iji o  TU���� 0 	leftindex 	leftIndexj klk o  UV���� 0 endindex endIndexl mnm o  VW����  0 sortcomparator sortComparatorn o��o ?  W`pqp \  WZrsr o  WX���� 0 endindex endIndexs o  XY���� 0 	leftindex 	leftIndexq o  Z_���� *0 _quicksortthreshold _quicksortThreshold��  ��  e t��t L  eg����  ��  Q R      ����u
�� .ascrerr ****      � ****��  u ��v��
�� 
errnv d      ww m      ����
���  R l oo��xy��  x r l stack overflow, so fall-through to use non-recursive insertion sort (this should rarely happen in practice)   y �zz �   s t a c k   o v e r f l o w ,   s o   f a l l - t h r o u g h   t o   u s e   n o n - r e c u r s i v e   i n s e r t i o n   s o r t   ( t h i s   s h o u l d   r a r e l y   h a p p e n   i n   p r a c t i c e )��  
W � � sort mostly uses quicksort, but falls through to insertionsort when sorting small number of items (<8), or when sorting a mostly-sorted list, or when quicksort recursion exceeds AS's stack depth   
X �{{�   s o r t   m o s t l y   u s e s   q u i c k s o r t ,   b u t   f a l l s   t h r o u g h   t o   i n s e r t i o n s o r t   w h e n   s o r t i n g   s m a l l   n u m b e r   o f   i t e m s   ( < 8 ) ,   o r   w h e n   s o r t i n g   a   m o s t l y - s o r t e d   l i s t ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   e x c e e d s   A S ' s   s t a c k   d e p t h�6  �5  
S |}| l uu��~��  ~ � � fall-through to use loop-based insertion sort when sorting a small number of items (for which it is faster than quicksort), or when quicksort recursion overflows AppleScript's call stack    ���v   f a l l - t h r o u g h   t o   u s e   l o o p - b a s e d   i n s e r t i o n   s o r t   w h e n   s o r t i n g   a   s m a l l   n u m b e r   o f   i t e m s   ( f o r   w h i c h   i t   i s   f a s t e r   t h a n   q u i c k s o r t ) ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   o v e r f l o w s   A p p l e S c r i p t ' s   c a l l   s t a c k} ��� r  uz��� [  ux��� o  uv���� 0 
startindex 
startIndex� m  vw���� � o      ���� 0 
startindex 
startIndex� ��� Y  {��~���}� Y  ���|���� k  ��� ��� r  ����� J  ���� ��� e  ���� n  ����� 4  ���{�
�{ 
cobj� l ����z�y� \  ����� o  ���x�x 0 j  � m  ���w�w �z  �y  � n ����� o  ���v�v 
0 _keys_  � o  ���u�u $0 resultlistobject resultListObject� ��t� e  ���� n  ����� 4  ���s�
�s 
cobj� o  ���r�r 0 j  � n ����� o  ���q�q 
0 _keys_  � o  ���p�p $0 resultlistobject resultListObject�t  � J      �� ��� o      �o�o 0 leftkey leftKey� ��n� o      �m�m 0 rightkey rightKey�n  � ��� l ������ Z �����l�k� A  ����� n ����� I  ���j��i�j 0 comparekeys compareKeys� ��� o  ���h�h 0 leftkey leftKey� ��g� o  ���f�f 0 rightkey rightKey�g  �i  � o  ���e�e  0 sortcomparator sortComparator� m  ���d�d �  S  ���l  �k  � !  stop when leftKey�rightKey   � ��� 6   s t o p   w h e n   l e f t K e y"d r i g h t K e y� ��� r  ����� J  ���� ��� o  ���c�c 0 rightkey rightKey� ��b� o  ���a�a 0 leftkey leftKey�b  � J      �� ��� n      ��� 4  ���`�
�` 
cobj� l ����_�^� \  ����� o  ���]�] 0 j  � m  ���\�\ �_  �^  � n ����� o  ���[�[ 
0 _keys_  � o  ���Z�Z $0 resultlistobject resultListObject� ��Y� n      ��� 4  ���X�
�X 
cobj� o  ���W�W 0 j  � n ����� o  ���V�V 
0 _keys_  � o  ���U�U $0 resultlistobject resultListObject�Y  � ��T� r  ���� J  ���� ��� e  ���� n  ����� 4  ���S�
�S 
cobj� o  ���R�R 0 j  � n ����� o  ���Q�Q 
0 _list_  � o  ���P�P $0 resultlistobject resultListObject� ��O� e  ���� n  ����� 4  ���N�
�N 
cobj� l ����M�L� \  ����� o  ���K�K 0 j  � m  ���J�J �M  �L  � n ����� o  ���I�I 
0 _list_  � o  ���H�H $0 resultlistobject resultListObject�O  � J      �� ��� n      ��� 4  ��G�
�G 
cobj� l ���F�E� \  ���� o  ���D�D 0 j  � m  � �C�C �F  �E  � n ����� o  ���B�B 
0 _list_  � o  ���A�A $0 resultlistobject resultListObject� ��@� n      ��� 4  �?�
�? 
cobj� o  �>�> 0 j  � n ��� o  	�=�= 
0 _list_  � o  	�<�< $0 resultlistobject resultListObject�@  �T  �| 0 j  � o  ���;�; 0 i  � o  ���:�: 0 
startindex 
startIndex� m  ���9�9���~ 0 i  � o  ~�8�8 0 
startindex 
startIndex� o  ��7�7 0 endindex endIndex�}  �  
O 1 + performs in-place quicksort/insertionsort	   
P ��� V   p e r f o r m s   i n - p l a c e   q u i c k s o r t / i n s e r t i o n s o r t 	
A ��� l     �6�5�4�6  �5  �4  � ��� l     �3 �3     -----    � 
 - - - - -�  l     �2�1�0�2  �1  �0    i  N Q I     �/	

�/ .Lst:Sortnull���     ****	 o      �.�. 0 thelist theList
 �-�,
�- 
Comp |�+�*�)�+  �*   o      �(�(  0 sortcomparator sortComparator�)   l     �'�& m      �%
�% 
msng�'  �&  �,   k    u  l     �$�$  .( note that `sort list` currently doesn't implement a `reversed order` parameter as its quicksort algorithm isn't stable (i.e. items that compare as equal will appear in any order, not the order in which they were supplied), so such an option would be useless in practice and rather misleading too. (To get a list in descending order, just get the returned list's `reverse` property or else pass a comparator containing a suitable compareKeys handler.) This parameter can always be added in future if/when a stable sorting algorithm is ever implemented.    �P   n o t e   t h a t   ` s o r t   l i s t `   c u r r e n t l y   d o e s n ' t   i m p l e m e n t   a   ` r e v e r s e d   o r d e r `   p a r a m e t e r   a s   i t s   q u i c k s o r t   a l g o r i t h m   i s n ' t   s t a b l e   ( i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   w i l l   a p p e a r   i n   a n y   o r d e r ,   n o t   t h e   o r d e r   i n   w h i c h   t h e y   w e r e   s u p p l i e d ) ,   s o   s u c h   a n   o p t i o n   w o u l d   b e   u s e l e s s   i n   p r a c t i c e   a n d   r a t h e r   m i s l e a d i n g   t o o .   ( T o   g e t   a   l i s t   i n   d e s c e n d i n g   o r d e r ,   j u s t   g e t   t h e   r e t u r n e d   l i s t ' s   ` r e v e r s e `   p r o p e r t y   o r   e l s e   p a s s   a   c o m p a r a t o r   c o n t a i n i n g   a   s u i t a b l e   c o m p a r e K e y s   h a n d l e r . )   T h i s   p a r a m e t e r   c a n   a l w a y s   b e   a d d e d   i n   f u t u r e   i f / w h e n   a   s t a b l e   s o r t i n g   a l g o r i t h m   i s   e v e r   i m p l e m e n t e d . �# Q    u k   _  r     n    I    �" �!�" "0 aslistparameter asListParameter  !"! o    	� �  0 thelist theList" #�# m   	 
$$ �%%  �  �!   o    �� 0 _support   o      �� 0 thelist theList &'& h    �(� $0 resultlistobject resultListObject( k      )) *+* l     ,-., j     	�/� 
0 _keys_  / n     010 2   �
� 
cobj1 o     �� 0 thelist theList- ~ x (replacing items in an existing list of the correct length is a little faster than appending items to a new empty list)   . �22 �   ( r e p l a c i n g   i t e m s   i n   a n   e x i s t i n g   l i s t   o f   t h e   c o r r e c t   l e n g t h   i s   a   l i t t l e   f a s t e r   t h a n   a p p e n d i n g   i t e m s   t o   a   n e w   e m p t y   l i s t )+ 3�3 j   
 �4� 
0 _list_  4 n   
 565 2   �
� 
cobj6 o   
 �� 0 thelist theList�  ' 787 Z   ,9:��9 A     ;<; n   =>= 1    �
� 
leng> n   ?@? o    �� 
0 _list_  @ o    �� $0 resultlistobject resultListObject< m    �� : L   # (AA n  # 'BCB o   $ &�� 
0 _list_  C o   # $�� $0 resultlistobject resultListObject�  �  8 DED Z   - JFG�HF =  - 0IJI o   - .��  0 sortcomparator sortComparatorJ m   . /�

�
 
msngG r   3 :KLK I  3 8�	��
�	 .Lst:DeSonull��� ��� null�  �  L o      ��  0 sortcomparator sortComparator�  H r   = JMNM n  = HOPO I   B H�Q�� &0 asscriptparameter asScriptParameterQ RSR o   B C��  0 sortcomparator sortComparatorS T�T m   C DUU �VV 
 u s i n g�  �  P o   = B�� 0 _support  N o      � �   0 sortcomparator sortComparatorE WXW l  K K��YZ��  Y M G call comparator's makeKey method to generate each sortable key in turn   Z �[[ �   c a l l   c o m p a r a t o r ' s   m a k e K e y   m e t h o d   t o   g e n e r a t e   e a c h   s o r t a b l e   k e y   i n   t u r nX \]\ l  K N^_`^ r   K Naba m   K L����  b o      ���� "0 disorderedcount disorderedCount_ z t while generating keys also check if list is already almost/fully sorted and if it is use insertionsort/return as-is   ` �cc �   w h i l e   g e n e r a t i n g   k e y s   a l s o   c h e c k   i f   l i s t   i s   a l r e a d y   a l m o s t / f u l l y   s o r t e d   a n d   i f   i t   i s   u s e   i n s e r t i o n s o r t / r e t u r n   a s - i s] ded Q   Ofghf k   Rii jkj Q   R �lmnl r   U copo n  U aqrq I   V a��s���� 0 makekey makeKeys t��t e   V ]uu n   V ]vwv 4   Y \��x
�� 
cobjx m   Z [���� w n  V Yyzy o   W Y���� 
0 _keys_  z o   V W���� $0 resultlistobject resultListObject��  ��  r o   U V����  0 sortcomparator sortComparatorp o      ���� 0 previouskey previousKeym R      ��{|
�� .ascrerr ****      � ****{ o      ���� 0 etext eText| ��}~
�� 
errn} o      ���� 0 enum eNum~ ����
�� 
errt o      ���� 
0 eto eTo��  n R   k �����
�� .ascrerr ****      � ****� b   � ���� m   � ��� ��� : C o u l d n  t   m a k e K e y   f o r   i t e m   1 :  � o   � ����� 0 etext eText� ����
�� 
errn� o   o p���� 0 enum eNum� ����
�� 
erob� l  s {������ N   s {�� n   s z��� 4   w z���
�� 
cobj� m   x y���� � l  s w������ e   s w�� n  s w��� o   t v���� 
0 _list_  � o   s t���� $0 resultlistobject resultListObject��  ��  ��  ��  � �����
�� 
errt� o   ~ ���� 
0 eto eTo��  k ��� r   � ���� o   � ����� 0 previouskey previousKey� n      ��� 4   � ����
�� 
cobj� m   � ����� � n  � ���� o   � ����� 
0 _keys_  � o   � ����� $0 resultlistobject resultListObject� ���� Y   ��������� k   � ��� ��� Q   � ����� r   � ���� n  � ���� I   � �������� 0 makekey makeKey� ���� n   � ���� 4   � ����
�� 
cobj� o   � ����� 0 i  � n  � ���� o   � ����� 
0 _keys_  � o   � ����� $0 resultlistobject resultListObject��  ��  � o   � �����  0 sortcomparator sortComparator� o      ���� 0 
currentkey 
currentKey� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enum eNum� �����
�� 
errt� o      ���� 
0 eto eTo��  � R   � �����
�� .ascrerr ****      � ****� b   � ���� b   � ���� b   � ���� m   � ��� ��� 4 C o u l d n  t   m a k e K e y   f o r   i t e m  � o   � ����� 0 i  � m   � ��� ���  :  � o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enum eNum� ����
�� 
erob� l  � ������� N   � ��� n   � ���� 4   � ����
�� 
cobj� o   � ����� 0 i  � l  � ������� e   � ��� n  � ���� o   � ����� 
0 _list_  � o   � ����� $0 resultlistobject resultListObject��  ��  ��  ��  � �����
�� 
errt� o   � ����� 
0 eto eTo��  � ��� r   � ���� o   � ����� 0 
currentkey 
currentKey� n      ��� 4   � ����
�� 
cobj� o   � ����� 0 i  � n  � ���� o   � ����� 
0 _keys_  � o   � ����� $0 resultlistobject resultListObject� ��� Z  � �������� ?   � ���� n  � ���� I   � �������� 0 comparekeys compareKeys� ��� o   � ����� 0 previouskey previousKey� ���� o   � ����� 0 
currentkey 
currentKey��  ��  � o   � �����  0 sortcomparator sortComparator� m   � �����  � r   � ���� [   � ���� o   � ����� "0 disorderedcount disorderedCount� m   � ����� � o      ���� "0 disorderedcount disorderedCount��  ��  � ���� r   � ���� o   � ����� 0 
currentkey 
currentKey� o      ���� 0 previouskey previousKey��  �� 0 i  � m   � ����� � n  � ���� 1   � ���
�� 
leng� n  � ���� o   � ����� 
0 _keys_  � o   � ����� $0 resultlistobject resultListObject��  ��  g R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enum eNum� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  h R  ����
�� .ascrerr ****      � ****� o  ���� 0 etext eText� ����
�� 
errn� o  ���� 0 enum eNum� ����
�� 
erob� o  ���� 0 efrom eFrom� �����
�� 
errt� o  ���� 
0 eto eTo��  e � � Z  Y���� ?  " o   ���� "0 disorderedcount disorderedCount m   !����   l %U k  %U 	
	 l %D r  %D F  %B l %0���� ?  %0 n %* 1  (*��
�� 
leng n %( o  &(���� 
0 _list_   o  %&���� $0 resultlistobject resultListObject o  */���� *0 _quicksortthreshold _quicksortThreshold��  ��   ?  3> l 3:��~ ^  3: o  34�}�} "0 disorderedcount disorderedCount l 49�|�{ n 49  1  79�z
�z 
leng  n 47!"! o  57�y�y 
0 _list_  " o  45�x�x $0 resultlistobject resultListObject�|  �{  �  �~   m  :=## ?�z�G�{ o      �w�w 0 usequicksort useQuickSort \ V if list is small or already 99% in-order then insertion sort is faster than quicksort    �$$ �   i f   l i s t   i s   s m a l l   o r   a l r e a d y   9 9 %   i n - o r d e r   t h e n   i n s e r t i o n   s o r t   i s   f a s t e r   t h a n   q u i c k s o r t
 %�v% I  EU�u&�t�u 	0 _sort  & '(' o  FG�s�s $0 resultlistobject resultListObject( )*) m  GH�r�r * +,+ n HM-.- 1  KM�q
�q 
leng. n HK/0/ o  IK�p�p 
0 _list_  0 o  HI�o�o $0 resultlistobject resultListObject, 121 o  MN�n�n  0 sortcomparator sortComparator2 3�m3 o  NO�l�l 0 usequicksort useQuickSort�m  �t  �v     some sorting required    �44 ,   s o m e   s o r t i n g   r e q u i r e d��  ��    5�k5 L  Z_66 n Z^787 o  []�j�j 
0 _list_  8 o  Z[�i�i $0 resultlistobject resultListObject�k   R      �h9:
�h .ascrerr ****      � ****9 o      �g�g 0 etext eText: �f;<
�f 
errn; o      �e�e 0 enumber eNumber< �d=>
�d 
erob= o      �c�c 0 efrom eFrom> �b?�a
�b 
errt? o      �`�` 
0 eto eTo�a   I  gu�_@�^�_ 
0 _error  @ ABA m  hkCC �DD  s o r t   l i s tB EFE o  kl�]�] 0 etext eTextF GHG o  lm�\�\ 0 enumber eNumberH IJI o  mn�[�[ 0 efrom eFromJ K�ZK o  no�Y�Y 
0 eto eTo�Z  �^  �#   LML l     �X�W�V�X  �W  �V  M NON l     �U�T�S�U  �T  �S  O PQP l     �RRS�R  R  -----   S �TT 
 - - - - -Q UVU l     �QWX�Q  W U O sort comparator constructors; used to customize how `sort list` compares items   X �YY �   s o r t   c o m p a r a t o r   c o n s t r u c t o r s ;   u s e d   t o   c u s t o m i z e   h o w   ` s o r t   l i s t `   c o m p a r e s   i t e m sV Z[Z l     �P�O�N�P  �O  �N  [ \]\ i  R U^_^ I     �M�L�K
�M .Lst:DeSonull��� ��� null�L  �K  _ h     �J`�J &0 defaultcomparator DefaultComparator` k      aa bcb j     �Id�I "0 _supportedtypes _supportedTypesd J     ee fgf m     �H
�H 
nmbrg hih m    �G
�G 
ctxti j�Fj m    �E
�E 
ldt �F  c klk j    	�Dm�D 	0 _type  m m    �C
�C 
msngl non i   
 pqp I      �Br�A�B 0 makekey makeKeyr s�@s o      �?�? 0 anobject anObject�@  �A  q k     }tt uvu Z     zwxy�>w =    z{z o     �=�= 	0 _type  { m    �<
�< 
msngx k   
 K|| }~} X   
 B�;� Z    =���:�9� ?    *��� l   (��8�7� I   (�6��
�6 .corecnte****       ****� J    �� ��5� o    �4�4 0 anobject anObject�5  � �3��2
�3 
kocl� l    $��1�0� e     $�� n    $��� 1   ! #�/
�/ 
pcnt� o     !�.�. 0 aref aRef�1  �0  �2  �8  �7  � m   ( )�-�-  � k   - 9�� ��� r   - 6��� n  - 0��� 1   . 0�,
�, 
pcnt� o   - .�+�+ 0 aref aRef� o      �*�* 	0 _type  � ��)� L   7 9�� o   7 8�(�( 0 anobject anObject�)  �:  �9  �; 0 aref aRef� n   ��� o    �'�' "0 _supportedtypes _supportedTypes�  f    ~ ��&� R   C K�%��
�% .ascrerr ****      � ****� m   I J�� ��� � I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   c a n   o n l y   c o m p a r e   i n t e g e r / r e a l ,   t e x t ,   o r   d a t e   t y p e s ) .� �$��
�$ 
errn� m   E F�#�#�\� �"��!
�" 
erob� o   G H� �  0 anobject anObject�!  �&  y ��� =   N ]��� l  N [���� I  N [���
� .corecnte****       ****� J   N Q�� ��� o   N O�� 0 anobject anObject�  � ���
� 
kocl� o   R W�� 	0 _type  �  �  �  � m   [ \��  � ��� R   ` v���
� .ascrerr ****      � ****� b   f u��� b   f s��� b   f o��� b   f m��� m   f g�� ��� ^ I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   e x p e c t e d  � o   g l�� 	0 _type  � m   m n�� ���    b u t   r e c e i v e d  � l  o r���� n   o r��� m   p r�
� 
pcls� o   o p�� 0 anobject anObject�  �  � m   s t�� ���  ) .� ���
� 
errn� m   b c���\� ���
� 
erob� o   d e�� 0 anobject anObject�  �  �>  v ��
� L   { }�� o   { |�	�	 0 anobject anObject�
  o ��� i   ��� I      ���� 0 comparekeys compareKeys� ��� o      �� 0 
leftobject 
leftObject� ��� o      �� 0 rightobject rightObject�  �  � Z     ����� A     ��� o     �� 0 
leftobject 
leftObject� o    �� 0 rightobject rightObject� L    �� m    � � ��� ��� ?    ��� o    ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� ���� L    �� m    ���� ��  � L    �� m    ����  �  ] ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  V Y��� I     ������
�� .Lst:NuSonull��� ��� null��  ��  � h     ����� &0 numericcomparator NumericComparator� k      �� ��� i    ��� I      ������� 0 makekey makeKey� ���� o      ���� 0 anobject anObject��  ��  � L     �� c     ��� o     ���� 0 anobject anObject� m    ��
�� 
nmbr� ���� i   ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 
leftobject 
leftObject� ���� o      ���� 0 rightobject rightObject��  ��  � l    ���� L     �� \     ��� o     ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject��� note: since compareKeys' return value can be any -ve/0/+ve number, a single subtraction operation is sufficient for numbers and dates. (Caveat: this doesn't take into account minor differences due to real imprecision. Currently this doesn't matter as quicksort isn't stable anyway so makes no guarantees about the order of [imprecisely] equal items; however, if quicksort ever gets replaced with a stable sorting algorithm then this method will need revised to use Number library's `cmp` instead.)   � ����   n o t e :   s i n c e   c o m p a r e K e y s '   r e t u r n   v a l u e   c a n   b e   a n y   - v e / 0 / + v e   n u m b e r ,   a   s i n g l e   s u b t r a c t i o n   o p e r a t i o n   i s   s u f f i c i e n t   f o r   n u m b e r s   a n d   d a t e s .   ( C a v e a t :   t h i s   d o e s n ' t   t a k e   i n t o   a c c o u n t   m i n o r   d i f f e r e n c e s   d u e   t o   r e a l   i m p r e c i s i o n .   C u r r e n t l y   t h i s   d o e s n ' t   m a t t e r   a s   q u i c k s o r t   i s n ' t   s t a b l e   a n y w a y   s o   m a k e s   n o   g u a r a n t e e s   a b o u t   t h e   o r d e r   o f   [ i m p r e c i s e l y ]   e q u a l   i t e m s ;   h o w e v e r ,   i f   q u i c k s o r t   e v e r   g e t s   r e p l a c e d   w i t h   a   s t a b l e   s o r t i n g   a l g o r i t h m   t h e n   t h i s   m e t h o d   w i l l   n e e d   r e v i s e d   t o   u s e   N u m b e r   l i b r a r y ' s   ` c m p `   i n s t e a d . )��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � � � i  Z ] I     ������
�� .Lst:DaSonull��� ��� null��  ��   h     ����  0 datecomparator DateComparator k        i     I      ��	���� 0 makekey makeKey	 
��
 o      ���� 0 anobject anObject��  ��   L      c      o     ���� 0 anobject anObject m    ��
�� 
ldt  �� i    I      ������ 0 comparekeys compareKeys  o      ���� 0 
leftobject 
leftObject �� o      ���� 0 rightobject rightObject��  ��   l     L      \      o     ���� 0 
leftobject 
leftObject o    ���� 0 rightobject rightObject Y S as in NumericComparator, a simple subtraction operation produces a suitable result    � �   a s   i n   N u m e r i c C o m p a r a t o r ,   a   s i m p l e   s u b t r a c t i o n   o p e r a t i o n   p r o d u c e s   a   s u i t a b l e   r e s u l t��     l     ��������  ��  ��    l     ��������  ��  ��    !  i  ^ a"#" I     ����$
�� .Lst:TeSonull��� ��� null��  $ ��%��
�� 
Cons% |����&��'��  ��  & o      ����  0 orderingoption orderingOption��  ' l     (����( m      ��
�� SrtECmpI��  ��  ��  # Q     r)*+) k    \,, -.- h    
��/�� B0 currentconsiderationscomparator CurrentConsiderationsComparator/ k      00 121 i    343 I      ��5���� 0 makekey makeKey5 6��6 o      ���� 0 anobject anObject��  ��  4 l    7897 L     :: c     ;<; o     ���� 0 anobject anObject< m    ��
�� 
ctxt8 � � caution: some AS types - e.g. reals, lists - are subject to localization/TIDs issues when coercing to text, but there's a practical limit to how much AS insanity a library can protect user from without completely bogging down itself   9 �==�   c a u t i o n :   s o m e   A S   t y p e s   -   e . g .   r e a l s ,   l i s t s   -   a r e   s u b j e c t   t o   l o c a l i z a t i o n / T I D s   i s s u e s   w h e n   c o e r c i n g   t o   t e x t ,   b u t   t h e r e ' s   a   p r a c t i c a l   l i m i t   t o   h o w   m u c h   A S   i n s a n i t y   a   l i b r a r y   c a n   p r o t e c t   u s e r   f r o m   w i t h o u t   c o m p l e t e l y   b o g g i n g   d o w n   i t s e l f2 >��> i   ?@? I      ��A���� 0 comparekeys compareKeysA BCB o      ���� 0 
leftobject 
leftObjectC D��D o      ���� 0 rightobject rightObject��  ��  @ Z     EFGHE A     IJI o     ���� 0 
leftobject 
leftObjectJ o    ���� 0 rightobject rightObjectF L    KK m    ������G LML ?    NON o    ���� 0 
leftobject 
leftObjectO o    ���� 0 rightobject rightObjectM P��P L    QQ m    ���� ��  H L    RR m    ����  ��  . S��S Z    \TUVWT =   XYX o    ����  0 orderingoption orderingOptionY m    ��
�� SrtECmpIU k    ZZ [\[ h    ��]�� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator] k      ^^ _`_ j     ��a
�� 
parea o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparator` b��b i  	 cdc I      ��e���� 0 comparekeys compareKeyse fgf o      ���� 0 
leftobject 
leftObjectg h��h o      ���� 0 rightobject rightObject��  ��  d P     ijki L    ll M    mm I      ��n���� 0 comparekeys compareKeysn opo o    ���� 0 
leftobject 
leftObjectp q��q o    ���� 0 rightobject rightObject��  ��  j ��r
�� consdiacr ��s
�� conshyphs ��t
�� conspunct ��u
�� conswhitu ����
�� consnume��  k ����
�� conscase��  ��  \ v��v L    ww o    ���� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator��  V xyx =   !z{z o    ����  0 orderingoption orderingOption{ m     ��
�� SrtECmpCy |}| k   $ .~~ � h   $ +����� :0 casesensitivetextcomparator CaseSensitiveTextComparator� k      �� ��� j     ���
�� 
pare� o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparator� ���� i  	 ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 
leftobject 
leftObject� ���� o      �� 0 rightobject rightObject��  ��  � P     ���~� L    �� M    �� I      �}��|�} 0 comparekeys compareKeys� ��� o    �{�{ 0 
leftobject 
leftObject� ��z� o    �y�y 0 rightobject rightObject�z  �|  � �x�
�x conscase� �w�
�w consdiac� �v�
�v conshyph� �u�
�u conspunc� �t�
�t conswhit� �s�r
�s consnume�r  �~  ��  � ��q� L   , .�� o   , -�p�p :0 casesensitivetextcomparator CaseSensitiveTextComparator�q  } ��� =  1 4��� o   1 2�o�o  0 orderingoption orderingOption� m   2 3�n
�n SrtECmpE� ��� k   7 A�� ��� h   7 >�m��m 40 exactmatchtextcomparator ExactMatchTextComparator� k      �� ��� j     �l�
�l 
pare� o     �k�k B0 currentconsiderationscomparator CurrentConsiderationsComparator� ��j� i  	 ��� I      �i��h�i 0 comparekeys compareKeys� ��� o      �g�g 0 
leftobject 
leftObject� ��f� o      �e�e 0 rightobject rightObject�f  �h  � P     ���� L    �� M    �� I      �d��c�d 0 comparekeys compareKeys� ��� o    �b�b 0 
leftobject 
leftObject� ��a� o    �`�` 0 rightobject rightObject�a  �c  � �_�
�_ conscase� �^�
�^ consdiac� �]�
�] conshyph� �\�
�\ conspunc� �[�Z
�[ conswhit�Z  � �Y�X
�Y consnume�X  �j  � ��W� L   ? A�� o   ? @�V�V 40 exactmatchtextcomparator ExactMatchTextComparator�W  � ��� =  D G��� o   D E�U�U  0 orderingoption orderingOption� m   E F�T
�T SrtECmpD� ��S� L   J L�� o   J K�R�R B0 currentconsiderationscomparator CurrentConsiderationsComparator�S  W n  O \��� I   T \�Q��P�Q >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   T U�O�O  0 orderingoption orderingOption� ��N� m   U X�� ���  f o r�N  �P  � o   O T�M�M 0 _support  ��  * R      �L��
�L .ascrerr ****      � ****� o      �K�K 0 etext eText� �J��
�J 
errn� o      �I�I 0 enumber eNumber� �H��
�H 
erob� o      �G�G 0 efrom eFrom� �F��E
�F 
errt� o      �D�D 
0 eto eTo�E  + I   d r�C��B�C 
0 _error  � ��� m   e h�� ���  t e x t   c o m p a r a t o r� ��� o   h i�A�A 0 etext eText� ��� o   i j�@�@ 0 enumber eNumber� ��� o   j k�?�? 0 efrom eFrom� ��>� o   k l�=�= 
0 eto eTo�>  �B  ! ��� l     �<�;�:�<  �;  �:  � ��� l     �9�8�7�9  �8  �7  � ��� i  b e��� I     �6�5�
�6 .Lst:LiSonull��� ��� null�5  � �4��3
�4 
Comp� |�2�1��0��2  �1  � o      �/�/ "0 itemcomparators itemComparators�0  � l     ��.�-� m      �,
�, 
msng�.  �-  �3  � Q    <���� k   &�� ��� Z   ���+�*� =   ��� o    �)�) "0 itemcomparators itemComparators� m    �(
�( 
msng� r   	 ��� I  	 �'�&�%
�' .Lst:DeSonull��� ��� null�&  �%  � o      �$�$ $0 comparatorobject comparatorObject�+  �*  � ��#� Z   &���"�� =     ��� l    �!�   I   �
� .corecnte****       **** J     � o    �� "0 itemcomparators itemComparators�   ��
� 
kocl m    �
� 
scpt�  �!  �   � m    �� � l  # ; k   # ;		 

 r   # 0 n  # . I   ( .��� &0 asscriptparameter asScriptParameter  o   ( )�� "0 itemcomparators itemComparators � m   ) * �  f o r�  �   o   # (�� 0 _support   o      �� $0 comparatorobject comparatorObject  h   1 8�� .0 uniformlistcomparator UniformListComparator l      k        i      I      �!�� 0 makekey makeKey! "�" o      �� 0 sublist  �  �    h     �#� 0 	keyobject 	KeyObject# k      $$ %&% j     �'� 
0 _list_  ' o     �� 0 sublist  & ()( l     *+,* j    
�
-�
 
0 _keys_  - J    	�	�	  +   cached keys   , �..    c a c h e d   k e y s) /0/ l     ����  �  �  0 1�1 i   232 I      �4�� 0 getkey getKey4 5�5 o      �� 0 	itemindex 	itemIndex�  �  3 k     066 787 V     '9:9 r    ";<; n   =>= I    � ?���  0 makekey makeKey? @��@ n    ABA 4    ��C
�� 
cobjC o    ���� 0 	itemindex 	itemIndexB n   DED o    ���� 
0 _list_  E  f    ��  ��  > o    ���� $0 comparatorobject comparatorObject< n      FGF  ;     !G o     ���� 
0 _keys_  : ?    HIH o    ���� 0 	itemindex 	itemIndexI n    
JKJ 1    
��
�� 
lengK n   LML o    ���� 
0 _keys_  M  f    8 N��N L   ( 0OO n   ( /PQP 4   + .��R
�� 
cobjR o   , -���� 0 	itemindex 	itemIndexQ n  ( +STS o   ) +���� 
0 _keys_  T  f   ( )��  �   UVU l     ��������  ��  ��  V W��W i   XYX I      ��Z���� 0 comparekeys compareKeysZ [\[ o      ���� 0 leftkeyobject leftKeyObject\ ]��] o      ����  0 rightkeyobject rightKeyObject��  ��  Y k     z^^ _`_ r     aba J     cc ded n    fgf 1    ��
�� 
lengg n    hih o    ���� 
0 _list_  i o     ���� 0 leftkeyobject leftKeyObjecte j��j n   
klk 1    
��
�� 
lengl n   mnm o    ���� 
0 _list_  n o    ����  0 rightkeyobject rightKeyObject��  b J      oo pqp o      ���� 0 
leftlength 
leftLengthq r��r o      ���� 0 rightlength rightLength��  ` sts r    uvu o    ���� 0 
leftlength 
leftLengthv o      ���� 0 commonlength commonLengtht wxw Z    -yz����y A     #{|{ o     !���� 0 rightlength rightLength| o   ! "���� 0 commonlength commonLengthz r   & )}~} o   & '���� 0 rightlength rightLength~ o      ���� 0 commonlength commonLength��  ��  x � Y   . a�������� l  8 \���� k   8 \�� ��� r   8 O��� n  8 M��� I   = M������� 0 comparekeys compareKeys� ��� n  = C��� I   > C������� 0 getkey getKey� ���� o   > ?���� 0 i  ��  ��  � o   = >���� 0 leftkeyobject leftKeyObject� ���� n  C I��� I   D I������� 0 getkey getKey� ���� o   D E���� 0 i  ��  ��  � o   C D����  0 rightkeyobject rightKeyObject��  ��  � o   8 =���� $0 comparatorobject comparatorObject� o      ���� $0 comparisonresult comparisonResult� ���� Z  P \������� >   P S��� o   P Q���� $0 comparisonresult comparisonResult� m   Q R����  � L   V X�� o   V W���� $0 comparisonresult comparisonResult��  ��  ��  � E ? iterate over item indexes common to both lists, comparing keys   � ��� ~   i t e r a t e   o v e r   i t e m   i n d e x e s   c o m m o n   t o   b o t h   l i s t s ,   c o m p a r i n g   k e y s�� 0 i  � m   1 2���� � o   2 3���� 0 commonlength commonLength��  � ���� Z   b z����� A   b e��� o   b c���� 0 
leftlength 
leftLength� o   c d���� 0 rightlength rightLength� l  h j���� L   h j�� m   h i������� A ; left sublist is shorter than right sublist, so comes first   � ��� v   l e f t   s u b l i s t   i s   s h o r t e r   t h a n   r i g h t   s u b l i s t ,   s o   c o m e s   f i r s t� ��� ?   m p��� o   m n���� 0 
leftlength 
leftLength� o   n o���� 0 rightlength rightLength� ���� l  s u���� L   s u�� m   s t���� � A ; right sublist is shorter than left sublist, so comes first   � ��� v   r i g h t   s u b l i s t   i s   s h o r t e r   t h a n   l e f t   s u b l i s t ,   s o   c o m e s   f i r s t��  � l  x z���� L   x z�� m   x y����  �   both lists are identical   � ��� 2   b o t h   l i s t s   a r e   i d e n t i c a l��  ��   9 3 compares sublists of same type and variable length    ��� f   c o m p a r e s   s u b l i s t s   o f   s a m e   t y p e   a n d   v a r i a b l e   l e n g t h ���� L   9 ;�� o   9 :���� .0 uniformlistcomparator UniformListComparator��   6 0 compare all sublist items using same comparator    ��� `   c o m p a r e   a l l   s u b l i s t   i t e m s   u s i n g   s a m e   c o m p a r a t o r�"  � k   >&�� ��� Z  > U������� =   > I��� l  > G������ I  > G����
�� .corecnte****       ****� J   > A�� ���� o   > ?���� "0 itemcomparators itemComparators��  � �����
�� 
kocl� m   B C��
�� 
reco��  ��  ��  � m   G H���� � r   L Q��� J   L O�� ���� o   L M���� "0 itemcomparators itemComparators��  � o      ���� "0 itemcomparators itemComparators��  ��  � ��� Z   V����� =   V a��� l  V ]������ I  V ]����
�� .corecnte****       ****� o   V W���� "0 itemcomparators itemComparators� �����
�� 
kocl� m   X Y��
�� 
reco��  ��  ��  � n  ] `��� 1   ^ `��
�� 
leng� o   ] ^���� "0 itemcomparators itemComparators� l  d ����� X   d ������ l  t ����� Q   t ����� k   w ��� ��� c   w |��� l  w z������ n   w z��� o   x z���� 0 	itemindex 	itemIndex� o   w x���� 0 aref aRef��  ��  � m   z {��
�� 
long� ���� c   } ���� l  } ������� n   } ���� o   ~ �����  0 itemcomparator itemComparator� o   } ~���� 0 aref aRef��  ��  � m   � ���
�� 
scpt��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 emsg eMsg� �����
�� 
errn� o      ���� 0 enum eNum��  � k   � ��� ��� Z  � �������� H   � �   E  � � J   � �  m   � ������\ �� m   � ������@��   J   � � �� o   � ����� 0 enum eNum��  � R   � ���	

�� .ascrerr ****      � ****	 o   � ����� 0 emsg eMsg
 ����
�� 
errn o   � ��� 0 enum eNum��  ��  ��  � �~ n  � � I   � ��}�|�} .0 throwinvalidparameter throwInvalidParameter  o   � ��{�{ 0 aref aRef  m   � � �  f o r  m   � ��z
�z 
list �y m   � � � F N o t   a   v a l i d   i t e m   c o m p a r a t o r   r e c o r d .�y  �|   o   � ��x�x 0 _support  �~  � 2 , check list contains item comparator records   � � X   c h e c k   l i s t   c o n t a i n s   i t e m   c o m p a r a t o r   r e c o r d s�� 0 aref aRef� o   g h�w�w "0 itemcomparators itemComparators�   list of records   � �     l i s t   o f   r e c o r d s�  =   � �  l  � �!�v�u! I  � ��t"#
�t .corecnte****       ****" o   � ��s�s "0 itemcomparators itemComparators# �r$�q
�r 
kocl$ m   � ��p
�p 
scpt�q  �v  �u    n  � �%&% 1   � ��o
�o 
leng& o   � ��n�n "0 itemcomparators itemComparators '�m' l  � �()*( k   � �++ ,-, r   � �./. n  � �010 2  � ��l
�l 
cobj1 o   � ��k�k "0 itemcomparators itemComparators/ o      �j�j "0 itemcomparators itemComparators- 2�i2 Y   � �3�h45�g3 r   � �676 K   � �88 �f9:�f "0 comparatorindex comparatorIndex9 o   � ��e�e 0 i  : �d;�c�d  0 itemcomparator itemComparator; n   � �<=< 4   � ��b>
�b 
cobj> o   � ��a�a 0 i  = o   � ��`�` "0 itemcomparators itemComparators�c  7 n      ?@? 4   � ��_A
�_ 
cobjA o   � ��^�^ 0 i  @ o   � ��]�] "0 itemcomparators itemComparators�h 0 i  4 m   � ��\�\ 5 n   � �BCB 1   � ��[
�[ 
lengC o   � ��Z�Z "0 itemcomparators itemComparators�g  �i  )   list of script objects   * �DD .   l i s t   o f   s c r i p t   o b j e c t s�m  � n  �EFE I  �YG�X�Y .0 throwinvalidparameter throwInvalidParameterG HIH o  �W�W "0 itemcomparators itemComparatorsI JKJ m  LL �MM  f o rK NON J  PP QRQ m  	�V
�V 
scptR S�US m  	�T
�T 
list�U  O T�ST m  UU �VV � N o t   a   c o m p a r a t o r   s c r i p t   o b j e c t ,   l i s t   o f   c o m p a r a t o r   s c r i p t   o b j e c t s ,   o r   l i s t   o f   i t e m   c o m p a r a t o r   r e c o r d s .�S  �X  F o   ��R�R 0 _support  � WXW h  #�QY�Q *0 mixedlistcomparator MixedListComparatorY l     Z[\Z k      ]] ^_^ i    `a` I      �Pb�O�P 0 makekey makeKeyb c�Nc o      �M�M 0 sublist  �N  �O  a h     �Ld�L 0 	keyobject 	KeyObjectd l     efge k      hh iji j     �Kk�K 
0 _list_  k o     �J�J 0 sublist  j lml j    
�In�I 
0 _keys_  n J    	�H�H  m opo l     �G�F�E�G  �F  �E  p q�Dq i   rsr I      �Ct�B�C 0 getkey getKeyt u�Au o      �@�@ "0 comparatorindex comparatorIndex�A  �B  s k     yvv wxw V     pyzy k    k{{ |}| r    %~~ n    ��� 4    �?�
�? 
cobj� o    �>�> "0 comparatorindex comparatorIndex� o    �=�= "0 itemcomparators itemComparators K      �� �<���< 0 	itemindex 	itemIndex� o      �;�; 0 idx  � �:��9�:  0 itemcomparator itemComparator� o      �8�8 $0 comparatorobject comparatorObject�9  } ��� Q   & Y���� r   ) 1��� n   ) /��� 4   , /�7�
�7 
cobj� o   - .�6�6 0 idx  � n  ) ,��� o   * ,�5�5 
0 _list_  �  f   ) *� o      �4�4 0 subitem subItem� R      �3�2�
�3 .ascrerr ****      � ****�2  � �1��0
�1 
errn� d      �� m      �/�/��0  � R   9 Y�.��
�. .ascrerr ****      � ****� b   G X��� b   G V��� b   G N��� b   G L��� m   G H�� ��� & C a n  t   c o m p a r e   i t e m  � l  H K��-�,� c   H K��� o   H I�+�+ 0 idx  � m   I J�*
�* 
long�-  �,  � m   L M�� ��� 8   o f   s u b - l i s t   a s   i t   o n l y   h a s  � n  N U��� 1   S U�)
�) 
leng� o   N S�(�( 0 sublist  � m   V W�� ���    i t e m s .� �'��
�' 
errn� m   ; <�&�&�@� �%��$
�% 
erob� l  = F��#�"� N   = F�� n   = E��� 4   B E�!�
�! 
cobj� o   C D� �  0 idx  � o   = B�� 0 sublist  �#  �"  �$  � ��� r   Z k��� n  Z d��� I   _ d���� 0 makekey makeKey� ��� o   _ `�� 0 subitem subItem�  �  � o   Z _�� $0 comparatorobject comparatorObject� n      ���  ;   i j� o   d i�� 
0 _keys_  �  z ?    ��� o    �� "0 comparatorindex comparatorIndex� n    
��� 1    
�
� 
leng� n   ��� o    �� 
0 _keys_  �  f    x ��� L   q y�� n   q x��� 4   t w��
� 
cobj� o   u v�� "0 comparatorindex comparatorIndex� n  q t��� o   r t�� 
0 _keys_  �  f   q r�  �D  f g a lazily converts a single sublist's items into comparable keys, caching them for subsequent reuse   g ��� �   l a z i l y   c o n v e r t s   a   s i n g l e   s u b l i s t ' s   i t e m s   i n t o   c o m p a r a b l e   k e y s ,   c a c h i n g   t h e m   f o r   s u b s e q u e n t   r e u s e_ ��� l     ����  �  �  � ��� i   ��� I      ���� 0 comparekeys compareKeys� ��� o      �
�
 0 leftkeyobject leftKeyObject� ��	� o      ��  0 rightkeyobject rightKeyObject�	  �  � k     B�� ��� Y     ?������ k    :�� ��� r    -��� n   +��� I    +���� 0 comparekeys compareKeys� ��� n   !��� I    !���� 0 getkey getKey� ��� o    � �  0 i  �  �  � o    ���� 0 leftkeyobject leftKeyObject� ���� n  ! '��� I   " '������� 0 getkey getKey� ���� o   " #���� 0 i  ��  ��  � o   ! "����  0 rightkeyobject rightKeyObject��  �  � l   ������ n   ��� o    ����  0 itemcomparator itemComparator� n   ��� 4    ���
�� 
cobj� o    ���� 0 i  � o    ���� "0 itemcomparators itemComparators��  ��  � o      ���� $0 comparisonresult comparisonResult� ���� Z  . :������� >   . 1��� o   . /���� $0 comparisonresult comparisonResult� m   / 0����  � L   4 6�� o   4 5���� $0 comparisonresult comparisonResult��  ��  ��  � 0 i  � m    ���� � n   ��� 1   	 ��
�� 
leng� o    	���� "0 itemcomparators itemComparators�  � ���� l  @ B���� L   @ B�� m   @ A����  �   both lists are identical   � ��� 2   b o t h   l i s t s   a r e   i d e n t i c a l��  �  [ 9 3 compares sublists of same length and variable type   \ �   f   c o m p a r e s   s u b l i s t s   o f   s a m e   l e n g t h   a n d   v a r i a b l e   t y p eX �� L  $& o  $%���� *0 mixedlistcomparator MixedListComparator��  �#  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ��	��
�� 
errt	 o      ���� 
0 eto eTo��  � I  .<��
���� 
0 _error  
  m  /2 �  l i s t   c o m p a r a t o r  o  23���� 0 etext eText  o  34���� 0 enumber eNumber  o  45���� 0 efrom eFrom �� o  56���� 
0 eto eTo��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    i  f i I     ����
�� .Lst:ReSonull��� ��� null��   ����
�� 
Comp |���� ��!��  ��    o      ���� $0 comparatorobject comparatorObject��  ! l     "����" m      ��
�� 
msng��  ��  ��   Q     :#$%# k    (&& '(' Z     )*��+) =   ,-, o    ���� $0 comparatorobject comparatorObject- m    ��
�� 
msng* r   	 ./. I  	 ������
�� .Lst:DeSonull��� ��� null��  ��  / o      ���� $0 comparatorobject comparatorObject��  + r     010 n   232 I    ��4���� &0 asscriptparameter asScriptParameter4 565 o    ���� $0 comparatorobject comparatorObject6 7��7 m    88 �99  f o r��  ��  3 o    ���� 0 _support  1 o      ���� $0 comparatorobject comparatorObject( :��: h   ! (��;�� &0 reversecomparator ReverseComparator; k      << =>= j     ��?
�� 
pare? o     ���� $0 comparatorobject comparatorObject> @��@ i  	 ABA I      ��C���� 0 comparekeys compareKeysC DED o      ���� 0 leftkey leftKeyE F��F o      ���� 0 rightkey rightKey��  ��  B l    GHIG L     JJ d     
KK l    	L����L M     	MM I      ��N���� 0 comparekeys compareKeysN OPO o    ���� 0 leftkey leftKeyP Q��Q o    ���� 0 rightkey rightKey��  ��  ��  ��  H 4 . flip negative flag to positive and vice-versa   I �RR \   f l i p   n e g a t i v e   f l a g   t o   p o s i t i v e   a n d   v i c e - v e r s a��  ��  $ R      ��ST
�� .ascrerr ****      � ****S o      ���� 0 etext eTextT ��UV
�� 
errnU o      ���� 0 enumber eNumberV ��WX
�� 
erobW o      ���� 0 efrom eFromX ��Y��
�� 
errtY o      ���� 
0 eto eTo��  % I   0 :��Z���� 
0 _error  Z [\[ m   1 2]] �^^ $ r e v e r s e   c o m p a r a t o r\ _`_ o   2 3���� 0 etext eText` aba o   3 4���� 0 enumber eNumberb cdc o   4 5���� 0 efrom eFromd e��e o   5 6���� 
0 eto eTo��  ��   fgf l     ��������  ��  ��  g hih l     ��������  ��  ��  i j�j l     ����  �  �  �       �klmnopqrstuvwxyz�{|}~����  k ������������~�}�|�{�z�y�x�w�v�u�t�s�r
� 
pimr� 0 _support  � 
0 _error  � 20 _errorwithpartialresult _errorWithPartialResult� "0 _makelistobject _makeListObject
� .Lst:Instnull���     ****
� .Lst:Delenull���     ****
� .Lst:RDuLnull���     ****
� .Lst:SliLnull���     ****
� .Lst:Trannull���     ****
� .Lst:LiUSnull���     ****
�~ .Lst:Findnull���     ****
�} .Lst:Map_null���     ****
�| .Lst:Filtnull���     ****
�{ .Lst:Redunull���     ****�z *0 _quicksortthreshold _quicksortThreshold�y 	0 _sort  
�x .Lst:Sortnull���     ****
�w .Lst:DeSonull��� ��� null
�v .Lst:NuSonull��� ��� null
�u .Lst:DaSonull��� ��� null
�t .Lst:TeSonull��� ��� null
�s .Lst:LiSonull��� ��� null
�r .Lst:ReSonull��� ��� nulll �q��q �  �� �p��o
�p 
cobj� ��   �n
�n 
osax�o  m ��   �m %
�m 
scptn �l -�k�j���i�l 
0 _error  �k �h��h �  �g�f�e�d�c�g 0 handlername handlerName�f 0 etext eText�e 0 enumber eNumber�d 0 efrom eFrom�c 
0 eto eTo�j  � �b�a�`�_�^�b 0 handlername handlerName�a 0 etext eText�` 0 enumber eNumber�_ 0 efrom eFrom�^ 
0 eto eTo� �]�\�[
�] 
msng�\ �[ 20 _errorwithpartialresult _errorWithPartialResult�i *�������+ o �Z I�Y�X���W�Z 20 _errorwithpartialresult _errorWithPartialResult�Y �V��V �  �U�T�S�R�Q�P�U 0 handlername handlerName�T 0 etext eText�S 0 enumber eNumber�R 0 efrom eFrom�Q 
0 eto eTo�P 0 epartial ePartial�X  � �O�N�M�L�K�J�O 0 handlername handlerName�N 0 etext eText�M 0 enumber eNumber�L 0 efrom eFrom�K 
0 eto eTo�J 0 epartial ePartial�  [�I�H�G
�I 
msng�H �G 0 rethrowerror rethrowError�W b  ࠡ�����+ p �F x�E�D���C�F "0 _makelistobject _makeListObject�E �B��B �  �A�@�A 0 len  �@ 0 padvalue padValue�D  � �?�>�=�? 0 len  �> 0 padvalue padValue�= 0 
listobject 
listObject� �< ���;�:�9�8�< 0 
listobject 
listObject� �7��6�5���4
�7 .ascrinit****      � ****� k     ��  ��3�3  �6  �5  � �2�2 
0 _list_  � �1�1 
0 _list_  �4 jv��; �: 
0 _list_  
�9 
leng
�8 
cobj�C `��K S�O�j L�����v��,FO h��,�,���,��,%��,F[OY��O��,�,� ��,[�\[Zk\Z�2��,FY hY hO��,Eq �0 ��/�.���-
�0 .Lst:Instnull���     ****�/ 0 thelist theList�. �,�+�
�, 
Valu�+ 0 thevalue theValue� �*��
�* 
Befo� {�)�(�'�) 0 beforeindex beforeIndex�(  
�' 
msng� �&��
�& 
Afte� {�%�$�#�% 0 
afterindex 
afterIndex�$  
�# 
msng� �"��!
�" 
Conc� {� ���  0 isjoin isJoin�  
� boovfals�!  � 
����������� 0 thelist theList� 0 thevalue theValue� 0 beforeindex beforeIndex� 0 
afterindex 
afterIndex� 0 isjoin isJoin� 0 
listobject 
listObject� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� � ���������,9�E�
�	���r��������� 0 
listobject 
listObject� ��� ������
� .ascrinit****      � ****� k     ��  �����  �   ��  � ���� 
0 _list_  � ������ "0 aslistparameter asListParameter�� 
0 _list_  �� b  b   �l+ �
� 
kocl
� 
list
� .corecnte****       ****
� 
bool
� 
msng
� 
errn��Y� (0 asintegerparameter asIntegerParameter�
 (0 asbooleanparameter asBooleanParameter�	 
0 _list_  
� 
leng
� 
cobj
� 
insl� 80 throwinvalidparameterindex throwInvalidParameterIndex� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  �-�y��K S�O�
 �kv��l j �& 
�kvE�Y hO�� t�� )��l�Y hOb  ��l+ E�Ob  ��l+ E�O�j ��,a ,�kE�Y hO���,a , b  ��,Ea �/a 4a l+ Y hY ��� �b  �a l+ E�O�j 
�kE�Y 0�j ��,a ,�E�Y b  ��,Ea �/a 3a l+ O���,a ,
 �j�& b  ��,Ea �/a 3a l+ Y hY ��%O�j  ���,%Y ;���,a ,  ��,�%Y &��,[a \[Zk\Z�2�%��,[a \[Z�k\Zi2%W X  *a ����a + r ��'��������
�� .Lst:Delenull���     ****�� 0 thelist theList�� ����
�� 
Indx� {�������� 0 theindex theIndex��  ����� ����
�� 
FIdx� {�������� 0 
startindex 
startIndex��  
�� 
msng� �����
�� 
TIdx� {�������� 0 endindex endIndex��  
�� 
msng��  � �������������������������� 0 thelist theList�� 0 theindex theIndex�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 
listobject 
listObject�� 0 
listlength 
listLength�� 0 	startlist 	startList�� 0 endlist endList�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ��?�������_��o������������\������ 0 
listobject 
listObject� �����������
�� .ascrinit****      � ****� k     �� ?����  ��  ��  � ���� 
0 _list_  � G������ "0 aslistparameter asListParameter�� 
0 _list_  �� b  b   �l+ ��� 
0 _list_  
�� 
leng
�� 
msng�� (0 asintegerparameter asIntegerParameter
�� 
bool
�� 
cobj�� 80 throwinvalidparameterindex throwInvalidParameterIndex�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� ����
�� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  ������K S�O��,�,E�O�� b  ��l+ E�Y hO�� b  ��l+ E�Y hO�� 	 �� �& Mb  ��l+ E�O�j �k�E�Y hO�j 
 ���& b  ��,E�/�l+ Y hO�E�Y ���  kE�Y ��  �E�Y hO�j �k�E�Y hO�j �k�E�Y hO�j 
 ���& b  ��,E�/�l+ Y &�j 
 ���& b  ��,E�/�l+ Y hO�� ��,�-EY hO�k  �� 
 �� �& jvY hOjvE�Y ��,[�\[Zk\Z�k2E�O��  	jvE�Y ��,[�\[Z�k\Zi2E�O��%W X  *a ����a + s �l�����
� .Lst:RDuLnull���     ****� 0 thelist theList�  � 	���������� 0 thelist theList� 0 
listobject 
listObject� 0 i  � 0 u  � 0 
listlength 
listLength� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �t���������� 0 
listobject 
listObject� �������
� .ascrinit****      � ****� k     �� t��  �  �  � �� 
0 _list_  � ~���� "0 aslistparameter asListParameter
� 
cobj� 
0 _list_  � b  b   �l+ �-E�� 
0 _list_  
� 
leng
� 
cobj� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � � ���K S�Olk��,�,mvE[�k/E�Z[�l/E�Z[�m/E�ZO�j  jvY hO eh�� >h��,[�\[Zk\Z�2��,�/kv�kE�O�� ��,[�\[Zk\Z�2EY h[OY��O�kE�O��,�/��,�/FO�kE�[OY��O��,[�\[Zk\Z�2EW X  *襦���+ 
t ������
� .Lst:SliLnull���     ****� 0 thelist theList� ���
� 
FIdx� {���� 0 
startindex 
startIndex�  
� 
msng� ���
� 
TIdx� {���� 0 endindex endIndex�  
� 
msng�  � ��������� 0 thelist theList� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	thelength 	theLength� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� "���<�P�~U�}�|�{�z�yx����x�w�!�v�u� "0 aslistparameter asListParameter
� 
leng
� 
msng� (0 asintegerparameter asIntegerParameter
�~ 
long�} �| .0 throwinvalidparameter throwInvalidParameter
�{ 
cobj
�z 
errn�y�[
�x 
bool�w 0 etext eText� �t�s�
�t 
errn�s 0 enumber eNumber� �r�q�
�r 
erob�q 0 efrom eFrom� �p�o�n
�p 
errt�o 
0 eto eTo�n  �v �u 
0 _error  ���b  ��l+ E�O��,E�O�� ]b  ��l+ E�O�j  b  �����+ 
Y hO��  -��' 
��-EY �� jvY �[�\[Z�\Zi2EY hY ��  )��l�Y hO�� ab  ��l+ E�O�j  b  �a �a �+ 
Y hO��  -��' jvY �� 
��-EY �[�\[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO��
 �k	 	�ka &a &
 ��	 	��a &a & jvY hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[�\[Z�\Z�2EW X  *a ����a + u �m1�l�k���j
�m .Lst:Trannull���     ****�l 0 thelist theList�k �i��
�i 
Whil� {�h�g�f�h 0 unevenoption unevenOption�g  
�f LTrhLTrR� �e��d
�e 
PadI� {�c�b�a�c 0 padvalue padValue�b  
�a 
msng�d  � �`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�` 0 thelist theList�_ 0 unevenoption unevenOption�^ 0 padvalue padValue�] 0 
listobject 
listObject�\ $0 resultlistlength resultListLength�[ 0 aref aRef�Z *0 resultsublistlength resultSubListLength�Y 0 resultsublist resultSubList�X 0 i  �W 0 j  �V 0 etext eText�U 0 enumber eNumber�T 0 efrom eFrom�S 
0 eto eTo� �R�Q�P�Oej�N�M�Ln��K�J�I�H���G�F��E�D�C�B�[�A�@
�R 
kocl
�Q 
list
�P .corecnte****       ****
�O 
bool�N �M .0 throwinvalidparameter throwInvalidParameter�L 0 
listobject 
listObject� �?��>�=���<
�? .ascrinit****      � ****� k     
�� p�� s�;�;  �>  �=  � �:�9�: 
0 _list_  �9 0 _resultlist_ _resultList_� �8�7�8 
0 _list_  �7 0 _resultlist_ _resultList_�< b   �Ojv��K 
0 _list_  
�J 
cobj
�I 
leng
�H LTrhLTrR
�G LTrhLTrP
�F LTrhLTrT�E >0 throwinvalidconstantparameter throwInvalidConstantParameter�D "0 _makelistobject _makeListObject�C 0 _resultlist_ _resultList_�B 0 etext eText� �6�5�
�6 
errn�5 0 enumber eNumber� �4�3�
�4 
erob�3 0 efrom eFrom� �2�1�0
�2 
errt�1 
0 eto eTo�0  �A �@ 
0 _error  �j�ɠjv  jvY hO�kv��l j 
 ���l �j �& b  �����+ Y hO��K 
S�O��,�k/�,E�O��  7 1��,[��l kh ��,� b  ���a �+ Y h[OY��Y u�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y B�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y b  �a l+ O�j ���,�,E�O*��l+ E�O��a ,6FO l�kh ��-E�a ,6F[OY��O�a   @ :k�kh  +k��,�/�,Ekh 	��,�/�/�a ,�/�/F[OY��[OY��Y 5 2k�kh  #k�kh 	��,�/�/�a ,�/�/F[OY��[OY��Y hO�a ,EW X  *a ����a + v �/k�.�-���,
�/ .Lst:LiUSnull���     ****�. 0 thelist theList�-  � 	�+�*�)�(�'�&�%�$�#�+ 0 thelist theList�* $0 resultlistobject resultListObject�) 0 len  �( 0 idx1  �' 0 idx2  �& 0 etext eText�% 0 enumber eNumber�$ 0 efrom eFrom�# 
0 eto eTo� �"s��!� ������������" $0 resultlistobject resultListObject� �������
� .ascrinit****      � ****� k     �� s��  �  �  � �� 
0 _list_  � }���� "0 aslistparameter asListParameter
� 
cobj� 
0 _list_  � b  b   �l+ �-E��! 
0 _list_  
�  
leng
� misccura
� 
from
� 
to  � 
� .sysorandnmbr    ��� nmbr
� 
cobj� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ��
�
� 
erob�
 0 efrom eFrom� �	��
�	 
errt� 
0 eto eTo�  � � 
0 _error  �, u d��K S�O��,�,E�O Hk�kh � *�k�� 	UE�O��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZ[OY��O��,EW X  *������+ w �������
� .Lst:Findnull���     ****� 0 thelist theList� ���
� 
Valu� {�� ��� 0 theitem theItem�   
�� 
msng� ����
�� 
Usin� {�������� 0 filterobject filterObject��  
�� 
msng� �����
�� 
Retu� {�������� (0 findingoccurrences findingOccurrences��  
�� LFWhLFWA��  � 
���������������������� 0 thelist theList�� 0 theitem theItem�� 0 filterobject filterObject�� (0 findingoccurrences findingOccurrences�� 0 
listobject 
listObject�� 0 i  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ����������������5���������������������� 0 
listobject 
listObject� �����������
�� .ascrinit****      � ****� k     �� ��� ����  ��  ��  � ������ 
0 _list_  �� 0 _result_  � �������� "0 aslistparameter asListParameter�� 
0 _list_  �� 0 _result_  �� b  b   �l+ �Ojv�
�� LFWhLFWA
�� 
msng�� 
0 _list_  
�� 
leng
�� 
cobj�� 0 _result_  �� &0 asscriptparameter asScriptParameter�� 0 
filteritem 
filterItem
�� LFWhLFWF
�� LFWhLFWL�� >0 throwinvalidconstantparameter throwInvalidConstantParameter�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �����K S�O��  q��  . (k��,�,Ekh ��,�/�  ���,6FY h[OY��Y <b  ��l+ 
E�O +k��,�,Ekh ���,�/k+  ���,6FY h[OY��Y��  u��  0 *k��,�,Ekh ��,�/�  ���,6FOY h[OY��Y >b  ��l+ 
E�O -k��,�,Ekh ���,�/k+  ���,6FOY h[OY��Y ���  u��  0 *��,�,Ekih ��,�/�  ���,6FOY h[OY��Y >b  ��l+ 
E�O -��,�,Ekih ���,�/k+  ���,6FOY h[OY��Y b  �a l+ O��,EW X  *a ����a + x ��(��������
�� .Lst:Map_null���     ****�� 0 thelist theList�� ������
�� 
Usin�� 0 	mapobject 	mapObject��  � 	���������������� 0 thelist theList�� 0 	mapobject 	mapObject�� $0 resultlistobject resultListObject�� 0 i  �� 0 etext eText� 0 enumber eNumber� 
0 eto eTo� 0 epartial ePartial� 0 efrom eFrom� �2�H��������������������� $0 resultlistobject resultListObject� �������
� .ascrinit****      � ****� k     �� 2��  �  �  � �� 
0 _list_  � <���� "0 aslistparameter asListParameter
� 
cobj� 
0 _list_  � b  b   �l+ �-E�� &0 asscriptparameter asScriptParameter� 
0 _list_  
� 
leng
� 
cobj� 0 mapitem mapItem� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
errt� 
0 eto eTo�  
� 
errn
� 
erob� "0 aslistparameter asListParameter
� 
errt
� 
ptlr� � ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo� ���
� 
ptlr� 0 epartial ePartial�  � � 20 _errorwithpartialresult _errorWithPartialResult�� � ���K S�Ob  ��l+ E�O + %k��,�,Ekh ���,�/k+ ��,�/F[OY��W NX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)��b  ��l+ �/�a �a a �%a %�%O��,EW X 	 *a �����a + y �������
� .Lst:Filtnull���     ****� 0 thelist theList� ���
� 
Usin� 0 filterobject filterObject�  � ������������ 0 thelist theList� 0 filterobject filterObject� $0 resultlistobject resultListObject� 0 	lastindex 	lastIndex� 0 i  � 0 theitem theItem� 0 etext eText� 0 enumber eNumber� 
0 eto eTo� 0 epartial ePartial� 0 efrom eFrom� ���������~�}��|�{	Q�z�y�x�w	=	? 	q�v�u� $0 resultlistobject resultListObject� �t�s�r�q
�t .ascrinit****      � **** k      ��p�p  �s  �r   �o�o 
0 _list_   ��n�m�l�n "0 aslistparameter asListParameter
�m 
cobj�l 
0 _list_  �q b  b   �l+ �-E�� &0 asscriptparameter asScriptParameter� 
0 _list_  
� 
leng
� 
cobj�~ 0 
filteritem 
filterItem�} 0 etext eText� �k�j
�k 
errn�j 0 enumber eNumber �i�h�g
�i 
errt�h 
0 eto eTo�g  
�| 
errn
�{ 
erob�z "0 aslistparameter asListParameter
�y 
errt
�x 
ptlr�w   �f�e
�f 
errn�e 0 enumber eNumber �d�c
�d 
erob�c 0 efrom eFrom �b�a
�b 
errt�a 
0 eto eTo �`�_�^
�` 
ptlr�_ 0 epartial ePartial�^  �v �u 20 _errorwithpartialresult _errorWithPartialResult� � ���K S�Ob  ��l+ E�OjE�O = 7k��,�,Ekh ��,�/E�O��k+  �kE�O���,�/FY h[OY��W NX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)��b  ��l+ �/�a �a a �%a %�%O�j  jvY hO��,[�\[Zk\Z�2EW X 	 *a �����a + z �]	��\�[	
�Z
�] .Lst:Redunull���     ****�\ 0 thelist theList�[ �Y�X�W
�Y 
Usin�X 0 reduceobject reduceObject�W  	 	�V�U�T�S�R�Q�P�O�N�V 0 thelist theList�U 0 reduceobject reduceObject�T 0 	theresult 	theResult�S 0 
listobject 
listObject�R 0 i  �Q 0 etext eText�P 0 enumber eNumber�O 
0 eto eTo�N 0 efrom eFrom
 �M�L	��K�J	��I	��H�G	��F�E�D�C�B�A
�@�?�>	�	�
�=
�M 
msng�L 0 
listobject 
listObject �<�;�:�9
�< .ascrinit****      � **** k      	��8�8  �;  �:   �7�7 
0 _list_   	��6�5�6 "0 aslistparameter asListParameter�5 
0 _list_  �9 b  b   �l+ ��K 
0 _list_  
�J 
leng
�I 
list�H �G .0 throwinvalidparameter throwInvalidParameter�F &0 asscriptparameter asScriptParameter
�E 
cobj�D 0 
reduceitem 
reduceItem�C 0 etext eText �4�3
�4 
errn�3 0 enumber eNumber �2�1�0
�2 
errt�1 
0 eto eTo�0  
�B 
errn
�A 
erob�@ "0 aslistparameter asListParameter
�? 
errt�>  �/�.
�/ 
errn�. 0 enumber eNumber �-�,
�- 
erob�, 0 efrom eFrom �+�*�)
�+ 
errt�* 
0 eto eTo�)  �= 20 _errorwithpartialresult _errorWithPartialResult�Z ��E�O ���K S�O��,�,j  b  �����+ 
Y hOb  ��l+ E�O��,�k/E�O ' !l��,�,Ekh ����,��/l+ E�[OY��W 3X  )a �a b  �a l+ ��/a �a a �%a %�%O�W X  *a �����a + � { �(
C�'�&�%�( 	0 _sort  �' �$�$   �#�"�!� ��# $0 resultlistobject resultListObject�" 0 
startindex 
startIndex�! 0 endindex endIndex�   0 sortcomparator sortComparator� 0 usequicksort useQuickSort�&   ����������������� $0 resultlistobject resultListObject� 0 
startindex 
startIndex� 0 endindex endIndex�  0 sortcomparator sortComparator� 0 usequicksort useQuickSort� 0 	leftindex 	leftIndex� 0 
rightindex 
rightIndex� 0 
pivotvalue 
pivotValue� 0 etext eText� 0 enum eNum� 0 efrom eFrom� 
0 eto eTo� 0 i  � 0 j  � 0 leftkey leftKey� 0 rightkey rightKey �����
�	���
�
�����
� 
cobj� 
0 _keys_  � 0 comparekeys compareKeys
� 
nmbr�
 0 etext eText �� 
� 
errn�  0 enum eNum ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  
�	 
errn
� 
erob
� 
errt� � 
0 _list_  � � 	0 _sort  �   ������
�� 
errn���n��  �%�q��k hY hO��lvE[�k/E�Z[�l/E�ZO��,[�\[Z�\Z�2�.E�Oh�� % h���,�/E�l+ �&j�kE�[OY��W X  )���,�/�lv���%O $ h���,�/�l+ �&j�kE�[OY��W X  )���,�/�lv���%O�� p��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO�k�klvE[�k/E�Z[�l/E�ZY h[OY�O -*������b  �+ O*������b  �+ OhW X  hY hO�kE�O ���kh  ���ih ��,�k/E��,�/ElvE[�k/E�Z[�l/E�ZO���l+ k Y hO��lvE[�k/��,�k/FZ[�l/��,�/FZO��,�/E��,�k/ElvE[�k/��,�k/FZ[�l/��,�/FZ[OY�y[OY�j| ��������
�� .Lst:Sortnull���     ****�� 0 thelist theList�� ����
�� 
Comp {��������  0 sortcomparator sortComparator��  
�� 
msng��   ���������������������������� 0 thelist theList��  0 sortcomparator sortComparator�� $0 resultlistobject resultListObject�� "0 disorderedcount disorderedCount�� 0 previouskey previousKey�� 0 etext eText�� 0 enum eNum�� 
0 eto eTo�� 0 i  �� 0 
currentkey 
currentKey�� 0 efrom eFrom�� 0 usequicksort useQuickSort�� 0 enumber eNumber  $����(��������U���������� �������������!#������"C���� "0 aslistparameter asListParameter�� $0 resultlistobject resultListObject ��#����$%��
�� .ascrinit****      � ****# k     && ,'' 3����  ��  ��  $ ������ 
0 _keys_  �� 
0 _list_  % ������
�� 
cobj�� 
0 _keys_  �� 
0 _list_  �� b   �-E�Ob   �-E��� 
0 _list_  
�� 
leng
�� 
msng
�� .Lst:DeSonull��� ��� null�� &0 asscriptparameter asScriptParameter�� 
0 _keys_  
�� 
cobj�� 0 makekey makeKey�� 0 etext eText  ����(
�� 
errn�� 0 enum eNum( �����
�� 
errt�� 
0 eto eTo�  
�� 
errn
�� 
erob
�� 
errt�� �� 0 comparekeys compareKeys! ��)
� 
errn� 0 enum eNum) ��*
� 
erob� 0 efrom eFrom* ���
� 
errt� 
0 eto eTo�  
�� 
bool�� �� 	0 _sort  " ��+
� 
errn� 0 enumber eNumber+ ��,
� 
erob� 0 efrom eFrom, ���
� 
errt� 
0 eto eTo�  �� 
0 _error  ��vab  ��l+ E�O��K S�O��,�,l 
��,EY hO��  *j E�Y b  ��l+ 
E�OjE�O � ���,�k/Ek+ E�W $X  )a �a ��,E�k/a �a a �%O���,�k/FO ql��,�,Ekh  ���,�/k+ E�W *X  )a �a ��,E�/a �a a �%a %�%O���,�/FO���l+ j 
�kE�Y hO�E�[OY��W X  )a �a �a �a �O�j 5��,�,b  	 ���,�,!a a &E�O*�k��,�,��a + Y hO��,EW X  *a ����a + } �_��-.�
� .Lst:DeSonull��� ��� null�  �  - �� &0 defaultcomparator DefaultComparator. �`/� &0 defaultcomparator DefaultComparator/ �0��12�
� .ascrinit****      � ****0 k     33 b44 k55 n66 ���  �  �  1 ����� "0 _supportedtypes _supportedTypes� 	0 _type  � 0 makekey makeKey� 0 comparekeys compareKeys2 ������78
� 
nmbr
� 
ctxt
� 
ldt � "0 _supportedtypes _supportedTypes
� 
msng� 	0 _type  7 �q��9:�� 0 makekey makeKey� �;� ;  �� 0 anobject anObject�  9 ��� 0 anobject anObject� 0 aref aRef: ���������������
� 
msng� "0 _supportedtypes _supportedTypes
� 
kocl
� 
cobj
� .corecnte****       ****
� 
pcnt
� 
errn��\
� 
erob� 
� 
pcls� ~b  �  F 7)�,[��l kh �kv��,El j ��,Ec  O�Y h[OY��O)�����Y .�kv�b  l j  )�����b  %�%��,%�%Y hO�8 ����<=�� 0 comparekeys compareKeys� �>� >  ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�  < ��� 0 
leftobject 
leftObject� 0 rightobject rightObject=  � �� iY �� kY j� ���mv�O�OL OL � ��K S�~ ���~�}?@�|
� .Lst:NuSonull��� ��� null�~  �}  ? �{�{ &0 numericcomparator NumericComparator@ �z�A�z &0 numericcomparator NumericComparatorA �yB�x�wCD�v
�y .ascrinit****      � ****B k     EE �FF ��u�u  �x  �w  C �t�s�t 0 makekey makeKey�s 0 comparekeys compareKeysD GHG �r��q�pIJ�o�r 0 makekey makeKey�q �nK�n K  �m�m 0 anobject anObject�p  I �l�l 0 anobject anObjectJ �k
�k 
nmbr�o ��&H �j��i�hLM�g�j 0 comparekeys compareKeys�i �fN�f N  �e�d�e 0 
leftobject 
leftObject�d 0 rightobject rightObject�h  L �c�b�c 0 
leftobject 
leftObject�b 0 rightobject rightObjectM  �g ���v L  OL �| ��K S� �a�`�_OP�^
�a .Lst:DaSonull��� ��� null�`  �_  O �]�]  0 datecomparator DateComparatorP �\Q�\  0 datecomparator DateComparatorQ �[R�Z�YST�X
�[ .ascrinit****      � ****R k     UU VV �W�W  �Z  �Y  S �V�U�V 0 makekey makeKey�U 0 comparekeys compareKeysT WXW �T�S�RYZ�Q�T 0 makekey makeKey�S �P[�P [  �O�O 0 anobject anObject�R  Y �N�N 0 anobject anObjectZ �M
�M 
ldt �Q ��&X �L�K�J\]�I�L 0 comparekeys compareKeys�K �H^�H ^  �G�F�G 0 
leftobject 
leftObject�F 0 rightobject rightObject�J  \ �E�D�E 0 
leftobject 
leftObject�D 0 rightobject rightObject]  �I ���X L  OL �^ ��K S�� �C#�B�A_`�@
�C .Lst:TeSonull��� ��� null�B  �A �?a�>
�? 
Consa {�=�<�;�=  0 orderingoption orderingOption�<  
�; SrtECmpI�>  _ 	�:�9�8�7�6�5�4�3�2�:  0 orderingoption orderingOption�9 B0 currentconsiderationscomparator CurrentConsiderationsComparator�8 >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator�7 :0 casesensitivetextcomparator CaseSensitiveTextComparator�6 40 exactmatchtextcomparator ExactMatchTextComparator�5 0 etext eText�4 0 enumber eNumber�3 0 efrom eFrom�2 
0 eto eTo` �1/b�0�/]c�.�-�d�,�+�e�*��)�(f��'�&�1 B0 currentconsiderationscomparator CurrentConsiderationsComparatorb �%g�$�#hi�"
�% .ascrinit****      � ****g k     jj 1kk >�!�!  �$  �#  h � ��  0 makekey makeKey� 0 comparekeys compareKeysi lml �4��no�� 0 makekey makeKey� �p� p  �� 0 anobject anObject�  n �� 0 anobject anObjecto �
� 
ctxt� ��&m �@��qr�� 0 comparekeys compareKeys� �s� s  ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�  q ��� 0 
leftobject 
leftObject� 0 rightobject rightObjectr  � �� iY �� kY j�" L  OL 
�0 SrtECmpI�/ >0 caseinsensitivetextcomparator CaseInsensitiveTextComparatorc �t��uv�

� .ascrinit****      � ****t k     ww _xx b�	�	  �  �  u ��
� 
pare� 0 comparekeys compareKeysv �y
� 
parey �d��z{�� 0 comparekeys compareKeys� �|� |  � ���  0 
leftobject 
leftObject�� 0 rightobject rightObject�  z ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject{ jk���� 0 comparekeys compareKeys� �� )��ld*J V�
 b  N  OL 
�. SrtECmpC�- :0 casesensitivetextcomparator CaseSensitiveTextComparatord ��}����~��
�� .ascrinit****      � ****} k     �� ��� �����  ��  ��  ~ ����
�� 
pare�� 0 comparekeys compareKeys ���
�� 
pare� ������������� 0 comparekeys compareKeys�� ����� �  ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��  � ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject� ����� 0 comparekeys compareKeys�� �g )��ld*J V�� b  N  OL 
�, SrtECmpE�+ 40 exactmatchtextcomparator ExactMatchTextComparatore �����������
�� .ascrinit****      � ****� k     �� ��� �����  ��  ��  � ����
�� 
pare�� 0 comparekeys compareKeys� ���
�� 
pare� ������������� 0 comparekeys compareKeys�� ����� �  ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject��  � ������ 0 
leftobject 
leftObject�� 0 rightobject rightObject� ������ 0 comparekeys compareKeys�� �� )��ld*J V�� b  N  OL 
�* SrtECmpD�) >0 throwinvalidconstantparameter throwInvalidConstantParameter�( 0 etext eTextf �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �' �& 
0 _error  �@ s ^��K S�O��  ��K S�O�Y @��  ��K 
S�O�Y -��  ��K S�O�Y ��  �Y b  �a l+ W X  *a ����a + � �����������
�� .Lst:LiSonull��� ��� null��  �� �����
�� 
Comp� {�������� "0 itemcomparators itemComparators��  
�� 
msng��  � ���������������������� "0 itemcomparators itemComparators�� $0 comparatorobject comparatorObject�� .0 uniformlistcomparator UniformListComparator�� 0 aref aRef�� 0 emsg eMsg�� 0 enum eNum�� 0 i  �� *0 mixedlistcomparator MixedListComparator� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� %�����������������������LU�Y�����
� 
msng
� .Lst:DeSonull��� ��� null
� 
kocl
� 
scpt
� .corecnte****       ****� &0 asscriptparameter asScriptParameter� .0 uniformlistcomparator UniformListComparator� �������
� .ascrinit****      � ****� k     �� �� W��  �  �  � ��� 0 makekey makeKey� 0 comparekeys compareKeys� ��� � ������ 0 makekey makeKey� ��� �  �� 0 sublist  �  � ��� 0 sublist  � 0 	keyobject 	KeyObject� �#�� 0 	keyobject 	KeyObject� ��������
� .ascrinit****      � ****� k     �� %�� *�� 1����  �  �  � �������� 
0 _list_  �� 
0 _keys_  �� 0 getkey getKey� ������� 
0 _list_  �� 
0 _keys_  � ��3���������� 0 getkey getKey�� ����� �  ���� 0 	itemindex 	itemIndex��  � ���� 0 	itemindex 	itemIndex� ������~�}�� 
0 _keys_  
�� 
leng� 
0 _list_  
�~ 
cobj�} 0 makekey makeKey�� 1 &h�)�,�,b  )�,�/k+ b  6F[OY��O)�,�/E�� b   �Ojv�OL � ��K S�� �|Y�{�z���y�| 0 comparekeys compareKeys�{ �x��x �  �w�v�w 0 leftkeyobject leftKeyObject�v  0 rightkeyobject rightKeyObject�z  � �u�t�s�r�q�p�o�u 0 leftkeyobject leftKeyObject�t  0 rightkeyobject rightKeyObject�s 0 
leftlength 
leftLength�r 0 rightlength rightLength�q 0 commonlength commonLength�p 0 i  �o $0 comparisonresult comparisonResult� �n�m�l�k�j�n 
0 _list_  
�m 
leng
�l 
cobj�k 0 getkey getKey�j 0 comparekeys compareKeys�y {��,�,��,�,lvE[�k/E�Z[�l/E�ZO�E�O�� �E�Y hO 2k�kh b  ��k+ ��k+ l+ E�O�j �Y h[OY��O�� iY �� kY j� L  OL 
� 
reco
� 
leng
� 
cobj� 0 	itemindex 	itemIndex
� 
long�  0 itemcomparator itemComparator� 0 emsg eMsg� �i�h�g
�i 
errn�h 0 enum eNum�g  ��\��@
� 
errn
� 
list� � .0 throwinvalidparameter throwInvalidParameter� "0 comparatorindex comparatorIndex� *0 mixedlistcomparator MixedListComparator� �f��e�d���c
�f .ascrinit****      � ****� k     �� ^�� ��b�b  �e  �d  � �a�`�a 0 makekey makeKey�` 0 comparekeys compareKeys� ��� �_a�^�]���\�_ 0 makekey makeKey�^ �[��[ �  �Z�Z 0 sublist  �]  � �Y�X�Y 0 sublist  �X 0 	keyobject 	KeyObject� �Wd��W 0 	keyobject 	KeyObject� �V��U�T���S
�V .ascrinit****      � ****� k     �� i�� l�� q�R�R  �U  �T  � �Q�P�O�Q 
0 _list_  �P 
0 _keys_  �O 0 getkey getKey� �N�M��N 
0 _list_  �M 
0 _keys_  � �Ls�K�J���I�L 0 getkey getKey�K �H��H �  �G�G "0 comparatorindex comparatorIndex�J  � �F�E�D�F "0 comparatorindex comparatorIndex�E 0 idx  �D 0 subitem subItem� �C�B�A�@�?�>�=��<�;�:�9��8���7�C 
0 _keys_  
�B 
leng
�A 
cobj�@ 0 	itemindex 	itemIndex�?  0 itemcomparator itemComparator�> 
0 _list_  �=  � �6�5�4
�6 
errn�5�@�4  
�< 
errn�;�@
�: 
erob�9 
�8 
long�7 0 makekey makeKey�I z oh�)�,�,b   �/E[�,E�Z[�,Ec  ZO )�,�/E�W 'X  )���b   �/���&%�%b   �,%�%Ob  �k+ b  6F[OY��O)�,�/E�S b   �Ojv�OL �\ ��K S�� �3��2�1���0�3 0 comparekeys compareKeys�2 �/��/ �  �.�-�. 0 leftkeyobject leftKeyObject�-  0 rightkeyobject rightKeyObject�1  � �,�+�*�)�, 0 leftkeyobject leftKeyObject�+  0 rightkeyobject rightKeyObject�* 0 i  �) $0 comparisonresult comparisonResult� �(�'�&�%�$
�( 
leng
�' 
cobj�&  0 itemcomparator itemComparator�% 0 getkey getKey�$ 0 comparekeys compareKeys�0 C >kb   �,Ekh b   �/�,��k+ ��k+ l+ E�O�j �Y h[OY��Oj�c L  OL � 0 etext eText� �#�"�
�# 
errn�" 0 enumber eNumber� �!� �
�! 
erob�  0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  ��=(��  *j E�Y hO�kv��l k  b  ��l+ E�O��K 	S�O�Y �kv��l k  
�kvE�Y hO���l ��,  b \�[��l kh  ��,�&O��,�&W 9X  a a lv�kv )a �l�Y hOb  �a a a a + [OY��Y U���l ��,  /��-E�O #k��,Ekh a ���/a ��/F[OY��Y b  �a �a lva a + Oa a K S�O�W X   !*a "����a #+ $� ������
� .Lst:ReSonull��� ��� null�  � ���
� 
Comp� {���� $0 comparatorobject comparatorObject�  
� 
msng�  � ������� $0 comparatorobject comparatorObject� &0 reversecomparator ReverseComparator� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ��8��
;��	�]��
� 
msng
� .Lst:DeSonull��� ��� null� &0 asscriptparameter asScriptParameter�
 &0 reversecomparator ReverseComparator� �������
� .ascrinit****      � ****� k     �� =�� @��  �  �  � �� 
� 
pare�  0 comparekeys compareKeys� ���
�� 
pare� ��B���������� 0 comparekeys compareKeys�� ����� �  ������ 0 leftkey leftKey�� 0 rightkey rightKey��  � ������ 0 leftkey leftKey�� 0 rightkey rightKey� ���� 0 comparekeys compareKeys�� )��ld*J  '� b   N  OL �	 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  � ; *��  *j E�Y b  ��l+ E�O��K S�W X  *颣���+ ascr  ��ޭ