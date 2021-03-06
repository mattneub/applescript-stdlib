FasdUAS 1.101.10   ��   ��    k             l      ��  ��    � � File -- common file system and path string operations

Notes:

- Path manipulation commands all operate on POSIX paths, as those are reliable whereas HFS paths (which are already deprecated everywhere else in OS X) are not.

     � 	 	�   F i l e   - -   c o m m o n   f i l e   s y s t e m   a n d   p a t h   s t r i n g   o p e r a t i o n s 
 
 N o t e s : 
 
 -   P a t h   m a n i p u l a t i o n   c o m m a n d s   a l l   o p e r a t e   o n   P O S I X   p a t h s ,   a s   t h o s e   a r e   r e l i a b l e   w h e r e a s   H F S   p a t h s   ( w h i c h   a r e   a l r e a d y   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X )   a r e   n o t . 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �        s u p p o r t   ! " ! l     ��������  ��  ��   "  # $ # l      % & ' % j    �� (�� 0 _support   ( N     ) ) 4    �� *
�� 
scpt * m     + + � , ,  T y p e S u p p o r t & "  used for parameter checking    ' � - - 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g $  . / . l     ��������  ��  ��   /  0 1 0 l     ��������  ��  ��   1  2 3 2 i   ! 4 5 4 I      �� 6���� 
0 _error   6  7 8 7 o      ���� 0 handlername handlerName 8  9 : 9 o      ���� 0 etext eText :  ; < ; o      ���� 0 enumber eNumber <  = > = o      ���� 0 efrom eFrom >  ?�� ? o      ���� 
0 eto eTo��  ��   5 n     @ A @ I    �� B���� &0 throwcommanderror throwCommandError B  C D C m     E E � F F  F i l e D  G H G o    ���� 0 handlername handlerName H  I J I o    ���� 0 etext eText J  K L K o    	���� 0 enumber eNumber L  M N M o   	 
���� 0 efrom eFrom N  O�� O o   
 ���� 
0 eto eTo��  ��   A o     ���� 0 _support   3  P Q P l     ��������  ��  ��   Q  R S R l     ��������  ��  ��   S  T U T l     �� V W��   V J D--------------------------------------------------------------------    W � X X � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - U  Y Z Y l     �� [ \��   [  File Read/Write; these are atomic alternatives to StandardAdditions' File Read/Write suite, with better support for text encodings (incremental read/write is almost entirely useless in practice as AS doesn't have the capabilities or smarts to do it right)    \ � ] ]    F i l e   R e a d / W r i t e ;   t h e s e   a r e   a t o m i c   a l t e r n a t i v e s   t o   S t a n d a r d A d d i t i o n s '   F i l e   R e a d / W r i t e   s u i t e ,   w i t h   b e t t e r   s u p p o r t   f o r   t e x t   e n c o d i n g s   ( i n c r e m e n t a l   r e a d / w r i t e   i s   a l m o s t   e n t i r e l y   u s e l e s s   i n   p r a c t i c e   a s   A S   d o e s n ' t   h a v e   t h e   c a p a b i l i t i e s   o r   s m a r t s   t o   d o   i t   r i g h t ) Z  ^ _ ^ l     ��������  ��  ��   _  ` a ` h   " )�� b�� (0 _nsstringencodings _NSStringEncodings b k       c c  d e d l     �� f g��   fZT note that CoreFoundation defines a much larger set of encodings, but ASOC's limited C support prevents it using CFStringConvertEncodingToNSStringEncoding to convert them to NSStringEncodings so aren't supported here (users' scripts can always use command-line `textutil` tool via `do shell script` to transcode plain text files separately)    g � h h�   n o t e   t h a t   C o r e F o u n d a t i o n   d e f i n e s   a   m u c h   l a r g e r   s e t   o f   e n c o d i n g s ,   b u t   A S O C ' s   l i m i t e d   C   s u p p o r t   p r e v e n t s   i t   u s i n g   C F S t r i n g C o n v e r t E n c o d i n g T o N S S t r i n g E n c o d i n g   t o   c o n v e r t   t h e m   t o   N S S t r i n g E n c o d i n g s   s o   a r e n ' t   s u p p o r t e d   h e r e   ( u s e r s '   s c r i p t s   c a n   a l w a y s   u s e   c o m m a n d - l i n e   ` t e x t u t i l `   t o o l   v i a   ` d o   s h e l l   s c r i p t `   t o   t r a n s c o d e   p l a i n   t e x t   f i l e s   s e p a r a t e l y ) e  i j i l     ��������  ��  ��   j  k l k j     �� m�� 	0 _list   m m     ��
�� 
msng l  n o n l     ��������  ��  ��   o  p q p i    r s r I      �������� 	0 _init  ��  ��   s r     � t u t J     � v v  w x w l 	    y���� y J      z z  { | { m     ��
�� FEncFE01 |  }�� } n    ~  ~ o    ���� ,0 nsutf8stringencoding NSUTF8StringEncoding  m    ��
�� misccura��  ��  ��   x  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE02 �  ��� � n   
 � � � o    
���� .0 nsutf16stringencoding NSUTF16StringEncoding � m    ��
�� misccura��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE03 �  ��� � n    � � � o    ���� @0 nsutf16bigendianstringencoding NSUTF16BigEndianStringEncoding � m    ��
�� misccura��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE04 �  ��� � n    � � � o    ���� F0 !nsutf16littleendianstringencoding !NSUTF16LittleEndianStringEncoding � m    ��
�� misccura��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE05 �  ��� � n    � � � o    ���� .0 nsutf32stringencoding NSUTF32StringEncoding � m    ��
�� misccura��  ��  ��   �  � � � l 	  $ ����� � J    $ � �  � � � m    ��
�� FEncFE06 �  ��� � n   " � � � o     "���� @0 nsutf32bigendianstringencoding NSUTF32BigEndianStringEncoding � m     ��
�� misccura��  ��  ��   �  � � � l 	 $ * ����� � J   $ * � �  � � � m   $ %��
�� FEncFE07 �  ��� � n  % ( � � � o   & (���� F0 !nsutf32littleendianstringencoding !NSUTF32LittleEndianStringEncoding � m   % &��
�� misccura��  ��  ��   �  � � � l 	 * 2 ����� � J   * 2 � �  � � � m   * +��
�� FEncFE11 �  ��� � n  + 0 � � � o   , 0���� .0 nsasciistringencoding NSASCIIStringEncoding � m   + ,��
�� misccura��  ��  ��   �  � � � l 	 2 < ����� � J   2 < � �  � � � m   2 5��
�� FEncFE12 �  ��� � n  5 : � � � o   6 :���� 60 nsiso2022jpstringencoding NSISO2022JPStringEncoding � m   5 6��
�� misccura��  ��  ��   �  � � � l 	 < F ����� � J   < F � �  � � � m   < ?��
�� FEncFE13 �  ��� � n  ? D � � � o   @ D���� 60 nsisolatin1stringencoding NSISOLatin1StringEncoding � m   ? @��
�� misccura��  ��  ��   �  � � � l 	 F P ���~ � J   F P � �  � � � m   F I�}
�} FEncFE14 �  ��| � n  I N � � � o   J N�{�{ 60 nsisolatin2stringencoding NSISOLatin2StringEncoding � m   I J�z
�z misccura�|  �  �~   �  � � � l 	 P Z ��y�x � J   P Z � �  � � � m   P S�w
�w FEncFE15 �  ��v � n  S X � � � o   T X�u�u :0 nsjapaneseeucstringencoding NSJapaneseEUCStringEncoding � m   S T�t
�t misccura�v  �y  �x   �  � � � l 	 Z d ��s�r � J   Z d � �  � � � m   Z ]�q
�q FEncFE16 �  ��p � n  ] b � � � o   ^ b�o�o 80 nsmacosromanstringencoding NSMacOSRomanStringEncoding � m   ] ^�n
�n misccura�p  �s  �r   �  � � � l 	 d n ��m�l � J   d n � �  � � � m   d g�k
�k FEncFE17 �  ��j � n  g l � � � o   h l�i�i >0 nsnonlossyasciistringencoding NSNonLossyASCIIStringEncoding � m   g h�h
�h misccura�j  �m  �l   �  � � � l 	 n x ��g�f � J   n x � �  � � � m   n q�e
�e FEncFE18 �  ��d � n  q v � � � o   r v�c�c 40 nsshiftjisstringencoding NSShiftJISStringEncoding � m   q r�b
�b misccura�d  �g  �f   �  � � � l 	 x � �a�`  J   x �  m   x {�_
�_ FEncFE19 �^ n  { � o   | ��]�] 00 nssymbolstringencoding NSSymbolStringEncoding m   { |�\
�\ misccura�^  �a  �`   �  l 	 � �	�[�Z	 J   � �

  m   � ��Y
�Y FEncFE50 �X n  � � o   � ��W�W >0 nswindowscp1250stringencoding NSWindowsCP1250StringEncoding m   � ��V
�V misccura�X  �[  �Z    l 	 � ��U�T J   � �  m   � ��S
�S FEncFE51 �R n  � � o   � ��Q�Q >0 nswindowscp1251stringencoding NSWindowsCP1251StringEncoding m   � ��P
�P misccura�R  �U  �T    l 	 � ��O�N J   � �  m   � ��M
�M FEncFE52 �L n  � � !  o   � ��K�K >0 nswindowscp1252stringencoding NSWindowsCP1252StringEncoding! m   � ��J
�J misccura�L  �O  �N   "#" l 	 � �$�I�H$ J   � �%% &'& m   � ��G
�G FEncFE53' (�F( n  � �)*) o   � ��E�E >0 nswindowscp1253stringencoding NSWindowsCP1253StringEncoding* m   � ��D
�D misccura�F  �I  �H  # +�C+ l 	 � �,�B�A, J   � �-- ./. m   � ��@
�@ FEncFE54/ 0�?0 n  � �121 o   � ��>�> >0 nswindowscp1254stringencoding NSWindowsCP1254StringEncoding2 m   � ��=
�= misccura�?  �B  �A  �C   u o      �<�< 	0 _list   q 343 l     �;�:�9�;  �:  �9  4 5�85 i   
676 I      �78�6�7 0 getencoding getEncoding8 9�59 o      �4�4 0 textencoding textEncoding�5  �6  7 k     k:: ;<; Q     _=>?= k    G@@ ABA Z   CD�3�2C =   
EFE o    �1�1 	0 _list  F m    	�0
�0 
msngD I    �/�.�-�/ 	0 _init  �.  �-  �3  �2  B GHG r    IJI c    KLK o    �,�, 0 textencoding textEncodingL m    �+
�+ 
enumJ o      �*�* 0 textencoding textEncodingH M�)M X    GN�(ON Z  / BPQ�'�&P =  / 5RSR n  / 3TUT 4   0 3�%V
�% 
cobjV m   1 2�$�$ U o   / 0�#�# 0 aref aRefS o   3 4�"�" 0 textencoding textEncodingQ L   8 >WW n  8 =XYX 4   9 <�!Z
�! 
cobjZ m   : ;� �  Y o   8 9�� 0 aref aRef�'  �&  �( 0 aref aRefO n    #[\[ o   ! #�� 	0 _list  \  f     !�)  > R      ��]
� .ascrerr ****      � ****�  ] �^�
� 
errn^ d      __ m      ����  ? l  O _`ab` Q   O _cdec L   R Vff c   R Ughg o   R S�� 0 textencoding textEncodingh m   S T�
� 
longd R      ��i
� .ascrerr ****      � ****�  i �j�
� 
errnj d      kk m      ����  e l  ^ ^�lm�  l   fall through   m �nn    f a l l   t h r o u g ha ] W not a predefined constant, but hedge bets as it might be a raw NSStringEncoding number   b �oo �   n o t   a   p r e d e f i n e d   c o n s t a n t ,   b u t   h e d g e   b e t s   a s   i t   m i g h t   b e   a   r a w   N S S t r i n g E n c o d i n g   n u m b e r< p�p n  ` kqrq I   e k�s�� >0 throwinvalidconstantparameter throwInvalidConstantParameters tut o   e f�� 0 textencoding textEncodingu v�v m   f gww �xx 
 u s i n g�  �  r o   ` e�� 0 _support  �  �8   a yzy l     �
�	��
  �	  �  z {|{ l     ����  �  �  | }~} l     ���    -----   � ��� 
 - - - - -~ ��� l     ����  �  �  � ��� i  * -��� I     � ��
�  .Fil:Readnull���     file� o      ���� 0 thefile theFile� ����
�� 
Type� |����������  ��  � o      ���� 0 datatype dataType��  � l     ������ m      ��
�� 
ctxt��  ��  � �����
�� 
Enco� |����������  ��  � o      ���� 0 textencoding textEncoding��  � l     ������ m      ��
�� FEncFE01��  ��  ��  � Q     ����� k    ��� ��� r    ��� n   ��� I    ������� ,0 asposixpathparameter asPOSIXPathParameter� ��� o    	���� 0 thefile theFile� ���� m   	 
�� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 	posixpath 	posixPath� ��� r    ��� n   ��� I    ������� "0 astypeparameter asTypeParameter� ��� o    ���� 0 datatype dataType� ���� m    �� ���  a s��  ��  � o    ���� 0 _support  � o      ���� 0 datatype dataType� ���� Z    ������� F    *��� =   "��� o     ���� 0 datatype dataType� m     !��
�� 
ctxt� >  % (��� o   % &���� 0 textencoding textEncoding� m   & '��
�� FEncFEPE� l  - }���� k   - }�� ��� r   - 9��� n  - 7��� I   2 7������� 0 getencoding getEncoding� ���� o   2 3���� 0 textencoding textEncoding��  ��  � o   - 2���� (0 _nsstringencodings _NSStringEncodings� o      ���� 0 textencoding textEncoding� ��� r   : S��� n  : D��� I   = D������� T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_� ��� o   = >���� 0 	posixpath 	posixPath� ��� o   > ?���� 0 textencoding textEncoding� ���� l  ? @������ m   ? @��
�� 
obj ��  ��  ��  ��  � n  : =��� o   ; =���� 0 nsstring NSString� m   : ;��
�� misccura� J      �� ��� o      ���� 0 
asocstring 
asocString� ���� o      ���� 0 theerror theError��  � ��� Z  T x������� =  T W��� o   T U���� 0 
asocstring 
asocString� m   U V��
�� 
msng� R   Z t����
�� .ascrerr ****      � ****� l  l s������ c   l s��� n  l q��� I   m q�������� ,0 localizeddescription localizedDescription��  ��  � o   l m���� 0 theerror theError� m   q r��
�� 
ctxt��  ��  � ����
�� 
errn� n  \ a��� I   ] a�������� 0 code  ��  ��  � o   \ ]���� 0 theerror theError� ����
�� 
erob� o   d e���� 0 thefile theFile� �����
�� 
errt� o   h i���� 0 datatype dataType��  ��  ��  � ���� L   y }�� c   y |��� o   y z���� 0 
asocstring 
asocString� m   z {��
�� 
ctxt��  �'! note: AS treats `text`, `string`, and `Unicode text` as synonyms when comparing for equality, which is a little bit problematic as StdAdds' `read` command treats `string` as 'primary encoding' and `Unicode text` as UTF16; passing `primary encoding` for `using` parameter provides an 'out'   � ���B   n o t e :   A S   t r e a t s   ` t e x t ` ,   ` s t r i n g ` ,   a n d   ` U n i c o d e   t e x t `   a s   s y n o n y m s   w h e n   c o m p a r i n g   f o r   e q u a l i t y ,   w h i c h   i s   a   l i t t l e   b i t   p r o b l e m a t i c   a s   S t d A d d s '   ` r e a d `   c o m m a n d   t r e a t s   ` s t r i n g `   a s   ' p r i m a r y   e n c o d i n g '   a n d   ` U n i c o d e   t e x t `   a s   U T F 1 6 ;   p a s s i n g   ` p r i m a r y   e n c o d i n g `   f o r   ` u s i n g `   p a r a m e t e r   p r o v i d e s   a n   ' o u t '��  � k   � ��� ��� r   � ���� I  � ������
�� .rdwropenshor       file� l  � ������� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf��  ��  ��  � o      ���� 0 fh  � ���� Q   � ����� k   � ��� � � r   � � I  � ���
�� .rdwrread****        **** o   � ����� 0 fh   ����
�� 
as   o   � ����� 0 datatype dataType��   o      ���� 0 	theresult 	theResult   I  � �����
�� .rdwrclosnull���     **** o   � ����� 0 fh  ��   	��	 L   � �

 o   � ����� 0 	theresult 	theResult��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � k   � �  Q   � ��� I  � �����
�� .rdwrclosnull���     **** o   � ����� 0 fh  ��   R      ������
�� .ascrerr ****      � ****��  ��  ��   �� R   � ���
�� .ascrerr ****      � **** o   � ����� 0 etext eText ��
�� 
errn o   � ����� 0 enumber eNumber ��
�� 
erob o   � ����� 0 efrom eFrom ����
�� 
errt o   � ����� 
0 eto eTo��  ��  ��  ��  � R      �� !
�� .ascrerr ****      � ****  o      ���� 0 etext eText! ��"#
�� 
errn" o      �� 0 enumber eNumber# �~$%
�~ 
erob$ o      �}�} 0 efrom eFrom% �|&�{
�| 
errt& o      �z�z 
0 eto eTo�{  � I   � ��y'�x�y 
0 _error  ' ()( m   � �** �++  r e a d   f i l e) ,-, o   � ��w�w 0 etext eText- ./. o   � ��v�v 0 enumber eNumber/ 010 o   � ��u�u 0 efrom eFrom1 2�t2 o   � ��s�s 
0 eto eTo�t  �x  � 343 l     �r�q�p�r  �q  �p  4 565 l     �o�n�m�o  �n  �m  6 787 i  . 19:9 I     �l;<
�l .Fil:Writnull���     file; o      �k�k 0 thefile theFile< �j=>
�j 
Data= o      �i�i 0 thedata theData> �h?@
�h 
Type? |�g�fA�eB�g  �f  A o      �d�d 0 datatype dataType�e  B l     C�c�bC m      �a
�a 
ctxt�c  �b  @ �`D�_
�` 
EncoD |�^�]E�\F�^  �]  E o      �[�[ 0 textencoding textEncoding�\  F l     G�Z�YG m      �X
�X FEncFE01�Z  �Y  �_  : Q    	HIJH k    �KK LML r    NON n   PQP I    �WR�V�W ,0 asposixpathparameter asPOSIXPathParameterR STS o    	�U�U 0 thefile theFileT U�TU m   	 
VV �WW  �T  �V  Q o    �S�S 0 _support  O o      �R�R 0 	posixpath 	posixPathM XYX r    Z[Z n   \]\ I    �Q^�P�Q "0 astypeparameter asTypeParameter^ _`_ o    �O�O 0 datatype dataType` a�Na m    bb �cc  a s�N  �P  ] o    �M�M 0 _support  [ o      �L�L 0 datatype dataTypeY d�Kd Z    �ef�Jge F    *hih =   "jkj o     �I�I 0 datatype dataTypek m     !�H
�H 
ctxti >  % (lml o   % &�G�G 0 textencoding textEncodingm m   & '�F
�F FEncFEPEf k   - �nn opo r   - Aqrq n  - ?sts I   0 ?�Eu�D�E &0 stringwithstring_ stringWithString_u v�Cv l  0 ;w�B�Aw n  0 ;xyx I   5 ;�@z�?�@ "0 astextparameter asTextParameterz {|{ o   5 6�>�> 0 thedata theData| }�=} m   6 7~~ �  d a t a�=  �?  y o   0 5�<�< 0 _support  �B  �A  �C  �D  t n  - 0��� o   . 0�;�; 0 nsstring NSString� m   - .�:
�: misccurar o      �9�9 0 
asocstring 
asocStringp ��� r   B N��� n  B L��� I   G L�8��7�8 0 getencoding getEncoding� ��6� o   G H�5�5 0 textencoding textEncoding�6  �7  � o   B G�4�4 (0 _nsstringencodings _NSStringEncodings� o      �3�3 0 textencoding textEncoding� ��� r   O k��� n  O X��� I   P X�2��1�2 P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_� ��� o   P Q�0�0 0 	posixpath 	posixPath� ��� m   Q R�/
�/ boovtrue� ��� o   R S�.�. 0 textencoding textEncoding� ��-� l  S T��,�+� m   S T�*
�* 
obj �,  �+  �-  �1  � o   O P�)�) 0 
asocstring 
asocString� J      �� ��� o      �(�( 0 
didsucceed 
didSucceed� ��'� o      �&�& 0 theerror theError�'  � ��%� Z   l ����$�#� H   l n�� o   l m�"�" 0 
didsucceed 
didSucceed� R   q ��!��
�! .ascrerr ****      � ****� l  � ��� �� c   � ���� n  � ���� I   � ����� ,0 localizeddescription localizedDescription�  �  � o   � ��� 0 theerror theError� m   � ��
� 
ctxt�   �  � ���
� 
errn� n  u z��� I   v z���� 0 code  �  �  � o   u v�� 0 theerror theError� ���
� 
erob� o   } ~�� 0 thefile theFile� ���
� 
errt� o   � ��� 0 datatype dataType�  �$  �#  �%  �J  g k   � ��� ��� r   � ���� I  � ����
� .rdwropenshor       file� l  � ����� c   � ���� o   � ��� 0 	posixpath 	posixPath� m   � ��
� 
psxf�  �  � �
��	
�
 
perm� m   � ��
� boovtrue�	  � o      �� 0 fh  � ��� Q   � ����� k   � ��� ��� l  � ����� I  � ����
� .rdwrseofnull���     ****� o   � ��� 0 fh  � ���
� 
set2� m   � ���  �  � e _ important: when overwriting an existing file, make sure its previous contents are erased first   � ��� �   i m p o r t a n t :   w h e n   o v e r w r i t i n g   a n   e x i s t i n g   f i l e ,   m a k e   s u r e   i t s   p r e v i o u s   c o n t e n t s   a r e   e r a s e d   f i r s t� ��� I  � �� ��
�  .rdwrwritnull���     ****� o   � ����� 0 thedata theData� ����
�� 
refn� o   � ����� 0 fh  � �����
�� 
as  � o   � ����� 0 datatype dataType��  � ��� I  � ������
�� .rdwrclosnull���     ****� o   � ����� 0 fh  ��  � ���� L   � �����  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � k   � ��� ��� Q   � ������ I  � ������
�� .rdwrclosnull���     ****� o   � ����� 0 fh  ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  � ���� R   � �����
�� .ascrerr ****      � ****� o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enumber eNumber� ����
�� 
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  ��  �  �K  I R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  J I   �	������� 
0 _error  � ��� m   � ��� ���  w r i t e   f i l e� ��� o   � ���� 0 etext eText� ��� o   ���� 0 enumber eNumber� ��� o  ���� 0 efrom eFrom� ���� o  ���� 
0 eto eTo��  ��  8 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � � � l     ����   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   l     ����     POSIX path manipulation    � 0   P O S I X   p a t h   m a n i p u l a t i o n 	
	 l     ��������  ��  ��  
  i  2 5 I     ��
�� .Fil:ConPnull���     **** o      ���� 0 filepath filePath ��
�� 
From |��������  ��   o      ���� 0 
fromformat 
fromFormat��   l     ���� m      ��
�� FLCTFLCP��  ��   ����
�� 
To__ |��������  ��   o      ���� 0 toformat toFormat��   l     ���� m      ��
�� FLCTFLCP��  ��  ��   l   b Q    b k   L   !"! Z    �#$��%# =    &'& l   (����( I   ��)*
�� .corecnte****       ****) J    ++ ,��, o    ���� 0 filepath filePath��  * ��-��
�� 
kocl- m    ��
�� 
ctxt��  ��  ��  ' m    ����  $ l   ./0. r    121 n   343 I    ��5���� ,0 asposixpathparameter asPOSIXPathParameter5 676 o    ���� 0 filepath filePath7 8��8 m    99 �::  ��  ��  4 o    ���� 0 _support  2 o      ���� 0 	posixpath 	posixPath/ F @ assume it's a file identifier object (alias, �class furl�, etc)   0 �;; �   a s s u m e   i t ' s   a   f i l e   i d e n t i f i e r   o b j e c t   ( a l i a s ,   � c l a s s   f u r l � ,   e t c )��  % l  ! �<=>< Z   ! �?@AB? =  ! $CDC o   ! "���� 0 
fromformat 
fromFormatD m   " #��
�� FLCTFLCP@ r   ' *EFE o   ' (���� 0 filepath filePathF o      ���� 0 	posixpath 	posixPathA GHG =  - 0IJI o   - .���� 0 
fromformat 
fromFormatJ m   . /��
�� FLCTFLCHH KLK l  3 ;MNOM r   3 ;PQP n   3 9RSR 1   7 9��
�� 
psxpS l  3 7T����T 4   3 7��U
�� 
fileU o   5 6���� 0 filepath filePath��  ��  Q o      ���� 0 	posixpath 	posixPathN � � caution: HFS path format is flawed and deprecated everywhere else in OS X (unlike POSIX path format, it can't distinguish between two volumes with the same name), but is still used by AS and a few older scriptable apps so must be supported   O �VV�   c a u t i o n :   H F S   p a t h   f o r m a t   i s   f l a w e d   a n d   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X   ( u n l i k e   P O S I X   p a t h   f o r m a t ,   i t   c a n ' t   d i s t i n g u i s h   b e t w e e n   t w o   v o l u m e s   w i t h   t h e   s a m e   n a m e ) ,   b u t   i s   s t i l l   u s e d   b y   A S   a n d   a   f e w   o l d e r   s c r i p t a b l e   a p p s   s o   m u s t   b e   s u p p o r t e dL WXW =  > AYZY o   > ?���� 0 
fromformat 
fromFormatZ m   ? @��
�� FLCTFLCUX [��[ k   D w\\ ]^] r   D N_`_ n  D Laba I   G L��c����  0 urlwithstring_ URLWithString_c d��d o   G H���� 0 filepath filePath��  ��  b n  D Gefe o   E G���� 	0 NSURL  f m   D E��
�� misccura` o      ���� 0 asocurl asocURL^ g��g Z  O whi����h G   O ]jkj =  O Rlml o   O P���� 0 asocurl asocURLm m   P Q��
�� 
msngk H   U [nn n  U Zopo I   V Z������� 0 fileurl fileURL��  �  p o   U V�~�~ 0 asocurl asocURLi n  ` sqrq I   e s�}s�|�} .0 throwinvalidparameter throwInvalidParameters tut o   e f�{�{ 0 filepath filePathu vwv m   f ixx �yy  w z{z m   i j�z
�z 
ctxt{ |�y| m   j m}} �~~  N o t   a   f i l e   U R L .�y  �|  r o   ` e�x�x 0 _support  ��  ��  ��  ��  B n  z �� I    ��w��v�w >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o    ��u�u 0 
fromformat 
fromFormat� ��t� m   � ��� ���  f r o m�t  �v  � o   z �s�s 0 _support  = \ V it's a text path in the user-specified format, so convert it to a standard POSIX path   > ��� �   i t ' s   a   t e x t   p a t h   i n   t h e   u s e r - s p e c i f i e d   f o r m a t ,   s o   c o n v e r t   i t   t o   a   s t a n d a r d   P O S I X   p a t h" ��� l  � ��r���r  �   sanity check   � ���    s a n i t y   c h e c k� ��� Z  � ����q�p� =   � ���� n  � ���� 1   � ��o
�o 
leng� o   � ��n�n 0 	posixpath 	posixPath� m   � ��m�m  � n  � ���� I   � ��l��k�l .0 throwinvalidparameter throwInvalidParameter� ��� o   � ��j�j 0 filepath filePath� ��� m   � ��� ���  � ��� m   � ��i
�i 
ctxt� ��h� m   � ��� ��� ( P a t h   c a n  t   b e   e m p t y .�h  �k  � o   � ��g�g 0 _support  �q  �p  � ��� l  � ��f���f  � ; 5 convert POSIX path text to the requested format/type   � ��� j   c o n v e r t   P O S I X   p a t h   t e x t   t o   t h e   r e q u e s t e d   f o r m a t / t y p e� ��e� Z   �L����� =  � ���� o   � ��d�d 0 toformat toFormat� m   � ��c
�c FLCTFLCP� L   � ��� o   � ��b�b 0 	posixpath 	posixPath� ��� =  � ���� o   � ��a�a 0 toformat toFormat� m   � ��`
�` FLCTFLCA� ��� l  � ����� L   � ��� c   � ���� c   � ���� o   � ��_�_ 0 	posixpath 	posixPath� m   � ��^
�^ 
psxf� m   � ��]
�] 
alis� %  returns object of type `alias`   � ��� >   r e t u r n s   o b j e c t   o f   t y p e   ` a l i a s `� ��� =  � ���� o   � ��\�\ 0 toformat toFormat� m   � ��[
�[ FLCTFLCX� ��� l  � ����� L   � ��� c   � ���� o   � ��Z�Z 0 	posixpath 	posixPath� m   � ��Y
�Y 
psxf� , & returns object of type `�class furl�`   � ��� L   r e t u r n s   o b j e c t   o f   t y p e   ` � c l a s s   f u r l � `� ��� =  � ���� o   � ��X�X 0 toformat toFormat� m   � ��W
�W FLCTFLCS� ��� l  � ����� L   � ��� N   � ��� n   � ���� 4   � ��V�
�V 
file� l  � ���U�T� c   � ���� c   � ���� o   � ��S�S 0 	posixpath 	posixPath� m   � ��R
�R 
psxf� m   � ��Q
�Q 
ctxt�U  �T  � 1   � ��P
�P 
ascr�NH returns an _object specifier_ of type 'file'. Caution: unlike alias and �class furl� objects, this is not a true object but may be used by some applications; not to be confused with the deprecated `file specifier` type (�class fss�), although it uses the same `file TEXT` constructor. Furthermore, it uses an HFS path string so suffers the same problems as HFS paths. Also, being a specifier, requires disambiguation when used [e.g.] in an `open` command otherwise command will be dispatched to it instead of target app, e.g. `tell app "TextEdit" to open {fileSpecifierObject}`. Horribly nasty, brittle, and confusing mis-feature, in other words, but supported (though not encouraged) as an option here for sake of compatibility as there's usually some scriptable app or other API in AS that will absolutely refuse to accept anything else.   � ����   r e t u r n s   a n   _ o b j e c t   s p e c i f i e r _   o f   t y p e   ' f i l e ' .   C a u t i o n :   u n l i k e   a l i a s   a n d   � c l a s s   f u r l �   o b j e c t s ,   t h i s   i s   n o t   a   t r u e   o b j e c t   b u t   m a y   b e   u s e d   b y   s o m e   a p p l i c a t i o n s ;   n o t   t o   b e   c o n f u s e d   w i t h   t h e   d e p r e c a t e d   ` f i l e   s p e c i f i e r `   t y p e   ( � c l a s s   f s s � ) ,   a l t h o u g h   i t   u s e s   t h e   s a m e   ` f i l e   T E X T `   c o n s t r u c t o r .   F u r t h e r m o r e ,   i t   u s e s   a n   H F S   p a t h   s t r i n g   s o   s u f f e r s   t h e   s a m e   p r o b l e m s   a s   H F S   p a t h s .   A l s o ,   b e i n g   a   s p e c i f i e r ,   r e q u i r e s   d i s a m b i g u a t i o n   w h e n   u s e d   [ e . g . ]   i n   a n   ` o p e n `   c o m m a n d   o t h e r w i s e   c o m m a n d   w i l l   b e   d i s p a t c h e d   t o   i t   i n s t e a d   o f   t a r g e t   a p p ,   e . g .   ` t e l l   a p p   " T e x t E d i t "   t o   o p e n   { f i l e S p e c i f i e r O b j e c t } ` .   H o r r i b l y   n a s t y ,   b r i t t l e ,   a n d   c o n f u s i n g   m i s - f e a t u r e ,   i n   o t h e r   w o r d s ,   b u t   s u p p o r t e d   ( t h o u g h   n o t   e n c o u r a g e d )   a s   a n   o p t i o n   h e r e   f o r   s a k e   o f   c o m p a t i b i l i t y   a s   t h e r e ' s   u s u a l l y   s o m e   s c r i p t a b l e   a p p   o r   o t h e r   A P I   i n   A S   t h a t   w i l l   a b s o l u t e l y   r e f u s e   t o   a c c e p t   a n y t h i n g   e l s e .� ��� =  � ���� o   � ��O�O 0 toformat toFormat� m   � ��N
�N FLCTFLCH� ��� L   ��� c   ���� c   � ���� o   � ��M�M 0 	posixpath 	posixPath� m   � ��L
�L 
psxf� m   � �K
�K 
ctxt� ��� = ��� o  �J�J 0 toformat toFormat� m  �I
�I FLCTFLCU� ��H� k  <�� ��� r  ��� n ��� I  �G��F�G $0 fileurlwithpath_ fileURLWithPath_� ��E� o  �D�D 0 	posixpath 	posixPath�E  �F  � n ��� o  �C�C 	0 NSURL  � m  �B
�B misccura� o      �A�A 0 asocurl asocURL� ��� Z 3���@�?� = � � o  �>�> 0 asocurl asocURL  m  �=
�= 
msng� n / I  !/�<�;�< .0 throwinvalidparameter throwInvalidParameter  o  !"�:�: 0 filepath filePath  m  "% �		   
�9
 4  %+�8
�8 
ctxt m  '* � 4 C a n  t   c o n v e r t   t o   f i l e   U R L .�9  �;   o  !�7�7 0 _support  �@  �?  � �6 L  4< c  4; l 49�5�4 n 49 I  59�3�2�1�3  0 absolutestring absoluteString�2  �1   o  45�0�0 0 asocurl asocURL�5  �4   m  9:�/
�/ 
ctxt�6  �H  � n ?L I  DL�.�-�. >0 throwinvalidconstantparameter throwInvalidConstantParameter  o  DE�,�, 0 toformat toFormat �+ m  EH �  t o�+  �-   o  ?D�*�* 0 _support  �e   R      �)
�) .ascrerr ****      � **** o      �(�( 0 etext eText �' 
�' 
errn o      �&�& 0 enumber eNumber  �%!"
�% 
erob! o      �$�$ 0 efrom eFrom" �##�"
�# 
errt# o      �!�! 
0 eto eTo�"   I  Tb� $��  
0 _error  $ %&% m  UX'' �((  c o n v e r t   p a t h& )*) o  XY�� 0 etext eText* +,+ o  YZ�� 0 enumber eNumber, -.- o  Z[�� 0 efrom eFrom. /�/ o  [\�� 
0 eto eTo�  �   x r brings a modicum of sanity to the horrible mess that is AppleScript's file path formats and file identifier types    �00 �   b r i n g s   a   m o d i c u m   o f   s a n i t y   t o   t h e   h o r r i b l e   m e s s   t h a t   i s   A p p l e S c r i p t ' s   f i l e   p a t h   f o r m a t s   a n d   f i l e   i d e n t i f i e r   t y p e s 121 l     ����  �  �  2 343 l     ����  �  �  4 565 i  6 9787 I     �9:
� .Fil:NorPnull���     ctxt9 o      �� 0 filepath filePath: �;<
� 
ExpT; |��=�>�  �  = o      ��  0 expandingtilde expandingTilde�  > l 
    ?��? l     @�
�	@ m      �
� boovfals�
  �	  �  �  < �AB
� 
ExpRA |��C�D�  �  C o      �� &0 expandingrelative expandingRelative�  D l     E��E m      � 
�  boovfals�  �  B ��F��
�� 
ExpAF |����G��H��  ��  G o      ���� $0 expandingsymlink expandingSymlink��  H l     I����I m      ��
�� boovfals��  ��  ��  8 Q     �JKLJ P    �MNOM k    �PP QRQ r    STS n   UVU I    ��W���� ,0 asposixpathparameter asPOSIXPathParameterW XYX o    ���� 0 filepath filePathY Z��Z m    [[ �\\  ��  ��  V o    ���� 0 _support  T o      ���� 0 filepath filePathR ]^] l   6_`a_ Z   6bc����b F    *ded H    "ff n   !ghg l 
  !i����i I    !��j���� (0 asbooleanparameter asBooleanParameterj klk o    ����  0 expandingtilde expandingTildel m��m m    nn �oo  t i l d e   e x p a n s i o n��  ��  ��  ��  h o    ���� 0 _support  e C   % (pqp o   % &���� 0 filepath filePathq m   & 'rr �ss  ~c r   - 2tut b   - 0vwv m   - .xx �yy  . /w o   . /���� 0 filepath filePathu o      ���� 0 filepath filePath��  ��  ` � � Cocoa API *always* expands leading "~" character, which it really shouldn't as tilde expansion is a *nix shell-ism, not a POSIX path-ism, so prefix with "./" to prevent that   a �zz\   C o c o a   A P I   * a l w a y s *   e x p a n d s   l e a d i n g   " ~ "   c h a r a c t e r ,   w h i c h   i t   r e a l l y   s h o u l d n ' t   a s   t i l d e   e x p a n s i o n   i s   a   * n i x   s h e l l - i s m ,   n o t   a   P O S I X   p a t h - i s m ,   s o   p r e f i x   w i t h   " . / "   t o   p r e v e n t   t h a t^ {|{ Z  7 `}~����} F   7 K� n  7 B��� l 
 < B������ I   < B������� (0 asbooleanparameter asBooleanParameter� ��� o   < =���� &0 expandingrelative expandingRelative� ���� m   = >�� ��� $ a b s o l u t e   e x p a n s i o n��  ��  ��  ��  � o   7 <���� 0 _support  � H   E I�� C   E H��� o   E F���� 0 filepath filePath� m   F G�� ���  /~ r   N \��� I  N Z�����
�� .Fil:JoiPnull���     ****� J   N V�� ��� I  N S������
�� .Fil:CurFnull��� ��� null��  ��  � ���� o   S T���� 0 filepath filePath��  ��  � o      ���� 0 filepath filePath��  ��  | ���� Z   a ������� n  a l��� I   f l������� (0 asbooleanparameter asBooleanParameter� ��� o   f g���� $0 expandingsymlink expandingSymlink� ���� m   g h�� ���  a l i a s   e x p a n s i o n��  ��  � o   a f���� 0 _support  � L   o ��� c   o ��� l  o {������ n  o {��� I   w {�������� B0 stringbyresolvingsymlinksinpath stringByResolvingSymlinksInPath��  ��  � l  o w������ n  o w��� I   r w������� &0 stringwithstring_ stringWithString_� ���� o   r s���� 0 filepath filePath��  ��  � n  o r��� o   p r���� 0 nsstring NSString� m   o p��
�� misccura��  ��  ��  ��  � m   { ~��
�� 
ctxt��  � L   � ��� c   � ���� l  � ������� n  � ���� I   � ��������� 60 stringbystandardizingpath stringByStandardizingPath��  ��  � l  � ������� n  � ���� I   � �������� &0 stringwithstring_ stringWithString_� ���� o   � ����� 0 filepath filePath��  ��  � n  � ���� o   � ����� 0 nsstring NSString� m   � ���
�� misccura��  ��  ��  ��  � m   � ���
�� 
ctxt��  N ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  O ����
�� consnume��  K R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� �����
�� 
errt� o      ���� 
0 eto eTo��  L I   � �������� 
0 _error  � ��� m   � ��� ���  n o r m a l i z e   p a t h� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 filepath filePath� ���� o   � ����� 
0 eto eTo��  ��  6 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  : =��� I     ����
�� .Fil:JoiPnull���     ****� o      ����  0 pathcomponents pathComponents� �����
�� 
Exte� |����������  ��  � o      ���� 0 fileextension fileExtension��  � l     ������ m      �� ���  ��  ��  ��  � Q     ����� k    ��� ��� r    ��� n    ��� 2   ��
�� 
cobj� n   ��� I    ������� "0 aslistparameter asListParameter� ��� o    	����  0 pathcomponents pathComponents� ���� m   	 
�� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 subpaths subPaths� ��� Q    a���� k    L�� ��� Z   %������� =   ��� o    ���� 0 subpaths subPaths� J    ��  � R    !�~�}�|
�~ .ascrerr ****      � ****�}  �|  ��  ��  � ��{� X   & L �z  r   6 G n  6 C I   ; C�y�x�y ,0 asposixpathparameter asPOSIXPathParameter  n  ; >	
	 1   < >�w
�w 
pcnt
 o   ; <�v�v 0 aref aRef �u m   > ? �  �u  �x   o   6 ;�t�t 0 _support   n      1   D F�s
�s 
pcnt o   C D�r�r 0 aref aRef�z 0 aref aRef o   ) *�q�q 0 subpaths subPaths�{  � R      �p�o�n
�p .ascrerr ****      � ****�o  �n  � n  T a I   Y a�m�l�m .0 throwinvalidparameter throwInvalidParameter  o   Y Z�k�k  0 pathcomponents pathComponents  m   Z [ �    m   [ \�j
�j 
list �i m   \ ] � X E x p e c t e d   o n e   o r   m o r e   t e x t   a n d / o r   f i l e   i t e m s .�i  �l   o   T Y�h�h 0 _support  �  r   b n !  l  b l"�g�f" n  b l#$# I   g l�e%�d�e *0 pathwithcomponents_ pathWithComponents_% &�c& o   g h�b�b 0 subpaths subPaths�c  �d  $ n  b g'(' o   c g�a�a 0 nsstring NSString( m   b c�`
�` misccura�g  �f  ! o      �_�_ 0 asocpath asocPath )*) r   o ~+,+ n  o |-.- I   t |�^/�]�^ "0 astextparameter asTextParameter/ 010 o   t u�\�\ 0 fileextension fileExtension1 2�[2 m   u x33 �44 ( u s i n g   f i l e   e x t e n s i o n�[  �]  . o   o t�Z�Z 0 _support  , o      �Y�Y 0 fileextension fileExtension* 565 Z    �78�X�W7 >    �9:9 n   �;<; 1   � ��V
�V 
leng< o    ��U�U 0 fileextension fileExtension: m   � ��T�T  8 k   � �== >?> r   � �@A@ n  � �BCB I   � ��SD�R�S B0 stringbyappendingpathextension_ stringByAppendingPathExtension_D E�QE o   � ��P�P 0 fileextension fileExtension�Q  �R  C o   � ��O�O 0 asocpath asocPathA o      �N�N 0 asocpath asocPath? F�MF Z  � �GH�L�KG =  � �IJI o   � ��J�J 0 asocpath asocPathJ m   � ��I
�I 
msngH n  � �KLK I   � ��HM�G�H .0 throwinvalidparameter throwInvalidParameterM NON o   � ��F�F 0 fileextension fileExtensionO PQP m   � �RR �SS ( u s i n g   f i l e   e x t e n s i o nQ TUT m   � ��E
�E 
ctxtU V�DV m   � �WW �XX . I n v a l i d   f i l e   e x t e n s i o n .�D  �G  L o   � ��C�C 0 _support  �L  �K  �M  �X  �W  6 Y�BY L   � �ZZ c   � �[\[ o   � ��A�A 0 asocpath asocPath\ m   � ��@
�@ 
ctxt�B  � R      �?]^
�? .ascrerr ****      � ****] o      �>�> 0 etext eText^ �=_`
�= 
errn_ o      �<�< 0 enumber eNumber` �;ab
�; 
eroba o      �:�: 0 efrom eFromb �9c�8
�9 
errtc o      �7�7 
0 eto eTo�8  � I   � ��6d�5�6 
0 _error  d efe m   � �gg �hh  j o i n   p a t hf iji o   � ��4�4 0 etext eTextj klk o   � ��3�3 0 enumber eNumberl mnm o   � ��2�2 0 efrom eFromn o�1o o   � ��0�0 
0 eto eTo�1  �5  � pqp l     �/�.�-�/  �.  �-  q rsr l     �,�+�*�,  �+  �*  s tut i  > Avwv I     �)xy
�) .Fil:SplPnull���     ctxtx o      �(�( 0 filepath filePathy �'z�&
�' 
Uponz |�%�${�#|�%  �$  { o      �"�" 0 splitposition splitPosition�#  | l     }�!� } m      �
� FLSPFLSL�!  �   �&  w Q     ~~�~ k    h�� ��� r    ��� n   ��� I    ���� &0 stringwithstring_ stringWithString_� ��� l   ���� n   ��� I    ���� ,0 asposixpathparameter asPOSIXPathParameter� ��� o    �� 0 filepath filePath� ��� m    �� ���  �  �  � o    �� 0 _support  �  �  �  �  � n   ��� o    �� 0 nsstring NSString� m    �
� misccura� o      �� 0 asocpath asocPath� ��� Z    h����� =   ��� o    �� 0 splitposition splitPosition� m    �
� FLSPFLSL� L    /�� J    .�� ��� c    %��� l   #���� n   #��� I    #���
� F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent�  �
  � o    �	�	 0 asocpath asocPath�  �  � m   # $�
� 
ctxt� ��� c   % ,��� l  % *���� n  % *��� I   & *���� &0 lastpathcomponent lastPathComponent�  �  � o   % &�� 0 asocpath asocPath�  �  � m   * +� 
�  
ctxt�  � ��� =  2 5��� o   2 3���� 0 splitposition splitPosition� m   3 4��
�� FLSPFLSE� ��� L   8 I�� J   8 H�� ��� c   8 ?��� l  8 =������ n  8 =��� I   9 =�������� >0 stringbydeletingpathextension stringByDeletingPathExtension��  ��  � o   8 9���� 0 asocpath asocPath��  ��  � m   = >��
�� 
ctxt� ���� c   ? F��� l  ? D������ n  ? D��� I   @ D�������� 0 pathextension pathExtension��  ��  � o   ? @���� 0 asocpath asocPath��  ��  � m   D E��
�� 
ctxt��  � ��� =  L O��� o   L M���� 0 splitposition splitPosition� m   M N��
�� FLSPFLSA� ���� L   R Z�� c   R Y��� l  R W������ n  R W��� I   S W��������  0 pathcomponents pathComponents��  ��  � o   R S���� 0 asocpath asocPath��  ��  � m   W X��
�� 
list��  � n  ] h��� I   b h������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   b c���� 0 matchformat matchFormat� ���� m   c d�� ���  a t��  ��  � o   ] b���� 0 _support  �   R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   p ~������� 
0 _error  � ��� m   q t�� ���  s p l i t   p a t h� ��� o   t u���� 0 etext eText� ��� o   u v���� 0 enumber eNumber� ��� o   v w���� 0 efrom eFrom� ���� o   w x���� 
0 eto eTo��  ��  u ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � S M Shell Script Support handlers for use in AppleScripts that run via osascript   � ��� �   S h e l l   S c r i p t   S u p p o r t   h a n d l e r s   f o r   u s e   i n   A p p l e S c r i p t s   t h a t   r u n   v i a   o s a s c r i p t� ��� l     ��������  ��  ��  � ��� l     ���� j   B F�����  0 _argvusererror _ArgvUserError� m   B E����'��� error code used to indicate the shell script's user supplied invalid command line options (errors due to bugs in invalid option/argument definitions supplied by shell script author use standard AS error codes); need to decide what's a sensible code to use and document it in SDEF (unfortunately, `on error number ...` blocks only accept literal integer (for pattern matching) or identifier (for assignment) and don't allow a command as parameter, so there's no way to supply library-defined error numbers as 'named constants' via library-defined commands, e.g. `on error number (command line user error)`, that return the appropriate number)   � ���   e r r o r   c o d e   u s e d   t o   i n d i c a t e   t h e   s h e l l   s c r i p t ' s   u s e r   s u p p l i e d   i n v a l i d   c o m m a n d   l i n e   o p t i o n s   ( e r r o r s   d u e   t o   b u g s   i n   i n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n s   s u p p l i e d   b y   s h e l l   s c r i p t   a u t h o r   u s e   s t a n d a r d   A S   e r r o r   c o d e s ) ;   n e e d   t o   d e c i d e   w h a t ' s   a   s e n s i b l e   c o d e   t o   u s e   a n d   d o c u m e n t   i t   i n   S D E F   ( u n f o r t u n a t e l y ,   ` o n   e r r o r   n u m b e r   . . . `   b l o c k s   o n l y   a c c e p t   l i t e r a l   i n t e g e r   ( f o r   p a t t e r n   m a t c h i n g )   o r   i d e n t i f i e r   ( f o r   a s s i g n m e n t )   a n d   d o n ' t   a l l o w   a   c o m m a n d   a s   p a r a m e t e r ,   s o   t h e r e ' s   n o   w a y   t o   s u p p l y   l i b r a r y - d e f i n e d   e r r o r   n u m b e r s   a s   ' n a m e d   c o n s t a n t s '   v i a   l i b r a r y - d e f i n e d   c o m m a n d s ,   e . g .   ` o n   e r r o r   n u m b e r   ( c o m m a n d   l i n e   u s e r   e r r o r ) ` ,   t h a t   r e t u r n   t h e   a p p r o p r i a t e   n u m b e r )� ��� l     ��������  ��  ��  � � � h   G R���� 0 novalue NoValue l     ����   J D unique constant used to indicate no defaultValue property was given    � �   u n i q u e   c o n s t a n t   u s e d   t o   i n d i c a t e   n o   d e f a u l t V a l u e   p r o p e r t y   w a s   g i v e n   l     ��������  ��  ��    j   S [��	�� 
0 lf2 LF2	 b   S Z

 1   S V��
�� 
lnfd 1   V Y��
�� 
lnfd  j   \ `���� 0 indent1 Indent1 m   \ _ �       j   a e���� 0 indent2 Indent2 m   a d �               l     ��������  ��  ��    l     ��������  ��  ��    l     ��������  ��  ��    i  f i I      �� ���� 0 vt100 VT100  !��! o      ���� 0 
formatcode 
formatCode��  ��   k     "" #$# l      ��%&��  %F@ Returns a magic character sequence that will apply the specified formatting or other control operation in Terminal.app and other VT100 terminal emulators. Multiple codes may be given as semicolon-separated numeric text, e.g. "1;7". Commonly used style codes are:
	
		0 = reset/normal
		1 = bold
		2 = faint
		4 = underline
		5 = blink
		7 = negative
		8 = conceal
		30-37 = foreground colors (black, red, green, yellow, blue, magenta, cyan, white)
		38;5;N = xterm-256 foreground colors (N = 0-255)
		39 = default foreground color
		40-49 = background colors (as for 30-39)
	   & �''�   R e t u r n s   a   m a g i c   c h a r a c t e r   s e q u e n c e   t h a t   w i l l   a p p l y   t h e   s p e c i f i e d   f o r m a t t i n g   o r   o t h e r   c o n t r o l   o p e r a t i o n   i n   T e r m i n a l . a p p   a n d   o t h e r   V T 1 0 0   t e r m i n a l   e m u l a t o r s .   M u l t i p l e   c o d e s   m a y   b e   g i v e n   a s   s e m i c o l o n - s e p a r a t e d   n u m e r i c   t e x t ,   e . g .   " 1 ; 7 " .   C o m m o n l y   u s e d   s t y l e   c o d e s   a r e : 
 	 
 	 	 0   =   r e s e t / n o r m a l 
 	 	 1   =   b o l d 
 	 	 2   =   f a i n t 
 	 	 4   =   u n d e r l i n e 
 	 	 5   =   b l i n k 
 	 	 7   =   n e g a t i v e 
 	 	 8   =   c o n c e a l 
 	 	 3 0 - 3 7   =   f o r e g r o u n d   c o l o r s   ( b l a c k ,   r e d ,   g r e e n ,   y e l l o w ,   b l u e ,   m a g e n t a ,   c y a n ,   w h i t e ) 
 	 	 3 8 ; 5 ; N   =   x t e r m - 2 5 6   f o r e g r o u n d   c o l o r s   ( N   =   0 - 2 5 5 ) 
 	 	 3 9   =   d e f a u l t   f o r e g r o u n d   c o l o r 
 	 	 4 0 - 4 9   =   b a c k g r o u n d   c o l o r s   ( a s   f o r   3 0 - 3 9 ) 
 	$ (��( L     )) b     *+* b     	,-, b     ./. l    0����0 5     ��1��
�� 
cha 1 m    ���� 
�� kfrmID  ��  ��  / m    22 �33  [- o    ���� 0 
formatcode 
formatCode+ m   	 
44 �55  m��   676 l     ��������  ��  ��  7 898 l     ��:;��  :  -----   ; �<< 
 - - - - -9 =>= l     ��?@��  ? - ' convert raw args to supported AS types   @ �AA N   c o n v e r t   r a w   a r g s   t o   s u p p o r t e d   A S   t y p e s> BCB l     ��������  ��  ��  C DED i  j mFGF I      ��H���� 0 _unpackvalue _unpackValueH IJI o      ���� 0 thevalue theValueJ K��K o      ���� $0 definitionrecord definitionRecord��  ��  G k    �LL MNM l     ��OP��  O � � note that only ASOC-friendly AS types are supported here since NSDictionaries are used as temporary storage for parsed options and arguments   P �QQ   n o t e   t h a t   o n l y   A S O C - f r i e n d l y   A S   t y p e s   a r e   s u p p o r t e d   h e r e   s i n c e   N S D i c t i o n a r i e s   a r e   u s e d   a s   t e m p o r a r y   s t o r a g e   f o r   p a r s e d   o p t i o n s   a n d   a r g u m e n t sN RSR r     TUT c     VWV n    XYX o    ���� 0 	valuetype 	valueTypeY o     ���� $0 definitionrecord definitionRecordW m    ��
�� 
typeU o      ���� 0 	valuetype 	valueTypeS Z[Z Z   �\]^_\ =   `a` o    	���� 0 	valuetype 	valueTypea m   	 
��
�� 
ctxt] r    bcb o    ���� 0 thevalue theValuec o      ���� 0 	theresult 	theResult^ ded E   fgf J    hh iji m    ��
�� 
longj klk m    ��
�� 
doubl m��m m    ��
�� 
nmbr��  g J    nn o��o o    ���� 0 	valuetype 	valueType��  e pqp l    �rstr k     �uu vwv r     -xyx n    +z{z I   ' +�������� 0 init  ��  ��  { n    '|}| I   # '������� 	0 alloc  ��  �  } n    #~~ o   ! #�~�~ &0 nsnumberformatter NSNumberFormatter m     !�}
�} misccuray o      �|�| 0 asocformatter asocFormatterw ��� n  . 6��� I   / 6�{��z�{ "0 setnumberstyle_ setNumberStyle_� ��y� l  / 2��x�w� n  / 2��� o   0 2�v�v D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� m   / 0�u
�u misccura�x  �w  �y  �z  � o   . /�t�t 0 asocformatter asocFormatter� ��� n  7 C��� I   8 C�s��r�s 0 
setlocale_ 
setLocale_� ��q� l  8 ?��p�o� n  8 ?��� I   ; ?�n�m�l�n 0 systemlocale systemLocale�m  �l  � n  8 ;��� o   9 ;�k�k 0 nslocale NSLocale� m   8 9�j
�j misccura�p  �o  �q  �r  � o   7 8�i�i 0 asocformatter asocFormatter� ��� r   D L��� n  D J��� I   E J�h��g�h &0 numberfromstring_ numberFromString_� ��f� o   E F�e�e 0 thevalue theValue�f  �g  � o   D E�d�d 0 asocformatter asocFormatter� o      �c�c 0 
asocresult 
asocResult� ��� Z  M i���b�a� =  M R��� o   M N�`�` 0 
asocresult 
asocResult� m   N Q�_
�_ 
msng� R   U e�^��
�^ .ascrerr ****      � ****� b   _ d��� m   _ b�� ��� ( N o t   a   v a l i d   n u m b e r :  � o   b c�]�] 0 thevalue theValue� �\��[
�\ 
errn� o   Y ^�Z�Z  0 _argvusererror _ArgvUserError�[  �b  �a  � ��� r   j q��� c   j o��� o   j k�Y�Y 0 
asocresult 
asocResult� m   k n�X
�X 
****� o      �W�W 0 	theresult 	theResult� ��V� Z   r ����U�T� =  r u��� o   r s�S�S 0 	valuetype 	valueType� m   s t�R
�R 
long� k   x ��� ��� Z  x ����Q�P� >   x }��� `   x {��� o   x y�O�O 0 	theresult 	theResult� m   y z�N�N � m   { |�M�M  � R   � ��L��
�L .ascrerr ****      � ****� b   � ���� m   � ��� ��� * N o t   a   v a l i d   i n t e g e r :  � o   � ��K�K 0 thevalue theValue� �J��I
�J 
errn� o   � ��H�H  0 _argvusererror _ArgvUserError�I  �Q  �P  � ��G� r   � ���� c   � ���� o   � ��F�F 0 	theresult 	theResult� m   � ��E
�E 
long� o      �D�D 0 	theresult 	theResult�G  �U  �T  �V  s 6 0 note: decimal numbers must be in canonical form   t ��� `   n o t e :   d e c i m a l   n u m b e r s   m u s t   b e   i n   c a n o n i c a l   f o r mq ��� E  � ���� J   � ��� ��� m   � ��C
�C 
furl� ��� m   � ��B
�B 
alis� ��� m   � ��A
�A 
file� ��@� m   � ��?
�? 
psxf�@  � J   � ��� ��>� o   � ��=�= 0 	valuetype 	valueType�>  � ��� l  �T���� k   �T�� ��� l  � ��<���<  �   expand/normalize path   � ��� ,   e x p a n d / n o r m a l i z e   p a t h� ��� Z   ����;�:� F   � ���� H   � ��� C   � ���� o   � ��9�9 0 thevalue theValue� m   � ��� ���  /� H   � ��� C   � ���� o   � ��8�8 0 thevalue theValue� m   � ��� ���  ~� k   �
�� ��� r   � ���� n  � ���� I   � ��7�6�5�7 ,0 currentdirectorypath currentDirectoryPath�6  �5  � n  � ���� I   � ��4�3�2�4  0 defaultmanager defaultManager�3  �2  � n  � ���� o   � ��1�1 0 nsfilemanager NSFileManager� m   � ��0
�0 misccura� o      �/�/ 0 basepath basePath� ��� Z  � � �.�-  =  � � o   � ��,�, 0 basepath basePath m   � ��+
�+ 
msng R   � ��*
�* .ascrerr ****      � **** b   � � m   � � �		 � C a n ' t   e x p a n d   r e l a t i v e   f i l e   p a t h   ( c u r r e n t   w o r k i n g   d i r e c t o r y   i s   u n k n o w n ) :   o   � ��)�) 0 thevalue theValue �(
�'
�( 
errn
 o   � ��&�&  0 _argvusererror _ArgvUserError�'  �.  �-  � �% r   �
 l  ��$�# n  � I   �"�!�" *0 pathwithcomponents_ pathWithComponents_ �  J     o   �� 0 basepath basePath � o  �� 0 thevalue theValue�  �   �!   n  �  o   � �� 0 nsstring NSString m   � ��
� misccura�$  �#   o      �� 0 thevalue theValue�%  �;  �:  �  r  % c  # c    l !��! n "#" I  ���� 60 stringbystandardizingpath stringByStandardizingPath�  �  # l $��$ n %&% I  �'�� &0 stringwithstring_ stringWithString_' (�( o  �� 0 thevalue theValue�  �  & n )*) o  �� 0 nsstring NSString* m  �
� misccura�  �  �  �    m  �
� 
ctxt m  "�
� 
psxf o      �
�
 0 	theresult 	theResult +�	+ Q  &T,-., Z )</0��/ = ).121 o  )*�� 0 	valuetype 	valueType2 m  *-�
� 
alis0 r  18343 c  16565 o  12�� 0 	theresult 	theResult6 m  25�
� 
alis4 o      �� 0 	theresult 	theResult�  �  - R      �� 7
� .ascrerr ****      � ****�   7 ��8��
�� 
errn8 d      99 m      ���� +��  . l DT:;<: R  DT��=>
�� .ascrerr ****      � ****= b  NS?@? m  NQAA �BB 2 F i l e   p a t h   d o e s n  t   e x i s t :  @ o  QR���� 0 thevalue theValue> ��C��
�� 
errnC o  HM����  0 _argvusererror _ArgvUserError��  ;   file not found   < �DD    f i l e   n o t   f o u n d�	  � � � note: `file` is treated as synonym for `POSIX file` here, as actual 'file' object specifiers are both mostly pointless and much more problematic due to using HFS paths   � �EEP   n o t e :   ` f i l e `   i s   t r e a t e d   a s   s y n o n y m   f o r   ` P O S I X   f i l e `   h e r e ,   a s   a c t u a l   ' f i l e '   o b j e c t   s p e c i f i e r s   a r e   b o t h   m o s t l y   p o i n t l e s s   a n d   m u c h   m o r e   p r o b l e m a t i c   d u e   t o   u s i n g   H F S   p a t h s� FGF = W\HIH o  WX���� 0 	valuetype 	valueTypeI m  X[��
�� 
boolG J��J l _�KLMK P  _�N��ON Z  f�PQRSP E f}TUT J  fyVV WXW m  fiYY �ZZ  t r u eX [\[ m  il]] �^^  y e s\ _`_ m  loaa �bb  t` cdc m  oree �ff  yd g��g m  ruhh �ii  1��  U J  y|jj k��k o  yz���� 0 thevalue theValue��  Q L  ��ll m  ����
�� boovtrueR mnm E ��opo J  ��qq rsr m  ��tt �uu 
 f a l s es vwv m  ��xx �yy  n ow z{z m  ��|| �}}  f{ ~~ m  ���� ���  n ���� m  ���� ���  0��  p J  ���� ���� o  ������ 0 thevalue theValue��  n ���� L  ���� m  ����
�� boovfals��  S R  ������
�� .ascrerr ****      � ****� b  ����� m  ���� ��� 2 N o t    y e s    o r    n o    ( Y | N ) :  � o  ������ 0 thevalue theValue� �����
�� 
errn� o  ������  0 _argvusererror _ArgvUserError��  ��  O ����
�� conscase��  L W Q may be used by boolean argument definitions (boolean options don't take a value)   M ��� �   m a y   b e   u s e d   b y   b o o l e a n   a r g u m e n t   d e f i n i t i o n s   ( b o o l e a n   o p t i o n s   d o n ' t   t a k e   a   v a l u e )��  _ R  ������
�� .ascrerr ****      � ****� m  ���� ��� r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) .� ����
�� 
errn� m  �������Y� ����
�� 
erob� l �������� N  ���� n  ����� o  ������ 0 	valuetype 	valueType� o  ������ $0 definitionrecord definitionRecord��  ��  � �����
�� 
errt� m  ����
�� 
type��  [ ���� L  ���� o  ������ 0 	theresult 	theResult��  E ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  n q��� I      ������� 40 _defaultvalueplaceholder _defaultValuePlaceholder� ���� o      ���� $0 definitionrecord definitionRecord��  ��  � l    g���� k     g�� ��� r     ��� c     ��� n    ��� o    ���� 0 	valuetype 	valueType� o     ���� $0 definitionrecord definitionRecord� m    ��
�� 
type� o      ���� 0 	valuetype 	valueType� ��� l   ������  � ^ X note: the following conditional block should implement same branches as in _unpackValue   � ��� �   n o t e :   t h e   f o l l o w i n g   c o n d i t i o n a l   b l o c k   s h o u l d   i m p l e m e n t   s a m e   b r a n c h e s   a s   i n   _ u n p a c k V a l u e� ���� Z    g����� =   ��� o    	���� 0 	valuetype 	valueType� m   	 
��
�� 
ctxt� L    �� m    �� ���  T E X T� ��� E   ��� J    �� ��� m    ��
�� 
long� ��� m    ��
�� 
doub� ���� m    ��
�� 
nmbr��  � J    �� ���� o    ���� 0 	valuetype 	valueType��  � ��� Z    ,������ =   "��� o     ���� 0 	valuetype 	valueType� m     !��
�� 
long� L   % '�� m   % &�� ���  I N T E G E R��  � L   * ,�� m   * +�� ���  N U M B E R� ��� E  / 9��� J   / 5�� ��� m   / 0��
�� 
furl� ��� m   0 1��
�� 
alis� ��� m   1 2��
�� 
file� ���� m   2 3��
�� 
psxf��  � J   5 8�� ���� o   5 6���� 0 	valuetype 	valueType��  � ��� L   < >�� m   < =�� ���  F I L E� ��� =  A D��� o   A B���� 0 	valuetype 	valueType� m   B C��
�� 
bool� ���� L   G K�� m   G J�� ���  Y | N��  � R   N g����
�� .ascrerr ****      � ****� m   c f�� ��� r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) .� ����
�� 
errn� m   R U�����Y� ��� 
�� 
erob� l  X \���� N   X \ n   X [ o   Y [���� 0 	valuetype 	valueType o   X Y���� $0 definitionrecord definitionRecord��  ��    ����
�� 
errt m   _ `��
�� 
type��  ��  � z t given an option/argument definition record, returns the appropriate default placeholderValue according to valueType   � � �   g i v e n   a n   o p t i o n / a r g u m e n t   d e f i n i t i o n   r e c o r d ,   r e t u r n s   t h e   a p p r o p r i a t e   d e f a u l t   p l a c e h o l d e r V a l u e   a c c o r d i n g   t o   v a l u e T y p e�  l     ��������  ��  ��   	
	 l     ��������  ��  ��  
  i  r u I      ������ *0 _formatdefaultvalue _formatDefaultValue �� o      ���� $0 definitionrecord definitionRecord��  ��   l    � k     �  r      n      o    ���� 0 defaultvalue defaultValue o     ���� $0 definitionrecord definitionRecord o      ���� 0 defaultvalue defaultValue  Z   (���� F      >    !"! l   #����# I   ��$%
�� .corecnte****       ****$ J    	&& '��' o    ���� 0 defaultvalue defaultValue��  % ��(��
�� 
kocl( m   
 ��
�� 
list��  ��  ��  " m    ����    =    )*) n    +,+ 1    ��
�� 
leng, o    ���� 0 defaultvalue defaultValue* m    ����  r    $-.- n    "/0/ 4    "��1
�� 
cobj1 m     !���� 0 o    ���� 0 defaultvalue defaultValue. o      ���� 0 defaultvalue defaultValue��  ��   232 Z   ) �45674 >   ) 4898 l  ) 2:����: I  ) 2��;<
�� .corecnte****       ****; J   ) ,== >��> o   ) *���� 0 defaultvalue defaultValue��  < ��?��
�� 
kocl? m   - .��
�� 
ctxt��  ��  ��  9 m   2 3��  5 r   7 :@A@ o   7 8�~�~ 0 defaultvalue defaultValueA o      �}�} 0 defaulttext defaultText6 BCB G   = XDED >   = HFGF l  = FH�|�{H I  = F�zIJ
�z .corecnte****       ****I J   = @KK L�yL o   = >�x�x 0 defaultvalue defaultValue�y  J �wM�v
�w 
koclM m   A B�u
�u 
long�v  �|  �{  G m   F G�t�t  E >   K VNON l  K TP�s�rP I  K T�qQR
�q .corecnte****       ****Q J   K NSS T�pT o   K L�o�o 0 defaultvalue defaultValue�p  R �nU�m
�n 
koclU m   O P�l
�l 
doub�m  �s  �r  O m   T U�k�k  C VWV k   [ �XX YZY r   [ h[\[ n  [ f]^] I   b f�j�i�h�j 0 init  �i  �h  ^ n  [ b_`_ I   ^ b�g�f�e�g 	0 alloc  �f  �e  ` n  [ ^aba o   \ ^�d�d &0 nsnumberformatter NSNumberFormatterb m   [ \�c
�c misccura\ o      �b�b 0 asocformatter asocFormatterZ cdc n  i qefe I   j q�ag�`�a "0 setnumberstyle_ setNumberStyle_g h�_h l  j mi�^�]i n  j mjkj o   k m�\�\ >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStylek m   j k�[
�[ misccura�^  �]  �_  �`  f o   i j�Z�Z 0 asocformatter asocFormatterd lml n  r �non I   s ��Yp�X�Y 0 
setlocale_ 
setLocale_p q�Wq l  s |r�V�Ur n  s |sts I   x |�T�S�R�T 0 systemlocale systemLocale�S  �R  t n  s xuvu o   t x�Q�Q 0 nslocale NSLocalev m   s t�P
�P misccura�V  �U  �W  �X  o o   r s�O�O 0 asocformatter asocFormatterm w�Nw r   � �xyx c   � �z{z l  � �|�M�L| n  � �}~} I   � ��K�J�K &0 stringfromnumber_ stringFromNumber_ ��I� o   � ��H�H 0 defaultvalue defaultValue�I  �J  ~ o   � ��G�G 0 asocformatter asocFormatter�M  �L  { m   � ��F
�F 
****y o      �E�E 0 defaulttext defaultText�N  W ��� G   � ���� >   � ���� l  � ���D�C� I  � ��B��
�B .corecnte****       ****� J   � ��� ��A� o   � ��@�@ 0 defaultvalue defaultValue�A  � �?��>
�? 
kocl� m   � ��=
�= 
furl�>  �D  �C  � m   � ��<�<  � >   � ���� l  � ���;�:� I  � ��9��
�9 .corecnte****       ****� J   � ��� ��8� o   � ��7�7 0 defaultvalue defaultValue�8  � �6��5
�6 
kocl� m   � ��4
�4 
alis�5  �;  �:  � m   � ��3�3  � ��� r   � ���� n   � ���� 1   � ��2
�2 
psxp� o   � ��1�1 0 defaultvalue defaultValue� o      �0�0 0 defaulttext defaultText� ��� =  � ���� o   � ��/�/ 0 defaultvalue defaultValue� m   � ��.
�. boovtrue� ��� r   � ���� m   � ��� ���  Y� o      �-�- 0 defaulttext defaultText� ��� =  � ���� o   � ��,�, 0 defaultvalue defaultValue� m   � ��+
�+ boovfals� ��*� r   � ���� m   � ��� ���  N� o      �)�) 0 defaulttext defaultText�*  7 L   � ��� m   � ��� ���  3 ��(� L   � ��� b   � ���� b   � ���� m   � ��� ���  D e f a u l t :   � o   � ��'�' 0 defaulttext defaultText� m   � ��� ���    �(   G A formats default value for inclusion in OPTIONS/ARGUMENTS section    ��� �   f o r m a t s   d e f a u l t   v a l u e   f o r   i n c l u s i o n   i n   O P T I O N S / A R G U M E N T S   s e c t i o n ��� l     �&�%�$�&  �%  �$  � ��� l     �#���#  �  -----   � ��� 
 - - - - -� ��� l     �"���"  �   parse ARGV   � ���    p a r s e   A R G V� ��� l     �!� ��!  �   �  � ��� i  v y��� I      ���� (0 _buildoptionstable _buildOptionsTable� ��� o      �� &0 optiondefinitions optionDefinitions�  �  � k    ��� ��� l     ����  � � � create a case-sensitive lookup table of all short and long option names (e.g. "-a", "-A", "-o", "--output-file", etc); used by _parseOptions() to retrieve the definition record for each option it encounters   � ����   c r e a t e   a   c a s e - s e n s i t i v e   l o o k u p   t a b l e   o f   a l l   s h o r t   a n d   l o n g   o p t i o n   n a m e s   ( e . g .   " - a " ,   " - A " ,   " - o " ,   " - - o u t p u t - f i l e " ,   e t c ) ;   u s e d   b y   _ p a r s e O p t i o n s ( )   t o   r e t r i e v e   t h e   d e f i n i t i o n   r e c o r d   f o r   e a c h   o p t i o n   i t   e n c o u n t e r s� ��� r     ��� J     ��  � o      �� 0 
foundnames 
foundNames� ��� r    ��� n   ��� I    ���� 0 
dictionary  �  �  � n   ��� o    �� *0 nsmutabledictionary NSMutableDictionary� m    �
� misccura� o      �� 20 optiondefinitionsbyname optionDefinitionsByName� ��� X   ����� k   ��� ��� l   ;���� r    ;��� b    9��� l   $���� c    $��� n   "��� 1     "�
� 
pcnt� o     �� 0 	optionref 	optionRef� m   " #�
� 
reco�  �  � K   $ 8�� ���� 0 	shortname 	shortName� m   % &�� ���  � �
���
 0 longname longName� m   ' (�� ���  � �	���	 0 propertyname propertyName� m   ) *	 	  �		  � �		� 0 	valuetype 	valueType	 m   + ,�
� 
ctxt	 �		� 0 islist isList	 m   / 0�
� boovfals	 �	�� 0 defaultvalue defaultValue	 m   3 4�
� boovfals�  � o      �� $0 optiondefinition optionDefinition� 5 / this defaultValue is only used by boolean opts   � �		 ^   t h i s   d e f a u l t V a l u e   i s   o n l y   u s e d   b y   b o o l e a n   o p t s� 				 Q   < y	
			
 k   ? _		 			 r   ? F			 c   ? D			 n  ? B			 o   @ B� �  0 propertyname propertyName	 o   ? @���� $0 optiondefinition optionDefinition	 m   B C��
�� 
ctxt	 o      ���� 0 propertyname propertyName	 	��	 Z  G _		����	 =  G N			 n  G J			 o   H J���� 0 propertyname propertyName	 o   G H���� $0 optiondefinition optionDefinition	 m   J M		 �		  	 R   Q [����	
�� .ascrerr ****      � ****��  	 ��	 ��
�� 
errn	  m   U X�����\��  ��  ��  ��  	 R      ����	!
�� .ascrerr ****      � ****��  	! ��	"��
�� 
errn	" d      	#	# m      �������  	 R   g y��	$	%
�� .ascrerr ****      � ****	$ m   u x	&	& �	'	' � I n v a l i d   o p t i o n   d e f i n i t i o n   ( p r o p e r t y   n a m e   m u s t   b e   n o n - e m p t y   t e x t ) .	% ��	(	)
�� 
errn	( m   k n�����Y	) ��	*��
�� 
erob	* o   q r���� 0 	optionref 	optionRef��  		 	+	,	+ r   z �	-	.	- n   z 	/	0	/ 1   { ��
�� 
leng	0 o   z {���� 0 
foundnames 
foundNames	. o      ���� 0 	namecount 	nameCount	, 	1	2	1 X   ��	3��	4	3 k   ��	5	5 	6	7	6 r   � �	8	9	8 o   � ����� 0 aref aRef	9 J      	:	: 	;	<	; o      ���� 0 thename theName	< 	=��	= o      ���� 0 
nameprefix 
namePrefix��  	7 	>	?	> Q   � �	@	A	B	@ r   � �	C	D	C c   � �	E	F	E o   � ����� 0 thename theName	F m   � ���
�� 
ctxt	D o      ���� 0 thename theName	A R      ����	G
�� .ascrerr ****      � ****��  	G ��	H��
�� 
errn	H d      	I	I m      �������  	B R   � ���	J	K
�� .ascrerr ****      � ****	J m   � �	L	L �	M	M r I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t / l o n g   n a m e   m u s t   b e   t e x t ) .	K ��	N	O
�� 
errn	N m   � ������\	O ��	P��
�� 
erob	P o   � ����� 0 	optionref 	optionRef��  	? 	Q��	Q Z   ��	R	S����	R >  � �	T	U	T o   � ����� 0 thename theName	U m   � �	V	V �	W	W  	S k   ��	X	X 	Y	Z	Y Z  � �	[	\����	[ E  � �	]	^	] o   � ����� 0 
foundnames 
foundNames	^ J   � �	_	_ 	`��	` o   � ����� 0 thename theName��  	\ R   � ���	a	b
�� .ascrerr ****      � ****	a m   � �	c	c �	d	d x I n v a l i d   o p t i o n   d e f i n i t i o n   ( f o u n d   d u p l i c a t e   s h o r t / l o n g   n a m e ) .	b ��	e	f
�� 
errn	e m   � ������Y	f ��	g��
�� 
erob	g o   � ����� 0 	optionref 	optionRef��  ��  ��  	Z 	h	i	h r   �	j	k	j o   � ����� 0 thename theName	k n      	l	m	l  ;   	m o   � ���� 0 
foundnames 
foundNames	i 	n	o	n P  �	p��	q	p Z  
�	r	s��	t	r =  
	u	v	u n 
	w	x	w 1  ��
�� 
leng	x o  
���� 0 
nameprefix 
namePrefix	v m  ���� 	s l A	y	z	{	y Z A	|	}����	| l (	~����	~ G  (		�	 >  	�	�	� n 	�	�	� 1  ��
�� 
leng	� o  ���� 0 thename theName	� m  ���� 	� H  $	�	� E #	�	�	� m  !	�	� �	�	� 4 a b c d e f g h i j k l m n o p q r s t u v w x y z	� o  !"���� 0 thename theName��  ��  	} R  +=��	�	�
�� .ascrerr ****      � ****	� m  9<	�	� �	�	� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t   n a m e   m u s t   b e   a   s i n g l e   A - Z   o r   a - z   c h a r a c t e r ) .	� ��	�	�
�� 
errn	� m  /2�����Y	� ��	���
�� 
erob	� o  56���� 0 	optionref 	optionRef��  ��  ��  	z   validate short name   	{ �	�	� (   v a l i d a t e   s h o r t   n a m e��  	t l D�	�	�	�	� k  D�	�	� 	�	�	� Z D�	�	�����	� G  Di	�	�	� G  D]	�	�	� =  DK	�	�	� n DI	�	�	� 1  EI��
�� 
leng	� o  DE���� 0 thename theName	� m  IJ����  	� H  NY	�	� E NX	�	�	� m  NQ	�	� �	�	� 4 a b c d e f g h i j k l m n o p q r s t u v w x y z	� n QW	�	�	� 4  RW��	�
�� 
cha 	� m  UV���� 	� o  QR���� 0 thename theName	� D  `e	�	�	� o  `a���� 0 thename theName	� m  ad	�	� �	�	�  -	� R  l~��	�	�
�� .ascrerr ****      � ****	� m  z}	�	� �	�	� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( l o n g   n a m e   m u s t   s t a r t   w i t h   A - Z   o r   a - z   c h a r a c t e r ) .	� ��	�	�
�� 
errn	� m  ps�����Y	� ��	���
�� 
erob	� o  vw���� 0 	optionref 	optionRef��  ��  ��  	� 	���	� X  ��	���	�	� Z ��	�	�����	� H  ��	�	� E ��	�	�	� m  ��	�	� �	�	� J a b c d e f g h i j k l m n o p q r s t u v w x y z 1 2 3 4 5 6 7 8 9 0 -	� n ��	�	�	� 1  ����
�� 
pcnt	� o  ������ 0 charref charRef	� R  ����	�	�
�� .ascrerr ****      � ****	� m  ��	�	� �	�	� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( l o n g   n a m e   c a n   o n l y   c o n t a i n   A - Z ,   a - z ,   0 - 9   o r   h y p h e n   c h a r a c t e r s ) .	� ��	�	�
�� 
errn	� m  �������Y	� ��	���
�� 
erob	� o  ������ 0 	optionref 	optionRef��  ��  ��  �� 0 charref charRef	� o  ������ 0 thename theName��  	�   validate long name   	� �	�	� &   v a l i d a t e   l o n g   n a m e��  	q ����
�� conscase��  	o 	���	� l ��	�����	� n ��	�	�	� I  ����	����� &0 setobject_forkey_ setObject_forKey_	� 	�	�	� o  ������ $0 optiondefinition optionDefinition	� 	���	� l ��	�����	� b  ��	�	�	� o  ������ 0 
nameprefix 
namePrefix	� o  ������ 0 thename theName��  ��  ��  ��  	� o  ������ 20 optiondefinitionsbyname optionDefinitionsByName��  ��  ��  ��  ��  ��  �� 0 aref aRef	4 J   � �	�	� 	�	�	� J   � �	�	� 	�	�	� n  � �	�	�	� o   � ����� 0 	shortname 	shortName	� o   � ����� $0 optiondefinition optionDefinition	� 	���	� m   � �	�	� �	�	�  -��  	� 	���	� J   � �	�	� 	�	�	� n  � �	�	�	� o   � ��� 0 longname longName	� o   � ��~�~ $0 optiondefinition optionDefinition	� 	��}	� m   � �	�	� �	�	�  - -�}  ��  	2 	��|	� Z ��	�	��{�z	� =  ��	�	�	� n  ��	�	�	� 1  ���y
�y 
leng	� o  ���x�x 0 
foundnames 
foundNames	� o  ���w�w 0 	namecount 	nameCount	� R  ���v	�	�
�v .ascrerr ****      � ****	� m  ��	�	� �	�	� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .	� �u	�	�
�u 
errn	� m  ���t�t�Y	� �s	��r
�s 
erob	� o  ���q�q 0 	optionref 	optionRef�r  �{  �z  �|  � 0 	optionref 	optionRef� o    �p�p &0 optiondefinitions optionDefinitions� 	��o	� L  ��	�	� o  ���n�n 20 optiondefinitionsbyname optionDefinitionsByName�o  � 	�	�	� l     �m�l�k�m  �l  �k  	� 	�	�	� l     �j�i�h�j  �i  �h  	� 	�	�	� i  z }	�	�	� I      �g
 �f�g 0 _parseoptions _parseOptions
  


 o      �e�e 0 rawarguments rawArguments
 


 o      �d�d &0 optiondefinitions optionDefinitions
 
�c
 o      �b�b &0 hasdefaultoptions hasDefaultOptions�c  �f  	� k    n

 


 l     �a
	

�a  
	oi given a list of raw arguments passed to script's run handler, extract those items that are command option names and (where relevant) their corresponding values, converting those values to the required type and returning an NSMutableDictionary of option name-value pairs plus a list of any remaining (i.e. non-option) arguments to be passed to _parseArguments()   

 �

�   g i v e n   a   l i s t   o f   r a w   a r g u m e n t s   p a s s e d   t o   s c r i p t ' s   r u n   h a n d l e r ,   e x t r a c t   t h o s e   i t e m s   t h a t   a r e   c o m m a n d   o p t i o n   n a m e s   a n d   ( w h e r e   r e l e v a n t )   t h e i r   c o r r e s p o n d i n g   v a l u e s ,   c o n v e r t i n g   t h o s e   v a l u e s   t o   t h e   r e q u i r e d   t y p e   a n d   r e t u r n i n g   a n   N S M u t a b l e D i c t i o n a r y   o f   o p t i o n   n a m e - v a l u e   p a i r s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s   t o   b e   p a s s e d   t o   _ p a r s e A r g u m e n t s ( )
 


 l     �`

�`  
 6 0 first build a lookup table of all known options   
 �

 `   f i r s t   b u i l d   a   l o o k u p   t a b l e   o f   a l l   k n o w n   o p t i o n s
 


 r     


 I     �_
�^�_ (0 _buildoptionstable _buildOptionsTable
 
�]
 o    �\�\ &0 optiondefinitions optionDefinitions�]  �^  
 o      �[�[ 20 optiondefinitionsbyname optionDefinitionsByName
 


 r   	 


 n  	 


 I    �Z�Y�X�Z 0 
dictionary  �Y  �X  
 n  	 


 o   
 �W�W *0 nsmutabledictionary NSMutableDictionary
 m   	 
�V
�V misccura
 o      �U�U (0 asocparametersdict asocParametersDict
 

 
 l   
!
"
#
! r    
$
%
$ m    
&
& �
'
'  =
% n     
(
)
( 1    �T
�T 
txdl
) 1    �S
�S 
ascr
" P J note: a long option can use a space or '=' to separate its name and value   
# �
*
* �   n o t e :   a   l o n g   o p t i o n   c a n   u s e   a   s p a c e   o r   ' = '   t o   s e p a r a t e   i t s   n a m e   a n d   v a l u e
  
+
,
+ l   �R
-
.�R  
- R L consume raw arguments list until it is empty or a non-option is encountered   
. �
/
/ �   c o n s u m e   r a w   a r g u m e n t s   l i s t   u n t i l   i t   i s   e m p t y   o r   a   n o n - o p t i o n   i s   e n c o u n t e r e d
, 
0
1
0 W   h
2
3
2 k   "c
4
4 
5
6
5 r   " (
7
8
7 n   " &
9
:
9 4  # &�Q
;
�Q 
cobj
; m   $ %�P�P 
: o   " #�O�O 0 rawarguments rawArguments
8 o      �N�N 0 thearg theArg
6 
<
=
< Z   ) 
>
?
@
A
> C   ) ,
B
C
B o   ) *�M�M 0 thearg theArg
C m   * +
D
D �
E
E  - -
? l  / m
F
G
H
F k   / m
I
I 
J
K
J Z   / @
L
M�L�K
L =  / 2
N
O
N o   / 0�J�J 0 thearg theArg
O m   0 1
P
P �
Q
Q  - -
M l  5 <
R
S
T
R k   5 <
U
U 
V
W
V r   5 :
X
Y
X n   5 8
Z
[
Z 1   6 8�I
�I 
rest
[ o   5 6�H�H 0 rawarguments rawArguments
Y o      �G�G 0 rawarguments rawArguments
W 
\�F
\  S   ; <�F  
S i c double-hypens terminates the option list, so anything left in rawArguments is positional arguments   
T �
]
] �   d o u b l e - h y p e n s   t e r m i n a t e s   t h e   o p t i o n   l i s t ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s�L  �K  
K 
^
_
^ l  A G
`
a
b
` r   A G
c
d
c n   A E
e
f
e 4  B E�E
g
�E 
citm
g m   C D�D�D 
f o   A B�C�C 0 thearg theArg
d o      �B�B 0 
optionname 
optionName
a   get "--NAME"   
b �
h
h    g e t   " - - N A M E "
_ 
i�A
i Z   H m
j
k�@
l
j ?   H Q
m
n
m l  H O
o�?�>
o I  H O�=
p
q
�= .corecnte****       ****
p o   H I�<�< 0 thearg theArg
q �;
r�:
�; 
kocl
r m   J K�9
�9 
citm�:  �?  �>  
n m   O P�8�8 
k l  T e
s
t
u
s r   T e
v
w
v n   T `
x
y
x 7  U `�7
z
{
�7 
ctxt
z l  Y \
|�6�5
| 4   Y \�4
}
�4 
citm
} m   Z [�3�3 �6  �5  
{ m   ] _�2�2��
y o   T U�1�1 0 thearg theArg
w n      
~

~ 4  a d�0
�
�0 
cobj
� m   b c�/�/ 
 o   ` a�.�. 0 rawarguments rawArguments
t * $ put "VALUE" back on stack for later   
u �
�
� H   p u t   " V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r�@  
l l  h m
�
�
�
� r   h m
�
�
� n   h k
�
�
� 1   i k�-
�- 
rest
� o   h i�,�, 0 rawarguments rawArguments
� o      �+�+ 0 rawarguments rawArguments
� ( " remove the option name from stack   
� �
�
� D   r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k�A  
G < 6 found "--[NAME[=VALUE]]" (NAME is a long option name)   
H �
�
� l   f o u n d   " - - [ N A M E [ = V A L U E ] ] "   ( N A M E   i s   a   l o n g   o p t i o n   n a m e )
@ 
�
�
� C   p s
�
�
� o   p q�*�* 0 thearg theArg
� m   q r
�
� �
�
�  -
� 
��)
� l  v �
�
�
�
� k   v �
�
� 
�
�
� l  v �
�
�
�
� Z  v �
�
��(�'
� G   v �
�
�
� =  v {
�
�
� o   v w�&�& 0 thearg theArg
� m   w z
�
� �
�
�  -
� E  ~ �
�
�
� m   ~ �
�
� �
�
�  0 1 2 3 4 5 6 7 8 9 0
� n  � �
�
�
� 4   � ��%
�
�% 
cha 
� m   � ��$�$ 
� o   � ��#�# 0 thearg theArg
�  S   � ��(  �'  
� � { it's a lone hyphen or a negative number (i.e. not an option), so treat it and rest of rawArguments as positional arguments   
� �
�
� �   i t ' s   a   l o n e   h y p h e n   o r   a   n e g a t i v e   n u m b e r   ( i . e .   n o t   a n   o p t i o n ) ,   s o   t r e a t   i t   a n d   r e s t   o f   r a w A r g u m e n t s   a s   p o s i t i o n a l   a r g u m e n t s
� 
�
�
� l  � �
�
�
�
� r   � �
�
�
� n   � �
�
�
� 7  � ��"
�
�
�" 
ctxt
� m   � ��!�! 
� m   � �� �  
� o   � ��� 0 thearg theArg
� o      �� 0 
optionname 
optionName
�  	 get "-N"   
� �
�
�    g e t   " - N "
� 
��
� Z   � �
�
��
�
� ?   � �
�
�
� n  � �
�
�
� 1   � ��
� 
leng
� o   � ��� 0 thearg theArg
� m   � ��� 
� l  � �
�
�
�
� k   � �
�
� 
�
�
� r   � �
�
�
� n   � �
�
�
� 7  � ��
�
�
� 
ctxt
� m   � ��� 
� m   � �����
� o   � ��� 0 thearg theArg
� n      
�
�
� 4  � ��
�
� 
cobj
� m   � ��� 
� o   � ��� 0 rawarguments rawArguments
� 
�
�
� r   � �
�
�
� n  � �
�
�
� I   � ��
��� 0 objectforkey_ objectForKey_
� 
��
� o   � ��� 0 
optionname 
optionName�  �  
� o   � ��� 20 optiondefinitionsbyname optionDefinitionsByName
� o      �� $0 optiondefinition optionDefinition
� 
��
� Z   � �
�
��
�	
� F   � �
�
�
� >  � �
�
�
� o   � ��� $0 optiondefinition optionDefinition
� m   � ��
� 
msng
� =  � �
�
�
� n  � �
�
�
� o   � ��� 0 	valuetype 	valueType
� l  � �
���
� c   � �
�
�
� o   � ��� $0 optiondefinition optionDefinition
� m   � ��
� 
****�  �  
� m   � ��
� 
bool
� r   � �
�
�
� b   � �
�
�
� m   � �
�
� �
�
�  -
� n   � �
�
�
� 4  � �� 
�
�  
cobj
� m   � ����� 
� o   � ����� 0 rawarguments rawArguments
� n      
�
�
� 4  � ���
�
�� 
cobj
� m   � ����� 
� o   � ����� 0 rawarguments rawArguments�
  �	  �  
� / ) put "[-N�]VALUE" back on stack for later   
� �
�
� R   p u t   " [ - N & ] V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r�  
� l  � �
�
�
�
� r   � �
�
�
� n   � �
�
�
� 1   � ���
�� 
rest
� o   � ����� 0 rawarguments rawArguments
� o      ���� 0 rawarguments rawArguments
� ' !remove the option name from stack   
� �
�
� B r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k�  
� H B found "-N[N�][VALUE]" (N is a single-character short option name)   
� �
�
� �   f o u n d   " - N [ N & ] [ V A L U E ] "   ( N   i s   a   s i n g l e - c h a r a c t e r   s h o r t   o p t i o n   n a m e )�)  
A l  � 
�
�
�
�  S   � 
� S M not an option name, so anything left in rawArguments is positional arguments   
� �
�
� �   n o t   a n   o p t i o n   n a m e ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s
= 
�
�
� l �� ��    - ' look up the option's definition record    � N   l o o k   u p   t h e   o p t i o n ' s   d e f i n i t i o n   r e c o r d
�  r  	 n  I  ��	���� 0 objectforkey_ objectForKey_	 
��
 o  ���� 0 
optionname 
optionName��  ��   o  ���� 20 optiondefinitionsbyname optionDefinitionsByName o      ���� $0 optiondefinition optionDefinition  Z  
����� = 
 o  
���� $0 optiondefinition optionDefinition m  ��
�� 
msng l � k  �  Z  t���� o  ���� &0 hasdefaultoptions hasDefaultOptions k  p  r  ? J  0   E "!"! J  ## $%$ m  && �''  - h% (��( m  )) �**  - - h e l p��  " J  !++ ,��, o  ���� 0 
optionname 
optionName��    -��- E "../. J  "*00 121 m  "%33 �44  - v2 5��5 m  %(66 �77  - - v e r s i o n��  / J  *-88 9��9 o  *+���� 0 
optionname 
optionName��  ��   J      :: ;<; o      ���� 0 ishelp isHelp< =��= o      ���� 0 	isversion 	isVersion��   >��> Z  @p?@����? G  @IABA o  @A���� 0 ishelp isHelpB o  DE���� 0 	isversion 	isVersion@ l LlCDEC k  LlFF GHG n LQIJI I  MQ�������� $0 removeallobjects removeAllObjects��  ��  J o  LM���� (0 asocparametersdict asocParametersDictH KLK n R[MNM I  S[��O���� $0 setvalue_forkey_ setValue_forKey_O PQP o  ST���� 0 ishelp isHelpQ R��R m  TWSS �TT  h e l p��  ��  N o  RS���� (0 asocparametersdict asocParametersDictL UVU n \eWXW I  ]e��Y���� $0 setvalue_forkey_ setValue_forKey_Y Z[Z o  ]^���� 0 	isversion 	isVersion[ \��\ m  ^a]] �^^  v e r s i o n��  ��  X o  \]���� (0 asocparametersdict asocParametersDictV _`_ r  fjaba J  fh����  b o      ���� 0 rawarguments rawArguments` c��c  S  kl��  D  � ignore everything else and return a minimal record containing only `help` and `version` properties, one or both of which are true, so must be dealt with accordingly by `run` handler (i.e. format+log help text and return and/or return version number)   E �dd�   i g n o r e   e v e r y t h i n g   e l s e   a n d   r e t u r n   a   m i n i m a l   r e c o r d   c o n t a i n i n g   o n l y   ` h e l p `   a n d   ` v e r s i o n `   p r o p e r t i e s ,   o n e   o r   b o t h   o f   w h i c h   a r e   t r u e ,   s o   m u s t   b e   d e a l t   w i t h   a c c o r d i n g l y   b y   ` r u n `   h a n d l e r   ( i . e .   f o r m a t + l o g   h e l p   t e x t   a n d   r e t u r n   a n d / o r   r e t u r n   v e r s i o n   n u m b e r )��  ��  ��  ��  ��   e��e R  u���fg
�� .ascrerr ****      � ****f b  �hih m  �jj �kk   U n k n o w n   o p t i o n :  i o  ������ 0 
optionname 
optionNameg ��l��
�� 
errnl o  y~����  0 _argvusererror _ArgvUserError��  ��   A ; check for default options (help/version), else raise error    �mm v   c h e c k   f o r   d e f a u l t   o p t i o n s   ( h e l p / v e r s i o n ) ,   e l s e   r a i s e   e r r o r��  ��   non r  ��pqp c  ��rsr o  ������ $0 optiondefinition optionDefinitions m  ����
�� 
****q o      ���� $0 optiondefinition optionDefinitiono tut r  ��vwv n ��xyx o  ������ 0 propertyname propertyNamey o  ������ $0 optiondefinition optionDefinitionw o      ���� 0 propertyname propertyNameu z{z l ����|}��  | #  now process the option value   } �~~ :   n o w   p r o c e s s   t h e   o p t i o n   v a l u e{ � Z  ������� = ����� n ����� o  ������ 0 	valuetype 	valueType� o  ������ $0 optiondefinition optionDefinition� m  ����
�� 
bool� Q  ������ r  ����� H  ���� n ����� o  ������ 0 defaultvalue defaultValue� o  ������ $0 optiondefinition optionDefinition� o      ���� 0 thevalue theValue� R      ������
�� .ascrerr ****      � ****��  ��  � R  ������
�� .ascrerr ****      � ****� b  ����� m  ���� ��� J B a d   d e f a u l t V a l u e   f o r   b o o l e a n   o p t i o n :  � o  ������ 0 
optionname 
optionName� ����
�� 
errn� m  �������\� �����
�� 
erob� l �������� N  ���� n  ����� o  ������ 0 defaultvalue defaultValue� o  ������ $0 optiondefinition optionDefinition��  ��  ��  ��  � k  ��� ��� Z ��������� = ����� o  ������ 0 rawarguments rawArguments� J  ������  � R  ������
�� .ascrerr ****      � ****� b  ����� m  ���� ��� 4 M i s s i n g   v a l u e   f o r   o p t i o n :  � o  ������ 0 
optionname 
optionName� �����
�� 
errn� o  ������  0 _argvusererror _ArgvUserError��  ��  ��  � ��� r  ����� I  ��������� 0 _unpackvalue _unpackValue� ��� n  ����� 4 �����
�� 
cobj� m  ������ � o  ������ 0 rawarguments rawArguments� ���� o  ������ $0 optiondefinition optionDefinition��  ��  � o      ���� 0 thevalue theValue� ���� r  ���� n  ���� 1  ���
�� 
rest� o  ������ 0 rawarguments rawArguments� o      ���� 0 rawarguments rawArguments��  � ��� Z  [������ n 
��� o  	���� 0 islist isList� o  ���� $0 optiondefinition optionDefinition� l 7���� k  7�� ��� r  ��� n ��� I  ������� 0 objectforkey_ objectForKey_� ���� o  ���� 0 propertyname propertyName��  ��  � o  ���� (0 asocparametersdict asocParametersDict� o      ���� 0 thelist theList� ���� Z  7������ = ��� o  ���� 0 thelist theList� m  ��
�� 
msng� r  *��� n (��� I  #(������� $0 arraywithobject_ arrayWithObject_� ���� o  #$���� 0 thevalue theValue��  ��  � n #��� o  #����  0 nsmutablearray NSMutableArray� m  ��
�� misccura� o      ���� 0 thevalue theValue��  � k  -7�� ��� n -3��� I  .3���~� 0 
addobject_ 
addObject_� ��}� o  ./�|�| 0 thevalue theValue�}  �~  � o  -.�{�{ 0 thelist theList� ��z� r  47��� o  45�y�y 0 thelist theList� o      �x�x 0 thevalue theValue�z  ��  � = 7 option can appear multiple times, so collect in a list   � ��� n   o p t i o n   c a n   a p p e a r   m u l t i p l e   t i m e s ,   s o   c o l l e c t   i n   a   l i s t� ��� > :D��� l :@��w�v� n :@��� I  ;@�u��t�u 0 objectforkey_ objectForKey_� ��s� o  ;<�r�r 0 propertyname propertyName�s  �t  � o  :;�q�q (0 asocparametersdict asocParametersDict�w  �v  � m  @C�p
�p 
msng� ��o� R  GW�n��
�n .ascrerr ****      � ****� b  QV��� m  QT�� ��� $ D u p l i c a t e   o p t i o n :  � o  TU�m�m 0 
optionname 
optionName� �l��k
�l 
errn� o  KP�j�j  0 _argvusererror _ArgvUserError�k  �o  ��  � ��i� n \c��� I  ]c�h��g�h &0 setobject_forkey_ setObject_forKey_� ��� o  ]^�f�f 0 thevalue theValue� ��e� o  ^_�d�d 0 propertyname propertyName�e  �g  � o  \]�c�c (0 asocparametersdict asocParametersDict�i  
3 =   !� � o    �b�b 0 rawarguments rawArguments  J     �a�a  
1 �` L  in J  im  o  ij�_�_ (0 asocparametersdict asocParametersDict �^ o  jk�]�] 0 rawarguments rawArguments�^  �`  	�  l     �\�[�Z�\  �[  �Z   	
	 l     �Y�X�W�Y  �X  �W  
  i  ~ � I      �V�U�V (0 _adddefaultoptions _addDefaultOptions  o      �T�T (0 asocparametersdict asocParametersDict �S o      �R�R &0 optiondefinitions optionDefinitions�S  �U   k     �  X     ��Q k    �  r    " b      l   �P�O c     !  o    �N�N 0 recref recRef! m    �M
�M 
reco�P  �O   K    "" �L#$�L 0 propertyname propertyName# m    %% �&&  $ �K'(�K 0 longname longName' m    )) �**  ( �J+�I�J 0 defaultvalue defaultValue+ o    �H�H 0 novalue NoValue�I   o      �G�G 0 rec   ,-, r   # (./. n  # &010 o   $ &�F�F 0 propertyname propertyName1 o   # $�E�E 0 rec  / o      �D�D 0 propertyname propertyName- 232 Z  ) 845�C�B4 =  ) ,676 o   ) *�A�A 0 propertyname propertyName7 m   * +88 �99  5 r   / 4:;: n  / 2<=< o   0 2�@�@ 0 longname longName= o   / 0�?�? 0 rec  ; o      �>�> 0 propertyname propertyName�C  �B  3 >�=> Z   9 �?@�<�;? =  9 AABA l  9 ?C�:�9C n  9 ?DED I   : ?�8F�7�8 0 objectforkey_ objectForKey_F G�6G o   : ;�5�5 0 propertyname propertyName�6  �7  E o   9 :�4�4 (0 asocparametersdict asocParametersDict�:  �9  B m   ? @�3
�3 
msng@ k   D �HH IJI r   D IKLK n  D GMNM o   E G�2�2 0 defaultvalue defaultValueN o   D E�1�1 0 rec  L o      �0�0 0 thevalue theValueJ OPO Z   J �QR�/�.Q =  J QSTS o   J K�-�- 0 thevalue theValueT o   K P�,�, 0 novalue NoValueR l  T �UVWU k   T �XX YZY r   T [[\[ b   T Y]^] m   T U__ �``  - -^ n  U Xaba o   V X�+�+ 0 longname longNameb o   U V�*�* 0 rec  \ o      �)�) 0 
optionname 
optionNameZ cdc Z  \ oef�(�'e =  \ _ghg o   \ ]�&�& 0 
optionname 
optionNameh m   ] ^ii �jj  - -f r   b kklk b   b imnm m   b coo �pp  -n n  c hqrq o   d h�%�% 0 	shortname 	shortNamer o   c d�$�$ 0 rec  l o      �#�# 0 
optionname 
optionName�(  �'  d s�"s R   p ��!tu
�! .ascrerr ****      � ****t b   z vwv m   z }xx �yy 2 M i s s i n g   r e q u i r e d   o p t i o n :  w o   } ~� �  0 
optionname 
optionNameu �z�
� 
errnz o   t y��  0 _argvusererror _ArgvUserError�  �"  V 2 , record doesn't have a defaultValue property   W �{{ X   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y�/  �.  P |}| Z  � �~��~ =  � ���� o   � ��� 0 thevalue theValue� m   � ��
� 
msng r   � ���� n  � ���� I   � ����� 0 null  �  �  � n  � ���� o   � ��� 0 nsnull NSNull� m   � ��
� misccura� o      �� 0 thevalue theValue�  �  } ��� l  � ����� n  � ���� I   � ����� &0 setobject_forkey_ setObject_forKey_� ��� o   � ��� 0 thevalue theValue� ��� o   � ��� 0 propertyname propertyName�  �  � o   � ��
�
 (0 asocparametersdict asocParametersDict�  �  �  �<  �;  �=  �Q 0 recref recRef o    �	�	 &0 optiondefinitions optionDefinitions ��� l  � �����  � k e add default 'help', 'version' properties to parameters dict (record) if not already supplied by user   � ��� �   a d d   d e f a u l t   ' h e l p ' ,   ' v e r s i o n '   p r o p e r t i e s   t o   p a r a m e t e r s   d i c t   ( r e c o r d )   i f   n o t   a l r e a d y   s u p p l i e d   b y   u s e r� ��� X   � ����� Z  � ������ =  � ���� l  � ����� n  � ���� I   � ���� � 0 objectforkey_ objectForKey_� ���� l  � ������� n  � ���� 1   � ���
�� 
pcnt� o   � ����� "0 propertynameref propertyNameRef��  ��  ��  �   � o   � ����� (0 asocparametersdict asocParametersDict�  �  � m   � ���
�� 
msng� l  � ������� n  � ���� I   � �������� &0 setobject_forkey_ setObject_forKey_� ��� m   � ���
�� boovfals� ���� l  � ������� n  � ���� 1   � ���
�� 
pcnt� o   � ����� "0 propertynameref propertyNameRef��  ��  ��  ��  � o   � ����� (0 asocparametersdict asocParametersDict��  ��  �  �  � "0 propertynameref propertyNameRef� J   � ��� ��� m   � ��� ���  h e l p� ���� m   � ��� ���  v e r s i o n��  �   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I      �������  0 _ordinalnumber _ordinalNumber� ���� o      ���� 0 n  ��  ��  � Z     7������ F     ��� E    ��� J     �� ��� m     ���� � ��� m    ���� � ���� m    ���� ��  � J    
�� ���� `    ��� o    ���� 0 n  � m    ���� 
��  � H    �� E   ��� J    �� ��� m    ���� � ��� m    ���� � ���� m    ���� ��  � J    �� ���� `    ��� o    ���� 0 n  � m    ���� d��  � L    .�� b    -��� l   "������ c    "��� o     ���� 0 n  � m     !��
�� 
ctxt��  ��  � n   " ,��� 4   ' ,���
�� 
cobj� l  ( +������ `   ( +��� o   ( )���� 0 n  � m   ) *���� 
��  ��  � J   " '�� ��� m   " #�� ���  s t� ��� m   # $�� ���  n d� ���� m   $ %�� ���  r d��  ��  � L   1 7�� b   1 6��� l  1 4������ c   1 4��� o   1 2���� 0 n  � m   2 3��
�� 
ctxt��  ��  � m   4 5   �  t h�  l     ��������  ��  ��    l     ��������  ��  ��    i  � �	 I      ��
���� "0 _parsearguments _parseArguments
  o      ���� 0 argumentslist argumentsList  o      ���� *0 argumentdefinitions argumentDefinitions �� o      ���� (0 asocparametersdict asocParametersDict��  ��  	 k    �  l     ����   q k parse the remaining raw arguments, converting to the required type and adding to the parameters dictionary    � �   p a r s e   t h e   r e m a i n i n g   r a w   a r g u m e n t s ,   c o n v e r t i n g   t o   t h e   r e q u i r e d   t y p e   a n d   a d d i n g   t o   t h e   p a r a m e t e r s   d i c t i o n a r y  r      m     ����   o      ���� 0 i    r    	 n    1    ��
�� 
leng o    ���� 0 argumentslist argumentsList o      ���� 0 argcount argCount  !  l  
 "#$" r   
 %&% m   
 ��
�� boovfals& o      ����  0 mustbeoptional mustBeOptional# � � repeat loop will throw invalid argument definition error if an optional argument definition is followed by a required argument definition   $ �''   r e p e a t   l o o p   w i l l   t h r o w   i n v a l i d   a r g u m e n t   d e f i n i t i o n   e r r o r   i f   a n   o p t i o n a l   a r g u m e n t   d e f i n i t i o n   i s   f o l l o w e d   b y   a   r e q u i r e d   a r g u m e n t   d e f i n i t i o n! ()( X   k*��+* k   f,, -.- r    #/0/ [    !121 o    ���� 0 i  2 m     ���� 0 o      ���� 0 i  . 343 r   $ <565 b   $ :787 l  $ )9����9 c   $ ):;: n  $ '<=< 1   % '��
�� 
pcnt= o   $ %���� 0 argref argRef; m   ' (��
�� 
reco��  ��  8 K   ) 9>> ��?@�� 0 propertyname propertyName? m   * +AA �BB  @ ��CD�� 0 	valuetype 	valueTypeC m   , -��
�� 
ctxtD ��EF�� 0 islist isListE m   . /��
�� boovfalsF ��GH�� 0 defaultvalue defaultValueG o   0 5���� 0 novalue NoValueH ��I���� $0 valueplaceholder valuePlaceholderI m   6 7JJ �KK  ��  6 o      ���� (0 argumentdefinition argumentDefinition4 LML Z   = wNOP��N >  = FQRQ n  = @STS o   > @���� 0 defaultvalue defaultValueT o   = >���� (0 argumentdefinition argumentDefinitionR o   @ E���� 0 novalue NoValueO r   I LUVU m   I J��
�� boovtrueV o      ����  0 mustbeoptional mustBeOptionalP WXW F   O ^YZY o   O P����  0 mustbeoptional mustBeOptionalZ =  S \[\[ n  S V]^] o   T V���� 0 defaultvalue defaultValue^ o   S T���� (0 argumentdefinition argumentDefinition\ o   V [���� 0 novalue NoValueX _��_ R   a s��`a
�� .ascrerr ****      � ****` m   o rbb �cc � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( a   n o n - o p t i o n a l   a r g u m e n t   c a n n o t   f o l l o w   a n   o p t i o n a l   a r g u m e n t ) .a ��de
�� 
errnd m   e h�����Ye ��f��
�� 
erobf o   k l���� 0 argref argRef��  ��  ��  M ghg Z  x �ij����i =  x klk n  x {mnm o   y {���� 0 propertyname propertyNamen o   x y���� (0 argumentdefinition argumentDefinitionl m   { ~oo �pp  j R   � ���qr
�� .ascrerr ****      � ****q m   � �ss �tt � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y   p r o p e r t y N a m e   p r o p e r t y ) .r ��uv
�� 
errnu m   � ������Yv ��w�
�� 
erobw o   � ��~�~ 0 argref argRef�  ��  ��  h xyx Z   �z{�}|z =   � �}~} o   � ��|�| 0 argumentslist argumentsList~ J   � ��{�{  { k   � � ��� r   � ���� n  � ���� o   � ��z�z 0 defaultvalue defaultValue� o   � ��y�y (0 argumentdefinition argumentDefinition� o      �x�x 0 thevalue theValue� ��w� Z   � ����v�u� =  � ���� o   � ��t�t 0 thevalue theValue� o   � ��s�s 0 novalue NoValue� l  � ����� k   � ��� ��� r   � ���� n  � ���� o   � ��r�r $0 valueplaceholder valuePlaceholder� o   � ��q�q (0 argumentdefinition argumentDefinition� o      �p�p "0 placeholdertext placeholderText� ��� Z  � ����o�n� =   � ���� n  � ���� 1   � ��m
�m 
leng� o   � ��l�l "0 placeholdertext placeholderText� m   � ��k�k  � r   � ���� I   � ��j��i�j 40 _defaultvalueplaceholder _defaultValuePlaceholder� ��h� o   � ��g�g (0 argumentdefinition argumentDefinition�h  �i  � o      �f�f "0 placeholdertext placeholderText�o  �n  � ��e� R   � ��d��
�d .ascrerr ****      � ****� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ���  M i s s i n g  � I   � ��c��b�c  0 _ordinalnumber _ordinalNumber� ��a� o   � ��`�` 0 i  �a  �b  � m   � ��� ��� :   r e q u i r e d   a r g u m e n t   ( e x p e c t e d  � o   � ��_�_ "0 placeholdertext placeholderText� m   � ��� ���  ) .� �^��]
�^ 
errn� o   � ��\�\  0 _argvusererror _ArgvUserError�]  �e  � W Q record doesn't have a defaultValue property, so user should've supplied argument   � ��� �   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y ,   s o   u s e r   s h o u l d ' v e   s u p p l i e d   a r g u m e n t�v  �u  �w  �}  | k   ��� ��� r   � ���� I   � ��[��Z�[ 0 _unpackvalue _unpackValue� ��� n   � ���� 4  � ��Y�
�Y 
cobj� m   � ��X�X � o   � ��W�W 0 argumentslist argumentsList� ��V� o   � ��U�U (0 argumentdefinition argumentDefinition�V  �Z  � o      �T�T 0 thevalue theValue� ��S� r   ���� n   ���� 1   ��R
�R 
rest� o   � ��Q�Q 0 argumentslist argumentsList� o      �P�P 0 argumentslist argumentsList�S  y ��� Z  \���O�N� n 
��� o  	�M�M 0 islist isList� o  �L�L (0 argumentdefinition argumentDefinition� k  X�� ��� Z +���K�J� A  ��� o  �I�I 0 i  � n  ��� 1  �H
�H 
leng� o  �G�G *0 argumentdefinitions argumentDefinitions� R  '�F��
�F .ascrerr ****      � ****� m  #&�� ��� � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( o n l y   t h e   l a s t   a r g u m e n t   d e f i n i t i o n   m a y   c o n t a i n   a n    i s L i s t : t r u e    p r o p e r t y ) .� �E��
�E 
errn� m  �D�D�Y� �C��B
�C 
erob� o   �A�A 0 argref argRef�B  �K  �J  � ��� r  ,1��� J  ,/�� ��@� o  ,-�?�? 0 thevalue theValue�@  � o      �>�> 0 thevalue theValue� ��� X  2S��=�� r  BN��� I  BK�<��;�< 0 _unpackvalue _unpackValue� ��� n CF��� 1  DF�:
�: 
pcnt� o  CD�9�9 0 aref aRef� ��8� o  FG�7�7 (0 argumentdefinition argumentDefinition�8  �;  � n      ���  ;  LM� o  KL�6�6 0 thevalue theValue�= 0 aref aRef� o  56�5�5 0 argumentslist argumentsList� ��4� r  TX��� J  TV�3�3  � o      �2�2 0 argumentslist argumentsList�4  �O  �N  � ��1� l ]f��0�/� n ]f��� I  ^f�.��-�. &0 setobject_forkey_ setObject_forKey_� ��� o  ^_�,�, 0 thevalue theValue� ��+� l _b��*�)� n _b��� o  `b�(�( 0 propertyname propertyName� o  _`�'�' (0 argumentdefinition argumentDefinition�*  �)  �+  �-  � o  ]^�&�& (0 asocparametersdict asocParametersDict�0  �/  �1  �� 0 argref argRef+ o    �%�% *0 argumentdefinitions argumentDefinitions) ��$� Z l� �#�"  > lp o  lm�!�! 0 argumentslist argumentsList J  mo� �    R  s��
� .ascrerr ****      � **** b  }� b  }�	 b  }�

 b  }� m  }� � : T o o   m a n y   a r g u m e n t s   ( e x p e c t e d   n  �� 1  ���
� 
leng o  ���� *0 argumentdefinitions argumentDefinitions m  �� �    b u t   r e c e i v e d  	 o  ���� 0 argcount argCount m  �� �  ) . ��
� 
errn o  w|��  0 _argvusererror _ArgvUserError�  �#  �"  �$    l     ����  �  �    l     ����  �  �    l     ��    -----    � 
 - - - - -  !  l     �"#�  " ) # format built-in help documentation   # �$$ F   f o r m a t   b u i l t - i n   h e l p   d o c u m e n t a t i o n! %&% l     ����  �  �  & '(' i  � �)*) I      �+��  0 _formatoptions _formatOptions+ ,-, o      �� &0 optiondefinitions optionDefinitions- ./. o      �
�
 0 vtstyle vtStyle/ 0�	0 o      �� &0 hasdefaultoptions hasDefaultOptions�	  �  * k    11 232 l     �45�  4 ] W generates OPTIONS section, along with options synopsis for inclusion in autogenerated    5 �66 �   g e n e r a t e s   O P T I O N S   s e c t i o n ,   a l o n g   w i t h   o p t i o n s   s y n o p s i s   f o r   i n c l u s i o n   i n   a u t o g e n e r a t e d  3 787 Z    9:��9 F     ;<; =    =>= o     �� &0 optiondefinitions optionDefinitions> J    ��  < H    	?? o    �� &0 hasdefaultoptions hasDefaultOptions: L    @@ J    AA BCB m    DD �EE  C F�F m    GG �HH  �  �  �  8 IJI r    3KLK J    MM NON m    PP �QQ  O RSR m    TT �UU  S V� V m    WW �XX  �   L J      YY Z[Z o      ����  0 defaultoptions defaultOptions[ \]\ o      ����  0 booleanoptions booleanOptions] ^��^ o      ���� 0 otheroptions otherOptions��  J _`_ r   4 ?aba b   4 =cdc b   4 9efe n  4 7ghg o   5 7���� 0 b  h o   4 5���� 0 vtstyle vtStylef m   7 8ii �jj  O P T I O N Sd n  9 <klk o   : <���� 0 n  l o   9 :���� 0 vtstyle vtStyleb o      ����  0 optionssection optionsSection` mnm X   @*o��po k   P%qq rsr r   P ~tut b   P |vwv l  P Sx����x c   P Syzy o   P Q���� 0 	optionref 	optionRefz m   Q R��
�� 
reco��  ��  w K   S {{{ ��|}�� 0 	shortname 	shortName| m   T U~~ �  } ������ 0 longname longName� m   V Y�� ���  � ������ 0 	valuetype 	valueType� m   \ _��
�� 
ctxt� ������ 0 islist isList� m   b c��
�� boovfals� ������ 0 defaultvalue defaultValue� o   f k���� 0 novalue NoValue� ������ $0 valueplaceholder valuePlaceholder� m   n q�� ���  � ������� $0 valuedescription valueDescription� m   t w�� ���  ��  u o      ���� $0 optiondefinition optionDefinitions ��� Q    ����� k   � ��� ��� r   � ���� c   � ���� n  � ���� o   � ����� 0 	shortname 	shortName� o   � ����� $0 optiondefinition optionDefinition� m   � ���
�� 
ctxt� o      ���� 0 	shortname 	shortName� ��� r   � ���� c   � ���� n  � ���� o   � ����� 0 longname longName� o   � ����� $0 optiondefinition optionDefinition� m   � ���
�� 
ctxt� o      ���� 0 longname longName� ��� r   � ���� c   � ���� n  � ���� o   � ����� 0 	valuetype 	valueType� o   � ����� $0 optiondefinition optionDefinition� m   � ���
�� 
type� o      ���� 0 	valuetype 	valueType� ��� r   � ���� c   � ���� n  � ���� o   � ����� 0 islist isList� o   � ����� $0 optiondefinition optionDefinition� m   � ���
�� 
bool� o      ���� 0 islist isList� ��� r   � ���� c   � ���� n  � ���� o   � ����� $0 valueplaceholder valuePlaceholder� o   � ����� $0 optiondefinition optionDefinition� m   � ���
�� 
ctxt� o      ���� $0 valueplaceholder valuePlaceholder� ���� r   � ���� c   � ���� n  � ���� o   � ����� $0 valuedescription valueDescription� o   � ����� $0 optiondefinition optionDefinition� m   � ���
�� 
ctxt� o      ���� $0 valuedescription valueDescription��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � n  � ���� I   � �������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o   � ����� &0 optiondefinitions optionDefinitions� ��� m   � ��� ���  o p t i o n s� ��� m   � ���
�� 
reco� ���� m   � ��� ��� ` l i s t   o f    c o m m a n d   l i n e   o p t i o n   d e f i n i t i o n    r e c o r d s��  ��  � o   � ����� 0 _support  � ��� r   � ���� b   � ���� b   � ���� o   � �����  0 optionssection optionsSection� o   � ����� 
0 lf2 LF2� o   � ����� 0 indent1 Indent1� o      ����  0 optionssection optionsSection� ��� Z   �I������ =  � ���� o   � ����� 0 	shortname 	shortName� m   � ��� ���  � k   �#�� ��� Z  �������� =  � ���� o   � ����� 0 longname longName� m   � ��� ���  � R   �����
�� .ascrerr ****      � ****� m  �� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .� ����
�� 
errn� m  �����Y� �����
�� 
erob� o  	
���� 0 	optionref 	optionRef��  ��  ��  � ��� r  ��� o  ���� 0 longname longName� o      ���� 0 
optionname 
optionName� ���� r  #��� b  !� � b   o  ����  0 optionssection optionsSection m   �  - -  o   ���� 0 longname longName� o      ����  0 optionssection optionsSection��  ��  � k  &I  r  &)	 o  &'���� 0 	shortname 	shortName	 o      ���� 0 
optionname 
optionName 

 r  *3 b  *1 b  */ o  *+����  0 optionssection optionsSection m  +. �  - o  /0���� 0 	shortname 	shortName o      ����  0 optionssection optionsSection �� Z 4I���� > 49 o  45���� 0 longname longName m  58 �   r  <E b  <C b  <A  o  <=����  0 optionssection optionsSection  m  =@!! �""  ,   - - o  AB���� 0 longname longName o      ����  0 optionssection optionsSection��  ��  ��  � #$# Z  J%&��'% = JM()( o  JK���� 0 	valuetype 	valueType) m  KL��
�� 
bool& l PU*+,* r  PU-.- b  PS/0/ o  PQ����  0 booleanoptions booleanOptions0 o  QR���� 0 
optionname 
optionName. o      ����  0 booleanoptions booleanOptions+ ) # group all boolean flags as "[-N�]"   , �11 F   g r o u p   a l l   b o o l e a n   f l a g s   a s   " [ - N & ] "��  ' k  X22 343 r  Xg565 > Xc787 n X]9:9 o  Y]���� 0 defaultvalue defaultValue: o  XY���� $0 optiondefinition optionDefinition8 o  ]b���� 0 novalue NoValue6 o      ���� 0 
isoptional 
isOptional4 ;<; r  ho=>= b  hm?@? o  hi���� 0 otheroptions otherOptions@ 1  il��
�� 
spac> o      ���� 0 otheroptions otherOptions< ABA Z p�CD����C o  ps���� 0 
isoptional 
isOptionalD r  v}EFE b  v{GHG o  vw���� 0 otheroptions otherOptionsH m  wzII �JJ  [F o      ���� 0 otheroptions otherOptions��  ��  B KLK r  ��MNM b  ��OPO b  ��QRQ o  ������ 0 otheroptions otherOptionsR m  ��SS �TT  -P o  ������ 0 
optionname 
optionNameN o      ���� 0 otheroptions otherOptionsL UVU r  ��WXW o  ������ $0 valueplaceholder valuePlaceholderX o      ���� $0 valueplaceholder valuePlaceholderV YZY Z ��[\����[ = ��]^] o  ������ $0 valueplaceholder valuePlaceholder^ m  ��__ �``  \ r  ��aba I  ����c���� 40 _defaultvalueplaceholder _defaultValuePlaceholderc d��d o  ������ $0 optiondefinition optionDefinition��  ��  b o      ���� $0 valueplaceholder valuePlaceholder��  ��  Z efe r  ��ghg b  ��iji b  ��klk n ��mnm o  ������ 0 u  n o  ������ 0 vtstyle vtStylel o  ���� $0 valueplaceholder valuePlaceholderj n ��opo o  ���~�~ 0 n  p o  ���}�} 0 vtstyle vtStyleh o      �|�| $0 valueplaceholder valuePlaceholderf qrq r  ��sts b  ��uvu b  ��wxw o  ���{�{ 0 otheroptions otherOptionsx 1  ���z
�z 
spacv o  ���y�y $0 valueplaceholder valuePlaceholdert o      �x�x 0 otheroptions otherOptionsr yzy Z ��{|�w�v{ o  ���u�u 0 
isoptional 
isOptional| r  ��}~} b  ��� o  ���t�t 0 otheroptions otherOptions� m  ���� ���  ]~ o      �s�s 0 otheroptions otherOptions�w  �v  z ��� r  ����� b  ����� b  ����� o  ���r�r  0 optionssection optionsSection� 1  ���q
�q 
spac� o  ���p�p $0 valueplaceholder valuePlaceholder� o      �o�o  0 optionssection optionsSection� ��� Z �����n�m� > ����� n ����� o  ���l�l 0 defaultvalue defaultValue� o  ���k�k $0 optiondefinition optionDefinition� o  ���j�j 0 novalue NoValue� r  ����� b  ����� o  ���i�i $0 valuedescription valueDescription� I  ���h��g�h *0 _formatdefaultvalue _formatDefaultValue� ��f� o  ���e�e $0 optiondefinition optionDefinition�f  �g  � o      �d�d $0 valuedescription valueDescription�n  �m  � ��c� Z ����b�a� o  ���`�` 0 islist isList� r  ���� b  ����� o  ���_�_ $0 valuedescription valueDescription� m  ���� ��� N T h i s   o p t i o n   c a n   b e   u s e d   m u l t i p l e   t i m e s .� o      �^�^ $0 valuedescription valueDescription�b  �a  �c  $ ��]� Z %���\�[� > ��� o  �Z�Z $0 valuedescription valueDescription� m  
�� ���  � r  !��� b  ��� b  ��� b  ��� b  ��� o  �Y�Y  0 optionssection optionsSection� 1  �X
�X 
lnfd� o  �W�W 0 indent2 Indent2� o  �V�V $0 valuedescription valueDescription� 1  �U
�U 
spac� o      �T�T  0 optionssection optionsSection�\  �[  �]  �� 0 	optionref 	optionRefp o   C D�S�S &0 optiondefinitions optionDefinitionsn ��� l ++�R���R  � � document default -h and -v options as needed (these will appear at bottom of OPTIONS section, which isn't aesthetically ideal but is simplest to implement and avoids messing with the order of the option definitions specified by the shell script's author)   � ����   d o c u m e n t   d e f a u l t   - h   a n d   - v   o p t i o n s   a s   n e e d e d   ( t h e s e   w i l l   a p p e a r   a t   b o t t o m   o f   O P T I O N S   s e c t i o n ,   w h i c h   i s n ' t   a e s t h e t i c a l l y   i d e a l   b u t   i s   s i m p l e s t   t o   i m p l e m e n t   a n d   a v o i d s   m e s s i n g   w i t h   t h e   o r d e r   o f   t h e   o p t i o n   d e f i n i t i o n s   s p e c i f i e d   b y   t h e   s h e l l   s c r i p t ' s   a u t h o r )� ��� Z  +����Q�P� o  +,�O�O &0 hasdefaultoptions hasDefaultOptions� k  /��� ��� Z  /e���N�M� H  /5�� E  /4��� o  /0�L�L  0 booleanoptions booleanOptions� m  03�� ���  h� k  8a�� ��� r  8?��� b  8=��� m  8;�� ���  h� o  ;<�K�K  0 defaultoptions defaultOptions� o      �J�J  0 defaultoptions defaultOptions� ��I� r  @a��� b  @_��� b  @[��� b  @U��� b  @Q��� b  @M��� b  @G��� o  @A�H�H  0 optionssection optionsSection� o  AF�G�G 
0 lf2 LF2� o  GL�F�F 0 indent1 Indent1� m  MP�� ���  - h ,   - - h e l p� 1  QT�E
�E 
lnfd� o  UZ�D�D 0 indent2 Indent2� m  [^�� ��� 2 P r i n t   t h i s   h e l p   a n d   e x i t .� o      �C�C  0 optionssection optionsSection�I  �N  �M  � ��B� Z  f����A�@� H  fl�� E  fk��� o  fg�?�?  0 booleanoptions booleanOptions� m  gj�� ���  v� k  o��� ��� r  ov��� b  ot��� o  op�>�>  0 defaultoptions defaultOptions� m  ps�� ���  v� o      �=�=  0 defaultoptions defaultOptions� ��<� r  w���� b  w���� b  w���� b  w���� b  w���� b  w���� b  w~   o  wx�;�;  0 optionssection optionsSection o  x}�:�: 
0 lf2 LF2� o  ~��9�9 0 indent1 Indent1� m  �� �  - v ,   - - v e r s i o n� 1  ���8
�8 
lnfd� o  ���7�7 0 indent2 Indent2� m  �� � < P r i n t   v e r s i o n   n u m b e r   a n d   e x i t .� o      �6�6  0 optionssection optionsSection�<  �A  �@  �B  �Q  �P  �  r  ��	 m  ��

 �  	 o      �5�5 "0 optionssynopsis optionsSynopsis  Z ���4�3 > �� o  ���2�2  0 defaultoptions defaultOptions m  �� �   r  �� b  �� b  �� b  �� o  ���1�1 "0 optionssynopsis optionsSynopsis m  �� �    [ - o  ���0�0  0 defaultoptions defaultOptions m  �� �  ] o      �/�/ "0 optionssynopsis optionsSynopsis�4  �3    !  Z ��"#�.�-" > ��$%$ o  ���,�,  0 booleanoptions booleanOptions% m  ��&& �''  # r  ��()( b  ��*+* b  ��,-, b  ��./. o  ���+�+ "0 optionssynopsis optionsSynopsis/ m  ��00 �11    [ -- o  ���*�*  0 booleanoptions booleanOptions+ m  ��22 �33  ]) o      �)�) "0 optionssynopsis optionsSynopsis�.  �-  ! 454 Z ��67�(�'6 > ��898 o  ���&�& 0 otheroptions otherOptions9 m  ��:: �;;  7 r  ��<=< b  ��>?> o  ���%�% "0 optionssynopsis optionsSynopsis? o  ���$�$ 0 otheroptions otherOptions= o      �#�# "0 optionssynopsis optionsSynopsis�(  �'  5 @�"@ L  �AA J  �BB CDC o  ���!�! "0 optionssynopsis optionsSynopsisD E� E o  ����  0 optionssection optionsSection�   �"  ( FGF l     ����  �  �  G HIH l     ����  �  �  I JKJ i  � �LML I      �N�� $0 _formatarguments _formatArgumentsN OPO o      �� *0 argumentdefinitions argumentDefinitionsP Q�Q o      �� 0 vtstyle vtStyle�  �  M k    >RR STS Z    UV��U =    WXW o     �� *0 argumentdefinitions argumentDefinitionsX J    ��  V L    YY J    ZZ [\[ m    ]] �^^  \ _�_ m    	`` �aa  �  �  �  T bcb r    ded m    ff �gg  e o      �� &0 argumentssynopsis argumentsSynopsisc hih r     jkj b    lml b    non n   pqp o    �� 0 b  q o    �� 0 vtstyle vtStyleo m    rr �ss  A R G U M E N T Sm n   tut o    �� 0 n  u o    �
�
 0 vtstyle vtStylek o      �	�	 $0 argumentssection argumentsSectioni vwv X   !4x�yx k   1/zz {|{ r   1 M}~} b   1 K� l  1 4���� c   1 4��� o   1 2�� 0 argumentref argumentRef� m   2 3�
� 
reco�  �  � K   4 J�� ���� 0 	valuetype 	valueType� m   5 6�
� 
ctxt� ���� 0 islist isList� m   7 8� 
�  boovfals� ������ 0 defaultvalue defaultValue� o   9 >���� 0 novalue NoValue� ������ $0 valueplaceholder valuePlaceholder� m   ? @�� ���  � ������� $0 valuedescription valueDescription� m   C F�� ���  ��  ~ o      ���� (0 argumentdefinition argumentDefinition| ��� Q   N ����� k   Q v�� ��� r   Q Z��� c   Q X��� n  Q T��� o   R T���� 0 	valuetype 	valueType� o   Q R���� (0 argumentdefinition argumentDefinition� m   T W��
�� 
type� o      ���� 0 	valuetype 	valueType� ��� r   [ d��� c   [ b��� n  [ ^��� o   \ ^���� 0 islist isList� o   [ \���� (0 argumentdefinition argumentDefinition� m   ^ a��
�� 
bool� o      ���� 0 islist isList� ��� r   e l��� c   e j��� n  e h��� o   f h���� $0 valueplaceholder valuePlaceholder� o   e f���� (0 argumentdefinition argumentDefinition� m   h i��
�� 
ctxt� o      ���� $0 valueplaceholder valuePlaceholder� ���� r   m v��� c   m t��� n  m r��� o   n r���� $0 valuedescription valueDescription� o   m n���� (0 argumentdefinition argumentDefinition� m   r s��
�� 
ctxt� o      ���� $0 valuedescription valueDescription��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � n  ~ ���� I   � �������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o   � ����� *0 argumentdefinitions argumentDefinitions� ��� m   � ��� ���  a r g u m e n t s� ��� m   � ���
�� 
reco� ���� m   � ��� ��� d l i s t   o f    c o m m a n d   l i n e   a r g u m e n t   d e f i n i t i o n    r e c o r d s��  ��  � o   ~ ����� 0 _support  � ��� Z  � �������� =  � ���� o   � ����� $0 valueplaceholder valuePlaceholder� m   � ��� ���  � r   � ���� I   � �������� 40 _defaultvalueplaceholder _defaultValuePlaceholder� ���� o   � ����� (0 argumentdefinition argumentDefinition��  ��  � o      ���� $0 valueplaceholder valuePlaceholder��  ��  � ��� Z  � �������� o   � ����� 0 islist isList� r   � ���� b   � ���� o   � ����� $0 valueplaceholder valuePlaceholder� m   � ��� ���    . . .� o      ���� $0 valueplaceholder valuePlaceholder��  ��  � ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ����� $0 argumentssection argumentsSection� o   � ����� 
0 lf2 LF2� o   � ����� 0 indent1 Indent1� n  � ���� o   � ����� 0 u  � o   � ����� 0 vtstyle vtStyle� o   � ����� $0 valueplaceholder valuePlaceholder� n  � ���� o   � ����� 0 n  � o   � ����� 0 vtstyle vtStyle� o      ���� $0 argumentssection argumentsSection� ��� Z  � �������� >  � ���� n  � ���� o   � ����� 0 defaultvalue defaultValue� o   � ����� (0 argumentdefinition argumentDefinition� o   � ����� 0 novalue NoValue� r   � ���� b   � ���� o   � ����� $0 valuedescription valueDescription� I   � �������� *0 _formatdefaultvalue _formatDefaultValue� ���� o   � ����� (0 argumentdefinition argumentDefinition��  ��  � o      ���� $0 valuedescription valueDescription��  ��  � ��� Z  �	 ����  >  � � o   � ����� $0 valuedescription valueDescription m   � � �   r   � b   �	 b   �

 b   � � o   � ����� $0 argumentssection argumentsSection 1   � ���
�� 
lnfd o   � ���� 0 indent2 Indent2	 o  ���� $0 valuedescription valueDescription o      ���� $0 argumentssection argumentsSection��  ��  �  Z 
%���� > 
 n 
 o  ���� 0 defaultvalue defaultValue o  
���� (0 argumentdefinition argumentDefinition o  ���� 0 novalue NoValue r  ! b   b   m   �  [ o  ���� $0 valueplaceholder valuePlaceholder m   �  ] o      ���� $0 valueplaceholder valuePlaceholder��  ��    ��  r  &/!"! b  &-#$# b  &+%&% o  &'���� &0 argumentssynopsis argumentsSynopsis& 1  '*��
�� 
spac$ o  +,���� $0 valueplaceholder valuePlaceholder" o      ���� &0 argumentssynopsis argumentsSynopsis��  � 0 argumentref argumentRefy o   $ %���� *0 argumentdefinitions argumentDefinitionsw '��' L  5>(( J  5=)) *+* b  5:,-, m  58.. �// 
   [ - - ]- o  89���� &0 argumentssynopsis argumentsSynopsis+ 0��0 o  :;���� $0 argumentssection argumentsSection��  ��  K 121 l     ��������  ��  ��  2 343 l     ��56��  5  -----   6 �77 
 - - - - -4 898 l     ��������  ��  ��  9 :;: i  � �<=< I     ��>?
�� .Fil:Argvnull���     ****> l 
    @����@ o      ���� 0 argv  ��  ��  ? ��AB
�� 
OpsDA |����C��D��  ��  C o      ���� &0 optiondefinitions optionDefinitions��  D l 
    E����E J      ����  ��  ��  B ��FG
�� 
OpsAF |����H��I��  ��  H o      ���� *0 argumentdefinitions argumentDefinitions��  I l 
    J����J J      ����  ��  ��  G ��K��
�� 
DefOK |����L��M��  ��  L o      ���� &0 hasdefaultoptions hasDefaultOptions��  M l     N����N m      ��
�� boovtrue��  ��  ��  = k     �OO PQP l     �RS�  R�� note: while NSUserDefaults provides some argument parsing support (see its NSArgumentDomain), it uses an atypical syntax and reads directly from argv, making it difficult both to omit arguments provided to osascript itself and to extract any arguments remaining after options are parsed; thus, this handler implements its own argv parser that avoids NSUserDefaults' deficiencies while also providing a better optparse-style UI/UX to both shell script authors and users   S �TT�   n o t e :   w h i l e   N S U s e r D e f a u l t s   p r o v i d e s   s o m e   a r g u m e n t   p a r s i n g   s u p p o r t   ( s e e   i t s   N S A r g u m e n t D o m a i n ) ,   i t   u s e s   a n   a t y p i c a l   s y n t a x   a n d   r e a d s   d i r e c t l y   f r o m   a r g v ,   m a k i n g   i t   d i f f i c u l t   b o t h   t o   o m i t   a r g u m e n t s   p r o v i d e d   t o   o s a s c r i p t   i t s e l f   a n d   t o   e x t r a c t   a n y   a r g u m e n t s   r e m a i n i n g   a f t e r   o p t i o n s   a r e   p a r s e d ;   t h u s ,   t h i s   h a n d l e r   i m p l e m e n t s   i t s   o w n   a r g v   p a r s e r   t h a t   a v o i d s   N S U s e r D e f a u l t s '   d e f i c i e n c i e s   w h i l e   a l s o   p r o v i d i n g   a   b e t t e r   o p t p a r s e - s t y l e   U I / U X   t o   b o t h   s h e l l   s c r i p t   a u t h o r s   a n d   u s e r sQ U�~U P     �VWXV k    �YY Z[Z r    
\]\ n   ^_^ 1    �}
�} 
txdl_ 1    �|
�| 
ascr] o      �{�{ 0 oldtids oldTIDs[ `�z` Q    �abca k    mdd efe l   �ygh�y  g ) # first, ensure parameters are lists   h �ii F   f i r s t ,   e n s u r e   p a r a m e t e r s   a r e   l i s t sf jkj r    lml n   non I    �xp�w�x "0 aslistparameter asListParameterp qrq o    �v�v 0 argv  r s�us m    tt �uu  �u  �w  o o    �t�t 0 _support  m o      �s�s 0 argv  k vwv r    )xyx n   'z{z I   ! '�r|�q�r "0 aslistparameter asListParameter| }~} o   ! "�p�p &0 optiondefinitions optionDefinitions~ �o m   " #�� ���  �o  �q  { o    !�n�n 0 _support  y o      �m�m &0 optiondefinitions optionDefinitionsw ��� r   * 7��� n  * 5��� I   / 5�l��k�l "0 aslistparameter asListParameter� ��� o   / 0�j�j *0 argumentdefinitions argumentDefinitions� ��i� m   0 1�� ���  �i  �k  � o   * /�h�h 0 _support  � o      �g�g *0 argumentdefinitions argumentDefinitions� ��� l  8 8�f���f  � � � next iterate over the raw argument list, identifying option names and (if non-boolean) values, returning a NSMutableDictionary of parsed option values plus a list of any remaining (i.e. non-option) arguments   � ����   n e x t   i t e r a t e   o v e r   t h e   r a w   a r g u m e n t   l i s t ,   i d e n t i f y i n g   o p t i o n   n a m e s   a n d   ( i f   n o n - b o o l e a n )   v a l u e s ,   r e t u r n i n g   a   N S M u t a b l e D i c t i o n a r y   o f   p a r s e d   o p t i o n   v a l u e s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s� ��� r   8 Q��� I      �e��d�e 0 _parseoptions _parseOptions� ��� n   9 <��� 2  : <�c
�c 
cobj� o   9 :�b�b 0 argv  � ��� o   < =�a�a &0 optiondefinitions optionDefinitions� ��`� o   = >�_�_ &0 hasdefaultoptions hasDefaultOptions�`  �d  � J      �� ��� o      �^�^ (0 asocparametersdict asocParametersDict� ��]� o      �\�\ 0 argumentslist argumentsList�]  � ��� l  R R�[���[  � v p add default values for any missing options to asocParametersDict, raising error if a required option is missing   � ��� �   a d d   d e f a u l t   v a l u e s   f o r   a n y   m i s s i n g   o p t i o n s   t o   a s o c P a r a m e t e r s D i c t ,   r a i s i n g   e r r o r   i f   a   r e q u i r e d   o p t i o n   i s   m i s s i n g� ��� I   R Y�Z��Y�Z (0 _adddefaultoptions _addDefaultOptions� ��� o   S T�X�X (0 asocparametersdict asocParametersDict� ��W� o   T U�V�V &0 optiondefinitions optionDefinitions�W  �Y  � ��� l  Z Z�U���U  � b \ parse the remaining arguments as named positional parameters, adding them to the dictionary   � ��� �   p a r s e   t h e   r e m a i n i n g   a r g u m e n t s   a s   n a m e d   p o s i t i o n a l   p a r a m e t e r s ,   a d d i n g   t h e m   t o   t h e   d i c t i o n a r y� ��� I   Z b�T��S�T "0 _parsearguments _parseArguments� ��� o   [ \�R�R 0 argumentslist argumentsList� ��� o   \ ]�Q�Q *0 argumentdefinitions argumentDefinitions� ��P� o   ] ^�O�O (0 asocparametersdict asocParametersDict�P  �S  � ��� r   c h��� o   c d�N�N 0 oldtids oldTIDs� n     ��� 1   e g�M
�M 
txdl� 1   d e�L
�L 
ascr� ��K� l  i m���� L   i m�� c   i l��� o   i j�J�J (0 asocparametersdict asocParametersDict� m   j k�I
�I 
****� : 4 coerce the dictionary to an AS record and return it   � ��� h   c o e r c e   t h e   d i c t i o n a r y   t o   a n   A S   r e c o r d   a n d   r e t u r n   i t�K  b R      �H��
�H .ascrerr ****      � ****� o      �G�G 0 etext eText� �F��
�F 
errn� o      �E�E 0 enumber eNumber� �D��
�D 
erob� o      �C�C 0 efrom eFrom� �B��A
�B 
errt� o      �@�@ 
0 eto eTo�A  c k   u ��� ��� r   u z��� o   u v�?�? 0 oldtids oldTIDs� n     ��� 1   w y�>
�> 
txdl� 1   v w�=
�= 
ascr� ��<� Z   { ����;�� =   { ���� o   { |�:�: 0 enumber eNumber� o   | ��9�9  0 _argvusererror _ArgvUserError� R   � ��8��
�8 .ascrerr ****      � ****� o   � ��7�7 0 etext eText� �6��
�6 
errn� o   � ��5�5 0 enumber eNumber� �4��
�4 
erob� o   � ��3�3 0 efrom eFrom� �2��1
�2 
errt� o   � ��0�0 
0 eto eTo�1  �;  � I   � ��/��.�/ 
0 _error  � ��� m   � ��� ��� 8 p a r s e   c o m m a n d   l i n e   a r g u m e n t s� ��� o   � ��-�- 0 etext eText� ��� o   � ��,�, 0 enumber eNumber� ��� o   � ��+�+ 0 efrom eFrom� ��*� o   � ��)�) 
0 eto eTo�*  �.  �<  �z  W �(�
�( conscase� �'�
�' consdiac� �&�
�& conshyph� �%�
�% conspunc� �$�#
�$ conswhit�#  X �"�!
�" consnume�!  �~  ; ��� l     � ���   �  �  � ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Fil:FHlpnull��� ��� null�  � ���
� 
Name� |���� �  �  � o      �� 0 commandname commandName�    l 
    �� l     �� m       �  �  �  �  �  � �
� 
Summ |����  �   o      �� $0 shortdescription shortDescription�   l 
    	�
�		 l     
��
 m       �  �  �  �
  �	   �
� 
Usag |����  �   o      �� "0 commandsynopses commandSynopses�   l 
    ��  J      ����  �  �    ��
�� 
OpsD |��������  ��   o      ���� &0 optiondefinitions optionDefinitions��   l 
    ���� J      ����  ��  ��   ��
�� 
OpsA |��������  ��   o      ���� *0 argumentdefinitions argumentDefinitions��   l 
    ���� J      ����  ��  ��   ��
�� 
Docu |��������  ��   o      ���� "0 longdescription longDescription��   l 
     ����  l     !����! m      "" �##  ��  ��  ��  ��   ��$%
�� 
VFmt$ |����&��'��  ��  & o      ���� 0 isstyled isStyled��  ' l 
    (����( l     )����) m      ��
�� boovtrue��  ��  ��  ��  % ��*��
�� 
DefO* |����+��,��  ��  + o      ���� &0 hasdefaultoptions hasDefaultOptions��  , l     -����- m      ��
�� boovtrue��  ��  ��  � P    %./0. Q   $1231 k   44 565 r    787 n   9:9 I    ��;���� "0 astextparameter asTextParameter; <=< o    ���� 0 commandname commandName= >��> m    ?? �@@  n a m e��  ��  : o    ���� 0 _support  8 o      ���� 0 commandname commandName6 ABA r    #CDC n   !EFE I    !��G���� "0 aslistparameter asListParameterG HIH o    ���� &0 optiondefinitions optionDefinitionsI J��J m    KK �LL  ��  ��  F o    ���� 0 _support  D o      ���� &0 optiondefinitions optionDefinitionsB MNM r   $ 1OPO n  $ /QRQ I   ) /��S���� "0 aslistparameter asListParameterS TUT o   ) *���� *0 argumentdefinitions argumentDefinitionsU V��V m   * +WW �XX  ��  ��  R o   $ )���� 0 _support  P o      ���� *0 argumentdefinitions argumentDefinitionsN YZY r   2 ?[\[ n  2 =]^] I   7 =��_���� "0 aslistparameter asListParameter_ `a` o   7 8���� "0 commandsynopses commandSynopsesa b��b m   8 9cc �dd  ��  ��  ^ o   2 7���� 0 _support  \ o      ���� "0 commandsynopses commandSynopsesZ efe r   @ Mghg n  @ Kiji I   E K��k���� "0 astextparameter asTextParameterk lml o   E F���� $0 shortdescription shortDescriptionm n��n m   F Goo �pp  s u m m a r y��  ��  j o   @ E���� 0 _support  h o      ���� $0 shortdescription shortDescriptionf qrq r   N [sts n  N Yuvu I   S Y��w���� "0 astextparameter asTextParameterw xyx o   S T���� "0 longdescription longDescriptiony z��z m   T U{{ �||  d o c u m e n t a t i o n��  ��  v o   N S���� 0 _support  t o      ���� "0 longdescription longDescriptionr }~} Z   \ ����� n  \ g��� I   a g������� (0 asbooleanparameter asBooleanParameter� ��� o   a b���� 0 isstyled isStyled� ���� m   b c�� ���  t e r m i n a l   s t y l e s��  ��  � o   \ a���� 0 _support  � l  j ����� r   j ���� K   j ��� ������ 0 n  � I   k q������� 0 vt100 VT100� ���� m   l m����  ��  ��  � ������ 0 b  � I   r x������� 0 vt100 VT100� ���� m   s t���� ��  ��  � ������� 0 u  � I   y �������� 0 vt100 VT100� ���� m   z }���� ��  ��  ��  � o      ���� 0 vtstyle vtStyle�   normal, bold, underline   � ��� 0   n o r m a l ,   b o l d ,   u n d e r l i n e��  � r   � ���� K   � ��� ������ 0 n  � m   � ��� ���  � ������ 0 b  � m   � ��� ���  � ������� 0 u  � m   � ��� ���  ��  � o      ���� 0 vtstyle vtStyle~ ��� l  � �������  � %  construct NAME summary section   � ��� >   c o n s t r u c t   N A M E   s u m m a r y   s e c t i o n� ��� Z   � �������� =  � ���� o   � ��� 0 commandname commandName� m   � ��� ���  � l  � ����� Q   � ����� r   � ���� l  � ����� I  � ����
� .Fil:SplPnull���     ctxt� l  � ����� n   � ���� o   � ��� 0 _  � l  � ����� I  � ����
� .Fil:EnVanull��� ��� null�  �  �  �  �  �  �  �  �  � o      �� 0 commandname commandName� R      ���
� .ascrerr ****      � ****�  �  � l  � ����� r   � ���� m   � ��� ���  C O M M A N D� o      �~�~ 0 commandname commandName� T N fallback on the offchance the above should fail to get the script's file name   � ��� �   f a l l b a c k   o n   t h e   o f f c h a n c e   t h e   a b o v e   s h o u l d   f a i l   t o   g e t   t h e   s c r i p t ' s   f i l e   n a m e� B < use the AppleScript shell script's own file name by default   � ��� x   u s e   t h e   A p p l e S c r i p t   s h e l l   s c r i p t ' s   o w n   f i l e   n a m e   b y   d e f a u l t��  ��  � ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� n  � ���� o   � ��}�} 0 b  � o   � ��|�| 0 vtstyle vtStyle� m   � ��� ���  N A M E� n  � ���� o   � ��{�{ 0 n  � o   � ��z�z 0 vtstyle vtStyle� o   � ��y�y 
0 lf2 LF2� o   � ��x�x 0 indent1 Indent1� o   � ��w�w 0 commandname commandName� o      �v�v 0 helptext helpText� ��� Z   � ����u�t� >  � ���� o   � ��s�s $0 shortdescription shortDescription� m   � ��� ���  � r   � ���� b   � ���� b   � ���� o   � ��r�r 0 helptext helpText� m   � ��� ���    - -  � o   � ��q�q $0 shortdescription shortDescription� o      �p�p 0 helptext helpText�u  �t  � ��� l  � ��o���o  � B < construct default SYNOPSIS, OPTIONS, and ARGUMENTS sections   � ��� x   c o n s t r u c t   d e f a u l t   S Y N O P S I S ,   O P T I O N S ,   a n d   A R G U M E N T S   s e c t i o n s� ��� r   ���� I      �n��m�n  0 _formatoptions _formatOptions� ��� o   � ��l�l &0 optiondefinitions optionDefinitions� ��� o   � ��k�k 0 vtstyle vtStyle�  �j  o   � ��i�i &0 hasdefaultoptions hasDefaultOptions�j  �m  � J        o      �h�h 00 defaultoptionssynopsis defaultOptionsSynopsis �g o      �f�f  0 optionssection optionsSection�g  �  r  1 I      �e	�d�e $0 _formatarguments _formatArguments	 

 o  �c�c *0 argumentdefinitions argumentDefinitions �b o  �a�a 0 vtstyle vtStyle�b  �d   J        o      �`�` 40 defaultargumentssynopsis defaultArgumentsSynopsis �_ o      �^�^ $0 argumentssection argumentsSection�_    r  2G b  2E b  2A b  2= b  29 o  23�]�] 0 helptext helpText o  38�\�\ 
0 lf2 LF2 n 9< o  :<�[�[ 0 b   o  9:�Z�Z 0 vtstyle vtStyle m  =@ �    S Y N O P S I S n AD!"! o  BD�Y�Y 0 n  " o  AB�X�X 0 vtstyle vtStyle o      �W�W 0 helptext helpText #$# Z  H\%&�V�U% = HL'(' o  HI�T�T "0 commandsynopses commandSynopses( J  IK�S�S  & r  OX)*) J  OV++ ,�R, b  OT-.- b  OR/0/ o  OP�Q�Q 0 commandname commandName0 o  PQ�P�P 00 defaultoptionssynopsis defaultOptionsSynopsis. o  RS�O�O 40 defaultargumentssynopsis defaultArgumentsSynopsis�R  * o      �N�N "0 commandsynopses commandSynopses�V  �U  $ 121 Q  ]�3453 X  `�6�M76 r  t�898 b  t�:;: b  t�<=< b  t{>?> o  tu�L�L 0 helptext helpText? o  uz�K�K 
0 lf2 LF2= o  {��J�J 0 indent1 Indent1; o  ���I�I 0 textref textRef9 o      �H�H 0 helptext helpText�M 0 textref textRef7 o  cd�G�G "0 commandsynopses commandSynopses4 R      �F�E@
�F .ascrerr ****      � ****�E  @ �DA�C
�D 
errnA d      BB m      �B�B��C  5 n ��CDC I  ���AE�@�A 60 throwinvalidparametertype throwInvalidParameterTypeE FGF o  ���?�? "0 commandsynopses commandSynopsesG HIH m  ��JJ �KK  s y n o p s i sI LML m  ���>
�> 
listM N�=N m  ��OO �PP  l i s t   o f   t e x t�=  �@  D o  ���<�< 0 _support  2 QRQ Z ��ST�;�:S > ��UVU o  ���9�9  0 optionssection optionsSectionV m  ��WW �XX  T r  ��YZY b  ��[\[ b  ��]^] o  ���8�8 0 helptext helpText^ o  ���7�7 
0 lf2 LF2\ o  ���6�6  0 optionssection optionsSectionZ o      �5�5 0 helptext helpText�;  �:  R _`_ Z ��ab�4�3a > ��cdc o  ���2�2 $0 argumentssection argumentsSectiond m  ��ee �ff  b r  ��ghg b  ��iji b  ��klk o  ���1�1 0 helptext helpTextl o  ���0�0 
0 lf2 LF2j o  ���/�/ $0 argumentssection argumentsSectionh o      �.�. 0 helptext helpText�4  �3  ` mnm l ���-op�-  o - ' add long DESCRIPTION section, if given   p �qq N   a d d   l o n g   D E S C R I P T I O N   s e c t i o n ,   i f   g i v e nn rsr Z  �tu�,�+t > ��vwv o  ���*�* "0 longdescription longDescriptionw m  ��xx �yy  u r  ��z{z b  ��|}| b  ��~~ b  ����� b  ����� b  ����� b  ����� o  ���)�) 0 helptext helpText� o  ���(�( 
0 lf2 LF2� n ����� o  ���'�' 0 b  � o  ���&�& 0 vtstyle vtStyle� m  ���� ���  D E S C R I P T I O N� n ����� o  ���%�% 0 n  � o  ���$�$ 0 vtstyle vtStyle o  ���#�# 
0 lf2 LF2} o  ���"�" "0 longdescription longDescription{ o      �!�! 0 helptext helpText�,  �+  s �� � L  �� b  ��� o  �� 0 helptext helpText� 1  �
� 
lnfd�   2 R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  3 I  $���� 
0 _error  � ��� m  �� ��� 0 f o r m a t   c o m m a n d   l i n e   h e l p� ��� o  �� 0 etext eText� ��� o  �� 0 enumber eNumber� ��� o  �� 0 efrom eFrom� ��� o  �� 
0 eto eTo�  �  / ��
� conscase� ��
� consdiac� ��
� conshyph� �
�
�
 conspunc� �	�
�	 conswhit�  0 ��
� consnume�  � ��� l     ����  �  �  � ��� l     ��� �  �  �   � ��� l     ��������  ��  ��  � ��� i  � ���� I     ������
�� .Fil:CurFnull��� ��� null��  ��  � Q     :���� k    (�� ��� r    ��� n   ��� I   
 �������� ,0 currentdirectorypath currentDirectoryPath��  ��  � n   
��� I    
��������  0 defaultmanager defaultManager��  ��  � n   ��� o    ���� 0 nsfilemanager NSFileManager� m    ��
�� misccura� o      ���� 0 asocpath asocPath� ��� Z   !������� =   ��� o    ���� 0 asocpath asocPath� m    ��
�� 
msng� R    ����
�� .ascrerr ****      � ****� m    �� ���  N o t   a v a i l a b l e .� �����
�� 
errn� m    �����@��  ��  ��  � ���� L   " (�� c   " '��� c   " %��� o   " #���� 0 asocpath asocPath� m   # $��
�� 
ctxt� m   % &��
�� 
psxf��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   0 :������� 
0 _error  � ��� m   1 2�� ��� 2 c u r r e n t   w o r k i n g   d i r e c t o r y� ��� o   2 3���� 0 etext eText� ��� o   3 4���� 0 enumber eNumber� ��� o   4 5���� 0 efrom eFrom� ���� o   5 6���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     ������
�� .Fil:EnVanull��� ��� null��  ��  � L     �� c     ��� l    ������ n    ��� I    �������� 0 environment  ��  ��  � n    ��� I    �������� 0 processinfo processInfo��  ��  � n    ��� o    ���� 0 nsprocessinfo NSProcessInfo� m     ��
�� misccura��  ��  � m    ��
�� 
****� ��� l     ������  �  �  � ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Fil:RSInnull��� ��� null�  � � 
� 
Prmt  |����  �   o      �� 0 
prompttext 
promptText�   l     �� m       �  > >  �  �   ��
� 
ReTo |���	�  �   o      �� 0 isinteractive isInteractive�  	 l     
��
 m      �
� boovfals�  �  �  � Q     � k    �  r     n   
 I    
���� :0 filehandlewithstandardinput fileHandleWithStandardInput�  �   n    o    �� 0 nsfilehandle NSFileHandle m    �
� misccura o      �� 0 	asocstdin 	asocStdin  Z    =� o    �� 0 isinteractive isInteractive k    3  I   � 
� .Fil:WSOunull���     ctxt o    �� 0 
prompttext 
promptText  �!"
� 
SLiB! m    �
� boovfals" �!�
� 
ALiE�   #$# r    "%&% n    '(' I     ���� 0 availabledata availableData�  �  ( o    �� 0 	asocstdin 	asocStdin& o      �� 0 asocdata asocData$ )�) Z  # 3*+��* =   # *,-, n  # (./. I   $ (���� 
0 length  �  �  / o   # $�� 0 asocdata asocData- m   ( )��  + L   - /00 m   - .�
� 
msng�  �  �  �   r   6 =121 n  6 ;343 I   7 ;���� *0 readdatatoendoffile readDataToEndOfFile�  �  4 o   6 7�� 0 	asocstdin 	asocStdin2 o      �� 0 asocdata asocData 565 r   > O787 n  > M9:9 I   E M�;�� 00 initwithdata_encoding_ initWithData_encoding_; <=< o   E F�� 0 asocdata asocData= >�> l  F I?��? n  F I@A@ o   G I�� ,0 nsutf8stringencoding NSUTF8StringEncodingA m   F G�
� misccura�  �  �  �  : n  > EBCB I   A E��~�}� 	0 alloc  �~  �}  C n  > ADED o   ? A�|�| 0 nsstring NSStringE m   > ?�{
�{ misccura8 o      �z�z 0 
asocstring 
asocString6 FGF Z  P dHI�y�xH =  P SJKJ o   P Q�w�w 0 
asocstring 
asocStringK m   Q R�v
�v 
msngI R   V `�uLM
�u .ascrerr ****      � ****L m   \ _NN �OO > I n p u t   i s   n o t   U T F 8 - e n c o d e d   t e x t .M �tP�s
�t 
errnP m   X [�r�r�\�s  �y  �x  G QRQ Z  e �ST�q�pS n  e mUVU I   f m�oW�n�o 0 
hassuffix_ 
hasSuffix_W X�mX 1   f i�l
�l 
lnfd�m  �n  V o   e f�k�k 0 
asocstring 
asocStringT r   p ~YZY n  p |[\[ I   q |�j]�i�j &0 substringtoindex_ substringToIndex_] ^�h^ l  q x_�g�f_ \   q x`a` l  q vb�e�db n  q vcdc I   r v�c�b�a�c 
0 length  �b  �a  d o   q r�`�` 0 
asocstring 
asocString�e  �d  a m   v w�_�_ �g  �f  �h  �i  \ o   p q�^�^ 0 
asocstring 
asocStringZ o      �]�] 0 
asocstring 
asocString�q  �p  R e�\e L   � �ff c   � �ghg o   � ��[�[ 0 
asocstring 
asocStringh m   � ��Z
�Z 
ctxt�\   R      �Yij
�Y .ascrerr ****      � ****i o      �X�X 0 etext eTextj �Wkl
�W 
errnk o      �V�V 0 enumber eNumberl �Umn
�U 
erobm o      �T�T 0 efrom eFromn �So�R
�S 
errto o      �Q�Q 
0 eto eTo�R   I   � ��Pp�O�P 
0 _error  p qrq m   � �ss �tt 0 r e a d   f r o m   s t a n d a r d   i n p u tr uvu o   � ��N�N 0 etext eTextv wxw o   � ��M�M 0 enumber eNumberx yzy o   � ��L�L 0 efrom eFromz {�K{ o   � ��J�J 
0 eto eTo�K  �O  � |}| l     �I�H�G�I  �H  �G  } ~~ l     �F�E�D�F  �E  �D   ��� i  � ���� I     �C��
�C .Fil:WSOunull���     ctxt� o      �B�B 0 thetext theText� �A��
�A 
SLiB� |�@�?��>��@  �?  � o      �=�= 0 uselinefeeds useLinefeeds�>  � l     ��<�;� m      �:
�: boovtrue�<  �;  � �9��8
�9 
ALiE� |�7�6��5��7  �6  � o      �4�4  0 withlineending withLineEnding�5  � l     ��3�2� m      �1
�1 boovtrue�3  �2  �8  � Q     ����� k    �� ��� r    ��� n   ��� I    �0��/�0 &0 asnsmutablestring asNSMutableString� ��.� n   ��� I    �-��,�- "0 astextparameter asTextParameter� ��� o    �+�+ 0 thetext theText� ��*� m    �� ���  �*  �,  � o    �)�) 0 _support  �.  �/  � o    �(�( 0 _support  � o      �'�' 0 
asocstring 
asocString� ��� Z    I���&�%� o    �$�$ 0 uselinefeeds useLinefeeds� k    E�� ��� n   2��� I    2�#��"�# l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_� ��� l 
  "��!� � l   "���� b    "��� o     �
� 
ret � 1     !�
� 
lnfd�  �  �!  �   � ��� l  " #���� 1   " #�
� 
lnfd�  �  � ��� m   # $��  � ��� K   $ .�� ���� 0 location  � m   % &��  � ���� 
0 length  � n  ' ,��� I   ( ,���� 
0 length  �  �  � o   ' (�� 0 
asocstring 
asocString�  �  �"  � o    �� 0 
asocstring 
asocString� ��� n  3 E��� I   4 E���� l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_� ��� l 
 4 5��
�	� l  4 5���� o   4 5�
� 
ret �  �  �
  �	  � ��� l  5 6���� 1   5 6�
� 
lnfd�  �  � ��� m   6 7��  � ��� K   7 A�� � ���  0 location  � m   8 9����  � ������� 
0 length  � n  : ?��� I   ; ?�������� 
0 length  ��  ��  � o   : ;���� 0 
asocstring 
asocString��  �  �  � o   3 4���� 0 
asocstring 
asocString�  �&  �%  � ��� Z  J d������� F   J W��� o   J K����  0 withlineending withLineEnding� H   N U�� l  N T������ n  N T��� I   O T������� 0 
hassuffix_ 
hasSuffix_� ���� 1   O P��
�� 
lnfd��  ��  � o   N O���� 0 
asocstring 
asocString��  ��  � n  Z `��� I   [ `������� 0 appendstring_ appendString_� ���� 1   [ \��
�� 
lnfd��  ��  � o   Z [���� 0 
asocstring 
asocString��  ��  � ��� r   e n��� n  e l��� I   h l�������� <0 filehandlewithstandardoutput fileHandleWithStandardOutput��  ��  � n  e h��� o   f h���� 0 nsfilehandle NSFileHandle� m   e f��
�� misccura� o      ���� 0 
asocstdout 
asocStdout� ��� n  o |��� I   p |������� 0 
writedata_ 
writeData_� ���� l  p x������ n  p x��� I   q x������� (0 datausingencoding_ dataUsingEncoding_� ���� l  q t������ n  q t��� o   r t���� ,0 nsutf8stringencoding NSUTF8StringEncoding� m   q r��
�� misccura��  ��  ��  ��  � o   p q���� 0 
asocstring 
asocString��  ��  ��  ��  � o   o p���� 0 
asocstdout 
asocStdout� ���� L   } ����  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �� ��
�� 
errt  o      ���� 
0 eto eTo��  � I   � ������� 
0 _error    m   � � � 0 w r i t e   t o   s t a n d a r d   o u t p u t  o   � ����� 0 etext eText 	 o   � ����� 0 enumber eNumber	 

 o   � ����� 0 efrom eFrom �� o   � ����� 
0 eto eTo��  ��  �  l     ��������  ��  ��   � l     ����  �  �  �       "�� !"#$%&'()*+,-�    ��������������������������������
� 
pimr� 0 _support  � 
0 _error  � (0 _nsstringencodings _NSStringEncodings
� .Fil:Readnull���     file
� .Fil:Writnull���     file
� .Fil:ConPnull���     ****
� .Fil:NorPnull���     ctxt
� .Fil:JoiPnull���     ****
� .Fil:SplPnull���     ctxt�  0 _argvusererror _ArgvUserError� 0 novalue NoValue� 
0 lf2 LF2� 0 indent1 Indent1� 0 indent2 Indent2� 0 vt100 VT100� 0 _unpackvalue _unpackValue� 40 _defaultvalueplaceholder _defaultValuePlaceholder� *0 _formatdefaultvalue _formatDefaultValue� (0 _buildoptionstable _buildOptionsTable� 0 _parseoptions _parseOptions� (0 _adddefaultoptions _addDefaultOptions�  0 _ordinalnumber _ordinalNumber� "0 _parsearguments _parseArguments�  0 _formatoptions _formatOptions� $0 _formatarguments _formatArguments
� .Fil:Argvnull���     ****
� .Fil:FHlpnull��� ��� null
� .Fil:CurFnull��� ��� null
� .Fil:EnVanull��� ��� null
� .Fil:RSInnull��� ��� null
� .Fil:WSOunull���     ctxt �.� .  /0/ �1�
� 
cobj1 22   � 
� 
frmk�  0 �3�
� 
cobj3 44   �
� 
osax�   55   � +
� 
scpt � 5��67�� 
0 _error  � �8� 8  ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�  6 ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo7  E��� � &0 throwcommanderror throwCommandError� b  ࠡ����+  � b  9� (0 _nsstringencodings _NSStringEncodings9  :�;<: �~�}�|�~ 	0 _list  �} 	0 _init  �| 0 getencoding getEncoding
� 
msng; �{ s�z�y=>�x�{ 	0 _init  �z  �y  =  > ,�w�v�u�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�M�L
�w FEncFE01
�v misccura�u ,0 nsutf8stringencoding NSUTF8StringEncoding
�t FEncFE02�s .0 nsutf16stringencoding NSUTF16StringEncoding
�r FEncFE03�q @0 nsutf16bigendianstringencoding NSUTF16BigEndianStringEncoding
�p FEncFE04�o F0 !nsutf16littleendianstringencoding !NSUTF16LittleEndianStringEncoding
�n FEncFE05�m .0 nsutf32stringencoding NSUTF32StringEncoding
�l FEncFE06�k @0 nsutf32bigendianstringencoding NSUTF32BigEndianStringEncoding
�j FEncFE07�i F0 !nsutf32littleendianstringencoding !NSUTF32LittleEndianStringEncoding
�h FEncFE11�g .0 nsasciistringencoding NSASCIIStringEncoding
�f FEncFE12�e 60 nsiso2022jpstringencoding NSISO2022JPStringEncoding
�d FEncFE13�c 60 nsisolatin1stringencoding NSISOLatin1StringEncoding
�b FEncFE14�a 60 nsisolatin2stringencoding NSISOLatin2StringEncoding
�` FEncFE15�_ :0 nsjapaneseeucstringencoding NSJapaneseEUCStringEncoding
�^ FEncFE16�] 80 nsmacosromanstringencoding NSMacOSRomanStringEncoding
�\ FEncFE17�[ >0 nsnonlossyasciistringencoding NSNonLossyASCIIStringEncoding
�Z FEncFE18�Y 40 nsshiftjisstringencoding NSShiftJISStringEncoding
�X FEncFE19�W 00 nssymbolstringencoding NSSymbolStringEncoding
�V FEncFE50�U >0 nswindowscp1250stringencoding NSWindowsCP1250StringEncoding
�T FEncFE51�S >0 nswindowscp1251stringencoding NSWindowsCP1251StringEncoding
�R FEncFE52�Q >0 nswindowscp1252stringencoding NSWindowsCP1252StringEncoding
�P FEncFE53�O >0 nswindowscp1253stringencoding NSWindowsCP1253StringEncoding
�N FEncFE54�M >0 nswindowscp1254stringencoding NSWindowsCP1254StringEncoding�L �x ����,lv���,lv���,lv���,lv���,lv���,lv���,lv��a ,lva �a ,lva �a ,lva �a ,lva �a ,lva �a ,lva �a ,lva �a ,lva �a  ,lva !�a ",lva #�a $,lva %�a &,lva '�a (,lva )�a *,lva +vEc   < �K7�J�I?@�H�K 0 getencoding getEncoding�J �GA�G A  �F�F 0 textencoding textEncoding�I  ? �E�D�E 0 textencoding textEncoding�D 0 aref aRef@ �C�B�A�@�?�>�=�<B�;w�:
�C 
msng�B 	0 _init  
�A 
enum�@ 	0 _list  
�? 
kocl
�> 
cobj
�= .corecnte****       ****�<  B �9�8�7
�9 
errn�8�\�7  
�; 
long�: >0 throwinvalidconstantparameter throwInvalidConstantParameter�H l Ib   �  
*j+ Y hO��&E�O ))�,[��l kh ��k/�  ��l/EY h[OY��W X   	��&W X  hOb  ��l+  �6��5�4CD�3
�6 .Fil:Readnull���     file�5 0 thefile theFile�4 �2EF
�2 
TypeE {�1�0�/�1 0 datatype dataType�0  
�/ 
ctxtF �.G�-
�. 
EncoG {�,�+�*�, 0 textencoding textEncoding�+  
�* FEncFE01�-  C �)�(�'�&�%�$�#�"�!� ���) 0 thefile theFile�( 0 datatype dataType�' 0 textencoding textEncoding�& 0 	posixpath 	posixPath�% 0 
asocstring 
asocString�$ 0 theerror theError�# 0 fh  �" 0 	theresult 	theResult�! 0 etext eText�  0 enumber eNumber� 0 efrom eFrom� 
0 eto eToD  ����������������������
�	���H��*��� ,0 asposixpathparameter asPOSIXPathParameter� "0 astypeparameter asTypeParameter
� 
ctxt
� FEncFEPE
� 
bool� 0 getencoding getEncoding
� misccura� 0 nsstring NSString
� 
obj � T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_
� 
cobj
� 
msng
� 
errn� 0 code  
� 
erob
� 
errt� � ,0 localizeddescription localizedDescription
� 
psxf
�
 .rdwropenshor       file
�	 
as  
� .rdwrread****        ****
� .rdwrclosnull���     ****� 0 etext eTextH �� I
� 
errn�  0 enumber eNumberI ����J
�� 
erob�� 0 efrom eFromJ ������
�� 
errt�� 
0 eto eTo��  �  �  � � 
0 _error  �3 � �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& Ub  �k+ E�O��,���m+ E[�k/E�Z[�l/E�ZO��  )�j+ a �a �a �j+ �&Y hO��&Y O�a &j E�O �a �l E�O�j O�W )X   
�j W X  hO)�a �a �a �W X  *a ����a +  ��:����KL��
�� .Fil:Writnull���     file�� 0 thefile theFile�� ����M
�� 
Data�� 0 thedata theDataM ��NO
�� 
TypeN {�������� 0 datatype dataType��  
�� 
ctxtO ��P��
�� 
EncoP {�������� 0 textencoding textEncoding��  
�� FEncFE01��  K ���������������������������� 0 thefile theFile�� 0 thedata theData�� 0 datatype dataType�� 0 textencoding textEncoding�� 0 	posixpath 	posixPath�� 0 
asocstring 
asocString�� 0 
didsucceed 
didSucceed�� 0 theerror theError�� 0 fh  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToL 'V��b������������~����������������������������������������������Q�������� ,0 asposixpathparameter asPOSIXPathParameter�� "0 astypeparameter asTypeParameter
�� 
ctxt
�� FEncFEPE
�� 
bool
�� misccura�� 0 nsstring NSString�� "0 astextparameter asTextParameter�� &0 stringwithstring_ stringWithString_�� 0 getencoding getEncoding
�� 
obj �� �� P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_
�� 
cobj
�� 
errn�� 0 code  
�� 
erob
�� 
errt�� �� ,0 localizeddescription localizedDescription
�� 
psxf
�� 
perm
�� .rdwropenshor       file
�� 
set2
�� .rdwrseofnull���     ****
�� 
refn
�� 
as  
�� .rdwrwritnull���     ****
�� .rdwrclosnull���     ****�� 0 etext eTextQ ��R
� 
errn� 0 enumber eNumberR ��S
� 
erob� 0 efrom eFromS ���
� 
errt� 
0 eto eTo�  ��  �  � � 
0 _error  ��
 �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& i��,b  ��l+ 
k+ E�Ob  �k+ E�O��e���+ E[a k/E�Z[a l/E�ZO� !)a �j+ a �a �a �j+ �&Y hY a�a &a el E�O %�a jl O�a �a �� O�j OhW +X   ! 
�j W X " #hO)a �a �a �a �W X   !*a $����a %+ & ���TU�
� .Fil:ConPnull���     ****� 0 filepath filePath� �VW
� 
FromV {���� 0 
fromformat 
fromFormat�  
� FLCTFLCPW �X�
� 
To__X {���� 0 toformat toFormat�  
� FLCTFLCP�  T 	���������� 0 filepath filePath� 0 
fromformat 
fromFormat� 0 toformat toFormat� 0 	posixpath 	posixPath� 0 asocurl asocURL� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToU )���9������������x}����������������Y'��
� 
kocl
� 
ctxt
� .corecnte****       ****� ,0 asposixpathparameter asPOSIXPathParameter
� FLCTFLCP
� FLCTFLCH
� 
file
� 
psxp
� FLCTFLCU
� misccura� 	0 NSURL  �  0 urlwithstring_ URLWithString_
� 
msng� 0 fileurl fileURL
� 
bool� � .0 throwinvalidparameter throwInvalidParameter� >0 throwinvalidconstantparameter throwInvalidConstantParameter
� 
leng
� FLCTFLCA
� 
psxf
� 
alis
� FLCTFLCX
� FLCTFLCS
� 
ascr� $0 fileurlwithpath_ fileURLWithPath_�  0 absolutestring absoluteString� 0 etext eTextY ��Z
� 
errn� 0 enumber eNumberZ ��~[
� 
erob�~ 0 efrom eFrom[ �}�|�{
�} 
errt�| 
0 eto eTo�{  � � 
0 _error  �cN�kv��l j  b  ��l+ E�Y h��  �E�Y \��  *�/�,E�Y K��  8��,�k+ E�O�� 
 
�j+ �& b  �a �a a + Y hY b  �a l+ O�a ,j  b  �a �a a + Y hO��  �Y ��a   �a &a &Y ��a   �a &Y s�a   _ �a &�&/Y Z��  �a &�&Y I��  6��,�k+ E�O��  b  �a  *�a !/m+ Y hO�j+ "�&Y b  �a #l+ W X $ %*a &����a '+ ( �z8�y�x\]�w
�z .Fil:NorPnull���     ctxt�y 0 filepath filePath�x �v^_
�v 
ExpT^ {�u�t�s�u  0 expandingtilde expandingTilde�t  
�s boovfals_ �r`a
�r 
ExpR` {�q�p�o�q &0 expandingrelative expandingRelative�p  
�o boovfalsa �nb�m
�n 
ExpAb {�l�k�j�l $0 expandingsymlink expandingSymlink�k  
�j boovfals�m  \ �i�h�g�f�e�d�c�i 0 filepath filePath�h  0 expandingtilde expandingTilde�g &0 expandingrelative expandingRelative�f $0 expandingsymlink expandingSymlink�e 0 etext eText�d 0 enumber eNumber�c 
0 eto eTo] NO[�bn�ar�`x���_�^��]�\�[�Z�Y�X�Wc��V�U�b ,0 asposixpathparameter asPOSIXPathParameter�a (0 asbooleanparameter asBooleanParameter
�` 
bool
�_ .Fil:CurFnull��� ��� null
�^ .Fil:JoiPnull���     ****
�] misccura�\ 0 nsstring NSString�[ &0 stringwithstring_ stringWithString_�Z B0 stringbyresolvingsymlinksinpath stringByResolvingSymlinksInPath
�Y 
ctxt�X 60 stringbystandardizingpath stringByStandardizingPath�W 0 etext eTextc �T�Sd
�T 
errn�S 0 enumber eNumberd �R�Q�P
�R 
errt�Q 
0 eto eTo�P  �V �U 
0 _error  �w � ��� �b  ��l+ E�Ob  ��l+ 	 ���& 
�%E�Y hOb  ��l+ 	 ���& *j �lvj E�Y hOb  ��l+  ��,�k+ j+ a &Y ��,�k+ j+ a &VW X  *a ����a +  �O��N�Mef�L
�O .Fil:JoiPnull���     ****�N  0 pathcomponents pathComponents�M �Kg�J
�K 
Exteg {�I�H��I 0 fileextension fileExtension�H  �J  e 	�G�F�E�D�C�B�A�@�?�G  0 pathcomponents pathComponents�F 0 fileextension fileExtension�E 0 subpaths subPaths�D 0 aref aRef�C 0 asocpath asocPath�B 0 etext eText�A 0 enumber eNumber�@ 0 efrom eFrom�? 
0 eto eTof ��>�=�<�;�:�9�8�7�6�5�4�3�2�13�0�/�.�-R�,W�+hg�*�)�> "0 aslistparameter asListParameter
�= 
cobj
�< 
kocl
�; .corecnte****       ****
�: 
pcnt�9 ,0 asposixpathparameter asPOSIXPathParameter�8  �7  
�6 
list�5 �4 .0 throwinvalidparameter throwInvalidParameter
�3 misccura�2 0 nsstring NSString�1 *0 pathwithcomponents_ pathWithComponents_�0 "0 astextparameter asTextParameter
�/ 
leng�. B0 stringbyappendingpathextension_ stringByAppendingPathExtension_
�- 
msng
�, 
ctxt�+ 0 etext eTexth �(�'i
�( 
errn�' 0 enumber eNumberi �&�%j
�& 
erob�% 0 efrom eFromj �$�#�"
�$ 
errt�# 
0 eto eTo�"  �* �) 
0 _error  �L � �b  ��l+ �-E�O ;�jv  	)jhY hO %�[��l kh b  ��,�l+ ��,F[OY��W X  	b  �����+ O�a ,�k+ E�Ob  �a l+ E�O�a ,j -��k+ E�O�a   b  �a a a �+ Y hY hO�a &W X  *a ����a +  �!w� �kl�
�! .Fil:SplPnull���     ctxt�  0 filepath filePath� �m�
� 
Uponm {���� 0 splitposition splitPosition�  
� FLSPFLSL�  k ��������� 0 filepath filePath� 0 splitposition splitPosition� 0 asocpath asocPath� 0 matchformat matchFormat� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTol ��������
�	���������n�� ��
� misccura� 0 nsstring NSString� ,0 asposixpathparameter asPOSIXPathParameter� &0 stringwithstring_ stringWithString_
� FLSPFLSL� F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent
�
 
ctxt�	 &0 lastpathcomponent lastPathComponent
� FLSPFLSE� >0 stringbydeletingpathextension stringByDeletingPathExtension� 0 pathextension pathExtension
� FLSPFLSA�  0 pathcomponents pathComponents
� 
list� >0 throwinvalidconstantparameter throwInvalidConstantParameter� 0 etext eTextn ����o
�� 
errn�� 0 enumber eNumbero ����p
�� 
erob�� 0 efrom eFromp ������
�� 
errt�� 
0 eto eTo��  �  �� 
0 _error  �  j��,b  ��l+ k+ E�O��  �j+ �&�j+ �&lvY 8��  �j+ 
�&�j+ �&lvY ��  �j+ �&Y b  ��l+ W X  *a ����a + �' ��  q�� 0 novalue NoValueq  rr   �ss  
 
 ������tu���� 0 vt100 VT100�� ��v�� v  ���� 0 
formatcode 
formatCode��  t ���� 0 
formatcode 
formatCodeu ������24
�� 
cha �� 
�� kfrmID  �� )���0�%�%�% ��G����wx���� 0 _unpackvalue _unpackValue�� ��y�� y  ������ 0 thevalue theValue�� $0 definitionrecord definitionRecord��  w ���������������� 0 thevalue theValue�� $0 definitionrecord definitionRecord�� 0 	valuetype 	valueType�� 0 	theresult 	theResult�� 0 asocformatter asocFormatter�� 0 
asocresult 
asocResult�� 0 basepath basePathx :��������������������������������������������������������������������zAOY]aeh�tx|���������� 0 	valuetype 	valueType
�� 
type
�� 
ctxt
�� 
long
�� 
doub
�� 
nmbr
�� misccura�� &0 nsnumberformatter NSNumberFormatter�� 	0 alloc  �� 0 init  �� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle�� "0 setnumberstyle_ setNumberStyle_�� 0 nslocale NSLocale�� 0 systemlocale systemLocale�� 0 
setlocale_ 
setLocale_�� &0 numberfromstring_ numberFromString_
�� 
msng
�� 
errn
�� 
****
�� 
furl
�� 
alis
�� 
file
�� 
psxf�� 
�� 
bool�� 0 nsfilemanager NSFileManager��  0 defaultmanager defaultManager�� ,0 currentdirectorypath currentDirectoryPath�� 0 nsstring NSString�� *0 pathwithcomponents_ pathWithComponents_�� &0 stringwithstring_ stringWithString_� 60 stringbystandardizingpath stringByStandardizingPath�  z ���
� 
errn����  � ��Y
� 
erob
� 
errt� ��ա�,�&E�O��  �E�Y����mv�kv ���,j+ j+ 	E�O���,k+ O���,j+ k+ O��k+ E�O�a   )a b  
la �%Y hO�a &E�O��  '�k#j )a b  
la �%Y hO��&E�Y hY2a a a a a v�kv ��a 	 �a a & A�a ,j+ j+ E�O�a   )a b  
la  �%Y hO�a !,��lvk+ "E�Y hO�a !,�k+ #j+ $�&a &E�O �a   �a &E�Y hW X % &)a b  
la '�%Y |�a   [ga ( Qa )a *a +a ,a -a .v�kv eY 1a /a 0a 1a 2a 3a .v�kv fY )a b  
la 4�%VY )a a 5a 6��,a 7�a 8a 9O� ����{|�� 40 _defaultvalueplaceholder _defaultValuePlaceholder� �}� }  �� $0 definitionrecord definitionRecord�  { ��� $0 definitionrecord definitionRecord� 0 	valuetype 	valueType| ������������������������ 0 	valuetype 	valueType
� 
type
� 
ctxt
� 
long
� 
doub
� 
nmbr
� 
furl
� 
alis
� 
file
� 
psxf� 
� 
bool
� 
errn��Y
� 
erob
� 
errt� � h��,�&E�O��  �Y V���mv�kv ��  �Y �Y :�����v�kv �Y (��  	a Y )a a a ��,a �a a   ���~�� *0 _formatdefaultvalue _formatDefaultValue� ��� �  �� $0 definitionrecord definitionRecord�  ~ ����� $0 definitionrecord definitionRecord� 0 defaultvalue defaultValue� 0 defaulttext defaultText� 0 asocformatter asocFormatter �������������������������������������~�}�|�{������ 0 defaultvalue defaultValue
� 
kocl
� 
list
�� .corecnte****       ****
�� 
leng
�� 
bool
�� 
cobj
�� 
ctxt
�� 
long
�� 
doub
�� misccura�� &0 nsnumberformatter NSNumberFormatter�� 	0 alloc  �� 0 init  �� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle�� "0 setnumberstyle_ setNumberStyle_�� 0 nslocale NSLocale�� 0 systemlocale systemLocale�� 0 
setlocale_ 
setLocale_� &0 stringfromnumber_ stringFromNumber_
�~ 
****
�} 
furl
�| 
alis
�{ 
psxp� ��,E�O�kv��l j	 	��,k �& ��k/E�Y hO�kv��l j �E�Y ��kv��l j
 �kv��l j�& 7��,j+ j+ E�O���,k+ O��a ,j+ k+ O��k+ a &E�Y N�kv�a l j
 �kv�a l j�& �a ,E�Y "�e  
a E�Y �f  
a E�Y a Oa �%a %! �z��y�x���w�z (0 _buildoptionstable _buildOptionsTable�y �v��v �  �u�u &0 optiondefinitions optionDefinitions�x  � �t�s�r�q�p�o�n�m�l�k�j�t &0 optiondefinitions optionDefinitions�s 0 
foundnames 
foundNames�r 20 optiondefinitionsbyname optionDefinitionsByName�q 0 	optionref 	optionRef�p $0 optiondefinition optionDefinition�o 0 propertyname propertyName�n 0 	namecount 	nameCount�m 0 aref aRef�l 0 thename theName�k 0 
nameprefix 
namePrefix�j 0 charref charRef� .�i�h�g�f�e�d�c�b�a��`��_	 �^�]�\�[�Z	�Y�X�W��V�U�T	&�S	�	�	L	V	c	q	��R	�	��Q	�	�	�	��P	�
�i misccura�h *0 nsmutabledictionary NSMutableDictionary�g 0 
dictionary  
�f 
kocl
�e 
cobj
�d .corecnte****       ****
�c 
pcnt
�b 
reco�a 0 	shortname 	shortName�` 0 longname longName�_ 0 propertyname propertyName�^ 0 	valuetype 	valueType
�] 
ctxt�\ 0 islist isList�[ 0 defaultvalue defaultValue�Z 
�Y 
errn�X�\�W  � �O�N�M
�O 
errn�N�\�M  �V�Y
�U 
erob�T 
�S 
leng
�R 
bool
�Q 
cha �P &0 setobject_forkey_ setObject_forKey_�w�jvE�O��,j+ E�O�[��l kh ��,�&��������a fa fa %E�O %��,�&E�O��,a   )a a lhY hW X  )a a a �a a O�a ,E�OJ��,a lv��,a lvlv[��l kh �E[�k/E�Z[�l/E�ZO 
��&E�W X  )a a a �a a O�a   ꡨkv )a a a �a a !Y hO��6FOga " ��a ,k  2�a ,k
 a #�a $& )a a a �a a %Y hY w�a ,j 
 a &�a 'k/a $&
 �a (a $& )a a a �a a )Y hO 5�[��l kh 
a *��, )a a a �a a +Y h[OY��VO����%l+ ,Y h[OY��O�a ,�  )a a a �a a -Y h[OY�+O�" �L	��K�J���I�L 0 _parseoptions _parseOptions�K �H��H �  �G�F�E�G 0 rawarguments rawArguments�F &0 optiondefinitions optionDefinitions�E &0 hasdefaultoptions hasDefaultOptions�J  � �D�C�B�A�@�?�>�=�<�;�:�9�8�D 0 rawarguments rawArguments�C &0 optiondefinitions optionDefinitions�B &0 hasdefaultoptions hasDefaultOptions�A 20 optiondefinitionsbyname optionDefinitionsByName�@ (0 asocparametersdict asocParametersDict�? 0 thearg theArg�> 0 
optionname 
optionName�= $0 optiondefinition optionDefinition�< 0 ishelp isHelp�; 0 	isversion 	isVersion�: 0 propertyname propertyName�9 0 thevalue theValue�8 0 thelist theList� 4�7�6�5�4
&�3�2�1
D
P�0�/�.�-�,
�
�
��+�*�)�(�'�&�%
�&)36�$S�#]�"j�!� ���������������7 (0 _buildoptionstable _buildOptionsTable
�6 misccura�5 *0 nsmutabledictionary NSMutableDictionary�4 0 
dictionary  
�3 
ascr
�2 
txdl
�1 
cobj
�0 
rest
�/ 
citm
�. 
kocl
�- .corecnte****       ****
�, 
ctxt
�+ 
cha 
�* 
bool
�) 
leng�( 0 objectforkey_ objectForKey_
�' 
msng
�& 
****�% 0 	valuetype 	valueType�$ $0 removeallobjects removeAllObjects�# $0 setvalue_forkey_ setValue_forKey_
�" 
errn�! 0 propertyname propertyName�  0 defaultvalue defaultValue�  �  ��\
� 
erob� � 0 _unpackvalue _unpackValue� 0 islist isList�  0 nsmutablearray NSMutableArray� $0 arraywithobject_ arrayWithObject_� 0 
addobject_ 
addObject_� &0 setobject_forkey_ setObject_forKey_�Io*�k+  E�O��,j+ E�O���,FONh�jv ��k/E�O�� C��  ��,E�OY hO��k/E�O���l k �[�\[�l/\Zi2��k/FY ��,E�Y ��� ��a  
 a �a l/a & Y hO�[�\[Zk\Zl2E�O�a ,l L�[�\[Zm\Zi2��k/FO��k+ E�O�a 	 �a &a ,a  a & a ��k/%��k/FY hY ��,E�Y O��k+ E�O�a   x� _a a lv�kva a lv�kvlvE[�k/E�Z[�l/E�ZO�
 �a & %�j+ O��a l+  O��a !l+  OjvE�OY hY hO)a "b  
la #�%Y hO�a &E�O�a $,E�O�a ,a   1 �a %,E�W  X & ')a "a (a )�a %,a *a +�%Y 0�jv  )a "b  
la ,�%Y hO*��k/�l+ -E�O��,E�O�a .,E /��k+ E�O�a   �a /,�k+ 0E�Y ��k+ 1O�E�Y #��k+ a  )a "b  
la 2�%Y hO���l+ 3[OY��O��lv# ������� (0 _adddefaultoptions _addDefaultOptions� ��� �  ��� (0 asocparametersdict asocParametersDict� &0 optiondefinitions optionDefinitions�  � ����
�	���� (0 asocparametersdict asocParametersDict� &0 optiondefinitions optionDefinitions� 0 recref recRef�
 0 rec  �	 0 propertyname propertyName� 0 thevalue theValue� 0 
optionname 
optionName� "0 propertynameref propertyNameRef� �����%� )����8����_io����x������������
� 
kocl
� 
cobj
� .corecnte****       ****
� 
reco� 0 propertyname propertyName�  0 longname longName�� 0 defaultvalue defaultValue�� �� 0 objectforkey_ objectForKey_
�� 
msng�� 0 	shortname 	shortName
�� 
errn
�� misccura�� 0 nsnull NSNull�� 0 null  �� &0 setobject_forkey_ setObject_forKey_
�� 
pcnt� � ��[��l kh ��&�����b  �%E�O��,E�O��  
��,E�Y hO��k+ �  e��,E�O�b    1���,%E�O��  �a ,%E�Y hO)a b  
la �%Y hO��  a a ,j+ E�Y hO���l+ Y h[OY�bO 9a a lv[��l kh ��a ,k+ �  �f�a ,l+ Y h[OY��$ �������������  0 _ordinalnumber _ordinalNumber�� ����� �  ���� 0 n  ��  � ���� 0 n  � ������������������� �� 
�� �� �� �� d
�� 
bool
�� 
ctxt
�� 
cobj�� 8klmmv��#kv	 ���mv��#kv�& ��&���mv��#/%Y ��&�%% ��	���������� "0 _parsearguments _parseArguments�� ����� �  �������� 0 argumentslist argumentsList�� *0 argumentdefinitions argumentDefinitions�� (0 asocparametersdict asocParametersDict��  � ������������������������ 0 argumentslist argumentsList�� *0 argumentdefinitions argumentDefinitions�� (0 asocparametersdict asocParametersDict�� 0 i  �� 0 argcount argCount��  0 mustbeoptional mustBeOptional�� 0 argref argRef�� (0 argumentdefinition argumentDefinition�� 0 thevalue theValue�� "0 placeholdertext placeholderText�� 0 aref aRef� #��������������A����������J������������bos����������
�� 
leng
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
reco�� 0 propertyname propertyName�� 0 	valuetype 	valueType
�� 
ctxt�� 0 islist isList�� 0 defaultvalue defaultValue�� $0 valueplaceholder valuePlaceholder�� 

�� 
bool
�� 
errn���Y
�� 
erob�� �� 40 _defaultvalueplaceholder _defaultValuePlaceholder�  0 _ordinalnumber _ordinalNumber� 0 _unpackvalue _unpackValue
� 
rest� &0 setobject_forkey_ setObject_forKey_���jE�O��,E�OfE�O\�[��l kh �kE�O��,�&�����f�b  ���%E�O��,b   eE�Y *�	 ��,b   �& )a a a �a a Y hO��,a   )a a a �a a Y hO�jv  S��,E�O�b    ?��,E�O��,j  *�k+ E�Y hO)a b  
la *�k+ %a %�%a %Y hY *��k/�l+ E�O�a ,E�O��,E P���, )a a a �a a Y hO�kvE�O  �[��l kh 
*��,�l+ �6F[OY��OjvE�Y hO����,l+ [OY��O�jv !)a b  
la  ��,%a !%�%a "%Y h& �*������  0 _formatoptions _formatOptions� ��� �  ���� &0 optiondefinitions optionDefinitions� 0 vtstyle vtStyle� &0 hasdefaultoptions hasDefaultOptions�  � ������������������� &0 optiondefinitions optionDefinitions� 0 vtstyle vtStyle� &0 hasdefaultoptions hasDefaultOptions�  0 defaultoptions defaultOptions�  0 booleanoptions booleanOptions� 0 otheroptions otherOptions�  0 optionssection optionsSection� 0 	optionref 	optionRef� $0 optiondefinition optionDefinition� 0 	shortname 	shortName� 0 longname longName� 0 	valuetype 	valueType� 0 islist isList� $0 valueplaceholder valuePlaceholder� $0 valuedescription valueDescription� 0 
optionname 
optionName� 0 
isoptional 
isOptional� "0 optionssynopsis optionsSynopsis� F�DGPTW��i�����~������������������������!�IS_�������������
&02:
� 
bool
� 
cobj� 0 b  � 0 n  
� 
kocl
� .corecnte****       ****
� 
reco� 0 	shortname 	shortName� 0 longname longName� 0 	valuetype 	valueType
� 
ctxt� 0 islist isList� 0 defaultvalue defaultValue� $0 valueplaceholder valuePlaceholder� $0 valuedescription valueDescription� 
� 
type�  � ���
� 
errn��\�  � � 60 throwinvalidparametertype throwInvalidParameterType
� 
errn��Y
� 
erob
� 
spac� 40 _defaultvalueplaceholder _defaultValuePlaceholder� 0 u  � *0 _formatdefaultvalue _formatDefaultValue
� 
lnfd��jv 	 ��& 
��lvY hO���mvE[�k/E�Z[�l/E�Z[�m/E�ZO��,�%��,%E�O�[��l kh ��&���a a a a fa b  a a a a a %E�O F��,a &E�O��,a &E�O�a ,a &E�O�a ,�&E�O�a ,a &E�O�a ,a &E�W X  b  �a �a a +  O�b  %b  %E�O�a !  1�a "  )a #a $a %�a a &Y hO�E�O�a '%�%E�Y %�E�O�a (%�%E�O�a ) �a *%�%E�Y hO��  
��%E�Y ��a ,b  E^ O�_ +%E�O]  �a ,%E�Y hO�a -%�%E�O�E�O�a .  *�k+ /E�Y hO�a 0,�%��,%E�O�_ +%�%E�O]  �a 1%E�Y hO�_ +%�%E�O�a ,b   �*�k+ 2%E�Y hO� �a 3%E�Y hO�a 4 �_ 5%b  %�%_ +%E�Y h[OY�%O� r�a 6 .a 7�%E�O�b  %b  %a 8%_ 5%b  %a 9%E�Y hO�a : .�a ;%E�O�b  %b  %a <%_ 5%b  %a =%E�Y hY hOa >E^ O�a ? ] a @%�%a A%E^ Y hO�a B ] a C%�%a D%E^ Y hO�a E ] �%E^ Y hO] �lv' �M������ $0 _formatarguments _formatArguments� �~��~ �  �}�|�} *0 argumentdefinitions argumentDefinitions�| 0 vtstyle vtStyle�  � 
�{�z�y�x�w�v�u�t�s�r�{ *0 argumentdefinitions argumentDefinitions�z 0 vtstyle vtStyle�y &0 argumentssynopsis argumentsSynopsis�x $0 argumentssection argumentsSection�w 0 argumentref argumentRef�v (0 argumentdefinition argumentDefinition�u 0 	valuetype 	valueType�t 0 islist isList�s $0 valueplaceholder valuePlaceholder�r $0 valuedescription valueDescription� &]`f�qr�p�o�n�m�l�k�j�i�h�g��f��e�d�c�b����a�`��_��^�]�\�[.�q 0 b  �p 0 n  
�o 
kocl
�n 
cobj
�m .corecnte****       ****
�l 
reco�k 0 	valuetype 	valueType
�j 
ctxt�i 0 islist isList�h 0 defaultvalue defaultValue�g $0 valueplaceholder valuePlaceholder�f $0 valuedescription valueDescription�e 

�d 
type
�c 
bool�b  � �Z�Y�X
�Z 
errn�Y�\�X  �a �` 60 throwinvalidparametertype throwInvalidParameterType�_ 40 _defaultvalueplaceholder _defaultValuePlaceholder�^ 0 u  �] *0 _formatdefaultvalue _formatDefaultValue
�\ 
lnfd
�[ 
spac�?�jv  
��lvY hO�E�O��,�%��,%E�O�[��l kh ��&���f�b  ��a a a %E�O *��,a &E�O��,a &E�O��,�&E�O�a ,�&E�W X  b  �a �a a + O�a   *�k+ E�Y hO� �a %E�Y hO�b  %b  %�a ,%�%��,%E�O��,b   �*�k+ %E�Y hO�a   �_ !%b  %�%E�Y hO��,b   a "�%a #%E�Y hO�_ $%�%E�[OY��Oa %�%�lv( �W=�V�U���T
�W .Fil:Argvnull���     ****�V 0 argv  �U �S��
�S 
OpsD� {�R�Q�P�R &0 optiondefinitions optionDefinitions�Q  �P  � �O��
�O 
OpsA� {�N�M�L�N *0 argumentdefinitions argumentDefinitions�M  �L  � �K��J
�K 
DefO� {�I�H�G�I &0 hasdefaultoptions hasDefaultOptions�H  
�G boovtrue�J  � �F�E�D�C�B�A�@�?�>�=�<�F 0 argv  �E &0 optiondefinitions optionDefinitions�D *0 argumentdefinitions argumentDefinitions�C &0 hasdefaultoptions hasDefaultOptions�B 0 oldtids oldTIDs�A (0 asocparametersdict asocParametersDict�@ 0 argumentslist argumentsList�? 0 etext eText�> 0 enumber eNumber�= 0 efrom eFrom�< 
0 eto eTo� WX�;�:t�9���8�7�6�5�4�3��2�1�0�/��.�-
�; 
ascr
�: 
txdl�9 "0 aslistparameter asListParameter
�8 
cobj�7 0 _parseoptions _parseOptions�6 (0 _adddefaultoptions _addDefaultOptions�5 "0 _parsearguments _parseArguments
�4 
****�3 0 etext eText� �,�+�
�, 
errn�+ 0 enumber eNumber� �*�)�
�* 
erob�) 0 efrom eFrom� �(�'�&
�( 
errt�' 
0 eto eTo�&  
�2 
errn
�1 
erob
�0 
errt�/ �. �- 
0 _error  �T ��� ���,E�O db  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�O*��-��m+ 	E[�k/E�Z[�l/E�ZO*��l+ 
O*���m+ O���,FO��&W 8X  ���,FO�b  
  )�a �a �a �Y *a ����a + V) �%��$�#���"
�% .Fil:FHlpnull��� ��� null�$  �# �!��
�! 
Name� {� ��  0 commandname commandName�  � ���
� 
Summ� {��� $0 shortdescription shortDescription�  � ���
� 
Usag� {���� "0 commandsynopses commandSynopses�  �  � ���
� 
OpsD� {���� &0 optiondefinitions optionDefinitions�  �  � ���
� 
OpsA� {���� *0 argumentdefinitions argumentDefinitions�  �  � ���
� 
Docu� {��"� "0 longdescription longDescription�  � ���
� 
VFmt� {��
�	� 0 isstyled isStyled�
  
�	 boovtrue� ���
� 
DefO� {���� &0 hasdefaultoptions hasDefaultOptions�  
� boovtrue�  � ���� ������������������������������� 0 commandname commandName� $0 shortdescription shortDescription� "0 commandsynopses commandSynopses�  &0 optiondefinitions optionDefinitions�� *0 argumentdefinitions argumentDefinitions�� "0 longdescription longDescription�� 0 isstyled isStyled�� &0 hasdefaultoptions hasDefaultOptions�� 0 vtstyle vtStyle�� 0 helptext helpText�� 00 defaultoptionssynopsis defaultOptionsSynopsis��  0 optionssection optionsSection�� 40 defaultargumentssynopsis defaultArgumentsSynopsis�� $0 argumentssection argumentsSection�� 0 textref textRef�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� 4/0?��K��Wco{��������������������������������������������J��O��Wex������������� "0 astextparameter asTextParameter�� "0 aslistparameter asListParameter�� (0 asbooleanparameter asBooleanParameter�� 0 n  �� 0 vt100 VT100�� 0 b  �� 0 u  �� �� 
�� .Fil:EnVanull��� ��� null�� 0 _  
�� .Fil:SplPnull���     ctxt��  ��  ��  0 _formatoptions _formatOptions
�� 
cobj�� $0 _formatarguments _formatArguments
�� 
kocl
�� .corecnte****       ****� ������
�� 
errn���\��  
�� 
list�� 60 throwinvalidparametertype throwInvalidParameterType
�� 
lnfd�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �"&��"b  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+  "�*jk+ �*kk+ �*a k+ a E�Y �a �a �a a E�O�a   $ *j a ,j E�W X  a E�Y hO��,a %��,%b  %b  %�%E�O�a  �a %�%E�Y hO*���m+ E[a  k/E�Z[a  l/E�ZO*��l+ !E[a  k/E�Z[a  l/E�ZO�b  %��,%a "%��,%E�O�jv  ��%�%kvE�Y hO / )�[a #a  l $kh �b  %b  %�%E�[OY��W X  %b  �a &a 'a (a + )O�a * �b  %�%E�Y hO�a + �b  %�%E�Y hO�a , "�b  %��,%a -%��,%b  %�%E�Y hO�_ .%W X / 0*a 1�] ] ] a 2+ 3V* �����������
�� .Fil:CurFnull��� ��� null��  ��  � ������������ 0 asocpath asocPath�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ��������������������
�� misccura�� 0 nsfilemanager NSFileManager��  0 defaultmanager defaultManager�� ,0 currentdirectorypath currentDirectoryPath
�� 
msng
� 
errn��@
� 
ctxt
� 
psxf� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� ; *��,j+ j+ E�O��  )��l�Y hO��&�&W X 
 *졢���+ + �������
� .Fil:EnVanull��� ��� null�  �  �  � �����
� misccura� 0 nsprocessinfo NSProcessInfo� 0 processinfo processInfo� 0 environment  
� 
****� ��,j+ j+ �&, �������
� .Fil:RSInnull��� ��� null�  � ���
� 
Prmt� {��� 0 
prompttext 
promptText�  � ���
� 
ReTo� {���� 0 isinteractive isInteractive�  
� boovfals�  � 	���������� 0 
prompttext 
promptText� 0 isinteractive isInteractive� 0 	asocstdin 	asocStdin� 0 asocdata asocData� 0 
asocstring 
asocString� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �����������������N�����~�s�}�|
� misccura� 0 nsfilehandle NSFileHandle� :0 filehandlewithstandardinput fileHandleWithStandardInput
� 
SLiB
� 
ALiE� 
� .Fil:WSOunull���     ctxt� 0 availabledata availableData� 
0 length  
� 
msng� *0 readdatatoendoffile readDataToEndOfFile� 0 nsstring NSString� 	0 alloc  � ,0 nsutf8stringencoding NSUTF8StringEncoding� 00 initwithdata_encoding_ initWithData_encoding_
� 
errn��\
� 
lnfd� 0 
hassuffix_ 
hasSuffix_� &0 substringtoindex_ substringToIndex_
� 
ctxt�~ 0 etext eText� �{�z�
�{ 
errn�z 0 enumber eNumber� �y�x�
�y 
erob�x 0 efrom eFrom� �w�v�u
�w 
errt�v 
0 eto eTo�u  �} �| 
0 _error  � � ���,j+ E�O� '��f�f� O�j+ E�O�j+ j  �Y hY 	�j+ 
E�O��,j+ ���,l+ E�O��  )�a la Y hO�_ k+  ��j+ kk+ E�Y hO�a &W X  *a ����a + - �t��s�r���q
�t .Fil:WSOunull���     ctxt�s 0 thetext theText�r �p��
�p 
SLiB� {�o�n�m�o 0 uselinefeeds useLinefeeds�n  
�m boovtrue� �l��k
�l 
ALiE� {�j�i�h�j  0 withlineending withLineEnding�i  
�h boovtrue�k  � 	�g�f�e�d�c�b�a�`�_�g 0 thetext theText�f 0 uselinefeeds useLinefeeds�e  0 withlineending withLineEnding�d 0 
asocstring 
asocString�c 0 
asocstdout 
asocStdout�b 0 etext eText�a 0 enumber eNumber�` 0 efrom eFrom�_ 
0 eto eTo� ��^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�M��L�K�^ "0 astextparameter asTextParameter�] &0 asnsmutablestring asNSMutableString
�\ 
ret 
�[ 
lnfd�Z 0 location  �Y 
0 length  �X �W l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_�V 0 
hassuffix_ 
hasSuffix_
�U 
bool�T 0 appendstring_ appendString_
�S misccura�R 0 nsfilehandle NSFileHandle�Q <0 filehandlewithstandardoutput fileHandleWithStandardOutput�P ,0 nsutf8stringencoding NSUTF8StringEncoding�O (0 datausingencoding_ dataUsingEncoding_�N 0 
writedata_ 
writeData_�M 0 etext eText� �J�I�
�J 
errn�I 0 enumber eNumber� �H�G�
�H 
erob�G 0 efrom eFrom� �F�E�D
�F 
errt�E 
0 eto eTo�D  �L �K 
0 _error  �q � �b  b  ��l+ k+ E�O� ,���%�j�j�j+ ��+ O���j�j�j+ ��+ Y hO�	 ��k+ 	�& ��k+ Y hO��,j+ E�O����,k+ k+ OhW X  *a ����a +  ascr  ��ޭ