FasdUAS 1.101.10   ��   ��    k             l      ��  ��   � File -- common file system and path string operations

Caution:

- Coercing file identifier objects to �class bmrk� currently causes AS to crash.

Notes:

- Path manipulation commands all operate on POSIX paths, as those are reliable whereas HFS paths (which are already deprecated everywhere else in OS X) are not. As POSIX paths are the default, handler names do not include the word 'POSIX' as standard; other formats (HFS/Windows/file URL) must be explicitly indicated.

- Library handlers should use TypeSupport's asPOSIXPathParameter(...) to validate user-supplied alias/furl/path parameters and normalize them as POSIX path strings (if a file object is specifically required, just coerce the path string to `POSIX file`). This should insulate library handlers from the worst of the mess that is AS's file identifier types.


TO DO:

- is there any benefit to adding `with UTF8 byte order mark` option to `write to file`? (NSString automatically adds UTF16/32 BOMs, but doesn't add UTF8 BOM for compatibility's sake; however, users might want to add UTF8 BOM to improve portability of files they intend to distribute)

- implement Windows path support in `convert path` (need to port CoreFoundation code for this)



- following TODOs are probably best left for now:

	- is there a Cocoa API to fuzzily convert IANA charset names to NSString encodings? if so, would be better than hardcoded list of encoding constants. A. Doesn't appear to be; also, NSStringEncodings aren't a directly interchangeable subset of CFStringEncodings, and since CFString APIs aren't accessible via ASOC there isn't any way to access the additional CF encodings anyway

	- any way to determine (via Cocoa) if stdout/stderr is connected to a terminal? if so, get rid of `terminal styles` parameter in `format command line help`? or provide separate `outputs to terminal` command that returns true/false (isStyled should only be true if help text will be displayed in Terminal.app or other VT100 terminal emulator) - A. probably not: isatty() is part of C stdlib, which ASOC can't import AFAIK, and NSFileHandle doesn't provide an equivalent method
	
	- if isStyled, text should be auto-wrapped to terminal width; Q. any way to get current terminal width, if available? (suspect that's a C call only [e.g. see osatest's terminalColumns() function]; anything in NSUserDefaults?)

	- in `read from file` allow `unknown encoding` to be passed, in which case use NSString's stringWithContentsOfFile:usedEncoding:error:, which tries to determine file's text encoding in various ways (e.g. by checking for BOM or "com.apple.TextEncoding" extended file attribute)? downside of that approach is that it really ought to return the encoding along with text for caller's information, which would make the command's return type inconsistent; another option might be to cheat it and implement a separate `detect encoding` and/or `guess encoding` command that returns just the encoding (ideally along with a value that indicates whether it's a reliable determination based on BOM or extended attribute or a heuristic guess)

	- what is status of alias and bookmark objects in AS? (the former is deprecated everywhere else in OS X; the latter is poorly supported, with crashing bugs, and rarely appears); what can/should/shouldn't be done to support these?

     � 	 	�   F i l e   - -   c o m m o n   f i l e   s y s t e m   a n d   p a t h   s t r i n g   o p e r a t i o n s 
 
 C a u t i o n : 
 
 -   C o e r c i n g   f i l e   i d e n t i f i e r   o b j e c t s   t o   � c l a s s   b m r k �   c u r r e n t l y   c a u s e s   A S   t o   c r a s h . 
 
 N o t e s : 
 
 -   P a t h   m a n i p u l a t i o n   c o m m a n d s   a l l   o p e r a t e   o n   P O S I X   p a t h s ,   a s   t h o s e   a r e   r e l i a b l e   w h e r e a s   H F S   p a t h s   ( w h i c h   a r e   a l r e a d y   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X )   a r e   n o t .   A s   P O S I X   p a t h s   a r e   t h e   d e f a u l t ,   h a n d l e r   n a m e s   d o   n o t   i n c l u d e   t h e   w o r d   ' P O S I X '   a s   s t a n d a r d ;   o t h e r   f o r m a t s   ( H F S / W i n d o w s / f i l e   U R L )   m u s t   b e   e x p l i c i t l y   i n d i c a t e d . 
 
 -   L i b r a r y   h a n d l e r s   s h o u l d   u s e   T y p e S u p p o r t ' s   a s P O S I X P a t h P a r a m e t e r ( . . . )   t o   v a l i d a t e   u s e r - s u p p l i e d   a l i a s / f u r l / p a t h   p a r a m e t e r s   a n d   n o r m a l i z e   t h e m   a s   P O S I X   p a t h   s t r i n g s   ( i f   a   f i l e   o b j e c t   i s   s p e c i f i c a l l y   r e q u i r e d ,   j u s t   c o e r c e   t h e   p a t h   s t r i n g   t o   ` P O S I X   f i l e ` ) .   T h i s   s h o u l d   i n s u l a t e   l i b r a r y   h a n d l e r s   f r o m   t h e   w o r s t   o f   t h e   m e s s   t h a t   i s   A S ' s   f i l e   i d e n t i f i e r   t y p e s . 
 
 
 T O   D O : 
 
 -   i s   t h e r e   a n y   b e n e f i t   t o   a d d i n g   ` w i t h   U T F 8   b y t e   o r d e r   m a r k `   o p t i o n   t o   ` w r i t e   t o   f i l e ` ?   ( N S S t r i n g   a u t o m a t i c a l l y   a d d s   U T F 1 6 / 3 2   B O M s ,   b u t   d o e s n ' t   a d d   U T F 8   B O M   f o r   c o m p a t i b i l i t y ' s   s a k e ;   h o w e v e r ,   u s e r s   m i g h t   w a n t   t o   a d d   U T F 8   B O M   t o   i m p r o v e   p o r t a b i l i t y   o f   f i l e s   t h e y   i n t e n d   t o   d i s t r i b u t e ) 
 
 -   i m p l e m e n t   W i n d o w s   p a t h   s u p p o r t   i n   ` c o n v e r t   p a t h `   ( n e e d   t o   p o r t   C o r e F o u n d a t i o n   c o d e   f o r   t h i s ) 
 
 
 
 -   f o l l o w i n g   T O D O s   a r e   p r o b a b l y   b e s t   l e f t   f o r   n o w : 
 
 	 -   i s   t h e r e   a   C o c o a   A P I   t o   f u z z i l y   c o n v e r t   I A N A   c h a r s e t   n a m e s   t o   N S S t r i n g   e n c o d i n g s ?   i f   s o ,   w o u l d   b e   b e t t e r   t h a n   h a r d c o d e d   l i s t   o f   e n c o d i n g   c o n s t a n t s .   A .   D o e s n ' t   a p p e a r   t o   b e ;   a l s o ,   N S S t r i n g E n c o d i n g s   a r e n ' t   a   d i r e c t l y   i n t e r c h a n g e a b l e   s u b s e t   o f   C F S t r i n g E n c o d i n g s ,   a n d   s i n c e   C F S t r i n g   A P I s   a r e n ' t   a c c e s s i b l e   v i a   A S O C   t h e r e   i s n ' t   a n y   w a y   t o   a c c e s s   t h e   a d d i t i o n a l   C F   e n c o d i n g s   a n y w a y 
 
 	 -   a n y   w a y   t o   d e t e r m i n e   ( v i a   C o c o a )   i f   s t d o u t / s t d e r r   i s   c o n n e c t e d   t o   a   t e r m i n a l ?   i f   s o ,   g e t   r i d   o f   ` t e r m i n a l   s t y l e s `   p a r a m e t e r   i n   ` f o r m a t   c o m m a n d   l i n e   h e l p ` ?   o r   p r o v i d e   s e p a r a t e   ` o u t p u t s   t o   t e r m i n a l `   c o m m a n d   t h a t   r e t u r n s   t r u e / f a l s e   ( i s S t y l e d   s h o u l d   o n l y   b e   t r u e   i f   h e l p   t e x t   w i l l   b e   d i s p l a y e d   i n   T e r m i n a l . a p p   o r   o t h e r   V T 1 0 0   t e r m i n a l   e m u l a t o r )   -   A .   p r o b a b l y   n o t :   i s a t t y ( )   i s   p a r t   o f   C   s t d l i b ,   w h i c h   A S O C   c a n ' t   i m p o r t   A F A I K ,   a n d   N S F i l e H a n d l e   d o e s n ' t   p r o v i d e   a n   e q u i v a l e n t   m e t h o d 
 	 
 	 -   i f   i s S t y l e d ,   t e x t   s h o u l d   b e   a u t o - w r a p p e d   t o   t e r m i n a l   w i d t h ;   Q .   a n y   w a y   t o   g e t   c u r r e n t   t e r m i n a l   w i d t h ,   i f   a v a i l a b l e ?   ( s u s p e c t   t h a t ' s   a   C   c a l l   o n l y   [ e . g .   s e e   o s a t e s t ' s   t e r m i n a l C o l u m n s ( )   f u n c t i o n ] ;   a n y t h i n g   i n   N S U s e r D e f a u l t s ? ) 
 
 	 -   i n   ` r e a d   f r o m   f i l e `   a l l o w   ` u n k n o w n   e n c o d i n g `   t o   b e   p a s s e d ,   i n   w h i c h   c a s e   u s e   N S S t r i n g ' s   s t r i n g W i t h C o n t e n t s O f F i l e : u s e d E n c o d i n g : e r r o r : ,   w h i c h   t r i e s   t o   d e t e r m i n e   f i l e ' s   t e x t   e n c o d i n g   i n   v a r i o u s   w a y s   ( e . g .   b y   c h e c k i n g   f o r   B O M   o r   " c o m . a p p l e . T e x t E n c o d i n g "   e x t e n d e d   f i l e   a t t r i b u t e ) ?   d o w n s i d e   o f   t h a t   a p p r o a c h   i s   t h a t   i t   r e a l l y   o u g h t   t o   r e t u r n   t h e   e n c o d i n g   a l o n g   w i t h   t e x t   f o r   c a l l e r ' s   i n f o r m a t i o n ,   w h i c h   w o u l d   m a k e   t h e   c o m m a n d ' s   r e t u r n   t y p e   i n c o n s i s t e n t ;   a n o t h e r   o p t i o n   m i g h t   b e   t o   c h e a t   i t   a n d   i m p l e m e n t   a   s e p a r a t e   ` d e t e c t   e n c o d i n g `   a n d / o r   ` g u e s s   e n c o d i n g `   c o m m a n d   t h a t   r e t u r n s   j u s t   t h e   e n c o d i n g   ( i d e a l l y   a l o n g   w i t h   a   v a l u e   t h a t   i n d i c a t e s   w h e t h e r   i t ' s   a   r e l i a b l e   d e t e r m i n a t i o n   b a s e d   o n   B O M   o r   e x t e n d e d   a t t r i b u t e   o r   a   h e u r i s t i c   g u e s s ) 
 
 	 -   w h a t   i s   s t a t u s   o f   a l i a s   a n d   b o o k m a r k   o b j e c t s   i n   A S ?   ( t h e   f o r m e r   i s   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X ;   t h e   l a t t e r   i s   p o o r l y   s u p p o r t e d ,   w i t h   c r a s h i n g   b u g s ,   a n d   r a r e l y   a p p e a r s ) ;   w h a t   c a n / s h o u l d / s h o u l d n ' t   b e   d o n e   t o   s u p p o r t   t h e s e ? 
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
0 eto eTo��  ��   A o     ���� 0 _support   3  P Q P l     ��������  ��  ��   Q  R S R l     ��������  ��  ��   S  T U T l     �� V W��   V J D--------------------------------------------------------------------    W � X X � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - U  Y Z Y l     �� [ \��   [  File Read/Write; these are atomic alternatives to StandardAdditions' File Read/Write suite, with better support for text encodings (incremental read/write is almost entirely useless in practice as AS doesn't have the capabilities or smarts to do it right)    \ � ] ]    F i l e   R e a d / W r i t e ;   t h e s e   a r e   a t o m i c   a l t e r n a t i v e s   t o   S t a n d a r d A d d i t i o n s '   F i l e   R e a d / W r i t e   s u i t e ,   w i t h   b e t t e r   s u p p o r t   f o r   t e x t   e n c o d i n g s   ( i n c r e m e n t a l   r e a d / w r i t e   i s   a l m o s t   e n t i r e l y   u s e l e s s   i n   p r a c t i c e   a s   A S   d o e s n ' t   h a v e   t h e   c a p a b i l i t i e s   o r   s m a r t s   t o   d o   i t   r i g h t ) Z  ^ _ ^ l     ��������  ��  ��   _  ` a ` h   " )�� b�� (0 _nsstringencodings _NSStringEncodings b k       c c  d e d l     �� f g��   f � � note: AS can't natively represent integers larger than 2^30, but as long as they're not larger than 2^50 (1e15) then AS's real (Double) representation will reliably coerce back to integer when passed to ASOC    g � h h�   n o t e :   A S   c a n ' t   n a t i v e l y   r e p r e s e n t   i n t e g e r s   l a r g e r   t h a n   2 ^ 3 0 ,   b u t   a s   l o n g   a s   t h e y ' r e   n o t   l a r g e r   t h a n   2 ^ 5 0   ( 1 e 1 5 )   t h e n   A S ' s   r e a l   ( D o u b l e )   r e p r e s e n t a t i o n   w i l l   r e l i a b l y   c o e r c e   b a c k   t o   i n t e g e r   w h e n   p a s s e d   t o   A S O C e  i j i l     ��������  ��  ��   j  k l k l     �� m n��   m ) # TO DO: use NS...Encoding constants    n � o o F   T O   D O :   u s e   N S . . . E n c o d i n g   c o n s t a n t s l  p q p j     ��� r�� 
0 _list_   r J     � s s  t u t l 	    v���� v J      w w  x y x m     ��
�� FEncFE01 y  z�� z m    ���� ��  ��  ��   u  { | { l 	   }���� } J     ~ ~   �  m    ��
�� FEncFE02 �  ��� � m    ���� 
��  ��  ��   |  � � � l 	   ����� � J     � �  � � � m    	��
�� FEncFE03 �  ��� � m   	 
 � � A�      ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE04 �  ��� � m     � � A�     ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE05 �  ��� � m     � � A�     ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE06 �  ��� � m     � � A�      ��  ��  ��   �  � � � l 	   ����� � J     � �  � � � m    ��
�� FEncFE07 �  ��� � m     � � A�     ��  ��  ��   �  � � � l 	    ����� � J      � �  � � � m    ��
�� FEncFE11 �  ��� � m    ���� ��  ��  ��   �  � � � l 	   & ����� � J     & � �  � � � m     !��
�� FEncFE12 �  ��� � m   ! $���� ��  ��  ��   �  � � � l 	 & . ����� � J   & . � �  � � � m   & )��
�� FEncFE13 �  ��� � m   ) ,���� ��  ��  ��   �  � � � l 	 . 6 ����� � J   . 6 � �  � � � m   . 1��
�� FEncFE14 �  ��� � m   1 4���� 	��  ��  ��   �  � � � l 	 6 < ����� � J   6 < � �  � � � m   6 9��
�� FEncFE15 �  ��� � m   9 :���� ��  ��  ��   �  � � � l 	 < D ����� � J   < D � �  � � � m   < ?��
�� FEncFE16 �  ��� � m   ? B���� ��  ��  ��   �  � � � l 	 D L ����� � J   D L � �  � � � m   D G��
�� FEncFE17 �  ��� � m   G J���� ��  ��  ��   �  � � � l 	 L T ���� � J   L T � �  � � � m   L O�~
�~ FEncFE18 �  ��} � m   O R�|�| �}  ��  �   �  � � � l 	 T \ ��{�z � J   T \ � �  � � � m   T W�y
�y FEncFE19 �  ��x � m   W Z�w�w �x  �{  �z   �  � � � l 	 \ d ��v�u � J   \ d � �  � � � m   \ _�t
�t FEncFE50 �  ��s � m   _ b�r�r �s  �v  �u   �  � � � l 	 d l ��q�p � J   d l � �  � � � m   d g�o
�o FEncFE51 �  ��n � m   g j�m�m �n  �q  �p   �  � � � l 	 l t ��l�k � J   l t � �  � � � m   l o�j
�j FEncFE52 �  ��i � m   o r�h�h �i  �l  �k   �  � � � l 	 t | �g�f  J   t |  m   t w�e
�e FEncFE53 �d m   w z�c�c �d  �g  �f   � �b l 	 | ��a�` J   | � 	 m   | �_
�_ FEncFE54	 
�^
 m    ��]�] �^  �a  �`  �b   q  l     �\�[�Z�\  �[  �Z   �Y i  � � I      �X�W�X 0 getencoding getEncoding �V o      �U�U 0 textencoding textEncoding�V  �W   k     V  Q     K k    3  r     c     o    �T�T 0 textencoding textEncoding m    �S
�S 
enum o      �R�R 0 textencoding textEncoding �Q X   	 3 �P!  Z   ."#�O�N" =   !$%$ n   &'& 4    �M(
�M 
cobj( m    �L�L ' o    �K�K 0 aref aRef% o     �J�J 0 textencoding textEncoding# L   $ *)) n  $ )*+* 4   % (�I,
�I 
cobj, m   & '�H�H + o   $ %�G�G 0 aref aRef�O  �N  �P 0 aref aRef! n   -.- o    �F�F 
0 _list_  .  f    �Q   R      �E�D/
�E .ascrerr ****      � ****�D  / �C0�B
�C 
errn0 d      11 m      �A�A��B   l  ; K2342 Q   ; K5675 L   > B88 c   > A9:9 o   > ?�@�@ 0 textencoding textEncoding: m   ? @�?
�? 
long6 R      �>�=;
�> .ascrerr ****      � ****�=  ; �<<�;
�< 
errn< d      == m      �:�:��;  7 l  J J�9>?�9  >   fall through   ? �@@    f a l l   t h r o u g h3 ] W not a predefined constant, but hedge bets as it might be a raw NSStringEncoding number   4 �AA �   n o t   a   p r e d e f i n e d   c o n s t a n t ,   b u t   h e d g e   b e t s   a s   i t   m i g h t   b e   a   r a w   N S S t r i n g E n c o d i n g   n u m b e r B�8B R   L V�7CD
�7 .ascrerr ****      � ****C m   T UEE �FF h I n v a l i d    u s i n g    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .D �6GH
�6 
errnG m   N O�5�5�YH �4IJ
�4 
erobI o   P Q�3�3 0 textencoding textEncodingJ �2K�1
�2 
errtK m   R S�0
�0 
enum�1  �8  �Y   a LML l     �/�.�-�/  �.  �-  M NON l     �,�+�*�,  �+  �*  O PQP l     �)RS�)  R  -----   S �TT 
 - - - - -Q UVU l     �(�'�&�(  �'  �&  V WXW i  * -YZY I     �%[\
�% .Fil:Readnull���     file[ o      �$�$ 0 thefile theFile\ �#]^
�# 
Type] |�"�!_� `�"  �!  _ o      �� 0 datatype dataType�   ` l     a��a m      �
� 
ctxt�  �  ^ �b�
� 
Encob |��c�d�  �  c o      �� 0 textencoding textEncoding�  d l     e��e m      �
� FEncFE01�  �  �  Z Q     �fghf k    �ii jkj r    lml n   non I    �p�� ,0 asposixpathparameter asPOSIXPathParameterp qrq o    	�� 0 thefile theFiler s�s m   	 
tt �uu  �  �  o o    �� 0 _support  m o      �� 0 	posixpath 	posixPathk vwv r    xyx n   z{z I    �|�� "0 astypeparameter asTypeParameter| }~} o    �
�
 0 datatype dataType~ �	 m    �� ���  a s�	  �  { o    �� 0 _support  y o      �� 0 datatype dataTypew ��� Z    ������ F    *��� =   "��� o     �� 0 datatype dataType� m     !�
� 
ctxt� >  % (��� o   % &�� 0 textencoding textEncoding� m   & '�
� FEncFEPE� l  - }���� k   - }�� ��� r   - 9��� n  - 7��� I   2 7� ����  0 getencoding getEncoding� ���� o   2 3���� 0 textencoding textEncoding��  ��  � o   - 2���� (0 _nsstringencodings _NSStringEncodings� o      ���� 0 textencoding textEncoding� ��� r   : S��� n  : D��� I   = D������� T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_� ��� o   = >���� 0 	posixpath 	posixPath� ��� o   > ?���� 0 textencoding textEncoding� ���� l  ? @������ m   ? @��
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
ctxt��  �'! note: AS treats `text`, `string`, and `Unicode text` as synonyms when comparing for equality, which is a little bit problematic as StdAdds' `read` command treats `string` as 'primary encoding' and `Unicode text` as UTF16; passing `primary encoding` for `using` parameter provides an 'out'   � ���B   n o t e :   A S   t r e a t s   ` t e x t ` ,   ` s t r i n g ` ,   a n d   ` U n i c o d e   t e x t `   a s   s y n o n y m s   w h e n   c o m p a r i n g   f o r   e q u a l i t y ,   w h i c h   i s   a   l i t t l e   b i t   p r o b l e m a t i c   a s   S t d A d d s '   ` r e a d `   c o m m a n d   t r e a t s   ` s t r i n g `   a s   ' p r i m a r y   e n c o d i n g '   a n d   ` U n i c o d e   t e x t `   a s   U T F 1 6 ;   p a s s i n g   ` p r i m a r y   e n c o d i n g `   f o r   ` u s i n g `   p a r a m e t e r   p r o v i d e s   a n   ' o u t '�  � k   � ��� ��� r   � ���� I  � ������
�� .rdwropenshor       file� l  � ������� c   � ���� o   � ����� 0 	posixpath 	posixPath� m   � ���
�� 
psxf��  ��  ��  � o      ���� 0 fh  � ���� Q   � ����� k   � ��� ��� l  � ����� r   � ���� I  � �����
�� .rdwrread****        ****� o   � ����� 0 fh  � �����
�� 
as  � o   � ����� 0 datatype dataType��  � o      ���� 0 	theresult 	theResult� r l TO DO: how to produce better error messages (e.g. passing wrong dataType just gives 'Parameter error.' -50)   � ��� �   T O   D O :   h o w   t o   p r o d u c e   b e t t e r   e r r o r   m e s s a g e s   ( e . g .   p a s s i n g   w r o n g   d a t a T y p e   j u s t   g i v e s   ' P a r a m e t e r   e r r o r . '   - 5 0 )� ��� I  � ������
�� .rdwrclosnull���     ****� o   � ����� 0 fh  ��  � ���� L   � ��� o   � ����� 0 	theresult 	theResult��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � k   � ��� ��� Q   � ������ I  � ������
�� .rdwrclosnull���     ****� o   � ����� 0 fh  ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  � ���� R   � �����
�� .ascrerr ****      � ****� o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enumber eNumber� ����
�� 
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  ��  ��  �  g R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  h I   � �������� 
0 _error  � � � m   � � �  r e a d   f i l e   o   � ����� 0 etext eText  o   � ����� 0 enumber eNumber  o   � ����� 0 efrom eFrom 	��	 o   � ����� 
0 eto eTo��  ��  X 

 l     ��������  ��  ��    l     ��������  ��  ��    i  . 1 I     ��
�� .Fil:Writnull���     file o      ���� 0 thefile theFile ��
�� 
Data o      ���� 0 thedata theData ��
�� 
Type |��������  ��   o      ���� 0 datatype dataType��   l     ���� m      ��
�� 
ctxt��  ��   ����
�� 
Enco |��������  ��   o      ���� 0 textencoding textEncoding��   l     ��~ m      �}
�} FEncFE01�  �~  ��   Q    	 ! k    �"" #$# r    %&% n   '(' I    �|)�{�| ,0 asposixpathparameter asPOSIXPathParameter) *+* o    	�z�z 0 thefile theFile+ ,�y, m   	 
-- �..  �y  �{  ( o    �x�x 0 _support  & o      �w�w 0 	posixpath 	posixPath$ /0/ r    121 n   343 I    �v5�u�v "0 astypeparameter asTypeParameter5 676 o    �t�t 0 datatype dataType7 8�s8 m    99 �::  a s�s  �u  4 o    �r�r 0 _support  2 o      �q�q 0 datatype dataType0 ;�p; Z    �<=�o>< F    *?@? =   "ABA o     �n�n 0 datatype dataTypeB m     !�m
�m 
ctxt@ >  % (CDC o   % &�l�l 0 textencoding textEncodingD m   & '�k
�k FEncFEPE= k   - �EE FGF r   - AHIH n  - ?JKJ I   0 ?�jL�i�j &0 stringwithstring_ stringWithString_L M�hM l  0 ;N�g�fN n  0 ;OPO I   5 ;�eQ�d�e "0 astextparameter asTextParameterQ RSR o   5 6�c�c 0 thedata theDataS T�bT m   6 7UU �VV  d a t a�b  �d  P o   0 5�a�a 0 _support  �g  �f  �h  �i  K n  - 0WXW o   . 0�`�` 0 nsstring NSStringX m   - .�_
�_ misccuraI o      �^�^ 0 
asocstring 
asocStringG YZY r   B N[\[ n  B L]^] I   G L�]_�\�] 0 getencoding getEncoding_ `�[` o   G H�Z�Z 0 textencoding textEncoding�[  �\  ^ o   B G�Y�Y (0 _nsstringencodings _NSStringEncodings\ o      �X�X 0 textencoding textEncodingZ aba r   O kcdc n  O Xefe I   P X�Wg�V�W P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_g hih o   P Q�U�U 0 	posixpath 	posixPathi jkj m   Q R�T
�T boovtruek lml o   R S�S�S 0 textencoding textEncodingm n�Rn l  S To�Q�Po m   S T�O
�O 
obj �Q  �P  �R  �V  f o   O P�N�N 0 
asocstring 
asocStringd J      pp qrq o      �M�M 0 
didsucceed 
didSucceedr s�Ls o      �K�K 0 theerror theError�L  b t�Jt Z   l �uv�I�Hu H   l nww o   l m�G�G 0 
didsucceed 
didSucceedv R   q ��Fxy
�F .ascrerr ****      � ****x l  � �z�E�Dz c   � �{|{ n  � �}~} I   � ��C�B�A�C ,0 localizeddescription localizedDescription�B  �A  ~ o   � ��@�@ 0 theerror theError| m   � ��?
�? 
ctxt�E  �D  y �>�
�> 
errn n  u z��� I   v z�=�<�;�= 0 code  �<  �;  � o   u v�:�: 0 theerror theError� �9��
�9 
erob� o   } ~�8�8 0 thefile theFile� �7��6
�7 
errt� o   � ��5�5 0 datatype dataType�6  �I  �H  �J  �o  > k   � ��� ��� r   � ���� I  � ��4��
�4 .rdwropenshor       file� l  � ���3�2� c   � ���� o   � ��1�1 0 	posixpath 	posixPath� m   � ��0
�0 
psxf�3  �2  � �/��.
�/ 
perm� m   � ��-
�- boovtrue�.  � o      �,�, 0 fh  � ��+� Q   � ����� k   � ��� ��� l  � ����� I  � ��*��
�* .rdwrseofnull���     ****� o   � ��)�) 0 fh  � �(��'
�( 
set2� m   � ��&�&  �'  � e _ important: when overwriting an existing file, make sure its previous contents are erased first   � ��� �   i m p o r t a n t :   w h e n   o v e r w r i t i n g   a n   e x i s t i n g   f i l e ,   m a k e   s u r e   i t s   p r e v i o u s   c o n t e n t s   a r e   e r a s e d   f i r s t� ��� l  � ����� I  � ��%��
�% .rdwrwritnull���     ****� o   � ��$�$ 0 thedata theData� �#��
�# 
refn� o   � ��"�" 0 fh  � �!�� 
�! 
as  � o   � ��� 0 datatype dataType�   � 2 , TO DO: how to produce better error messages   � ��� X   T O   D O :   h o w   t o   p r o d u c e   b e t t e r   e r r o r   m e s s a g e s� ��� I  � ����
� .rdwrclosnull���     ****� o   � ��� 0 fh  �  � ��� L   � ���  �  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � k   � ��� ��� Q   � ����� I  � ����
� .rdwrclosnull���     ****� o   � ��� 0 fh  �  � R      ���

� .ascrerr ****      � ****�  �
  �  � ��	� R   � ����
� .ascrerr ****      � ****� o   � ��� 0 etext eText� ���
� 
errn� o   � ��� 0 enumber eNumber� ���
� 
erob� o   � ��� 0 efrom eFrom� ���
� 
errt� o   � �� �  
0 eto eTo�  �	  �+  �p    R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  ! I   �	������� 
0 _error  � ��� m   � ��� ���  w r i t e   f i l e� ��� o   � ���� 0 etext eText� ��� o   ���� 0 enumber eNumber� ��� o  ���� 0 efrom eFrom� ���� o  ���� 
0 eto eTo��  ��   ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   POSIX path manipulation   � ��� 0   P O S I X   p a t h   m a n i p u l a t i o n� ��� l     ��������  ��  ��  � ��� i  2 5��� I     ����
�� .Fil:ConPnull���     ****� o      ���� 0 filepath filePath� ����
�� 
From� |����������  ��  � o      ���� 0 
fromformat 
fromFormat��  � l     ������ m      ��
�� FLCTFLCP��  ��  � �����
�� 
To__� |����������  ��  � o      ���� 0 toformat toFormat��  � l     ������ m      ��
�� FLCTFLCP��  ��  ��  � l   ����� Q    ����� k   �� ��� Z    ����� � =     l   ���� I   ��
�� .corecnte****       **** J     �� o    ���� 0 filepath filePath��   ����
�� 
kocl m    ��
�� 
ctxt��  ��  ��   m    ����  � l   	
	 r     n    I    ������ ,0 asposixpathparameter asPOSIXPathParameter  o    ���� 0 filepath filePath �� m     �  ��  ��   o    ���� 0 _support   o      ���� 0 	posixpath 	posixPath
 F @ assume it's a file identifier object (alias, �class furl�, etc)    � �   a s s u m e   i t ' s   a   f i l e   i d e n t i f i e r   o b j e c t   ( a l i a s ,   � c l a s s   f u r l � ,   e t c )��    l  ! � Z   ! � =  ! $ o   ! "���� 0 
fromformat 
fromFormat m   " #��
�� FLCTFLCP r   ' * !  o   ' (���� 0 filepath filePath! o      ���� 0 	posixpath 	posixPath "#" =  - 0$%$ o   - .���� 0 
fromformat 
fromFormat% m   . /��
�� FLCTFLCH# &'& l  3 ;()*( r   3 ;+,+ n   3 9-.- 1   7 9��
�� 
psxp. l  3 7/����/ 4   3 7��0
�� 
file0 o   5 6���� 0 filepath filePath��  ��  , o      ���� 0 	posixpath 	posixPath) � � caution: HFS path format is flawed and deprecated everywhere else in OS X (unlike POSIX path format, it can't distinguish between two volumes with the same name), but is still used by AS and a few older scriptable apps so must be supported   * �11�   c a u t i o n :   H F S   p a t h   f o r m a t   i s   f l a w e d   a n d   d e p r e c a t e d   e v e r y w h e r e   e l s e   i n   O S   X   ( u n l i k e   P O S I X   p a t h   f o r m a t ,   i t   c a n ' t   d i s t i n g u i s h   b e t w e e n   t w o   v o l u m e s   w i t h   t h e   s a m e   n a m e ) ,   b u t   i s   s t i l l   u s e d   b y   A S   a n d   a   f e w   o l d e r   s c r i p t a b l e   a p p s   s o   m u s t   b e   s u p p o r t e d' 232 =  > A454 o   > ?���� 0 
fromformat 
fromFormat5 m   ? @��
�� FLCTFLCW3 676 l  D H89:8 R   D H��;��
�� .ascrerr ****      � ****; m   F G<< �== ^ T O D O :   W i n d o w s   p a t h   c o n v e r s i o n   n o t   y e t   s u p p o r t e d��  9 W Q CFURLCreateWithFileSystemPath(NULL,(CFStringRef)path,kCFURLWindowsPathStyle,0);    : �>> �   C F U R L C r e a t e W i t h F i l e S y s t e m P a t h ( N U L L , ( C F S t r i n g R e f ) p a t h , k C F U R L W i n d o w s P a t h S t y l e , 0 ) ;  7 ?@? =  K NABA o   K L���� 0 
fromformat 
fromFormatB m   L M��
�� FLCTFLCU@ C��C k   Q �DD EFE r   Q [GHG n  Q YIJI I   T Y��K����  0 urlwithstring_ URLWithString_K L��L o   T U���� 0 filepath filePath��  ��  J n  Q TMNM o   R T���� 0 nsurl NSURLN m   Q R��
�� misccuraH o      ���� 0 asocurl asocURLF O��O Z  \ �PQ����P G   \ lRSR =  \ _TUT o   \ ]���� 0 asocurl asocURLU m   ] ^��
�� 
msngS H   b hVV n  b gWXW I   c g�������� 0 fileurl fileURL��  ��  X o   b c���� 0 asocurl asocURLQ R   o ���YZ
�� .ascrerr ****      � ****Y m   } �[[ �\\ T I n v a l i d   d i r e c t   p a r a m e t e r   ( n o t   a   f i l e   U R L ) .Z ��]^
�� 
errn] m   s v�����Y^ ��_��
�� 
erob_ o   y z���� 0 filepath filePath��  ��  ��  ��  ��   R   � ���`a
�� .ascrerr ****      � ****` m   � �bb �cc f I n v a l i d    f r o m    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .a ��de
�� 
errnd m   � ������Ye ��fg
�� 
erobf o   � ����� 0 
fromformat 
fromFormatg ��h��
�� 
errth m   � ���
�� 
enum��   \ V it's a text path in the user-specified format, so convert it to a standard POSIX path    �ii �   i t ' s   a   t e x t   p a t h   i n   t h e   u s e r - s p e c i f i e d   f o r m a t ,   s o   c o n v e r t   i t   t o   a   s t a n d a r d   P O S I X   p a t h� jkj l  � ���lm��  l   sanity check   m �nn    s a n i t y   c h e c kk opo l  � �qrsq Z  � �tu����t =   � �vwv n  � �xyx 1   � ���
�� 
lengy o   � ����� 0 	posixpath 	posixPathw m   � �����  u R   � ���z{
�� .ascrerr ****      � ****z m   � �|| �}} L I n v a l i d   d i r e c t   p a r a m e t e r   ( e m p t y   p a t h ) .{ ��~
�� 
errn~ m   � ������Y �����
�� 
erob� o   � ����� 0 filepath filePath��  ��  ��  r B < TO DO: what, if any, additional validation to perform here?   s ��� x   T O   D O :   w h a t ,   i f   a n y ,   a d d i t i o n a l   v a l i d a t i o n   t o   p e r f o r m   h e r e ?p ��� l  � �������  � ; 5 convert POSIX path text to the requested format/type   � ��� j   c o n v e r t   P O S I X   p a t h   t e x t   t o   t h e   r e q u e s t e d   f o r m a t / t y p e� ���� Z   ������ =  � ���� o   � ����� 0 toformat toFormat� m   � ���
�� FLCTFLCP� L   � ��� o   � ����� 0 	posixpath 	posixPath� ��� =  � ���� o   � ��� 0 toformat toFormat� m   � ��~
�~ FLCTFLCA� ��� l  � ����� L   � ��� c   � ���� c   � ���� o   � ��}�} 0 	posixpath 	posixPath� m   � ��|
�| 
psxf� m   � ��{
�{ 
alis� %  returns object of type `alias`   � ��� >   r e t u r n s   o b j e c t   o f   t y p e   ` a l i a s `� ��� =  � ���� o   � ��z�z 0 toformat toFormat� m   � ��y
�y FLCTFLCX� ��� l  � ����� L   � ��� c   � ���� o   � ��x�x 0 	posixpath 	posixPath� m   � ��w
�w 
psxf� , & returns object of type `�class furl�`   � ��� L   r e t u r n s   o b j e c t   o f   t y p e   ` � c l a s s   f u r l � `� ��� =  � ���� o   � ��v�v 0 toformat toFormat� m   � ��u
�u FLCTFLCS� ��� l  �	���� L   �	�� N   ��� n   ���� 4   ��t�
�t 
file� l  ���s�r� c   ���� c   ���� o   � �q�q 0 	posixpath 	posixPath� m   �p
�p 
psxf� m  �o
�o 
ctxt�s  �r  � 1   � ��n
�n 
ascr�NH returns an _object specifier_ of type 'file'. Caution: unlike alias and �class furl� objects, this is not a true object but may be used by some applications; not to be confused with the deprecated `file specifier` type (�class fss�), although it uses the same `file TEXT` constructor. Furthermore, it uses an HFS path string so suffers the same problems as HFS paths. Also, being a specifier, requires disambiguation when used [e.g.] in an `open` command otherwise command will be dispatched to it instead of target app, e.g. `tell app "TextEdit" to open {fileSpecifierObject}`. Horribly nasty, brittle, and confusing mis-feature, in other words, but supported (though not encouraged) as an option here for sake of compatibility as there's usually some scriptable app or other API in AS that will absolutely refuse to accept anything else.   � ����   r e t u r n s   a n   _ o b j e c t   s p e c i f i e r _   o f   t y p e   ' f i l e ' .   C a u t i o n :   u n l i k e   a l i a s   a n d   � c l a s s   f u r l �   o b j e c t s ,   t h i s   i s   n o t   a   t r u e   o b j e c t   b u t   m a y   b e   u s e d   b y   s o m e   a p p l i c a t i o n s ;   n o t   t o   b e   c o n f u s e d   w i t h   t h e   d e p r e c a t e d   ` f i l e   s p e c i f i e r `   t y p e   ( � c l a s s   f s s � ) ,   a l t h o u g h   i t   u s e s   t h e   s a m e   ` f i l e   T E X T `   c o n s t r u c t o r .   F u r t h e r m o r e ,   i t   u s e s   a n   H F S   p a t h   s t r i n g   s o   s u f f e r s   t h e   s a m e   p r o b l e m s   a s   H F S   p a t h s .   A l s o ,   b e i n g   a   s p e c i f i e r ,   r e q u i r e s   d i s a m b i g u a t i o n   w h e n   u s e d   [ e . g . ]   i n   a n   ` o p e n `   c o m m a n d   o t h e r w i s e   c o m m a n d   w i l l   b e   d i s p a t c h e d   t o   i t   i n s t e a d   o f   t a r g e t   a p p ,   e . g .   ` t e l l   a p p   " T e x t E d i t "   t o   o p e n   { f i l e S p e c i f i e r O b j e c t } ` .   H o r r i b l y   n a s t y ,   b r i t t l e ,   a n d   c o n f u s i n g   m i s - f e a t u r e ,   i n   o t h e r   w o r d s ,   b u t   s u p p o r t e d   ( t h o u g h   n o t   e n c o u r a g e d )   a s   a n   o p t i o n   h e r e   f o r   s a k e   o f   c o m p a t i b i l i t y   a s   t h e r e ' s   u s u a l l y   s o m e   s c r i p t a b l e   a p p   o r   o t h e r   A P I   i n   A S   t h a t   w i l l   a b s o l u t e l y   r e f u s e   t o   a c c e p t   a n y t h i n g   e l s e .� ��� = ��� o  �m�m 0 toformat toFormat� m  �l
�l FLCTFLCH� ��� L  �� c  ��� c  ��� o  �k�k 0 	posixpath 	posixPath� m  �j
�j 
psxf� m  �i
�i 
ctxt� ��� =  ��� o  �h�h 0 toformat toFormat� m  �g
�g FLCTFLCW� ��� l #)���� R  #)�f��e
�f .ascrerr ****      � ****� m  %(�� ��� ^ T O D O :   W i n d o w s   p a t h   c o n v e r s i o n   n o t   y e t   s u p p o r t e d�e  � F @ CFURLCopyFileSystemPath((CFURLRef)url, kCFURLWindowsPathStyle);   � ��� �   C F U R L C o p y F i l e S y s t e m P a t h ( ( C F U R L R e f ) u r l ,   k C F U R L W i n d o w s P a t h S t y l e ) ;� ��� = ,/��� o  ,-�d�d 0 toformat toFormat� m  -.�c
�c FLCTFLCU� ��b� k  2d�� ��� r  2<��� n 2:��� I  5:�a��`�a $0 fileurlwithpath_ fileURLWithPath_� ��_� o  56�^�^ 0 	posixpath 	posixPath�_  �`  � n 25��� o  35�]�] 0 nsurl NSURL� m  23�\
�\ misccura� o      �[�[ 0 asocurl asocURL� ��� Z  =[���Z�Y� = =@��� o  =>�X�X 0 asocurl asocURL� m  >?�W
�W 
msng� R  CW�V��
�V .ascrerr ****      � ****� b  QV��� m  QT�� ��� f C o u l d n ' t   c o n v e r t   t h e   f o l l o w i n g   p a t h   t o   a   f i l e   U R L :  � o  TU�U�U 0 	posixpath 	posixPath� �T��
�T 
errn� m  GJ�S�S�Y� �R��Q
�R 
erob� o  MN�P�P 0 filepath filePath�Q  �Z  �Y  � ��O� L  \d�� c  \c��� l \a��N�M� n \a��� I  ]a�L�K�J�L  0 absolutestring absoluteString�K  �J  � o  \]�I�I 0 asocurl asocURL�N  �M  � m  ab�H
�H 
ctxt�O  �b  � R  g�G��
�G .ascrerr ****      � ****� m  {~�� �   b I n v a l i d    t o    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .� �F
�F 
errn m  kn�E�E�Y �D
�D 
erob o  qr�C�C 0 toformat toFormat �B�A
�B 
errt m  ux�@
�@ 
enum�A  ��  � R      �?
�? .ascrerr ****      � **** o      �>�> 0 etext eText �=	
�= 
errn o      �<�< 0 enumber eNumber	 �;

�; 
erob
 o      �:�: 0 efrom eFrom �9�8
�9 
errt o      �7�7 
0 eto eTo�8  � I  ���6�5�6 
0 _error    m  �� �  c o n v e r t   p a t h  o  ���4�4 0 etext eText  o  ���3�3 0 enumber eNumber  o  ���2�2 0 efrom eFrom �1 o  ���0�0 
0 eto eTo�1  �5  � x r brings a modicum of sanity to the horrible mess that is AppleScript's file path formats and file identifier types   � � �   b r i n g s   a   m o d i c u m   o f   s a n i t y   t o   t h e   h o r r i b l e   m e s s   t h a t   i s   A p p l e S c r i p t ' s   f i l e   p a t h   f o r m a t s   a n d   f i l e   i d e n t i f i e r   t y p e s�  l     �/�.�-�/  �.  �-    l     �,�+�*�,  �+  �*    i  6 9 !  I     �)"#
�) .Fil:NorPnull���     ****" o      �(�( 0 filepath filePath# �'$�&
�' 
ExpR$ |�%�$%�#&�%  �$  % o      �"�" 0 isexpanding isExpanding�#  & l     '�!� ' m      �
� boovfals�!  �   �&  ! Q     R()*( k    @++ ,-, r    ./. n   010 I    �2�� ,0 asposixpathparameter asPOSIXPathParameter2 343 o    	�� 0 filepath filePath4 5�5 m   	 
66 �77  �  �  1 o    �� 0 _support  / o      �� 0 filepath filePath- 898 Z    0:;��: F    <=< o    �� 0 isexpanding isExpanding= H    >> C    ?@? o    �� 0 filepath filePath@ m    AA �BB  /; r    ,CDC I   *�E�
� .Fil:JoiPnull���     ****E J    &FF GHG I   #���
� .Fil:CurFnull��� ��� null�  �  H I�I o   # $�� 0 filepath filePath�  �  D o      �� 0 filepath filePath�  �  9 J�J L   1 @KK c   1 ?LML l  1 =N��
N n  1 =OPO I   9 =�	���	 60 stringbystandardizingpath stringByStandardizingPath�  �  P l  1 9Q��Q n  1 9RSR I   4 9�T�� &0 stringwithstring_ stringWithString_T U�U o   4 5�� 0 filepath filePath�  �  S n  1 4VWV o   2 4� �  0 nsstring NSStringW m   1 2��
�� misccura�  �  �  �
  M m   = >��
�� 
ctxt�  ) R      ��XY
�� .ascrerr ****      � ****X o      ���� 0 etext eTextY ��Z[
�� 
errnZ o      ���� 0 enumber eNumber[ ��\��
�� 
errt\ o      ���� 
0 eto eTo��  * I   H R��]���� 
0 _error  ] ^_^ m   I J`` �aa  n o r m a l i z e   p a t h_ bcb o   J K���� 0 etext eTextc ded o   K L���� 0 enumber eNumbere fgf o   L M���� 0 filepath filePathg h��h o   M N���� 
0 eto eTo��  ��   iji l     ��������  ��  ��  j klk l     ��������  ��  ��  l mnm i  : =opo I     ��qr
�� .Fil:JoiPnull���     ****q o      ����  0 pathcomponents pathComponentsr ��s��
�� 
Extes |����t��u��  ��  t o      ���� 0 fileextension fileExtension��  u l     v����v m      ww �xx  ��  ��  ��  p Q     �yz{y k    �|| }~} r    � n    ��� 2   ��
�� 
cobj� n   ��� I    ������� "0 aslistparameter asListParameter� ��� o    	����  0 pathcomponents pathComponents� ���� m   	 
�� ���  ��  ��  � o    ���� 0 _support  � o      ���� 0 subpaths subPaths~ ��� Q    \���� k    L�� ��� Z   %������� =   ��� o    ���� 0 subpaths subPaths� J    ����  � R    !������
�� .ascrerr ****      � ****��  ��  ��  ��  � ���� X   & L����� l  6 G���� r   6 G��� n  6 C��� I   ; C������� ,0 asposixpathparameter asPOSIXPathParameter� ��� n  ; >��� 1   < >��
�� 
pcnt� o   ; <���� 0 aref aRef� ���� m   > ?�� ���  ��  ��  � o   6 ;���� 0 _support  � n     ��� 1   D F��
�� 
pcnt� o   C D���� 0 aref aRef� | v TO DO: how should absolute paths after first item get handled? (e.g. Python's os.path.join discards everything prior)   � ��� �   T O   D O :   h o w   s h o u l d   a b s o l u t e   p a t h s   a f t e r   f i r s t   i t e m   g e t   h a n d l e d ?   ( e . g .   P y t h o n ' s   o s . p a t h . j o i n   d i s c a r d s   e v e r y t h i n g   p r i o r )�� 0 aref aRef� o   ) *���� 0 subpaths subPaths��  � R      ������
�� .ascrerr ****      � ****��  ��  � R   T \����
�� .ascrerr ****      � ****� m   Z [�� ��� � I n v a l i d   p a t h   c o m p o n e n t s   l i s t   ( e x p e c t e d   o n e   o r   m o r e   t e x t   a n d / o r   f i l e   i t e m s ) .� ����
�� 
errn� m   V W�����Y� �����
�� 
erob� o   X Y����  0 pathcomponents pathComponents��  � ��� r   ] i��� l  ] g������ n  ] g��� I   b g������� *0 pathwithcomponents_ pathWithComponents_� ���� o   b c���� 0 subpaths subPaths��  ��  � n  ] b��� o   ^ b���� 0 nsstring NSString� m   ] ^��
�� misccura��  ��  � o      ���� 0 asocpath asocPath� ��� r   j y��� n  j w��� I   o w������� "0 astextparameter asTextParameter� ��� o   o p���� 0 fileextension fileExtension� ���� m   p s�� ��� ( u s i n g   f i l e   e x t e n s i o n��  ��  � o   j o���� 0 _support  � o      ���� 0 fileextension fileExtension� ��� Z   z �������� >   z ���� n  z ��� 1   { ��
�� 
leng� o   z {���� 0 fileextension fileExtension� m    �����  � k   � ��� ��� r   � ���� n  � ���� I   � �������� B0 stringbyappendingpathextension_ stringByAppendingPathExtension_� ���� o   � ����� 0 fileextension fileExtension��  ��  � o   � ����� 0 asocpath asocPath� o      ���� 0 asocpath asocPath� ���� Z  � �������� =  � ���� o   � ����� 0 asocpath asocPath� m   � ���
�� 
msng� R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� . I n v a l i d   f i l e   e x t e n s i o n .� ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 fileextension fileExtension��  ��  ��  ��  ��  ��  � ���� L   � ��� c   � ���� o   � ����� 0 asocpath asocPath� m   � ���
�� 
ctxt��  z R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  { I   � �������� 
0 _error  � ��� m   � ��� ���  j o i n   p a t h� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  n ��� l     ��������  ��  ��  �    l     ��������  ��  ��    i  > A I     �
� .Fil:SplPnull���     ctxt o      �~�~ 0 filepath filePath �}�|
�} 
Upon |�{�z	�y
�{  �z  	 o      �x�x 0 splitposition splitPosition�y  
 l     �w�v m      �u
�u FLSPFLSL�w  �v  �|   Q     � k    s  r     n    I    �t�s�t &0 stringwithstring_ stringWithString_ �r l   �q�p n    I    �o�n�o ,0 asposixpathparameter asPOSIXPathParameter  o    �m�m 0 filepath filePath �l m     �    �l  �n   o    �k�k 0 _support  �q  �p  �r  �s   n   !"! o    �j�j 0 nsstring NSString" m    �i
�i misccura o      �h�h 0 asocpath asocPath #�g# Z    s$%&'$ =   ()( o    �f�f 0 splitposition splitPosition) m    �e
�e FLSPFLSL% L    /** J    .++ ,-, c    %./. l   #0�d�c0 n   #121 I    #�b�a�`�b F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent�a  �`  2 o    �_�_ 0 asocpath asocPath�d  �c  / m   # $�^
�^ 
ctxt- 3�]3 c   % ,454 l  % *6�\�[6 n  % *787 I   & *�Z�Y�X�Z &0 lastpathcomponent lastPathComponent�Y  �X  8 o   % &�W�W 0 asocpath asocPath�\  �[  5 m   * +�V
�V 
ctxt�]  & 9:9 =  2 5;<; o   2 3�U�U 0 splitposition splitPosition< m   3 4�T
�T FLSPFLSE: =>= L   8 I?? J   8 H@@ ABA c   8 ?CDC l  8 =E�S�RE n  8 =FGF I   9 =�Q�P�O�Q >0 stringbydeletingpathextension stringByDeletingPathExtension�P  �O  G o   8 9�N�N 0 asocpath asocPath�S  �R  D m   = >�M
�M 
ctxtB H�LH c   ? FIJI l  ? DK�K�JK n  ? DLML I   @ D�I�H�G�I 0 pathextension pathExtension�H  �G  M o   ? @�F�F 0 asocpath asocPath�K  �J  J m   D E�E
�E 
ctxt�L  > NON =  L OPQP o   L M�D�D 0 splitposition splitPositionQ m   M N�C
�C FLSPFLSAO R�BR L   R ZSS c   R YTUT l  R WV�A�@V n  R WWXW I   S W�?�>�=�?  0 pathcomponents pathComponents�>  �=  X o   R S�<�< 0 asocpath asocPath�A  �@  U m   W X�;
�; 
list�B  ' R   ] s�:YZ
�: .ascrerr ****      � ****Y m   o r[[ �\\ b I n v a l i d    a t    p a r a m e t e r   ( n o t   a n   a l l o w e d   c o n s t a n t ) .Z �9]^
�9 
errn] m   _ b�8�8�Y^ �7_`
�7 
erob_ o   e f�6�6 0 matchformat matchFormat` �5a�4
�5 
errta m   i l�3
�3 
enum�4  �g   R      �2bc
�2 .ascrerr ****      � ****b o      �1�1 0 etext eTextc �0de
�0 
errnd o      �/�/ 0 enumber eNumbere �.fg
�. 
erobf o      �-�- 0 efrom eFromg �,h�+
�, 
errth o      �*�* 
0 eto eTo�+   I   { ��)i�(�) 
0 _error  i jkj m   | ll �mm  s p l i t   p a t hk non o    ��'�' 0 etext eTexto pqp o   � ��&�& 0 enumber eNumberq rsr o   � ��%�% 0 efrom eFroms t�$t o   � ��#�# 
0 eto eTo�$  �(   uvu l     �"�!� �"  �!  �   v wxw l     ����  �  �  x yzy l     �{|�  { J D--------------------------------------------------------------------   | �}} � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -z ~~ l     ����  � S M Shell Script Support handlers for use in AppleScripts that run via osascript   � ��� �   S h e l l   S c r i p t   S u p p o r t   h a n d l e r s   f o r   u s e   i n   A p p l e S c r i p t s   t h a t   r u n   v i a   o s a s c r i p t ��� l     ����  �  �  � ��� l     ���� j   B F���  0 _argvusererror _ArgvUserError� m   B E��'��� error code used to indicate the shell script's user supplied invalid command line options (errors due to bugs in invalid option/argument definitions supplied by shell script author use standard AS error codes); need to decide what's a sensible code to use and document it in SDEF (unfortunately, `on error number ...` blocks only accept literal integer (for pattern matching) or identifier (for assignment) and don't allow a command as parameter, so there's no way to supply library-defined error numbers as 'named constants' via library-defined commands, e.g. `on error number (command line user error)`, that return the appropriate number)   � ���   e r r o r   c o d e   u s e d   t o   i n d i c a t e   t h e   s h e l l   s c r i p t ' s   u s e r   s u p p l i e d   i n v a l i d   c o m m a n d   l i n e   o p t i o n s   ( e r r o r s   d u e   t o   b u g s   i n   i n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n s   s u p p l i e d   b y   s h e l l   s c r i p t   a u t h o r   u s e   s t a n d a r d   A S   e r r o r   c o d e s ) ;   n e e d   t o   d e c i d e   w h a t ' s   a   s e n s i b l e   c o d e   t o   u s e   a n d   d o c u m e n t   i t   i n   S D E F   ( u n f o r t u n a t e l y ,   ` o n   e r r o r   n u m b e r   . . . `   b l o c k s   o n l y   a c c e p t   l i t e r a l   i n t e g e r   ( f o r   p a t t e r n   m a t c h i n g )   o r   i d e n t i f i e r   ( f o r   a s s i g n m e n t )   a n d   d o n ' t   a l l o w   a   c o m m a n d   a s   p a r a m e t e r ,   s o   t h e r e ' s   n o   w a y   t o   s u p p l y   l i b r a r y - d e f i n e d   e r r o r   n u m b e r s   a s   ' n a m e d   c o n s t a n t s '   v i a   l i b r a r y - d e f i n e d   c o m m a n d s ,   e . g .   ` o n   e r r o r   n u m b e r   ( c o m m a n d   l i n e   u s e r   e r r o r ) ` ,   t h a t   r e t u r n   t h e   a p p r o p r i a t e   n u m b e r )� ��� l     ����  �  �  � ��� h   G R��� 0 novalue NoValue� l     ����  � J D unique constant used to indicate no defaultValue property was given   � ��� �   u n i q u e   c o n s t a n t   u s e d   t o   i n d i c a t e   n o   d e f a u l t V a l u e   p r o p e r t y   w a s   g i v e n� ��� l     ����  �  �  � ��� j   S [��� 
0 lf2 LF2� b   S Z��� 1   S V�
� 
lnfd� 1   V Y�
� 
lnfd� ��� j   \ `�
��
 0 indent1 Indent1� m   \ _�� ���     � ��� j   a e�	��	 0 indent2 Indent2� m   a d�� ���             � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ��� �  �  �   � ��� i  f i��� I      ������� 0 vt100 VT100� ���� o      ���� 0 
formatcode 
formatCode��  ��  � k     �� ��� l      ������  �F@ Returns a magic character sequence that will apply the specified formatting or other control operation in Terminal.app and other VT100 terminal emulators. Multiple codes may be given as semicolon-separated numeric text, e.g. "1;7". Commonly used style codes are:
	
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
	   � ����   R e t u r n s   a   m a g i c   c h a r a c t e r   s e q u e n c e   t h a t   w i l l   a p p l y   t h e   s p e c i f i e d   f o r m a t t i n g   o r   o t h e r   c o n t r o l   o p e r a t i o n   i n   T e r m i n a l . a p p   a n d   o t h e r   V T 1 0 0   t e r m i n a l   e m u l a t o r s .   M u l t i p l e   c o d e s   m a y   b e   g i v e n   a s   s e m i c o l o n - s e p a r a t e d   n u m e r i c   t e x t ,   e . g .   " 1 ; 7 " .   C o m m o n l y   u s e d   s t y l e   c o d e s   a r e : 
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
 	� ���� L     �� b     ��� b     	��� b     ��� l    ������ 5     �����
�� 
cha � m    ���� 
�� kfrmID  ��  ��  � m    �� ���  [� o    ���� 0 
formatcode 
formatCode� m   	 
�� ���  m��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  � - ' convert raw args to supported AS types   � ��� N   c o n v e r t   r a w   a r g s   t o   s u p p o r t e d   A S   t y p e s� ��� l     ��������  ��  ��  � ��� i  j m��� I      ������� 0 _unpackvalue _unpackValue� ��� o      ���� 0 thevalue theValue� ���� o      ���� $0 definitionrecord definitionRecord��  ��  � k    ��� ��� l     ������  � � � note that only ASOC-friendly AS types are supported here since NSDictionaries are used as temporary storage for parsed options and arguments   � ���   n o t e   t h a t   o n l y   A S O C - f r i e n d l y   A S   t y p e s   a r e   s u p p o r t e d   h e r e   s i n c e   N S D i c t i o n a r i e s   a r e   u s e d   a s   t e m p o r a r y   s t o r a g e   f o r   p a r s e d   o p t i o n s   a n d   a r g u m e n t s� ��� r     ��� c     ��� n    ��� o    ���� 0 	valuetype 	valueType� o     ���� $0 definitionrecord definitionRecord� m    ��
�� 
type� o      ���� 0 	valuetype 	valueType� ��� Z   ������ =   ��� o    	���� 0 	valuetype 	valueType� m   	 
��
�� 
ctxt� r    ��� o    ���� 0 thevalue theValue� o      ���� 0 	theresult 	theResult� ��� E   ��� J    �� ��� m    ��
�� 
long� ��� m    ��
�� 
doub� ���� m    ��
�� 
nmbr��  � J    �� ���� o    ���� 0 	valuetype 	valueType��  � � � l    � k     �  r     - n    +	
	 I   ' +�������� 0 init  ��  ��  
 n    ' I   # '�������� 	0 alloc  ��  ��   n    # o   ! #���� &0 nsnumberformatter NSNumberFormatter m     !��
�� misccura o      ���� 0 asocformatter asocFormatter  n  . 6 I   / 6������ "0 setnumberstyle_ setNumberStyle_ �� l  / 2���� n  / 2 o   0 2���� D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle m   / 0��
�� misccura��  ��  ��  ��   o   . /���� 0 asocformatter asocFormatter  n  7 C I   8 C������ 0 
setlocale_ 
setLocale_ �� l  8 ?���� n  8 ?  I   ; ?�������� 0 systemlocale systemLocale��  ��    n  8 ;!"! o   9 ;���� 0 nslocale NSLocale" m   8 9��
�� misccura��  ��  ��  ��   o   7 8���� 0 asocformatter asocFormatter #$# r   D L%&% n  D J'(' I   E J��)���� &0 numberfromstring_ numberFromString_) *��* o   E F���� 0 thevalue theValue��  ��  ( o   D E���� 0 asocformatter asocFormatter& o      ���� 0 
asocresult 
asocResult$ +,+ Z  M i-.����- =  M R/0/ o   M N���� 0 
asocresult 
asocResult0 m   N Q��
�� 
msng. R   U e��12
�� .ascrerr ****      � ****1 b   _ d343 m   _ b55 �66 ( N o t   a   v a l i d   n u m b e r :  4 o   b c���� 0 thevalue theValue2 ��7��
�� 
errn7 o   Y ^����  0 _argvusererror _ArgvUserError��  ��  ��  , 898 r   j q:;: c   j o<=< o   j k���� 0 
asocresult 
asocResult= m   k n��
�� 
****; o      ���� 0 	theresult 	theResult9 >��> Z   r �?@����? =  r uABA o   r s���� 0 	valuetype 	valueTypeB m   s t��
�� 
long@ k   x �CC DED Z  x �FG����F >   x }HIH `   x {JKJ o   x y���� 0 	theresult 	theResultK m   y z���� I m   { |����  G R   � ���LM
�� .ascrerr ****      � ****L b   � �NON m   � �PP �QQ * N o t   a   v a l i d   i n t e g e r :  O o   � ����� 0 thevalue theValueM ��R��
�� 
errnR o   � �����  0 _argvusererror _ArgvUserError��  ��  ��  E S��S r   � �TUT c   � �VWV o   � ����� 0 	theresult 	theResultW m   � ���
�� 
longU o      ���� 0 	theresult 	theResult��  ��  ��  ��   6 0 note: decimal numbers must be in canonical form    �XX `   n o t e :   d e c i m a l   n u m b e r s   m u s t   b e   i n   c a n o n i c a l   f o r m  YZY E  � �[\[ J   � �]] ^_^ m   � ���
�� 
furl_ `a` m   � ���
�� 
alisa bcb m   � ���
�� 
filec d��d m   � ���
�� 
psxf��  \ J   � �ee f��f o   � ����� 0 	valuetype 	valueType��  Z ghg l  �Gijki k   �Gll mnm l  � ���op��  o   expand/normalize path   p �qq ,   e x p a n d / n o r m a l i z e   p a t hn rsr Z   �tu����t H   � �vv C   � �wxw o   � ����� 0 thevalue theValuex m   � �yy �zz  /u k   � �{{ |}| r   � �~~ n  � ���� I   � ��������� ,0 currentdirectorypath currentDirectoryPath��  ��  � n  � ���� I   � ���������  0 defaultmanager defaultManager��  ��  � n  � ���� o   � ����� 0 nsfilemanager NSFileManager� m   � ���
�� misccura o      ���� 0 basepath basePath} ��� Z  � �������� =  � ���� o   � ����� 0 basepath basePath� m   � ��
� 
msng� R   � ��~��
�~ .ascrerr ****      � ****� b   � ���� m   � ��� ��� � C a n ' t   e x p a n d   r e l a t i v e   f i l e   p a t h   ( c u r r e n t   w o r k i n g   d i r e c t o r y   i s   u n k n o w n ) :  � o   � ��}�} 0 thevalue theValue� �|��{
�| 
errn� o   � ��z�z  0 _argvusererror _ArgvUserError�{  ��  ��  � ��y� r   � ���� l  � ���x�w� n  � ���� I   � ��v��u�v *0 pathwithcomponents_ pathWithComponents_� ��t� J   � ��� ��� o   � ��s�s 0 basepath basePath� ��r� o   � ��q�q 0 thevalue theValue�r  �t  �u  � n  � ���� o   � ��p�p 0 nsstring NSString� m   � ��o
�o misccura�x  �w  � o      �n�n 0 thevalue theValue�y  ��  ��  s ��� r  ��� c  ��� c  ��� l ��m�l� n ��� I  �k�j�i�k 60 stringbystandardizingpath stringByStandardizingPath�j  �i  � l ��h�g� n ��� I  �f��e�f &0 stringwithstring_ stringWithString_� ��d� o  �c�c 0 thevalue theValue�d  �e  � n ��� o  �b�b 0 nsstring NSString� m  �a
�a misccura�h  �g  �m  �l  � m  �`
�` 
ctxt� m  �_
�_ 
psxf� o      �^�^ 0 	theresult 	theResult� ��]� Q  G���� Z /���\�[� = !��� o  �Z�Z 0 	valuetype 	valueType� m   �Y
�Y 
alis� r  $+��� c  $)��� o  $%�X�X 0 	theresult 	theResult� m  %(�W
�W 
alis� o      �V�V 0 	theresult 	theResult�\  �[  � R      �U�T�
�U .ascrerr ****      � ****�T  � �S��R
�S 
errn� d      �� m      �Q�Q +�R  � l 7G���� R  7G�P��
�P .ascrerr ****      � ****� b  AF��� m  AD�� ��� 2 F i l e   p a t h   d o e s n  t   e x i s t :  � o  DE�O�O 0 thevalue theValue� �N��M
�N 
errn� o  ;@�L�L  0 _argvusererror _ArgvUserError�M  �   file not found   � ���    f i l e   n o t   f o u n d�]  j � � note: `file` is treated as synonym for `POSIX file` here, as actual 'file' object specifiers are both mostly pointless and much more problematic due to using HFS paths   k ���P   n o t e :   ` f i l e `   i s   t r e a t e d   a s   s y n o n y m   f o r   ` P O S I X   f i l e `   h e r e ,   a s   a c t u a l   ' f i l e '   o b j e c t   s p e c i f i e r s   a r e   b o t h   m o s t l y   p o i n t l e s s   a n d   m u c h   m o r e   p r o b l e m a t i c   d u e   t o   u s i n g   H F S   p a t h sh ��� = JO��� o  JK�K�K 0 	valuetype 	valueType� m  KN�J
�J 
bool� ��I� l R����� P  R���H�� Z  Y������ E Ym��� J  Yi�� ��� m  Y\�� ���  t r u e� ��� m  \_�� ���  y e s� ��� m  _b�� ���  t� ��G� m  be�� ���  y�G  � J  il�� ��F� o  ij�E�E 0 thevalue theValue�F  � l pr���� L  pr�� m  pq�D
�D boovtrue� 7 1 TO DO: what should constitute 'true' vs 'false'?   � ��� b   T O   D O :   w h a t   s h o u l d   c o n s t i t u t e   ' t r u e '   v s   ' f a l s e ' ?� ��� E u���� J  u��� ��� m  ux�� ��� 
 f a l s e� ��� m  x{   �  n o�  m  {~ �  f �C m  ~� �  n�C  � J  ��		 
�B
 o  ���A�A 0 thevalue theValue�B  � �@ L  �� m  ���?
�? boovfals�@  � R  ���>
�> .ascrerr ****      � **** b  �� m  �� � 2 N o t    y e s    o r    n o    ( Y | N ) :   o  ���=�= 0 thevalue theValue �<�;
�< 
errn o  ���:�:  0 _argvusererror _ArgvUserError�;  �H  � �9�8
�9 conscase�8  � W Q may be used by boolean argument definitions (boolean options don't take a value)   � � �   m a y   b e   u s e d   b y   b o o l e a n   a r g u m e n t   d e f i n i t i o n s   ( b o o l e a n   o p t i o n s   d o n ' t   t a k e   a   v a l u e )�I  � R  ���7
�7 .ascrerr ****      � **** m  �� � r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) . �6
�6 
errn m  ���5�5�Y �4
�4 
erob l ���3�2 N  �� n  ��  o  ���1�1 0 	valuetype 	valueType  o  ���0�0 $0 definitionrecord definitionRecord�3  �2   �/!�.
�/ 
errt! m  ���-
�- 
type�.  � "�," L  ��## o  ���+�+ 0 	theresult 	theResult�,  � $%$ l     �*�)�(�*  �)  �(  % &'& l     �'�&�%�'  �&  �%  ' ()( i  n q*+* I      �$,�#�$ 40 _defaultvalueplaceholder _defaultValuePlaceholder, -�"- o      �!�! $0 definitionrecord definitionRecord�"  �#  + l    g./0. k     g11 232 r     454 c     676 n    898 o    � �  0 	valuetype 	valueType9 o     �� $0 definitionrecord definitionRecord7 m    �
� 
type5 o      �� 0 	valuetype 	valueType3 :;: l   �<=�  < ^ X note: the following conditional block should implement same branches as in _unpackValue   = �>> �   n o t e :   t h e   f o l l o w i n g   c o n d i t i o n a l   b l o c k   s h o u l d   i m p l e m e n t   s a m e   b r a n c h e s   a s   i n   _ u n p a c k V a l u e; ?�? Z    g@ABC@ =   DED o    	�� 0 	valuetype 	valueTypeE m   	 
�
� 
ctxtA L    FF m    GG �HH  T E X TB IJI E   KLK J    MM NON m    �
� 
longO PQP m    �
� 
doubQ R�R m    �
� 
nmbr�  L J    SS T�T o    �� 0 	valuetype 	valueType�  J UVU Z    ,WX�YW =   "Z[Z o     �� 0 	valuetype 	valueType[ m     !�
� 
longX L   % '\\ m   % &]] �^^  I N T E G E R�  Y L   * ,__ m   * +`` �aa  N U M B E RV bcb E  / 9ded J   / 5ff ghg m   / 0�
� 
furlh iji m   0 1�
� 
alisj klk m   1 2�
� 
filel m�m m   2 3�
� 
psxf�  e J   5 8nn o�
o o   5 6�	�	 0 	valuetype 	valueType�
  c pqp L   < >rr m   < =ss �tt  F I L Eq uvu =  A Dwxw o   A B�� 0 	valuetype 	valueTypex m   B C�
� 
boolv y�y L   G Kzz m   G J{{ �||  Y | N�  C R   N g�}~
� .ascrerr ****      � ****} m   c f ��� r I n v a l i d   o p t i o n / a r g u m e n t   d e f i n i t i o n   ( n o t   a n   a l l o w e d   t y p e ) .~ ���
� 
errn� m   R U���Y� ���
� 
erob� l  X \��� � N   X \�� n   X [��� o   Y [���� 0 	valuetype 	valueType� o   X Y���� $0 definitionrecord definitionRecord�  �   � �����
�� 
errt� m   _ `��
�� 
type��  �  / J D returns appropriate default placeholderValue according to valueType   0 ��� �   r e t u r n s   a p p r o p r i a t e   d e f a u l t   p l a c e h o l d e r V a l u e   a c c o r d i n g   t o   v a l u e T y p e) ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  r u��� I      ������� *0 _formatdefaultvalue _formatDefaultValue� ���� o      ���� $0 definitionrecord definitionRecord��  ��  � l    ����� k     ��� ��� r     ��� n     ��� o    ���� 0 defaultvalue defaultValue� o     ���� $0 definitionrecord definitionRecord� o      ���� 0 defaultvalue defaultValue� ��� Z   (������� F    ��� >    ��� l   ������ I   ����
�� .corecnte****       ****� J    	�� ���� o    ���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   
 ��
�� 
list��  ��  ��  � m    ����  � =    ��� n    ��� 1    ��
�� 
leng� o    ���� 0 defaultvalue defaultValue� m    ���� � r    $��� n    "��� 4    "���
�� 
cobj� m     !���� � o    ���� 0 defaultvalue defaultValue� o      ���� 0 defaultvalue defaultValue��  ��  � ��� Z   ) ������ >   ) 4��� l  ) 2������ I  ) 2����
�� .corecnte****       ****� J   ) ,�� ���� o   ) *���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   - .��
�� 
ctxt��  ��  ��  � m   2 3����  � r   7 :��� o   7 8���� 0 defaultvalue defaultValue� o      ���� 0 defaulttext defaultText� ��� G   = X��� >   = H��� l  = F������ I  = F����
�� .corecnte****       ****� J   = @�� ���� o   = >���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   A B��
�� 
long��  ��  ��  � m   F G����  � >   K V��� l  K T������ I  K T����
�� .corecnte****       ****� J   K N�� ���� o   K L���� 0 defaultvalue defaultValue��  � �����
�� 
kocl� m   O P��
�� 
doub��  ��  ��  � m   T U����  � ��� k   [ ��� ��� r   [ h��� n  [ f��� I   b f�������� 0 init  ��  ��  � n  [ b��� I   ^ b�������� 	0 alloc  ��  ��  � n  [ ^��� o   \ ^���� &0 nsnumberformatter NSNumberFormatter� m   [ \��
�� misccura� o      ���� 0 asocformatter asocFormatter� ��� n  i q��� I   j q������� "0 setnumberstyle_ setNumberStyle_� ���� l  j m������ n  j m��� o   k m���� >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle� m   j k��
�� misccura��  ��  ��  ��  � o   i j���� 0 asocformatter asocFormatter� ��� n  r ���� I   s �������� 0 
setlocale_ 
setLocale_� ���� l  s |������ n  s |��� I   x |�������� 0 systemlocale systemLocale��  ��  � n  s x��� o   t x���� 0 nslocale NSLocale� m   s t��
�� misccura��  ��  ��  ��  � o   r s���� 0 asocformatter asocFormatter� ���� r   � ���� c   � ���� l  � � ����  n  � � I   � ������� &0 stringfromnumber_ stringFromNumber_ �� o   � ����� 0 defaultvalue defaultValue��  ��   o   � ����� 0 asocformatter asocFormatter��  ��  � m   � ���
�� 
****� o      ���� 0 defaulttext defaultText��  �  G   � � >   � �	
	 l  � ����� I  � ���
�� .corecnte****       **** J   � � �� o   � ����� 0 defaultvalue defaultValue��   ����
�� 
kocl m   � ���
�� 
furl��  ��  ��  
 m   � �����   >   � � l  � ����� I  � ���
�� .corecnte****       **** J   � � �� o   � ����� 0 defaultvalue defaultValue��   ����
�� 
kocl m   � ���
�� 
alis��  ��  ��   m   � �����    r   � � n   � � 1   � ���
�� 
psxp o   � ����� 0 defaultvalue defaultValue o      ���� 0 defaulttext defaultText   =  � �!"! o   � ����� 0 defaultvalue defaultValue" m   � ���
�� boovtrue  #$# r   � �%&% m   � �'' �((  Y& o      ���� 0 defaulttext defaultText$ )*) =  � �+,+ o   � ����� 0 defaultvalue defaultValue, m   � ��
� boovfals* -�~- r   � �./. m   � �00 �11  N/ o      �}�} 0 defaulttext defaultText�~  � L   � �22 m   � �33 �44  � 5�|5 L   � �66 b   � �787 b   � �9:9 m   � �;; �<<  D e f a u l t :   : o   � ��{�{ 0 defaulttext defaultText8 m   � �== �>>    �|  � G A formats default value for inclusion in OPTIONS/ARGUMENTS section   � �?? �   f o r m a t s   d e f a u l t   v a l u e   f o r   i n c l u s i o n   i n   O P T I O N S / A R G U M E N T S   s e c t i o n� @A@ l     �z�y�x�z  �y  �x  A BCB l     �wDE�w  D  -----   E �FF 
 - - - - -C GHG l     �vIJ�v  I   parse ARGV   J �KK    p a r s e   A R G VH LML l     �u�t�s�u  �t  �s  M NON i  v yPQP I      �rR�q�r (0 _buildoptionstable _buildOptionsTableR S�pS o      �o�o &0 optiondefinitions optionDefinitions�p  �q  Q k    �TT UVU l     �nWX�n  W � � create a case-sensitive lookup table of all short and long option names (e.g. "-a", "-A", "-o", "--output-file", etc); used by _parseOptions() to retrieve the definition record for each option it encounters   X �YY�   c r e a t e   a   c a s e - s e n s i t i v e   l o o k u p   t a b l e   o f   a l l   s h o r t   a n d   l o n g   o p t i o n   n a m e s   ( e . g .   " - a " ,   " - A " ,   " - o " ,   " - - o u t p u t - f i l e " ,   e t c ) ;   u s e d   b y   _ p a r s e O p t i o n s ( )   t o   r e t r i e v e   t h e   d e f i n i t i o n   r e c o r d   f o r   e a c h   o p t i o n   i t   e n c o u n t e r sV Z[Z r     \]\ J     �m�m  ] o      �l�l 0 
foundnames 
foundNames[ ^_^ r    `a` n   bcb I    �k�j�i�k 0 
dictionary  �j  �i  c n   ded o    �h�h *0 nsmutabledictionary NSMutableDictionarye m    �g
�g misccuraa o      �f�f 20 optiondefinitionsbyname optionDefinitionsByName_ fgf X   h�eih k   zjj klk l   ;mnom r    ;pqp b    9rsr l   $t�d�ct c    $uvu n   "wxw 1     "�b
�b 
pcntx o     �a�a 0 	optionref 	optionRefv m   " #�`
�` 
reco�d  �c  s K   $ 8yy �_z{�_ 0 	shortname 	shortNamez m   % &|| �}}  { �^~�^ 0 longname longName~ m   ' (�� ���   �]���] 0 propertyname propertyName� m   ) *�� ���  � �\���\ 0 	valuetype 	valueType� m   + ,�[
�[ 
ctxt� �Z���Z 0 islist isList� m   / 0�Y
�Y boovfals� �X��W�X 0 defaultvalue defaultValue� m   3 4�V
�V boovfals�W  q o      �U�U $0 optiondefinition optionDefinitionn 5 / this defaultValue is only used by boolean opts   o ��� ^   t h i s   d e f a u l t V a l u e   i s   o n l y   u s e d   b y   b o o l e a n   o p t sl ��� Q   < y���� k   ? _�� ��� r   ? F��� c   ? D��� n  ? B��� o   @ B�T�T 0 propertyname propertyName� o   ? @�S�S $0 optiondefinition optionDefinition� m   B C�R
�R 
ctxt� o      �Q�Q 0 propertyname propertyName� ��P� Z  G _���O�N� =  G N��� n  G J��� o   H J�M�M 0 propertyname propertyName� o   G H�L�L $0 optiondefinition optionDefinition� m   J M�� ���  � R   Q [�K�J�
�K .ascrerr ****      � ****�J  � �I��H
�I 
errn� m   U X�G�G�\�H  �O  �N  �P  � R      �F�E�
�F .ascrerr ****      � ****�E  � �D��C
�D 
errn� d      �� m      �B�B��C  � R   g y�A��
�A .ascrerr ****      � ****� m   u x�� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( p r o p e r t y   n a m e   m u s t   b e   n o n - e m p t y   t e x t ) .� �@��
�@ 
errn� m   k n�?�?�Y� �>��=
�> 
erob� o   q r�<�< 0 	optionref 	optionRef�=  � ��� r   z ���� n   z ��� 1   { �;
�; 
leng� o   z {�:�: 0 
foundnames 
foundNames� o      �9�9 0 	namecount 	nameCount� ��� X   �Y��8�� k   �T�� ��� r   � ���� o   � ��7�7 0 aref aRef� J      �� ��� o      �6�6 0 thename theName� ��5� o      �4�4 0 
nameprefix 
namePrefix�5  � ��� Q   � ����� r   � ���� c   � ���� o   � ��3�3 0 thename theName� m   � ��2
�2 
ctxt� o      �1�1 0 thename theName� R      �0�/�
�0 .ascrerr ****      � ****�/  � �.��-
�. 
errn� d      �� m      �,�,��-  � R   � ��+��
�+ .ascrerr ****      � ****� m   � ��� ��� r I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t / l o n g   n a m e   m u s t   b e   t e x t ) .� �*��
�* 
errn� m   � ��)�)�\� �(��'
�( 
erob� o   � ��&�& 0 	optionref 	optionRef�'  � ��%� Z   �T���$�#� >  � ���� o   � ��"�" 0 thename theName� m   � ��� ���  � k   �P�� ��� Z  � ����!� � E  � ���� o   � ��� 0 
foundnames 
foundNames� J   � ��� ��� o   � ��� 0 thename theName�  � R   � ����
� .ascrerr ****      � ****� m   � ��� ��� x I n v a l i d   o p t i o n   d e f i n i t i o n   ( f o u n d   d u p l i c a t e   s h o r t / l o n g   n a m e ) .� ���
� 
errn� m   � ����Y� ���
� 
erob� o   � ��� 0 	optionref 	optionRef�  �!  �   � ��� r   ���� o   � ��� 0 thename theName� n      ���  ;   � o   � �� 0 
foundnames 
foundNames� ��� P  F���� Z  
E����� =  
��� n 
��� 1  �
� 
leng� o  
�� 0 
nameprefix 
namePrefix� m  �� � Z A����� l (���� G  (	 		  >  			 n 			 1  �
� 
leng	 o  �
�
 0 thename theName	 m  �	�	 	 H  $		 E #			 m  !				 �	
	
 4 a b c d e f g h i j k l m n o p q r s t u v w x y z	 o  !"�� 0 thename theName�  �  � R  +=�		
� .ascrerr ****      � ****	 m  9<		 �		 � I n v a l i d   o p t i o n   d e f i n i t i o n   ( s h o r t   n a m e   m u s t   b e   a   s i n g l e   A - Z   o r   a - z   c h a r a c t e r ) .	 �		
� 
errn	 m  /2���Y	 �	�
� 
erob	 o  56�� 0 	optionref 	optionRef�  �  �  �  � l DD�		�  	 ) # TO DO: how to validate long names?   	 �		 F   T O   D O :   h o w   t o   v a l i d a t e   l o n g   n a m e s ?�  � � ��
�  conscase��  � 	��	 l GP	����	 n GP			 I  HP��	���� &0 setobject_forkey_ setObject_forKey_	 			 o  HI���� $0 optiondefinition optionDefinition	 	��	 l IL	����	 b  IL			 o  IJ���� 0 
nameprefix 
namePrefix	 o  JK���� 0 thename theName��  ��  ��  ��  	 o  GH���� 20 optiondefinitionsbyname optionDefinitionsByName��  ��  ��  �$  �#  �%  �8 0 aref aRef� J   � �	 	  	!	"	! J   � �	#	# 	$	%	$ n  � �	&	'	& o   � ����� 0 	shortname 	shortName	' o   � ����� $0 optiondefinition optionDefinition	% 	(��	( m   � �	)	) �	*	*  -��  	" 	+��	+ J   � �	,	, 	-	.	- n  � �	/	0	/ o   � ����� 0 longname longName	0 o   � ����� $0 optiondefinition optionDefinition	. 	1��	1 m   � �	2	2 �	3	3  - -��  ��  � 	4��	4 Z Zz	5	6����	5 =  Za	7	8	7 n  Z_	9	:	9 1  [_��
�� 
leng	: o  Z[���� 0 
foundnames 
foundNames	8 o  _`���� 0 	namecount 	nameCount	6 R  dv��	;	<
�� .ascrerr ****      � ****	; m  ru	=	= �	>	> � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .	< ��	?	@
�� 
errn	? m  hk�����Y	@ ��	A��
�� 
erob	A o  no���� 0 	optionref 	optionRef��  ��  ��  ��  �e 0 	optionref 	optionRefi o    ���� &0 optiondefinitions optionDefinitionsg 	B��	B L  ��	C	C o  ������ 20 optiondefinitionsbyname optionDefinitionsByName��  O 	D	E	D l     ��������  ��  ��  	E 	F	G	F l     ��������  ��  ��  	G 	H	I	H i  z }	J	K	J I      ��	L���� 0 _parseoptions _parseOptions	L 	M	N	M o      ���� 0 rawarguments rawArguments	N 	O	P	O o      ���� &0 optiondefinitions optionDefinitions	P 	Q��	Q o      ���� &0 hasdefaultoptions hasDefaultOptions��  ��  	K k    n	R	R 	S	T	S l     ��	U	V��  	Uoi given a list of raw arguments passed to script's run handler, extract those items that are command option names and (where relevant) their corresponding values, converting those values to the required type and returning an NSMutableDictionary of option name-value pairs plus a list of any remaining (i.e. non-option) arguments to be passed to _parseArguments()   	V �	W	W�   g i v e n   a   l i s t   o f   r a w   a r g u m e n t s   p a s s e d   t o   s c r i p t ' s   r u n   h a n d l e r ,   e x t r a c t   t h o s e   i t e m s   t h a t   a r e   c o m m a n d   o p t i o n   n a m e s   a n d   ( w h e r e   r e l e v a n t )   t h e i r   c o r r e s p o n d i n g   v a l u e s ,   c o n v e r t i n g   t h o s e   v a l u e s   t o   t h e   r e q u i r e d   t y p e   a n d   r e t u r n i n g   a n   N S M u t a b l e D i c t i o n a r y   o f   o p t i o n   n a m e - v a l u e   p a i r s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t s   t o   b e   p a s s e d   t o   _ p a r s e A r g u m e n t s ( )	T 	X	Y	X l     ��	Z	[��  	Z 6 0 first build a lookup table of all known options   	[ �	\	\ `   f i r s t   b u i l d   a   l o o k u p   t a b l e   o f   a l l   k n o w n   o p t i o n s	Y 	]	^	] r     	_	`	_ I     ��	a���� (0 _buildoptionstable _buildOptionsTable	a 	b��	b o    ���� &0 optiondefinitions optionDefinitions��  ��  	` o      ���� 20 optiondefinitionsbyname optionDefinitionsByName	^ 	c	d	c r   	 	e	f	e n  	 	g	h	g I    �������� 0 
dictionary  ��  ��  	h n  	 	i	j	i o   
 ���� *0 nsmutabledictionary NSMutableDictionary	j m   	 
��
�� misccura	f o      ���� (0 asocparametersdict asocParametersDict	d 	k	l	k l   	m	n	o	m r    	p	q	p m    	r	r �	s	s  =	q n     	t	u	t 1    ��
�� 
txdl	u 1    ��
�� 
ascr	n P J note: a long option can use a space or '=' to separate its name and value   	o �	v	v �   n o t e :   a   l o n g   o p t i o n   c a n   u s e   a   s p a c e   o r   ' = '   t o   s e p a r a t e   i t s   n a m e   a n d   v a l u e	l 	w	x	w l   ��	y	z��  	y R L consume raw arguments list until it is empty or a non-option is encountered   	z �	{	{ �   c o n s u m e   r a w   a r g u m e n t s   l i s t   u n t i l   i t   i s   e m p t y   o r   a   n o n - o p t i o n   i s   e n c o u n t e r e d	x 	|	}	| W   h	~		~ k   "c	�	� 	�	�	� r   " (	�	�	� n   " &	�	�	� 4  # &��	�
�� 
cobj	� m   $ %���� 	� o   " #���� 0 rawarguments rawArguments	� o      ���� 0 thearg theArg	� 	�	�	� Z   ) 	�	�	�	�	� C   ) ,	�	�	� o   ) *���� 0 thearg theArg	� m   * +	�	� �	�	�  - -	� l  / m	�	�	�	� k   / m	�	� 	�	�	� Z   / @	�	�����	� =  / 2	�	�	� o   / 0���� 0 thearg theArg	� m   0 1	�	� �	�	�  - -	� l  5 <	�	�	�	� k   5 <	�	� 	�	�	� r   5 :	�	�	� n   5 8	�	�	� 1   6 8��
�� 
rest	� o   5 6���� 0 rawarguments rawArguments	� o      ���� 0 rawarguments rawArguments	� 	���	�  S   ; <��  	� i c double-hypens terminates the option list, so anything left in rawArguments is positional arguments   	� �	�	� �   d o u b l e - h y p e n s   t e r m i n a t e s   t h e   o p t i o n   l i s t ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s��  ��  	� 	�	�	� l  A G	�	�	�	� r   A G	�	�	� n   A E	�	�	� 4  B E��	�
�� 
citm	� m   C D���� 	� o   A B���� 0 thearg theArg	� o      ���� 0 
optionname 
optionName	�   get "--NAME"   	� �	�	�    g e t   " - - N A M E "	� 	���	� Z   H m	�	���	�	� ?   H Q	�	�	� l  H O	�����	� I  H O��	�	�
�� .corecnte****       ****	� o   H I���� 0 thearg theArg	� ��	���
�� 
kocl	� m   J K��
�� 
citm��  ��  ��  	� m   O P���� 	� l  T e	�	�	�	� r   T e	�	�	� n   T `	�	�	� 7  U `��	�	�
�� 
ctxt	� l  Y \	�����	� 4   Y \��	�
�� 
citm	� m   Z [���� ��  ��  	� m   ] _������	� o   T U���� 0 thearg theArg	� n      	�	�	� 4  a d��	�
�� 
cobj	� m   b c���� 	� o   ` a���� 0 rawarguments rawArguments	� * $ put "VALUE" back on stack for later   	� �	�	� H   p u t   " V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r��  	� l  h m	�	�	�	� r   h m	�	�	� n   h k	�	�	� 1   i k��
�� 
rest	� o   h i���� 0 rawarguments rawArguments	� o      ���� 0 rawarguments rawArguments	� ( " remove the option name from stack   	� �	�	� D   r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k��  	� < 6 found "--[NAME[=VALUE]]" (NAME is a long option name)   	� �	�	� l   f o u n d   " - - [ N A M E [ = V A L U E ] ] "   ( N A M E   i s   a   l o n g   o p t i o n   n a m e )	� 	�	�	� C   p s	�	�	� o   p q���� 0 thearg theArg	� m   q r	�	� �	�	�  -	� 	���	� l  v �	�	�	�	� k   v �	�	� 	�	�	� l  v �	�	�	�	� Z  v �	�	�����	� G   v �	�	�	� =  v {	�	�	� o   v w���� 0 thearg theArg	� m   w z	�	� �	�	�  -	� E  ~ �	�	�	� m   ~ �	�	� �	�	�  0 1 2 3 4 5 6 7 8 9 0	� n  � �	�	�	� 4   � ���	�
�� 
cha 	� m   � ����� 	� o   � ����� 0 thearg theArg	�  S   � ���  ��  	� � { it's a lone hyphen or a negative number (i.e. not an option), so treat it and rest of rawArguments as positional arguments   	� �	�	� �   i t ' s   a   l o n e   h y p h e n   o r   a   n e g a t i v e   n u m b e r   ( i . e .   n o t   a n   o p t i o n ) ,   s o   t r e a t   i t   a n d   r e s t   o f   r a w A r g u m e n t s   a s   p o s i t i o n a l   a r g u m e n t s	� 	�	�	� l  � �	�	�	�	� r   � �	�	�	� n   � �	�	�	� 7  � ���
 

�� 
ctxt
  m   � ����� 
 m   � ����� 	� o   � ����� 0 thearg theArg	� o      ���� 0 
optionname 
optionName	�  	 get "-N"   	� �

    g e t   " - N "	� 
��
 Z   � �

��

 ?   � �


 n  � �
	


	 1   � ���
�� 
leng

 o   � ����� 0 thearg theArg
 m   � ����� 
 l  � �



 k   � �

 


 r   � �


 n   � �


 7  � ���


�� 
ctxt
 m   � ����� 
 m   � �������
 o   � ����� 0 thearg theArg
 n      


 4  � ���

�� 
cobj
 m   � ����� 
 o   � ����� 0 rawarguments rawArguments
 


 r   � �


 n  � �


 I   � ���
 ��� 0 objectforkey_ objectForKey_
  
!�~
! o   � ��}�} 0 
optionname 
optionName�~  �  
 o   � ��|�| 20 optiondefinitionsbyname optionDefinitionsByName
 o      �{�{ $0 optiondefinition optionDefinition
 
"�z
" Z   � �
#
$�y�x
# F   � �
%
&
% >  � �
'
(
' o   � ��w�w $0 optiondefinition optionDefinition
( m   � ��v
�v 
msng
& =  � �
)
*
) n  � �
+
,
+ o   � ��u�u 0 	valuetype 	valueType
, l  � �
-�t�s
- c   � �
.
/
. o   � ��r�r $0 optiondefinition optionDefinition
/ m   � ��q
�q 
****�t  �s  
* m   � ��p
�p 
bool
$ r   � �
0
1
0 b   � �
2
3
2 m   � �
4
4 �
5
5  -
3 n   � �
6
7
6 4  � ��o
8
�o 
cobj
8 m   � ��n�n 
7 o   � ��m�m 0 rawarguments rawArguments
1 n      
9
:
9 4  � ��l
;
�l 
cobj
; m   � ��k�k 
: o   � ��j�j 0 rawarguments rawArguments�y  �x  �z  
 / ) put "[-N�]VALUE" back on stack for later   
 �
<
< R   p u t   " [ - N & ] V A L U E "   b a c k   o n   s t a c k   f o r   l a t e r��  
 l  � �
=
>
?
= r   � �
@
A
@ n   � �
B
C
B 1   � ��i
�i 
rest
C o   � ��h�h 0 rawarguments rawArguments
A o      �g�g 0 rawarguments rawArguments
> ' !remove the option name from stack   
? �
D
D B r e m o v e   t h e   o p t i o n   n a m e   f r o m   s t a c k��  	� H B found "-N[N�][VALUE]" (N is a single-character short option name)   	� �
E
E �   f o u n d   " - N [ N & ] [ V A L U E ] "   ( N   i s   a   s i n g l e - c h a r a c t e r   s h o r t   o p t i o n   n a m e )��  	� l  � 
F
G
H
F  S   � 
G S M not an option name, so anything left in rawArguments is positional arguments   
H �
I
I �   n o t   a n   o p t i o n   n a m e ,   s o   a n y t h i n g   l e f t   i n   r a w A r g u m e n t s   i s   p o s i t i o n a l   a r g u m e n t s	� 
J
K
J l �f
L
M�f  
L - ' look up the option's definition record   
M �
N
N N   l o o k   u p   t h e   o p t i o n ' s   d e f i n i t i o n   r e c o r d
K 
O
P
O r  	
Q
R
Q n 
S
T
S I  �e
U�d�e 0 objectforkey_ objectForKey_
U 
V�c
V o  �b�b 0 
optionname 
optionName�c  �d  
T o  �a�a 20 optiondefinitionsbyname optionDefinitionsByName
R o      �`�` $0 optiondefinition optionDefinition
P 
W
X
W Z  
�
Y
Z�_�^
Y = 

[
\
[ o  
�]�] $0 optiondefinition optionDefinition
\ m  �\
�\ 
msng
Z l �
]
^
_
] k  �
`
` 
a
b
a Z  t
c
d�[�Z
c o  �Y�Y &0 hasdefaultoptions hasDefaultOptions
d k  p
e
e 
f
g
f r  ?
h
i
h J  0
j
j 
k
l
k E "
m
n
m J  
o
o 
p
q
p m  
r
r �
s
s  - h
q 
t�X
t m  
u
u �
v
v  - - h e l p�X  
n J  !
w
w 
x�W
x o  �V�V 0 
optionname 
optionName�W  
l 
y�U
y E ".
z
{
z J  "*
|
| 
}
~
} m  "%

 �
�
�  - v
~ 
��T
� m  %(
�
� �
�
�  - - v e r s i o n�T  
{ J  *-
�
� 
��S
� o  *+�R�R 0 
optionname 
optionName�S  �U  
i J      
�
� 
�
�
� o      �Q�Q 0 ishelp isHelp
� 
��P
� o      �O�O 0 	isversion 	isVersion�P  
g 
��N
� Z  @p
�
��M�L
� G  @I
�
�
� o  @A�K�K 0 ishelp isHelp
� o  DE�J�J 0 	isversion 	isVersion
� l Ll
�
�
�
� k  Ll
�
� 
�
�
� n LQ
�
�
� I  MQ�I�H�G�I $0 removeallobjects removeAllObjects�H  �G  
� o  LM�F�F (0 asocparametersdict asocParametersDict
� 
�
�
� n R[
�
�
� I  S[�E
��D�E $0 setvalue_forkey_ setValue_forKey_
� 
�
�
� o  ST�C�C 0 ishelp isHelp
� 
��B
� m  TW
�
� �
�
�  h e l p�B  �D  
� o  RS�A�A (0 asocparametersdict asocParametersDict
� 
�
�
� n \e
�
�
� I  ]e�@
��?�@ $0 setvalue_forkey_ setValue_forKey_
� 
�
�
� o  ]^�>�> 0 	isversion 	isVersion
� 
��=
� m  ^a
�
� �
�
�  v e r s i o n�=  �?  
� o  \]�<�< (0 asocparametersdict asocParametersDict
� 
�
�
� r  fj
�
�
� J  fh�;�;  
� o      �:�: 0 rawarguments rawArguments
� 
��9
�  S  kl�9  
�  � ignore everything else and return a minimal record containing only `help` and `version` properties, one or both of which are true, so must be dealt with accordingly by `run` handler (i.e. format+log help text and return and/or return version number)   
� �
�
��   i g n o r e   e v e r y t h i n g   e l s e   a n d   r e t u r n   a   m i n i m a l   r e c o r d   c o n t a i n i n g   o n l y   ` h e l p `   a n d   ` v e r s i o n `   p r o p e r t i e s ,   o n e   o r   b o t h   o f   w h i c h   a r e   t r u e ,   s o   m u s t   b e   d e a l t   w i t h   a c c o r d i n g l y   b y   ` r u n `   h a n d l e r   ( i . e .   f o r m a t + l o g   h e l p   t e x t   a n d   r e t u r n   a n d / o r   r e t u r n   v e r s i o n   n u m b e r )�M  �L  �N  �[  �Z  
b 
��8
� R  u��7
�
�
�7 .ascrerr ****      � ****
� b  �
�
�
� m  �
�
� �
�
�   U n k n o w n   o p t i o n :  
� o  ���6�6 0 
optionname 
optionName
� �5
��4
�5 
errn
� o  y~�3�3  0 _argvusererror _ArgvUserError�4  �8  
^ A ; check for default options (help/version), else raise error   
_ �
�
� v   c h e c k   f o r   d e f a u l t   o p t i o n s   ( h e l p / v e r s i o n ) ,   e l s e   r a i s e   e r r o r�_  �^  
X 
�
�
� r  ��
�
�
� c  ��
�
�
� o  ���2�2 $0 optiondefinition optionDefinition
� m  ���1
�1 
****
� o      �0�0 $0 optiondefinition optionDefinition
� 
�
�
� r  ��
�
�
� n ��
�
�
� o  ���/�/ 0 propertyname propertyName
� o  ���.�. $0 optiondefinition optionDefinition
� o      �-�- 0 propertyname propertyName
� 
�
�
� l ���,
�
��,  
� #  now process the option value   
� �
�
� :   n o w   p r o c e s s   t h e   o p t i o n   v a l u e
� 
�
�
� Z  �
�
��+
�
� = ��
�
�
� n ��
�
�
� o  ���*�* 0 	valuetype 	valueType
� o  ���)�) $0 optiondefinition optionDefinition
� m  ���(
�( 
bool
� Q  ��
�
�
�
� r  ��
�
�
� H  ��
�
� n ��
�
�
� o  ���'�' 0 defaultvalue defaultValue
� o  ���&�& $0 optiondefinition optionDefinition
� o      �%�% 0 thevalue theValue
� R      �$�#�"
�$ .ascrerr ****      � ****�#  �"  
� R  ���!
�
�
�! .ascrerr ****      � ****
� b  ��
�
�
� m  ��
�
� �
�
� J B a d   d e f a u l t V a l u e   f o r   b o o l e a n   o p t i o n :  
� o  ��� �  0 
optionname 
optionName
� �
�
�
� 
errn
� m  �����\
� �
��
� 
erob
� l ��
���
� N  ��
�
� n  ��
�
�
� o  ���� 0 defaultvalue defaultValue
� o  ���� $0 optiondefinition optionDefinition�  �  �  �+  
� k  �
�
� 
�
�
� Z ��
�
���
� = ��
�
�
� o  ���� 0 rawarguments rawArguments
� J  ����  
� R  ���
�
�
� .ascrerr ****      � ****
� b  ��
�
�
� m  ��
�
� �
�
� 4 M i s s i n g   v a l u e   f o r   o p t i o n :  
� o  ���� 0 
optionname 
optionName
� �
��
� 
errn
� o  ����  0 _argvusererror _ArgvUserError�  �  �  
� 
�
�
� r  ��
�
�
� I  ���
��� 0 _unpackvalue _unpackValue
� 
�
�
� n  ��
�
�
� 4 ��� 
� 
cobj  m  ���� 
� o  ���
�
 0 rawarguments rawArguments
� �	 o  ���� $0 optiondefinition optionDefinition�	  �  
� o      �� 0 thevalue theValue
� � r  � n  � 1  ��
� 
rest o  ���� 0 rawarguments rawArguments o      �� 0 rawarguments rawArguments�  
�  Z  [	
�	 n 
 o  	�� 0 islist isList o  � �  $0 optiondefinition optionDefinition
 l 7 k  7  r   n  I  ������ 0 objectforkey_ objectForKey_ �� o  ���� 0 propertyname propertyName��  ��   o  ���� (0 asocparametersdict asocParametersDict o      ���� 0 thelist theList �� Z  7�� =  o  ���� 0 thelist theList m  ��
�� 
msng r  * !  n ("#" I  #(��$���� $0 arraywithobject_ arrayWithObject_$ %��% o  #$���� 0 thevalue theValue��  ��  # n #&'& o  #����  0 nsmutablearray NSMutableArray' m  ��
�� misccura! o      ���� 0 thevalue theValue��   k  -7(( )*) n -3+,+ I  .3��-���� 0 
addobject_ 
addObject_- .��. o  ./���� 0 thevalue theValue��  ��  , o  -.���� 0 thelist theList* /��/ r  47010 o  45���� 0 thelist theList1 o      ���� 0 thevalue theValue��  ��   = 7 option can appear multiple times, so collect in a list    �22 n   o p t i o n   c a n   a p p e a r   m u l t i p l e   t i m e s ,   s o   c o l l e c t   i n   a   l i s t 343 > :D565 l :@7����7 n :@898 I  ;@��:���� 0 objectforkey_ objectForKey_: ;��; o  ;<���� 0 propertyname propertyName��  ��  9 o  :;���� (0 asocparametersdict asocParametersDict��  ��  6 m  @C��
�� 
msng4 <��< R  GW��=>
�� .ascrerr ****      � ****= b  QV?@? m  QTAA �BB $ D u p l i c a t e   o p t i o n :  @ o  TU���� 0 
optionname 
optionName> ��C��
�� 
errnC o  KP����  0 _argvusererror _ArgvUserError��  ��  �   D��D n \cEFE I  ]c��G���� &0 setobject_forkey_ setObject_forKey_G HIH o  ]^���� 0 thevalue theValueI J��J o  ^_���� 0 propertyname propertyName��  ��  F o  \]���� (0 asocparametersdict asocParametersDict��  	 =   !KLK o    ���� 0 rawarguments rawArgumentsL J     ����  	} M��M L  inNN J  imOO PQP o  ij���� (0 asocparametersdict asocParametersDictQ R��R o  jk���� 0 rawarguments rawArguments��  ��  	I STS l     ��������  ��  ��  T UVU l     ��������  ��  ��  V WXW i  ~ �YZY I      ��[���� (0 _adddefaultoptions _addDefaultOptions[ \]\ o      ���� (0 asocparametersdict asocParametersDict] ^��^ o      ���� &0 optiondefinitions optionDefinitions��  ��  Z k     �__ `a` X     �b��cb k    �dd efe r    "ghg b     iji l   k����k c    lml o    ���� 0 recref recRefm m    ��
�� 
reco��  ��  j K    nn ��op�� 0 propertyname propertyNameo m    qq �rr  p ��st�� 0 longname longNames m    uu �vv  t ��w���� 0 defaultvalue defaultValuew o    ���� 0 novalue NoValue��  h o      ���� 0 rec  f xyx r   # (z{z n  # &|}| o   $ &���� 0 propertyname propertyName} o   # $���� 0 rec  { o      ���� 0 propertyname propertyNamey ~~ Z  ) 8������� =  ) ,��� o   ) *���� 0 propertyname propertyName� m   * +�� ���  � r   / 4��� n  / 2��� o   0 2���� 0 longname longName� o   / 0���� 0 rec  � o      ���� 0 propertyname propertyName��  ��   ���� Z   9 �������� =  9 A��� l  9 ?������ n  9 ?��� I   : ?������� 0 objectforkey_ objectForKey_� ���� o   : ;���� 0 propertyname propertyName��  ��  � o   9 :���� (0 asocparametersdict asocParametersDict��  ��  � m   ? @��
�� 
msng� k   D ��� ��� r   D I��� n  D G��� o   E G���� 0 defaultvalue defaultValue� o   D E���� 0 rec  � o      ���� 0 thevalue theValue� ��� Z   J �������� =  J Q��� o   J K���� 0 thevalue theValue� o   K P���� 0 novalue NoValue� l  T ����� k   T ��� ��� r   T [��� b   T Y��� m   T U�� ���  - -� n  U X��� o   V X���� 0 longname longName� o   U V���� 0 rec  � o      ���� 0 
optionname 
optionName� ��� Z  \ o������� =  \ _��� o   \ ]���� 0 
optionname 
optionName� m   ] ^�� ���  - -� r   b k��� b   b i��� m   b c�� ���  -� n  c h��� o   d h���� 0 	shortname 	shortName� o   c d���� 0 rec  � o      ���� 0 
optionname 
optionName��  ��  � ���� R   p �����
�� .ascrerr ****      � ****� b   z ��� m   z }�� ��� 2 M i s s i n g   r e q u i r e d   o p t i o n :  � o   } ~���� 0 
optionname 
optionName� �����
�� 
errn� o   t y����  0 _argvusererror _ArgvUserError��  ��  � 2 , record doesn't have a defaultValue property   � ��� X   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y��  ��  � ��� Z  � �������� =  � ���� o   � ����� 0 thevalue theValue� m   � ���
�� 
msng� r   � ���� n  � ���� I   � ��������� 0 null  ��  ��  � n  � ���� o   � ����� 0 nsnull NSNull� m   � ���
�� misccura� o      ���� 0 thevalue theValue��  ��  � ���� l  � ������ n  � ���� I   � ��~��}�~ &0 setobject_forkey_ setObject_forKey_� ��� o   � ��|�| 0 thevalue theValue� ��{� o   � ��z�z 0 propertyname propertyName�{  �}  � o   � ��y�y (0 asocparametersdict asocParametersDict��  �  ��  ��  ��  ��  �� 0 recref recRefc o    �x�x &0 optiondefinitions optionDefinitionsa ��� l  � ��w���w  � ` Z set default help, version properties if not already supplied by user of optionDefinitions   � ��� �   s e t   d e f a u l t   h e l p ,   v e r s i o n   p r o p e r t i e s   i f   n o t   a l r e a d y   s u p p l i e d   b y   u s e r   o f   o p t i o n D e f i n i t i o n s� ��v� X   � ���u�� Z  � ����t�s� =  � ���� l  � ���r�q� n  � ���� I   � ��p��o�p 0 objectforkey_ objectForKey_� ��n� o   � ��m�m 0 aref aRef�n  �o  � o   � ��l�l (0 asocparametersdict asocParametersDict�r  �q  � m   � ��k
�k 
msng� l  � ���j�i� n  � ���� I   � ��h��g�h &0 setobject_forkey_ setObject_forKey_� ��� m   � ��f
�f boovfals� ��e� o   � ��d�d 0 aref aRef�e  �g  � o   � ��c�c (0 asocparametersdict asocParametersDict�j  �i  �t  �s  �u 0 aref aRef� J   � ��� ��� m   � ��� ���  h e l p� ��b� m   � ��� ���  v e r s i o n�b  �v  X ��� l     �a�`�_�a  �`  �_  � ��� l     �^�]�\�^  �]  �\  �    i  � � I      �[�Z�[ "0 _parsearguments _parseArguments  o      �Y�Y 0 argumentslist argumentsList  o      �X�X *0 argumentdefinitions argumentDefinitions 	�W	 o      �V�V (0 asocparametersdict asocParametersDict�W  �Z   k    

  l     �U�U   q k parse the remaining raw arguments, converting to the required type and adding to the parameters dictionary    � �   p a r s e   t h e   r e m a i n i n g   r a w   a r g u m e n t s ,   c o n v e r t i n g   t o   t h e   r e q u i r e d   t y p e   a n d   a d d i n g   t o   t h e   p a r a m e t e r s   d i c t i o n a r y  r      m     �T�T   o      �S�S 0 i    r    	 n    1    �R
�R 
leng o    �Q�Q 0 argumentslist argumentsList o      �P�P 0 argcount argCount  l  
 
�O�O   � � TO DO: this should throw invalid argument definition error if an optional argument definition is followed by a required argument definition    �   T O   D O :   t h i s   s h o u l d   t h r o w   i n v a l i d   a r g u m e n t   d e f i n i t i o n   e r r o r   i f   a n   o p t i o n a l   a r g u m e n t   d e f i n i t i o n   i s   f o l l o w e d   b y   a   r e q u i r e d   a r g u m e n t   d e f i n i t i o n   X   
 �!�N"! k    �## $%$ r    &'& [    ()( o    �M�M 0 i  ) m    �L�L ' o      �K�K 0 i  % *+* r     6,-, b     4./. l    %0�J�I0 c     %121 n    #343 1   ! #�H
�H 
pcnt4 o     !�G�G 0 argref argRef2 m   # $�F
�F 
reco�J  �I  / K   % 355 �E67�E 0 propertyname propertyName6 m   & '88 �99  7 �D:;�D 0 	valuetype 	valueType: m   ( )�C
�C 
ctxt; �B<=�B 0 islist isList< m   * +�A
�A boovfals= �@>�?�@ 0 defaultvalue defaultValue> o   , 1�>�> 0 novalue NoValue�?  - o      �=�= (0 argumentdefinition argumentDefinition+ ?@? Z  7 QAB�<�;A =  7 <CDC n  7 :EFE o   8 :�:�: 0 propertyname propertyNameF o   7 8�9�9 (0 argumentdefinition argumentDefinitionD m   : ;GG �HH  B R   ? M�8IJ
�8 .ascrerr ****      � ****I m   I LKK �LL � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a   n o n - e m p t y   p r o p e r t y N a m e   p r o p e r t y ) .J �7MN
�7 
errnM m   A B�6�6�YN �5O�4
�5 
erobO o   E F�3�3 0 argref argRef�4  �<  �;  @ PQP Z   R �RS�2TR =   R VUVU o   R S�1�1 0 argumentslist argumentsListV J   S U�0�0  S k   Y WW XYX r   Y ^Z[Z n  Y \\]\ o   Z \�/�/ 0 defaultvalue defaultValue] o   Y Z�.�. (0 argumentdefinition argumentDefinition[ o      �-�- 0 thevalue theValueY ^�,^ Z   _ _`�+�*_ =  _ faba o   _ `�)�) 0 thevalue theValueb o   ` e�(�( 0 novalue NoValue` l  i {cdec l  i {fghf R   i {�'ij
�' .ascrerr ****      � ****i b   q zklk b   q vmnm m   q too �pp 4 M i s s i n g   r e q u i r e d   a r g u m e n t  n o   t u�&�& 0 i  l m   v yqq �rr  .j �%s�$
�% 
errns o   k p�#�#  0 _argvusererror _ArgvUserError�$  g J D TO DO: include placeholderValue/valueType in error message if given   h �tt �   T O   D O :   i n c l u d e   p l a c e h o l d e r V a l u e / v a l u e T y p e   i n   e r r o r   m e s s a g e   i f   g i v e nd W Q record doesn't have a defaultValue property, so user should've supplied argument   e �uu �   r e c o r d   d o e s n ' t   h a v e   a   d e f a u l t V a l u e   p r o p e r t y ,   s o   u s e r   s h o u l d ' v e   s u p p l i e d   a r g u m e n t�+  �*  �,  �2  T k   � �vv wxw r   � �yzy I   � ��"{�!�" 0 _unpackvalue _unpackValue{ |}| n   � �~~ 4  � �� �
�  
cobj� m   � ���  o   � ��� 0 argumentslist argumentsList} ��� o   � ��� (0 argumentdefinition argumentDefinition�  �!  z o      �� 0 thevalue theValuex ��� r   � ���� n   � ���� 1   � ��
� 
rest� o   � ��� 0 argumentslist argumentsList� o      �� 0 argumentslist argumentsList�  Q ��� Z   � ������ n  � ���� o   � ��� 0 islist isList� o   � ��� (0 argumentdefinition argumentDefinition� k   � ��� ��� Z  � ������ A   � ���� o   � ��� 0 i  � n   � ���� 1   � ��
� 
leng� o   � ��� *0 argumentdefinitions argumentDefinitions� R   � ����
� .ascrerr ****      � ****� m   � ��� ��� � I n v a l i d   a r g u m e n t   d e f i n i t i o n   ( o n l y   t h e   l a s t   a r g u m e n t   d e f i n i t i o n   m a y   c o n t a i n   a n    i s L i s t : t r u e    p r o p e r t y ) .� ���
� 
errn� m   � ����Y� �
��	
�
 
erob� o   � ��� 0 argref argRef�	  �  �  � ��� r   � ���� J   � ��� ��� o   � ��� 0 thevalue theValue�  � o      �� 0 thevalue theValue� ��� X   � ����� r   � ���� I   � ����� 0 _unpackvalue _unpackValue� ��� n  � ���� 1   � ��
� 
pcnt� o   � �� �  0 aref aRef� ���� o   � ����� (0 argumentdefinition argumentDefinition��  �  � n      ���  ;   � �� o   � ����� 0 thevalue theValue� 0 aref aRef� o   � ����� 0 argumentslist argumentsList� ���� r   � ���� J   � �����  � o      ���� 0 argumentslist argumentsList��  �  �  � ���� l  � ������� n  � ���� I   � �������� &0 setobject_forkey_ setObject_forKey_� ��� o   � ����� 0 thevalue theValue� ���� l  � ������� n  � ���� o   � ����� 0 propertyname propertyName� o   � ����� (0 argumentdefinition argumentDefinition��  ��  ��  ��  � o   � ����� (0 asocparametersdict asocParametersDict��  ��  ��  �N 0 argref argRef" o    ���� *0 argumentdefinitions argumentDefinitions  ���� Z  �������� >  � ���� o   � ����� 0 argumentslist argumentsList� J   � �����  � R   ����
�� .ascrerr ****      � ****� b  ��� b  ��� b  ��� b  ��� m  �� ��� : T o o   m a n y   a r g u m e n t s   ( e x p e c t e d  � n  ��� 1  ��
�� 
leng� o  ���� *0 argumentdefinitions argumentDefinitions� m  �� ���    b u t   r e c e i v e d  � o  ���� 0 argcount argCount� m  �� ���  ) .� �����
�� 
errn� o  ����  0 _argvusererror _ArgvUserError��  ��  ��  ��   ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  � ) # format built-in help documentation   � ��� F   f o r m a t   b u i l t - i n   h e l p   d o c u m e n t a t i o n� ��� l     ��������  ��  ��  � ��� i  � ���� I      �������  0 _formatoptions _formatOptions� ��� o      ���� &0 optiondefinitions optionDefinitions� ��� o      ���� 0 vtstyle vtStyle� ���� o      ���� &0 hasdefaultoptions hasDefaultOptions��  ��  � k    ��� ��� l     ������  � ] W generates OPTIONS section, along with options synopsis for inclusion in autogenerated    � ��� �   g e n e r a t e s   O P T I O N S   s e c t i o n ,   a l o n g   w i t h   o p t i o n s   s y n o p s i s   f o r   i n c l u s i o n   i n   a u t o g e n e r a t e d  � ��� r     ��� J     �� ��� m     �� ���  � ��� m       �  � �� m     �  ��  � J        o      ����  0 defaultoptions defaultOptions 	 o      ����  0 booleanoptions booleanOptions	 
��
 o      ���� 0 otheroptions otherOptions��  �  l   ' r    ' b    % b    ! n    o    ���� 0 b   o    ���� 0 vtstyle vtStyle m      �  O P T I O N S n  ! $ o   " $���� 0 n   o   ! "���� 0 vtstyle vtStyle o      ����  0 optionssection optionsSection � � TO DO: add option descriptions to NSMutableArray so they can be sorted alphabetically at end? ditto for boolean and other options in synopsis    �   T O   D O :   a d d   o p t i o n   d e s c r i p t i o n s   t o   N S M u t a b l e A r r a y   s o   t h e y   c a n   b e   s o r t e d   a l p h a b e t i c a l l y   a t   e n d ?   d i t t o   f o r   b o o l e a n   a n d   o t h e r   o p t i o n s   i n   s y n o p s i s  X   (��  k   8!! "#" r   8 `$%$ b   8 ^&'& l  8 ;(����( c   8 ;)*) o   8 9���� 0 	optionref 	optionRef* m   9 :��
�� 
reco��  ��  ' K   ; ]++ ��,-�� 0 	shortname 	shortName, m   < =.. �//  - ��01�� 0 longname longName0 m   > ?22 �33  1 ��45�� 0 	valuetype 	valueType4 m   @ A��
�� 
ctxt5 ��67�� 0 islist isList6 m   D E��
�� boovfals7 ��89�� 0 defaultvalue defaultValue8 o   H M���� 0 novalue NoValue9 ��:;�� $0 valueplaceholder valuePlaceholder: m   P S<< �==  ; ��>���� $0 valuedescription valueDescription> m   V Y?? �@@  ��  % o      ���� $0 optiondefinition optionDefinition# ABA Q   a �CDEC k   d �FF GHG r   d kIJI c   d iKLK n  d gMNM o   e g���� 0 	shortname 	shortNameN o   d e���� $0 optiondefinition optionDefinitionL m   g h��
�� 
ctxtJ o      ���� 0 	shortname 	shortNameH OPO r   l sQRQ c   l qSTS n  l oUVU o   m o���� 0 longname longNameV o   l m���� $0 optiondefinition optionDefinitionT m   o p��
�� 
ctxtR o      ���� 0 longname longNameP WXW r   t }YZY c   t {[\[ n  t w]^] o   u w���� 0 	valuetype 	valueType^ o   t u���� $0 optiondefinition optionDefinition\ m   w z��
�� 
typeZ o      ���� 0 	valuetype 	valueTypeX _`_ r   ~ �aba c   ~ �cdc n  ~ �efe o    ����� 0 islist isListf o   ~ ���� $0 optiondefinition optionDefinitiond m   � ���
�� 
boolb o      ���� 0 islist isList` ghg r   � �iji c   � �klk n  � �mnm o   � ����� $0 valueplaceholder valuePlaceholdern o   � ����� $0 optiondefinition optionDefinitionl m   � ���
�� 
ctxtj o      ���� $0 valueplaceholder valuePlaceholderh o��o r   � �pqp c   � �rsr n  � �tut o   � ����� $0 valuedescription valueDescriptionu o   � ����� $0 optiondefinition optionDefinitions m   � ���
�� 
ctxtq o      ���� $0 valuedescription valueDescription��  D R      ����v
�� .ascrerr ****      � ****��  v ��w��
�� 
errnw d      xx m      �������  E n  � �yzy I   � ���{���� 60 throwinvalidparametertype throwInvalidParameterType{ |}| o   � ����� &0 optiondefinitions optionDefinitions} ~~ m   � ��� ���  o p t i o n s ��� m   � ��� ��� ` l i s t   o f    c o m m a n d   l i n e   o p t i o n   d e f i n i t i o n    r e c o r d s� ���� m   � ���
�� 
reco��  ��  z o   � ����� 0 _support  B ��� r   � ���� b   � ���� b   � ���� o   � �����  0 optionssection optionsSection� o   � ����� 
0 lf2 LF2� o   � ����� 0 indent1 Indent1� o      ����  0 optionssection optionsSection� ��� Z   �#������ =  � ���� o   � ����� 0 	shortname 	shortName� m   � ��� ���  � k   � ��� ��� Z  � �������� =  � ���� o   � ����� 0 longname longName� m   � ��� ���  � R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� � I n v a l i d   o p t i o n   d e f i n i t i o n   ( r e c o r d   m u s t   c o n t a i n   a    s h o r t N a m e    a n d / o r    l o n g N a m e    p r o p e r t y ) .� ����
�� 
errn� m   � ������Y� �����
�� 
erob� o   � ����� 0 	optionref 	optionRef��  ��  ��  � ��� r   � ���� o   � ����� 0 longname longName� o      ���� 0 
optionname 
optionName� ���� r   � ���� b   � ���� b   � ���� o   � ���  0 optionssection optionsSection� m   � ��� ���  - -� o   � ��~�~ 0 longname longName� o      �}�}  0 optionssection optionsSection��  ��  � k   #�� ��� r   ��� o   �|�| 0 	shortname 	shortName� o      �{�{ 0 
optionname 
optionName� ��� r  ��� b  ��� b  	��� o  �z�z  0 optionssection optionsSection� m  �� ���  -� o  	
�y�y 0 	shortname 	shortName� o      �x�x  0 optionssection optionsSection� ��w� Z #���v�u� > ��� o  �t�t 0 longname longName� m  �� ���  � r  ��� b  ��� b  ��� o  �s�s  0 optionssection optionsSection� m  �� ���  ,   - -� o  �r�r 0 longname longName� o      �q�q  0 optionssection optionsSection�v  �u  �w  � ��� Z  $����p�� = $)��� o  $%�o�o 0 	valuetype 	valueType� m  %(�n
�n 
bool� l ,1���� r  ,1��� b  ,/��� o  ,-�m�m  0 booleanoptions booleanOptions� o  -.�l�l 0 
optionname 
optionName� o      �k�k  0 booleanoptions booleanOptions� ) # group all boolean flags as "[-N�]"   � ��� F   g r o u p   a l l   b o o l e a n   f l a g s   a s   " [ - N & ] "�p  � k  4��� ��� r  4C��� > 4?��� n 49��� o  59�j�j 0 defaultvalue defaultValue� o  45�i�i $0 optiondefinition optionDefinition� o  9>�h�h 0 novalue NoValue� o      �g�g 0 
isoptional 
isOptional� ��� r  DK��� b  DI��� o  DE�f�f 0 otheroptions otherOptions� 1  EH�e
�e 
spac� o      �d�d 0 otheroptions otherOptions� ��� Z L]���c�b� o  LO�a�a 0 
isoptional 
isOptional� r  RY��� b  RW��� o  RS�`�` 0 otheroptions otherOptions� m  SV�� ���  [� o      �_�_ 0 otheroptions otherOptions�c  �b  � ��� r  ^g��� b  ^e� � b  ^c o  ^_�^�^ 0 otheroptions otherOptions m  _b �  -  o  cd�]�] 0 
optionname 
optionName� o      �\�\ 0 otheroptions otherOptions�  r  hk o  hi�[�[ $0 valueplaceholder valuePlaceholder o      �Z�Z $0 valueplaceholder valuePlaceholder 	
	 Z l��Y�X = lq o  lm�W�W $0 valueplaceholder valuePlaceholder m  mp �   r  t| I  tz�V�U�V 40 _defaultvalueplaceholder _defaultValuePlaceholder �T o  uv�S�S $0 optiondefinition optionDefinition�T  �U   o      �R�R $0 valueplaceholder valuePlaceholder�Y  �X  
  r  �� b  �� b  �� n �� o  ���Q�Q 0 u   o  ���P�P 0 vtstyle vtStyle o  ���O�O $0 valueplaceholder valuePlaceholder n ��  o  ���N�N 0 n    o  ���M�M 0 vtstyle vtStyle o      �L�L $0 valueplaceholder valuePlaceholder !"! r  ��#$# b  ��%&% b  ��'(' o  ���K�K 0 otheroptions otherOptions( 1  ���J
�J 
spac& o  ���I�I $0 valueplaceholder valuePlaceholder$ o      �H�H 0 otheroptions otherOptions" )*) Z ��+,�G�F+ o  ���E�E 0 
isoptional 
isOptional, r  ��-.- b  ��/0/ o  ���D�D 0 otheroptions otherOptions0 m  ��11 �22  ]. o      �C�C 0 otheroptions otherOptions�G  �F  * 343 r  ��565 b  ��787 b  ��9:9 o  ���B�B  0 optionssection optionsSection: 1  ���A
�A 
spac8 o  ���@�@ $0 valueplaceholder valuePlaceholder6 o      �?�?  0 optionssection optionsSection4 ;<; Z ��=>�>�== > ��?@? n ��ABA o  ���<�< 0 defaultvalue defaultValueB o  ���;�; $0 optiondefinition optionDefinition@ o  ���:�: 0 novalue NoValue> r  ��CDC b  ��EFE o  ���9�9 $0 valuedescription valueDescriptionF I  ���8G�7�8 *0 _formatdefaultvalue _formatDefaultValueG H�6H o  ���5�5 $0 optiondefinition optionDefinition�6  �7  D o      �4�4 $0 valuedescription valueDescription�>  �=  < I�3I Z ��JK�2�1J o  ���0�0 0 islist isListK r  ��LML b  ��NON o  ���/�/ $0 valuedescription valueDescriptionO m  ��PP �QQ N T h i s   o p t i o n   c a n   b e   u s e d   m u l t i p l e   t i m e s .M o      �.�. $0 valuedescription valueDescription�2  �1  �3  � R�-R Z �ST�,�+S > ��UVU o  ���*�* $0 valuedescription valueDescriptionV m  ��WW �XX  T r  ��YZY b  ��[\[ b  ��]^] b  ��_`_ b  ��aba o  ���)�)  0 optionssection optionsSectionb 1  ���(
�( 
lnfd` o  ���'�' 0 indent2 Indent2^ o  ���&�& $0 valuedescription valueDescription\ 1  ���%
�% 
spacZ o      �$�$  0 optionssection optionsSection�,  �+  �-  �� 0 	optionref 	optionRef  o   + ,�#�# &0 optiondefinitions optionDefinitions cdc l �"ef�"  e 3 - document default -h and -v options as needed   f �gg Z   d o c u m e n t   d e f a u l t   - h   a n d   - v   o p t i o n s   a s   n e e d e dd hih Z  |jk�!� j o  �� &0 hasdefaultoptions hasDefaultOptionsk k  xll mnm Z  Aop��o H  qq E  rsr o  ��  0 booleanoptions booleanOptionss m  tt �uu  hp k  =vv wxw r  yzy b  {|{ m  }} �~~  h| o  ��  0 defaultoptions defaultOptionsz o      ��  0 defaultoptions defaultOptionsx � r  =��� b  ;��� b  7��� b  1��� b  -��� b  )��� b  #��� o  ��  0 optionssection optionsSection� o  "�� 
0 lf2 LF2� o  #(�� 0 indent1 Indent1� m  ),�� ���  - h ,   - - h e l p� 1  -0�
� 
lnfd� o  16�� 0 indent2 Indent2� m  7:�� ��� 2 P r i n t   t h i s   h e l p   a n d   e x i t .� o      ��  0 optionssection optionsSection�  �  �  n ��� Z  Bx����� H  BH�� E  BG��� o  BC��  0 booleanoptions booleanOptions� m  CF�� ���  v� k  Kt�� ��� r  KR��� b  KP��� o  KL��  0 defaultoptions defaultOptions� m  LO�� ���  v� o      ��  0 defaultoptions defaultOptions� ��� r  St��� b  Sr��� b  Sn��� b  Sh��� b  Sd��� b  S`��� b  SZ��� o  ST��  0 optionssection optionsSection� o  TY�
�
 
0 lf2 LF2� o  Z_�	�	 0 indent1 Indent1� m  `c�� ���  - v ,   - - v e r s i o n� 1  dg�
� 
lnfd� o  hm�� 0 indent2 Indent2� m  nq�� ��� < P r i n t   v e r s i o n   n u m b e r   a n d   e x i t .� o      ��  0 optionssection optionsSection�  �  �  �  �!  �   i ��� r  }���� m  }��� ���  � o      �� "0 optionssynopsis optionsSynopsis� ��� Z ������� > ����� o  ����  0 defaultoptions defaultOptions� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� o  ���� "0 optionssynopsis optionsSynopsis� m  ���� ���    [ -� o  ��� �   0 defaultoptions defaultOptions� m  ���� ���  ]� o      ���� "0 optionssynopsis optionsSynopsis�  �  � ��� Z ��������� > ����� o  ������  0 booleanoptions booleanOptions� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� o  ������ "0 optionssynopsis optionsSynopsis� m  ���� ���    [ -� o  ������  0 booleanoptions booleanOptions� m  ���� ���  ]� o      ���� "0 optionssynopsis optionsSynopsis��  ��  � ��� Z ��������� > ����� o  ������ 0 otheroptions otherOptions� m  ���� ���  � r  ����� b  ����� o  ������ "0 optionssynopsis optionsSynopsis� o  ������ 0 otheroptions otherOptions� o      ���� "0 optionssynopsis optionsSynopsis��  ��  � ���� L  ���� J  ���� ��� o  ������ "0 optionssynopsis optionsSynopsis� ���� o  ������  0 optionssection optionsSection��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I      ������� $0 _formatarguments _formatArguments� � � o      ���� *0 argumentdefinitions argumentDefinitions  �� o      ���� 0 vtstyle vtStyle��  ��  � k    >  Z    ���� =     o     ���� *0 argumentdefinitions argumentDefinitions J    ����   L    		 J    

  m     �   �� m    	 �  ��  ��  ��    r     m     �   o      ���� &0 argumentssynopsis argumentsSynopsis  r      b     b     n    !  o    ���� 0 b  ! o    ���� 0 vtstyle vtStyle m    "" �##  A R G U M E N T S n   $%$ o    ���� 0 n  % o    ���� 0 vtstyle vtStyle o      ���� $0 argumentssection argumentsSection &'& X   !4(��)( k   1/** +,+ r   1 M-.- b   1 K/0/ l  1 41����1 c   1 4232 o   1 2���� 0 argumentref argumentRef3 m   2 3��
�� 
reco��  ��  0 K   4 J44 ��56�� 0 	valuetype 	valueType5 m   5 6��
�� 
ctxt6 ��78�� 0 islist isList7 m   7 8��
�� boovfals8 ��9:�� 0 defaultvalue defaultValue9 o   9 >���� 0 novalue NoValue: ��;<�� $0 valueplaceholder valuePlaceholder; m   ? @== �>>  < ��?���� $0 valuedescription valueDescription? m   C F@@ �AA  ��  . o      ���� (0 argumentdefinition argumentDefinition, BCB Q   N �DEFD k   Q vGG HIH r   Q ZJKJ c   Q XLML n  Q TNON o   R T���� 0 	valuetype 	valueTypeO o   Q R���� (0 argumentdefinition argumentDefinitionM m   T W��
�� 
typeK o      ���� 0 	valuetype 	valueTypeI PQP r   [ dRSR c   [ bTUT n  [ ^VWV o   \ ^���� 0 islist isListW o   [ \���� (0 argumentdefinition argumentDefinitionU m   ^ a��
�� 
boolS o      ���� 0 islist isListQ XYX r   e lZ[Z c   e j\]\ n  e h^_^ o   f h���� $0 valueplaceholder valuePlaceholder_ o   e f���� (0 argumentdefinition argumentDefinition] m   h i��
�� 
ctxt[ o      ���� $0 valueplaceholder valuePlaceholderY `��` r   m vaba c   m tcdc n  m refe o   n r���� $0 valuedescription valueDescriptionf o   m n���� (0 argumentdefinition argumentDefinitiond m   r s��
�� 
ctxtb o      ���� $0 valuedescription valueDescription��  E R      ����g
�� .ascrerr ****      � ****��  g ��h��
�� 
errnh d      ii m      �������  F n  ~ �jkj I   � ���l���� 60 throwinvalidparametertype throwInvalidParameterTypel mnm o   � ����� *0 argumentdefinitions argumentDefinitionsn opo m   � �qq �rr  a r g u m e n t sp sts m   � �uu �vv d l i s t   o f    c o m m a n d   l i n e   a r g u m e n t   d e f i n i t i o n    r e c o r d st w��w m   � ���
�� 
reco��  ��  k o   ~ ����� 0 _support  C xyx Z  � �z{����z =  � �|}| o   � ����� $0 valueplaceholder valuePlaceholder} m   � �~~ �  { r   � ���� I   � �������� 40 _defaultvalueplaceholder _defaultValuePlaceholder� ���� o   � ����� (0 argumentdefinition argumentDefinition��  ��  � o      ���� $0 valueplaceholder valuePlaceholder��  ��  y ��� Z  � �������� o   � ����� 0 islist isList� r   � ���� b   � ���� o   � ����� $0 valueplaceholder valuePlaceholder� m   � ��� ���    . . .� o      ���� $0 valueplaceholder valuePlaceholder��  ��  � ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ����� $0 argumentssection argumentsSection� o   � ����� 
0 lf2 LF2� o   � ����� 0 indent1 Indent1� n  � ���� o   � ����� 0 u  � o   � ����� 0 vtstyle vtStyle� o   � ����� $0 valueplaceholder valuePlaceholder� n  � ���� o   � ����� 0 n  � o   � ����� 0 vtstyle vtStyle� o      ���� $0 argumentssection argumentsSection� ��� Z  � �������� >  � ���� n  � ���� o   � ����� 0 defaultvalue defaultValue� o   � ����� (0 argumentdefinition argumentDefinition� o   � ����� 0 novalue NoValue� r   � ���� b   � ���� o   � ����� $0 valuedescription valueDescription� I   � �������� *0 _formatdefaultvalue _formatDefaultValue� ���� o   � ����� (0 argumentdefinition argumentDefinition��  ��  � o      ���� $0 valuedescription valueDescription��  ��  � ��� Z  �	������� >  � ���� o   � ����� $0 valuedescription valueDescription� m   � ��� ���  � r   ���� b   ���� b   ���� b   � ���� o   � ����� $0 argumentssection argumentsSection� 1   � ���
�� 
lnfd� o   � ���� 0 indent2 Indent2� o  ���� $0 valuedescription valueDescription� o      ���� $0 argumentssection argumentsSection��  ��  � ��� Z 
%������� > 
��� n 
��� o  ���� 0 defaultvalue defaultValue� o  
���� (0 argumentdefinition argumentDefinition� o  ���� 0 novalue NoValue� r  !��� b  ��� b  ��� m  �� ���  [� o  �� $0 valueplaceholder valuePlaceholder� m  �� ���  ]� o      �~�~ $0 valueplaceholder valuePlaceholder��  ��  � ��}� r  &/��� b  &-��� b  &+��� o  &'�|�| &0 argumentssynopsis argumentsSynopsis� 1  '*�{
�{ 
spac� o  +,�z�z $0 valueplaceholder valuePlaceholder� o      �y�y &0 argumentssynopsis argumentsSynopsis�}  �� 0 argumentref argumentRef) o   $ %�x�x *0 argumentdefinitions argumentDefinitions' ��w� L  5>�� J  5=�� ��� b  5:��� m  58�� ��� 
   [ - - ]� o  89�v�v &0 argumentssynopsis argumentsSynopsis� ��u� o  :;�t�t $0 argumentssection argumentsSection�u  �w  � ��� l     �s�r�q�s  �r  �q  � ��� l     �p���p  �  -----   � ��� 
 - - - - -� ��� l     �o�n�m�o  �n  �m  � ��� i  � ���� I     �l��
�l .Fil:Argvnull���     ****� l 
    ��k�j� o      �i�i 0 argv  �k  �j  � �h��
�h 
OpsD� |�g�f��e��g  �f  � o      �d�d &0 optiondefinitions optionDefinitions�e  � l 
    ��c�b� J      �a�a  �c  �b  � �`��
�` 
OpsA� |�_�^��]��_  �^  � o      �\�\ *0 argumentdefinitions argumentDefinitions�]  � l 
    ��[�Z� J      �� ��Y� K      �� �X���X 0 propertyname propertyName� m         �  a r g u m e n t s L i s t� �W�V�W 0 islist isList m      �U
�U boovtrue�V  �Y  �[  �Z  � �T�S
�T 
DefO |�R�Q�P�R  �Q   o      �O�O &0 hasdefaultoptions hasDefaultOptions�P   l     �N�M m      �L
�L boovtrue�N  �M  �S  � k     � 	 l     �K
�K  
�� note: while NSUserDefaults provides some argument parsing support (see its NSArgumentDomain), it uses an atypical syntax and reads directly from argv, making it difficult both to omit arguments provided to osascript itself and to extract any arguments remaining after options are parsed; thus, this handler implements its own argv parser that avoids NSUserDefaults' deficiencies while also providing a better optparse-style UI/UX to both shell script authors and users    ��   n o t e :   w h i l e   N S U s e r D e f a u l t s   p r o v i d e s   s o m e   a r g u m e n t   p a r s i n g   s u p p o r t   ( s e e   i t s   N S A r g u m e n t D o m a i n ) ,   i t   u s e s   a n   a t y p i c a l   s y n t a x   a n d   r e a d s   d i r e c t l y   f r o m   a r g v ,   m a k i n g   i t   d i f f i c u l t   b o t h   t o   o m i t   a r g u m e n t s   p r o v i d e d   t o   o s a s c r i p t   i t s e l f   a n d   t o   e x t r a c t   a n y   a r g u m e n t s   r e m a i n i n g   a f t e r   o p t i o n s   a r e   p a r s e d ;   t h u s ,   t h i s   h a n d l e r   i m p l e m e n t s   i t s   o w n   a r g v   p a r s e r   t h a t   a v o i d s   N S U s e r D e f a u l t s '   d e f i c i e n c i e s   w h i l e   a l s o   p r o v i d i n g   a   b e t t e r   o p t p a r s e - s t y l e   U I / U X   t o   b o t h   s h e l l   s c r i p t   a u t h o r s   a n d   u s e r s	  l     �J�I�H�J  �I  �H    l     �G�G  �� TO DO: if default -h/-v is invoked, output relevant info to stderr/stdout and immediately exit(0)? (this'd require merging `format command line help` parameters and adding optional version number parameter (default: "0.1.0"); this would save users having to implement their own processing for help and version in every single script, the downside being more complex command documentation    �   T O   D O :   i f   d e f a u l t   - h / - v   i s   i n v o k e d ,   o u t p u t   r e l e v a n t   i n f o   t o   s t d e r r / s t d o u t   a n d   i m m e d i a t e l y   e x i t ( 0 ) ?   ( t h i s ' d   r e q u i r e   m e r g i n g   ` f o r m a t   c o m m a n d   l i n e   h e l p `   p a r a m e t e r s   a n d   a d d i n g   o p t i o n a l   v e r s i o n   n u m b e r   p a r a m e t e r   ( d e f a u l t :   " 0 . 1 . 0 " ) ;   t h i s   w o u l d   s a v e   u s e r s   h a v i n g   t o   i m p l e m e n t   t h e i r   o w n   p r o c e s s i n g   f o r   h e l p   a n d   v e r s i o n   i n   e v e r y   s i n g l e   s c r i p t ,   t h e   d o w n s i d e   b e i n g   m o r e   c o m p l e x   c o m m a n d   d o c u m e n t a t i o n �F P     � k    �  r    
 n    1    �E
�E 
txdl 1    �D
�D 
ascr o      �C�C 0 oldtids oldTIDs �B Q    � !"  k    j## $%$ l   �A&'�A  & ) # first, ensure parameters are lists   ' �(( F   f i r s t ,   e n s u r e   p a r a m e t e r s   a r e   l i s t s% )*) r    +,+ n   -.- I    �@/�?�@ "0 aslistparameter asListParameter/ 0�>0 o    �=�= 0 argv  �>  �?  . o    �<�< 0 _support  , o      �;�; 0 argv  * 121 r    '343 n   %565 I     %�:7�9�: "0 aslistparameter asListParameter7 8�88 o     !�7�7 &0 optiondefinitions optionDefinitions�8  �9  6 o     �6�6 0 _support  4 o      �5�5 &0 optiondefinitions optionDefinitions2 9:9 r   ( 4;<; n  ( 2=>= I   - 2�4?�3�4 "0 aslistparameter asListParameter? @�2@ o   - .�1�1 *0 argumentdefinitions argumentDefinitions�2  �3  > o   ( -�0�0 0 _support  < o      �/�/ *0 argumentdefinitions argumentDefinitions: ABA l  5 5�.CD�.  C � � next iterate over the raw argument list, identifying option names and (if non-boolean) values, returning a NSMutableDictionary of parsed option values plus a list of any remaining (i.e. non-option) arguments   D �EE�   n e x t   i t e r a t e   o v e r   t h e   r a w   a r g u m e n t   l i s t ,   i d e n t i f y i n g   o p t i o n   n a m e s   a n d   ( i f   n o n - b o o l e a n )   v a l u e s ,   r e t u r n i n g   a   N S M u t a b l e D i c t i o n a r y   o f   p a r s e d   o p t i o n   v a l u e s   p l u s   a   l i s t   o f   a n y   r e m a i n i n g   ( i . e .   n o n - o p t i o n )   a r g u m e n t sB FGF r   5 NHIH I      �-J�,�- 0 _parseoptions _parseOptionsJ KLK n   6 9MNM 2  7 9�+
�+ 
cobjN o   6 7�*�* 0 argv  L OPO o   9 :�)�) &0 optiondefinitions optionDefinitionsP Q�(Q o   : ;�'�' &0 hasdefaultoptions hasDefaultOptions�(  �,  I J      RR STS o      �&�& (0 asocparametersdict asocParametersDictT U�%U o      �$�$ 0 argumentslist argumentsList�%  G VWV l  O O�#XY�#  X v p add default values for any missing options to asocParametersDict, raising error if a required option is missing   Y �ZZ �   a d d   d e f a u l t   v a l u e s   f o r   a n y   m i s s i n g   o p t i o n s   t o   a s o c P a r a m e t e r s D i c t ,   r a i s i n g   e r r o r   i f   a   r e q u i r e d   o p t i o n   i s   m i s s i n gW [\[ I   O V�"]�!�" (0 _adddefaultoptions _addDefaultOptions] ^_^ o   P Q� �  (0 asocparametersdict asocParametersDict_ `�` o   Q R�� &0 optiondefinitions optionDefinitions�  �!  \ aba l  W W�cd�  c b \ parse the remaining arguments as named positional parameters, adding them to the dictionary   d �ee �   p a r s e   t h e   r e m a i n i n g   a r g u m e n t s   a s   n a m e d   p o s i t i o n a l   p a r a m e t e r s ,   a d d i n g   t h e m   t o   t h e   d i c t i o n a r yb fgf I   W _�h�� "0 _parsearguments _parseArgumentsh iji o   X Y�� 0 argumentslist argumentsListj klk o   Y Z�� *0 argumentdefinitions argumentDefinitionsl m�m o   Z [�� (0 asocparametersdict asocParametersDict�  �  g non r   ` epqp o   ` a�� 0 oldtids oldTIDsq n     rsr 1   b d�
� 
txdls 1   a b�
� 
ascro tut l  f f�vw�  v 6 0log (asocParametersDict's description() as text)   w �xx ` l o g   ( a s o c P a r a m e t e r s D i c t ' s   d e s c r i p t i o n ( )   a s   t e x t )u y�y l  f jz{|z L   f j}} c   f i~~ o   f g�� (0 asocparametersdict asocParametersDict m   g h�
� 
****{ : 4 coerce the dictionary to an AS record and return it   | ��� h   c o e r c e   t h e   d i c t i o n a r y   t o   a n   A S   r e c o r d   a n d   r e t u r n   i t�  ! R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �
�
 0 efrom eFrom� �	��
�	 
errt� o      �� 
0 eto eTo�  " k   r ��� ��� r   r w��� o   r s�� 0 oldtids oldTIDs� n     ��� 1   t v�
� 
txdl� 1   s t�
� 
ascr� ��� Z   x ������ =   x ��� o   x y�� 0 enumber eNumber� o   y ~� �   0 _argvusererror _ArgvUserError� l  � ����� R   � �����
�� .ascrerr ****      � ****� o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enumber eNumber� ����
�� 
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  � : 4 TO DO: check how osascript displays this error info   � ��� h   T O   D O :   c h e c k   h o w   o s a s c r i p t   d i s p l a y s   t h i s   e r r o r   i n f o�  � I   � �������� 
0 _error  � ��� m   � ��� ��� 8 p a r s e   c o m m a n d   l i n e   a r g u m e n t s� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  �  �B   ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��   ����
�� consnume��  �F  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Fil:FHlpnull��� ��� null��  � ����
�� 
Name� |����������  ��  � o      ���� 0 commandname commandName��  � l 
    ������ l     ������ m      �� ���  ��  ��  ��  ��  � ����
�� 
Summ� |����������  ��  � o      ���� $0 shortdescription shortDescription��  � l 
    ������ l     ������ m      �� ���  ��  ��  ��  ��  � ����
�� 
Usag� |����������  ��  � o      ���� "0 commandsynopses commandSynopses��  � l 
    ������ J      ����  ��  ��  � ����
�� 
OpsD� |����������  ��  � o      ���� &0 optiondefinitions optionDefinitions��  � l 
    ������ J      ����  ��  ��  � ����
�� 
OpsA� |����������  ��  � o      ���� *0 argumentdefinitions argumentDefinitions��  � l 
    ������ J      �� ���� K      �� ������ 0 propertyname propertyName� m      �� ���  a r g u m e n t s L i s t� ������� 0 islist isList� m      ��
�� boovtrue��  ��  ��  ��  � ����
�� 
Docu� |����������  ��  � o      ���� "0 longdescription longDescription��  � l 
    ������ l     ������ m      �� ���  ��  ��  ��  ��  � ����
�� 
VFmt� |����������  ��  � o      ���� 0 isstyled isStyled��  � l 
    ������ l     ������ m      ��
�� boovtrue��  ��  ��  ��  � �����
�� 
DefO� |����������  ��  � o      ���� &0 hasdefaultoptions hasDefaultOptions��  � l     ������ m      ��
�� boovtrue��  ��  ��  � P    ����� Q   ����� k   ��� ��� l   ���� r    ��� n      I    ������ "0 astextparameter asTextParameter  o    ���� 0 commandname commandName �� m     �  n a m e��  ��   o    ���� 0 _support  � o      ���� 0 commandname commandName� F @ TO DO: also accept file object, and use its last path component   � � �   T O   D O :   a l s o   a c c e p t   f i l e   o b j e c t ,   a n d   u s e   i t s   l a s t   p a t h   c o m p o n e n t� 	
	 r    " n     I     ������ "0 aslistparameter asListParameter �� o    ���� &0 optiondefinitions optionDefinitions��  ��   o    ���� 0 _support   o      ���� &0 optiondefinitions optionDefinitions
  r   # / n  # - I   ( -������ "0 aslistparameter asListParameter �� o   ( )���� *0 argumentdefinitions argumentDefinitions��  ��   o   # (���� 0 _support   o      ���� *0 argumentdefinitions argumentDefinitions  r   0 < n  0 : I   5 :������ "0 aslistparameter asListParameter  ��  o   5 6���� "0 commandsynopses commandSynopses��  ��   o   0 5�� 0 _support   o      �~�~ "0 commandsynopses commandSynopses !"! r   = J#$# n  = H%&% I   B H�}'�|�} "0 astextparameter asTextParameter' ()( o   B C�{�{ $0 shortdescription shortDescription) *�z* m   C D++ �,,  s u m m a r y�z  �|  & o   = B�y�y 0 _support  $ o      �x�x $0 shortdescription shortDescription" -.- r   K X/0/ n  K V121 I   P V�w3�v�w "0 astextparameter asTextParameter3 454 o   P Q�u�u "0 longdescription longDescription5 6�t6 m   Q R77 �88  d o c u m e n t a t i o n�t  �v  2 o   K P�s�s 0 _support  0 o      �r�r "0 longdescription longDescription. 9:9 Z   Y �;<�q=; n  Y d>?> I   ^ d�p@�o�p (0 asbooleanparameter asBooleanParameter@ ABA o   ^ _�n�n 0 isstyled isStyledB C�mC m   _ `DD �EE  t e r m i n a l   s t y l e s�m  �o  ? o   Y ^�l�l 0 _support  < l  g �FGHF r   g �IJI K   g ~KK �kLM�k 0 n  L I   h n�jN�i�j 0 vt100 VT100N O�hO m   i j�g�g  �h  �i  M �fPQ�f 0 b  P I   o u�eR�d�e 0 vt100 VT100R S�cS m   p q�b�b �c  �d  Q �aT�`�a 0 u  T I   v |�_U�^�_ 0 vt100 VT100U V�]V m   w x�\�\ �]  �^  �`  J o      �[�[ 0 vtstyle vtStyleG�� normal, bold, underline; TO DO: worth putting this in reusable script object as boldText, underlineText methods? (the problem is composability: VT100 codes don't nest as 0 turns everything off, so to selectively turn off one of several styles it's necessary to turn them all off then turn back on those that are still needed; thus to apply styles correctly it's necessary to split the text into an intermediate object tree representation, with each node applying a single style, then walk that tree to generate and insert the appropriate codes; thus a general-purpose VT formatting solution that client scripts can use too really falls outside the scope of File, and probably isn't of sufficient use to ASers to warrant stdlib inclusion anyway)   H �WW�   n o r m a l ,   b o l d ,   u n d e r l i n e ;   T O   D O :   w o r t h   p u t t i n g   t h i s   i n   r e u s a b l e   s c r i p t   o b j e c t   a s   b o l d T e x t ,   u n d e r l i n e T e x t   m e t h o d s ?   ( t h e   p r o b l e m   i s   c o m p o s a b i l i t y :   V T 1 0 0   c o d e s   d o n ' t   n e s t   a s   0   t u r n s   e v e r y t h i n g   o f f ,   s o   t o   s e l e c t i v e l y   t u r n   o f f   o n e   o f   s e v e r a l   s t y l e s   i t ' s   n e c e s s a r y   t o   t u r n   t h e m   a l l   o f f   t h e n   t u r n   b a c k   o n   t h o s e   t h a t   a r e   s t i l l   n e e d e d ;   t h u s   t o   a p p l y   s t y l e s   c o r r e c t l y   i t ' s   n e c e s s a r y   t o   s p l i t   t h e   t e x t   i n t o   a n   i n t e r m e d i a t e   o b j e c t   t r e e   r e p r e s e n t a t i o n ,   w i t h   e a c h   n o d e   a p p l y i n g   a   s i n g l e   s t y l e ,   t h e n   w a l k   t h a t   t r e e   t o   g e n e r a t e   a n d   i n s e r t   t h e   a p p r o p r i a t e   c o d e s ;   t h u s   a   g e n e r a l - p u r p o s e   V T   f o r m a t t i n g   s o l u t i o n   t h a t   c l i e n t   s c r i p t s   c a n   u s e   t o o   r e a l l y   f a l l s   o u t s i d e   t h e   s c o p e   o f   F i l e ,   a n d   p r o b a b l y   i s n ' t   o f   s u f f i c i e n t   u s e   t o   A S e r s   t o   w a r r a n t   s t d l i b   i n c l u s i o n   a n y w a y )�q  = r   � �XYX K   � �ZZ �Z[\�Z 0 n  [ m   � �]] �^^  \ �Y_`�Y 0 b  _ m   � �aa �bb  ` �Xc�W�X 0 u  c m   � �dd �ee  �W  Y o      �V�V 0 vtstyle vtStyle: fgf l  � ��Uhi�U  h %  construct NAME summary section   i �jj >   c o n s t r u c t   N A M E   s u m m a r y   s e c t i o ng klk Z   � �mn�T�Sm =  � �opo o   � ��R�R 0 commandname commandNamep m   � �qq �rr  n Q   � �stus l  � �vwxv r   � �yzy l  � �{�Q�P{ I  � ��O|�N
�O .Fil:SplPnull���     ctxt| l  � �}�M�L} n   � �~~ o   � ��K�K 0 _   l  � ���J�I� I  � ��H�G�F
�H .Fil:EnVanull��� ��� null�G  �F  �J  �I  �M  �L  �N  �Q  �P  z o      �E�E 0 commandname commandNamew I C TO DO: check this is always available when running via `osascript`   x ��� �   T O   D O :   c h e c k   t h i s   i s   a l w a y s   a v a i l a b l e   w h e n   r u n n i n g   v i a   ` o s a s c r i p t `t R      �D�C�B
�D .ascrerr ****      � ****�C  �B  u l  � ����� r   � ���� m   � ��� ���  C O M M A N D� o      �A�A 0 commandname commandName�   TO DO: or error?   � ��� "   T O   D O :   o r   e r r o r ?�T  �S  l ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� n  � ���� o   � ��@�@ 0 b  � o   � ��?�? 0 vtstyle vtStyle� m   � ��� ���  N A M E� n  � ���� o   � ��>�> 0 n  � o   � ��=�= 0 vtstyle vtStyle� o   � ��<�< 
0 lf2 LF2� o   � ��;�; 0 indent1 Indent1� o   � ��:�: 0 commandname commandName� o      �9�9 0 helptext helpText� ��� Z   � ����8�7� >  � ���� o   � ��6�6 $0 shortdescription shortDescription� m   � ��� ���  � r   � ���� b   � ���� b   � ���� o   � ��5�5 0 helptext helpText� m   � ��� ���    - -  � o   � ��4�4 $0 shortdescription shortDescription� o      �3�3 0 helptext helpText�8  �7  � ��� l  � ��2���2  � B < construct default SYNOPSIS, OPTIONS, and ARGUMENTS sections   � ��� x   c o n s t r u c t   d e f a u l t   S Y N O P S I S ,   O P T I O N S ,   a n d   A R G U M E N T S   s e c t i o n s� ��� r   ���� I      �1��0�1  0 _formatoptions _formatOptions� ��� o   � ��/�/ &0 optiondefinitions optionDefinitions� ��� o   � ��.�. 0 vtstyle vtStyle� ��-� o   � ��,�, &0 hasdefaultoptions hasDefaultOptions�-  �0  � J      �� ��� o      �+�+ 00 defaultoptionssynopsis defaultOptionsSynopsis� ��*� o      �)�)  0 optionssection optionsSection�*  � ��� r  &��� I      �(��'�( $0 _formatarguments _formatArguments� ��� o  �&�& *0 argumentdefinitions argumentDefinitions� ��%� o  �$�$ 0 vtstyle vtStyle�%  �'  � J      �� ��� o      �#�# 40 defaultargumentssynopsis defaultArgumentsSynopsis� ��"� o      �!�! $0 argumentssection argumentsSection�"  � ��� r  '<��� b  ':��� b  '6��� b  '2��� b  '.��� o  '(� �  0 helptext helpText� o  (-�� 
0 lf2 LF2� n .1��� o  /1�� 0 b  � o  ./�� 0 vtstyle vtStyle� m  25�� ���  S Y N O P S I S� n 69��� o  79�� 0 n  � o  67�� 0 vtstyle vtStyle� o      �� 0 helptext helpText� ��� Z  =Q����� = =A��� o  =>�� "0 commandsynopses commandSynopses� J  >@��  � r  DM��� J  DK�� ��� b  DI��� b  DG��� o  DE�� 0 commandname commandName� o  EF�� 00 defaultoptionssynopsis defaultOptionsSynopsis� o  GH�� 40 defaultargumentssynopsis defaultArgumentsSynopsis�  � o      �� "0 commandsynopses commandSynopses�  �  � ��� Q  R����� X  U���� r  iz��� b  ix��� b  iv��� b  ip��� o  ij�� 0 helptext helpText� o  jo�� 
0 lf2 LF2� o  pu�� 0 indent1 Indent1� o  vw�� 0 textref textRef� o      �� 0 helptext helpText� 0 textref textRef� o  XY�
�
 "0 commandsynopses commandSynopses� R      �	��
�	 .ascrerr ****      � ****�  � ���
� 
errn� d      �� m      ����  � n ��� � I  ����� 60 throwinvalidparametertype throwInvalidParameterType  o  ���� "0 commandsynopses commandSynopses  m  �� �  s y n o p s i s 	 m  ��

 �  l i s t   o f   t e x t	 � m  ��� 
�  
list�  �    o  ������ 0 _support  �  r  �� b  �� b  �� b  �� b  �� o  ������ 0 helptext helpText o  ������ 
0 lf2 LF2 o  ������  0 optionssection optionsSection o  ������ 
0 lf2 LF2 o  ������ $0 argumentssection argumentsSection o      ���� 0 helptext helpText  l ������   - ' add long DESCRIPTION section, if given    � N   a d d   l o n g   D E S C R I P T I O N   s e c t i o n ,   i f   g i v e n  Z  �� !����  > ��"#" o  ������ "0 longdescription longDescription# m  ��$$ �%%  ! r  ��&'& b  ��()( b  ��*+* b  ��,-, b  ��./. b  ��010 b  ��232 o  ������ 0 helptext helpText3 o  ������ 
0 lf2 LF21 n ��454 o  ������ 0 b  5 o  ������ 0 vtstyle vtStyle/ m  ��66 �77  D E S C R I P T I O N- n ��898 o  ������ 0 n  9 o  ������ 0 vtstyle vtStyle+ o  ������ 
0 lf2 LF2) o  ������ "0 longdescription longDescription' o      ���� 0 helptext helpText��  ��   :��: L  ��;; b  ��<=< o  ������ 0 helptext helpText= 1  ����
�� 
lnfd��  � R      ��>?
�� .ascrerr ****      � ****> o      ���� 0 etext eText? ��@A
�� 
errn@ o      ���� 0 enumber eNumberA ��BC
�� 
erobB o      ���� 0 efrom eFromC ��D��
�� 
errtD o      ���� 
0 eto eTo��  � I  ����E���� 
0 _error  E FGF m  ��HH �II 0 f o r m a t   c o m m a n d   l i n e   h e l pG JKJ o  ������ 0 etext eTextK LML o  ������ 0 enumber eNumberM NON o  ������ 0 efrom eFromO P��P o  ������ 
0 eto eTo��  ��  � ��Q
�� conscaseQ ��R
�� consdiacR ��S
�� conshyphS ��T
�� conspuncT ����
�� conswhit��  � ����
�� consnume��  � UVU l     ��������  ��  ��  V WXW l     ��������  ��  ��  X YZY l     ��������  ��  ��  Z [\[ i  � �]^] I     ������
�� .Fil:CurFnull��� ��� null��  ��  ^ Q     :_`a_ k    (bb cdc r    efe n   ghg I   
 �������� ,0 currentdirectorypath currentDirectoryPath��  ��  h n   
iji I    
��������  0 defaultmanager defaultManager��  ��  j n   klk o    ���� 0 nsfilemanager NSFileManagerl m    ��
�� misccuraf o      ���� 0 asocpath asocPathd mnm Z   !op����o =   qrq o    ���� 0 asocpath asocPathr m    ��
�� 
msngp R    ��st
�� .ascrerr ****      � ****s m    uu �vv  N o t   a v a i l a b l e .t ��w��
�� 
errnw m    �����@��  ��  ��  n x��x L   " (yy c   " 'z{z c   " %|}| o   " #���� 0 asocpath asocPath} m   # $��
�� 
ctxt{ m   % &��
�� 
psxf��  ` R      ��~
�� .ascrerr ****      � ****~ o      ���� 0 etext eText ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  a I   0 :������� 
0 _error  � ��� m   1 2�� ��� , c u r r e n t   w o r k i n g   f o l d e r� ��� o   2 3���� 0 etext eText� ��� o   3 4���� 0 enumber eNumber� ��� o   4 5���� 0 efrom eFrom� ���� o   5 6���� 
0 eto eTo��  ��  \ ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     ������
�� .Fil:EnVanull��� ��� null��  ��  � L     �� c     ��� l    ������ n    ��� I    �������� 0 environment  ��  ��  � n    ��� I    ������� 0 processinfo processInfo��  �  � n    ��� o    �� 0 nsprocessinfo NSProcessInfo� m     �
� misccura��  ��  � m    �
� 
****� ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Fil:RSInnull��� ��� null�  � ���
� 
Prmt� |������  �  � o      �� 0 
prompttext 
promptText�  � l     ��~�}� m      �� ���  > >  �~  �}  � �|��{
�| 
ReTo� |�z�y��x��z  �y  � o      �w�w 0 isinteractive isInteractive�x  � l     ��v�u� m      �t
�t boovfals�v  �u  �{  � Q     ����� k    ��� ��� r    ��� n   
��� I    
�s�r�q�s :0 filehandlewithstandardinput fileHandleWithStandardInput�r  �q  � n   ��� o    �p�p 0 nsfilehandle NSFileHandle� m    �o
�o misccura� o      �n�n 0 	asocstdin 	asocStdin� ��� Z    =���m�� o    �l�l 0 isinteractive isInteractive� k    3�� ��� I   �k��
�k .Fil:WSOunull���     ctxt� o    �j�j 0 
prompttext 
promptText� �i��
�i 
SLiB� m    �h
�h boovfals� �g��f
�g 
ALiE�f  � ��� r    "��� n    ��� I     �e�d�c�e 0 availabledata availableData�d  �c  � o    �b�b 0 	asocstdin 	asocStdin� o      �a�a 0 asocdata asocData� ��`� Z  # 3���_�^� =   # *��� n  # (��� I   $ (�]�\�[�] 
0 length  �\  �[  � o   # $�Z�Z 0 asocdata asocData� m   ( )�Y�Y  � L   - /�� m   - .�X
�X 
msng�_  �^  �`  �m  � r   6 =��� n  6 ;��� I   7 ;�W�V�U�W *0 readdatatoendoffile readDataToEndOfFile�V  �U  � o   6 7�T�T 0 	asocstdin 	asocStdin� o      �S�S 0 asocdata asocData� ��� r   > O��� n  > M��� I   E M�R��Q�R 00 initwithdata_encoding_ initWithData_encoding_� ��� o   E F�P�P 0 asocdata asocData� ��O� l  F I��N�M� n  F I��� o   G I�L�L ,0 nsutf8stringencoding NSUTF8StringEncoding� m   F G�K
�K misccura�N  �M  �O  �Q  � n  > E��� I   A E�J�I�H�J 	0 alloc  �I  �H  � n  > A��� o   ? A�G�G 0 nsstring NSString� m   > ?�F
�F misccura� o      �E�E 0 
asocstring 
asocString� ��� Z  P d���D�C� =  P S��� o   P Q�B�B 0 
asocstring 
asocString� m   Q R�A
�A 
msng� R   V `�@��
�@ .ascrerr ****      � ****� m   \ _�� ��� , N o t   U T F 8 - e n c o d e d   t e x t .� �?��>
�? 
errn� m   X [�=�=�\�>  �D  �C  � ��� Z  e �� �<�;� n  e m I   f m�:�9�: 0 
hassuffix_ 
hasSuffix_ �8 1   f i�7
�7 
lnfd�8  �9   o   e f�6�6 0 
asocstring 
asocString  r   p ~ n  p | I   q |�5	�4�5 &0 substringtoindex_ substringToIndex_	 
�3
 l  q x�2�1 \   q x l  q v�0�/ n  q v I   r v�.�-�,�. 
0 length  �-  �,   o   q r�+�+ 0 
asocstring 
asocString�0  �/   m   v w�*�* �2  �1  �3  �4   o   p q�)�) 0 
asocstring 
asocString o      �(�( 0 
asocstring 
asocString�<  �;  � �' L   � � c   � � o   � ��&�& 0 
asocstring 
asocString m   � ��%
�% 
ctxt�'  � R      �$
�$ .ascrerr ****      � **** o      �#�# 0 etext eText �"
�" 
errn o      �!�! 0 enumber eNumber � 
�  
erob o      �� 0 efrom eFrom ��
� 
errt o      �� 
0 eto eTo�  � I   � ���� 
0 _error    m   � � �   & r e a d   s t a n d a r d   i n p u t !"! o   � ��� 0 etext eText" #$# o   � ��� 0 enumber eNumber$ %&% o   � ��� 0 efrom eFrom& '�' o   � ��� 
0 eto eTo�  �  � ()( l     ����  �  �  ) *+* l     ����  �  �  + ,-, i  � �./. I     �01
� .Fil:WSOunull���     ctxt0 o      �� 0 thetext theText1 �23
� 
SLiB2 |��
4�	5�  �
  4 o      �� 0 uselinefeeds useLinefeeds�	  5 l     6��6 m      �
� boovtrue�  �  3 �7�
� 
ALiE7 |��8� 9�  �  8 o      ����  0 withlineending withLineEnding�   9 l     :����: m      ��
�� boovtrue��  ��  �  / Q     �;<=; k    >> ?@? r    ABA n   CDC I    ��E���� &0 asnsmutablestring asNSMutableStringE F��F n   GHG I    ��I���� "0 astextparameter asTextParameterI JKJ o    ���� 0 thetext theTextK L��L m    MM �NN  ��  ��  H o    ���� 0 _support  ��  ��  D o    ���� 0 _support  B o      ���� 0 
asocstring 
asocString@ OPO Z    IQR����Q o    ���� 0 uselinefeeds useLinefeedsR k    ESS TUT n   2VWV I    2��X���� l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_X YZY l 
  "[����[ l   "\����\ b    "]^] o     ��
�� 
ret ^ 1     !��
�� 
lnfd��  ��  ��  ��  Z _`_ l  " #a����a 1   " #��
�� 
lnfd��  ��  ` bcb m   # $����  c d��d K   $ .ee ��fg�� 0 location  f m   % &����  g ��h���� 
0 length  h n  ' ,iji I   ( ,�������� 
0 length  ��  ��  j o   ' (���� 0 
asocstring 
asocString��  ��  ��  W o    ���� 0 
asocstring 
asocStringU k��k n  3 Elml I   4 E��n���� l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_n opo l 
 4 5q����q l  4 5r����r o   4 5��
�� 
ret ��  ��  ��  ��  p sts l  5 6u����u 1   5 6��
�� 
lnfd��  ��  t vwv m   6 7����  w x��x K   7 Ayy ��z{�� 0 location  z m   8 9����  { ��|���� 
0 length  | n  : ?}~} I   ; ?�������� 
0 length  ��  ��  ~ o   : ;���� 0 
asocstring 
asocString��  ��  ��  m o   3 4���� 0 
asocstring 
asocString��  ��  ��  P � Z  J d������� F   J W��� o   J K����  0 withlineending withLineEnding� H   N U�� l  N T���� n  N T��� I   O T���� 0 
hassuffix_ 
hasSuffix_� ��� 1   O P�
� 
lnfd�  �  � o   N O�� 0 
asocstring 
asocString�  �  � n  Z `��� I   [ `���� 0 appendstring_ appendString_� ��� 1   [ \�
� 
lnfd�  �  � o   Z [�� 0 
asocstring 
asocString��  ��  � ��� r   e n��� n  e l��� I   h l���� <0 filehandlewithstandardoutput fileHandleWithStandardOutput�  �  � n  e h��� o   f h�� 0 nsfilehandle NSFileHandle� m   e f�
� misccura� o      �� 0 
asocstdout 
asocStdout� ��� n  o |��� I   p |���� 0 
writedata_ 
writeData_� ��� l  p x���� n  p x��� I   q x���� (0 datausingencoding_ dataUsingEncoding_� ��� l  q t���� n  q t��� o   r t�� ,0 nsutf8stringencoding NSUTF8StringEncoding� m   q r�
� misccura�  �  �  �  � o   p q�� 0 
asocstring 
asocString�  �  �  �  � o   o p�� 0 
asocstdout 
asocStdout� ��� L   } ��  �  < R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  = I   � ����� 
0 _error  � ��� m   � ��� ��� * w r i t e   s t a n d a r d   o u t p u t� ��� o   � ��� 0 etext eText� ��� o   � ��� 0 enumber eNumber� ��� o   � ��� 0 efrom eFrom� ��� o   � ��� 
0 eto eTo�  �  - ��� l     ����  �  �  � ��� l     ����  �  �  �       !����������������������������������  � �������~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f
� 
pimr� 0 _support  � 
0 _error  � (0 _nsstringencodings _NSStringEncodings
� .Fil:Readnull���     file
� .Fil:Writnull���     file
�~ .Fil:ConPnull���     ****
�} .Fil:NorPnull���     ****
�| .Fil:JoiPnull���     ****
�{ .Fil:SplPnull���     ctxt�z  0 _argvusererror _ArgvUserError�y 0 novalue NoValue�x 
0 lf2 LF2�w 0 indent1 Indent1�v 0 indent2 Indent2�u 0 vt100 VT100�t 0 _unpackvalue _unpackValue�s 40 _defaultvalueplaceholder _defaultValuePlaceholder�r *0 _formatdefaultvalue _formatDefaultValue�q (0 _buildoptionstable _buildOptionsTable�p 0 _parseoptions _parseOptions�o (0 _adddefaultoptions _addDefaultOptions�n "0 _parsearguments _parseArguments�m  0 _formatoptions _formatOptions�l $0 _formatarguments _formatArguments
�k .Fil:Argvnull���     ****
�j .Fil:FHlpnull��� ��� null
�i .Fil:CurFnull��� ��� null
�h .Fil:EnVanull��� ��� null
�g .Fil:RSInnull��� ��� null
�f .Fil:WSOunull���     ctxt� �e��e �  ��� �d��c
�d 
cobj� ��   �b 
�b 
frmk�c  � �a��`
�a 
cobj� ��   �_
�_ 
osax�`  � ��   �^ +
�^ 
scpt� �] 5�\�[���Z�] 
0 _error  �\ �Y��Y �  �X�W�V�U�T�X 0 handlername handlerName�W 0 etext eText�V 0 enumber eNumber�U 0 efrom eFrom�T 
0 eto eTo�[  � �S�R�Q�P�O�S 0 handlername handlerName�R 0 etext eText�Q 0 enumber eNumber�P 0 efrom eFrom�O 
0 eto eTo�  E�N�M�N �M &0 throwcommanderror throwCommandError�Z b  ࠡ����+ � �L b  ��L (0 _nsstringencodings _NSStringEncodings�  ���� �K�J�K 
0 _list_  �J 0 getencoding getEncoding� �I��I �  ���������������������� �H��H �  �G�F
�G FEncFE01�F � �E��E �  �D�C
�D FEncFE02�C 
� �B �B    �A �
�A FEncFE03� �@�@   �? �
�? FEncFE04� �>�>   �= �
�= FEncFE05� �<�<   �; �
�; FEncFE06� �:�:   �9 �
�9 FEncFE07� �8�8   �7�6
�7 FEncFE11�6 � �5�5   �4�3
�4 FEncFE12�3 � �2�2   �1�0
�1 FEncFE13�0 � �/�/   �.�-
�. FEncFE14�- 	� �,	�, 	  �+�*
�+ FEncFE15�* � �)
�) 
  �(�'
�( FEncFE16�' � �&�&   �%�$
�% FEncFE17�$ � �#�#   �"�!
�" FEncFE18�! � � �    ��
� FEncFE19� � ��   ��
� FEncFE50� � ��   ��
� FEncFE51� � ��   ��
� FEncFE52� � ��   ��
� FEncFE53� � ��   ��
� FEncFE54� � ����� 0 getencoding getEncoding� �
�
   �	�	 0 textencoding textEncoding�   ��� 0 textencoding textEncoding� 0 aref aRef ������� ����������E
� 
enum� 
0 _list_  
� 
kocl
� 
cobj
� .corecnte****       ****�   ������
�� 
errn���\��  
�  
long
�� 
errn���Y
�� 
erob
�� 
errt�� � W 5��&E�O ))�,[��l kh ��k/�  ��l/EY h[OY��W X   	��&W X  hO)�������� ��Z������
�� .Fil:Readnull���     file�� 0 thefile theFile�� ��
�� 
Type {�������� 0 datatype dataType��  
�� 
ctxt ����
�� 
Enco {�������� 0 textencoding textEncoding��  
�� FEncFE01��   �������������������������� 0 thefile theFile�� 0 datatype dataType�� 0 textencoding textEncoding�� 0 	posixpath 	posixPath�� 0 
asocstring 
asocString�� 0 theerror theError�� 0 fh  �� 0 	theresult 	theResult�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo  t����������������������������������������������������������� ,0 asposixpathparameter asPOSIXPathParameter�� "0 astypeparameter asTypeParameter
�� 
ctxt
�� FEncFEPE
�� 
bool�� 0 getencoding getEncoding
�� misccura�� 0 nsstring NSString
�� 
obj �� T0 (stringwithcontentsoffile_encoding_error_ (stringWithContentsOfFile_encoding_error_
�� 
cobj
�� 
msng
�� 
errn�� 0 code  
�� 
erob
�� 
errt�� �� ,0 localizeddescription localizedDescription
�� 
psxf
�� .rdwropenshor       file
�� 
as  
�� .rdwrread****        ****
�� .rdwrclosnull���     ****�� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ���
�� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  ��  ��  �� �� 
0 _error  �� � �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& Ub  �k+ E�O��,���m+ E[�k/E�Z[�l/E�ZO��  )�j+ a �a �a �j+ �&Y hO��&Y O�a &j E�O �a �l E�O�j O�W )X   
�j W X  hO)�a �a �a �W X  *a ����a + � ��� �
� .Fil:Writnull���     file� 0 thefile theFile� ��!
� 
Data� 0 thedata theData! �"#
� 
Type" {���� 0 datatype dataType�  
� 
ctxt# �$�
� 
Enco$ {���� 0 textencoding textEncoding�  
� FEncFE01�   �������������� 0 thefile theFile� 0 thedata theData� 0 datatype dataType� 0 textencoding textEncoding� 0 	posixpath 	posixPath� 0 
asocstring 
asocString� 0 
didsucceed 
didSucceed� 0 theerror theError� 0 fh  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo  '-�9������U�����������������������%�����~� ,0 asposixpathparameter asPOSIXPathParameter� "0 astypeparameter asTypeParameter
� 
ctxt
� FEncFEPE
� 
bool
� misccura� 0 nsstring NSString� "0 astextparameter asTextParameter� &0 stringwithstring_ stringWithString_� 0 getencoding getEncoding
� 
obj � � P0 &writetofile_atomically_encoding_error_ &writeToFile_atomically_encoding_error_
� 
cobj
� 
errn� 0 code  
� 
erob
� 
errt� � ,0 localizeddescription localizedDescription
� 
psxf
� 
perm
� .rdwropenshor       file
� 
set2
� .rdwrseofnull���     ****
� 
refn
� 
as  
� .rdwrwritnull���     ****
� .rdwrclosnull���     ****� 0 etext eText% �}�|&
�} 
errn�| 0 enumber eNumber& �{�z'
�{ 
erob�z 0 efrom eFrom' �y�x�w
�y 
errt�x 
0 eto eTo�w  �  �  � �~ 
0 _error  �
 �b  ��l+ E�Ob  ��l+ E�O�� 	 ���& i��,b  ��l+ 
k+ E�Ob  �k+ E�O��e���+ E[a k/E�Z[a l/E�ZO� !)a �j+ a �a �a �j+ �&Y hY a�a &a el E�O %�a jl O�a �a �� O�j OhW +X   ! 
�j W X " #hO)a �a �a �a �W X   !*a $����a %+ &� �v��u�t()�s
�v .Fil:ConPnull���     ****�u 0 filepath filePath�t �r*+
�r 
From* {�q�p�o�q 0 
fromformat 
fromFormat�p  
�o FLCTFLCP+ �n,�m
�n 
To__, {�l�k�j�l 0 toformat toFormat�k  
�j FLCTFLCP�m  ( 	�i�h�g�f�e�d�c�b�a�i 0 filepath filePath�h 0 
fromformat 
fromFormat�g 0 toformat toFormat�f 0 	posixpath 	posixPath�e 0 asocurl asocURL�d 0 etext eText�c 0 enumber eNumber�b 0 efrom eFrom�a 
0 eto eTo) -�`�_�^�]�\�[�Z�Y�X<�W�V�U�T�S�R�Q�P�O�N�M[�L�K�Jb�I|�H�G�F�E�D�C��B��A��@-�?�>
�` 
kocl
�_ 
ctxt
�^ .corecnte****       ****�] ,0 asposixpathparameter asPOSIXPathParameter
�\ FLCTFLCP
�[ FLCTFLCH
�Z 
file
�Y 
psxp
�X FLCTFLCW
�W FLCTFLCU
�V misccura�U 0 nsurl NSURL�T  0 urlwithstring_ URLWithString_
�S 
msng�R 0 fileurl fileURL
�Q 
bool
�P 
errn�O�Y
�N 
erob�M 
�L 
errt
�K 
enum�J 
�I 
leng
�H FLCTFLCA
�G 
psxf
�F 
alis
�E FLCTFLCX
�D FLCTFLCS
�C 
ascr�B $0 fileurlwithpath_ fileURLWithPath_�A  0 absolutestring absoluteString�@ 0 etext eText- �=�<.
�= 
errn�< 0 enumber eNumber. �;�:/
�; 
erob�: 0 efrom eFrom/ �9�8�7
�9 
errt�8 
0 eto eTo�7  �? �> 
0 _error  �s���kv��l j  b  ��l+ E�Y ���  �E�Y u��  *�/�,E�Y d��  	)j�Y W��  9��,�k+ E�O�� 
 �j+ a & )a a a �a a Y hY )a a a �a a a a O�a ,j  )a a a �a a Y hO��  �Y ��a   �a &a &Y ��a    �a &Y ��a !  _ "�a &�&/Y u��  �a &�&Y d��  )ja #Y U��  7��,�k+ $E�O��  )a a a �a a %�%Y hO�j+ &�&Y )a a a �a a a a 'W X ( )*a *����a ++ ,� �6!�5�401�3
�6 .Fil:NorPnull���     ****�5 0 filepath filePath�4 �22�1
�2 
ExpR2 {�0�/�.�0 0 isexpanding isExpanding�/  
�. boovfals�1  0 �-�,�+�*�)�- 0 filepath filePath�, 0 isexpanding isExpanding�+ 0 etext eText�* 0 enumber eNumber�) 
0 eto eTo1 6�(A�'�&�%�$�#�"�!� �3`���( ,0 asposixpathparameter asPOSIXPathParameter
�' 
bool
�& .Fil:CurFnull��� ��� null
�% .Fil:JoiPnull���     ****
�$ misccura�# 0 nsstring NSString�" &0 stringwithstring_ stringWithString_�! 60 stringbystandardizingpath stringByStandardizingPath
�  
ctxt� 0 etext eText3 ��4
� 
errn� 0 enumber eNumber4 ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �3 S Bb  ��l+ E�O�	 ���& *j �lvj E�Y hO��,�k+ j+ 	�&W X  *������+ � �p��56�
� .Fil:JoiPnull���     ****�  0 pathcomponents pathComponents� �7�
� 
Exte7 {��w� 0 fileextension fileExtension�  �  5 	������
�	���  0 pathcomponents pathComponents� 0 fileextension fileExtension� 0 subpaths subPaths� 0 aref aRef� 0 asocpath asocPath�
 0 etext eText�	 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo6 ��������� �������������������������������8������ "0 aslistparameter asListParameter
� 
cobj
� 
kocl
� .corecnte****       ****
� 
pcnt� ,0 asposixpathparameter asPOSIXPathParameter�   ��  
�� 
errn���Y
�� 
erob�� 
�� misccura�� 0 nsstring NSString�� *0 pathwithcomponents_ pathWithComponents_�� "0 astextparameter asTextParameter
�� 
leng�� B0 stringbyappendingpathextension_ stringByAppendingPathExtension_
�� 
msng
�� 
ctxt�� 0 etext eText8 ����9
�� 
errn�� 0 enumber eNumber9 ����:
�� 
erob�� 0 efrom eFrom: ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � � �b  ��l+ �-E�O ;�jv  	)jhY hO %�[��l kh b  ��,�l+ ��,F[OY��W X  	)�����O�a ,�k+ E�Ob  �a l+ E�O�a ,j $��k+ E�O�a   )����a Y hY hO�a &W X  *a ����a + � ������;<��
�� .Fil:SplPnull���     ctxt�� 0 filepath filePath�� ��=��
�� 
Upon= {�������� 0 splitposition splitPosition��  
�� FLSPFLSL��  ; ������������������ 0 filepath filePath�� 0 splitposition splitPosition�� 0 asocpath asocPath�� 0 matchformat matchFormat�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo< ����������������������������������������[��>l����
�� misccura�� 0 nsstring NSString�� ,0 asposixpathparameter asPOSIXPathParameter�� &0 stringwithstring_ stringWithString_
�� FLSPFLSL�� F0 !stringbydeletinglastpathcomponent !stringByDeletingLastPathComponent
�� 
ctxt�� &0 lastpathcomponent lastPathComponent
�� FLSPFLSE�� >0 stringbydeletingpathextension stringByDeletingPathExtension�� 0 pathextension pathExtension
�� FLSPFLSA��  0 pathcomponents pathComponents
�� 
list
�� 
errn���Y
�� 
erob
�� 
errt
�� 
enum�� �� 0 etext eText> ���?
�� 
errn� 0 enumber eNumber? ��@
� 
erob� 0 efrom eFrom@ ���
� 
errt� 
0 eto eTo�  �� �� 
0 _error  �� � u��,b  ��l+ k+ E�O��  �j+ �&�j+ �&lvY C��  �j+ 
�&�j+ �&lvY )��  �j+ �&Y )�a a �a a a a W X  *a ����a + �'� ��  A� 0 novalue NoValueA  BB  � �CC  
 
� ����DE�� 0 vt100 VT100� �F� F  �� 0 
formatcode 
formatCode�  D �� 0 
formatcode 
formatCodeE �����
� 
cha � 
� kfrmID  � )���0�%�%�%� ����GH�� 0 _unpackvalue _unpackValue� �I� I  ��� 0 thevalue theValue� $0 definitionrecord definitionRecord�  G �������� 0 thevalue theValue� $0 definitionrecord definitionRecord� 0 	valuetype 	valueType� 0 	theresult 	theResult� 0 asocformatter asocFormatter� 0 
asocresult 
asocResult� 0 basepath basePathH 6������������������5�P�����y���������J�������� ��~�}�|� 0 	valuetype 	valueType
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
� misccura� &0 nsnumberformatter NSNumberFormatter� 	0 alloc  � 0 init  � D0  nsnumberformatterscientificstyle  NSNumberFormatterScientificStyle� "0 setnumberstyle_ setNumberStyle_� 0 nslocale NSLocale� 0 systemlocale systemLocale� 0 
setlocale_ 
setLocale_� &0 numberfromstring_ numberFromString_
� 
msng
� 
errn
� 
****
� 
furl
� 
alis
� 
file
� 
psxf� � 0 nsfilemanager NSFileManager�  0 defaultmanager defaultManager� ,0 currentdirectorypath currentDirectoryPath� 0 nsstring NSString� *0 pathwithcomponents_ pathWithComponents_� &0 stringwithstring_ stringWithString_� 60 stringbystandardizingpath stringByStandardizingPath�  J �{�z�y
�{ 
errn�z���y  
� 
bool��Y
�~ 
erob
�} 
errt�| �¡�,�&E�O��  �E�Y����mv�kv ���,j+ j+ 	E�O���,k+ O���,j+ k+ O��k+ E�O�a   )a b  
la �%Y hO�a &E�O��  '�k#j )a b  
la �%Y hO��&E�Y hYa a a a a v�kv ��a  A�a ,j+ j+ E�O�a   )a b  
la �%Y hO�a ,��lvk+  E�Y hO�a ,�k+ !j+ "�&a &E�O �a   �a &E�Y hW X # $)a b  
la %�%Y v�a &  Uga ' Ka (a )a *a +a v�kv eY .a ,a -a .a /a v�kv fY )a b  
la 0�%VY )a a 1a 2��,a 3�a 4a 5O�� �x+�w�vKL�u�x 40 _defaultvalueplaceholder _defaultValuePlaceholder�w �tM�t M  �s�s $0 definitionrecord definitionRecord�v  K �r�q�r $0 definitionrecord definitionRecord�q 0 	valuetype 	valueTypeL �p�o�nG�m�l�k]`�j�i�h�g�fs�e{�d�c�b�a�`�p 0 	valuetype 	valueType
�o 
type
�n 
ctxt
�m 
long
�l 
doub
�k 
nmbr
�j 
furl
�i 
alis
�h 
file
�g 
psxf�f 
�e 
bool
�d 
errn�c�Y
�b 
erob
�a 
errt�` �u h��,�&E�O��  �Y V���mv�kv ��  �Y �Y :�����v�kv �Y (��  	a Y )a a a ��,a �a a � �_��^�]NO�\�_ *0 _formatdefaultvalue _formatDefaultValue�^ �[P�[ P  �Z�Z $0 definitionrecord definitionRecord�]  N �Y�X�W�V�Y $0 definitionrecord definitionRecord�X 0 defaultvalue defaultValue�W 0 defaulttext defaultText�V 0 asocformatter asocFormatterO �U�T�S�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>'03;=�U 0 defaultvalue defaultValue
�T 
kocl
�S 
list
�R .corecnte****       ****
�Q 
leng
�P 
bool
�O 
cobj
�N 
ctxt
�M 
long
�L 
doub
�K misccura�J &0 nsnumberformatter NSNumberFormatter�I 	0 alloc  �H 0 init  �G >0 nsnumberformatterdecimalstyle NSNumberFormatterDecimalStyle�F "0 setnumberstyle_ setNumberStyle_�E 0 nslocale NSLocale�D 0 systemlocale systemLocale�C 0 
setlocale_ 
setLocale_�B &0 stringfromnumber_ stringFromNumber_
�A 
****
�@ 
furl
�? 
alis
�> 
psxp�\ ��,E�O�kv��l j	 	��,k �& ��k/E�Y hO�kv��l j �E�Y ��kv��l j
 �kv��l j�& 7��,j+ j+ E�O���,k+ O��a ,j+ k+ O��k+ a &E�Y N�kv�a l j
 �kv�a l j�& �a ,E�Y "�e  
a E�Y �f  
a E�Y a Oa �%a %� �=Q�<�;QR�:�= (0 _buildoptionstable _buildOptionsTable�< �9S�9 S  �8�8 &0 optiondefinitions optionDefinitions�;  Q 
�7�6�5�4�3�2�1�0�/�.�7 &0 optiondefinitions optionDefinitions�6 0 
foundnames 
foundNames�5 20 optiondefinitionsbyname optionDefinitionsByName�4 0 	optionref 	optionRef�3 $0 optiondefinition optionDefinition�2 0 propertyname propertyName�1 0 	namecount 	nameCount�0 0 aref aRef�/ 0 thename theName�. 0 
nameprefix 
namePrefixR (�-�,�+�*�)�(�'�&�%|�$��#��"�!� ������T�����	)	2����		�	�	=
�- misccura�, *0 nsmutabledictionary NSMutableDictionary�+ 0 
dictionary  
�* 
kocl
�) 
cobj
�( .corecnte****       ****
�' 
pcnt
�& 
reco�% 0 	shortname 	shortName�$ 0 longname longName�# 0 propertyname propertyName�" 0 	valuetype 	valueType
�! 
ctxt�  0 islist isList� 0 defaultvalue defaultValue� 
� 
errn��\�  T ���
� 
errn��\�  ��Y
� 
erob� 
� 
leng
� 
bool� &0 setobject_forkey_ setObject_forKey_�:�jvE�O��,j+ E�Oo�[��l kh ��,�&��������a fa fa %E�O %��,�&E�O��,a   )a a lhY hW X  )a a a �a a O�a ,E�O ֤�,a lv��,a lvlv[��l kh �E[�k/E�Z[�l/E�ZO 
��&E�W X  )a a a �a a O�a   v��kv )a a a �a a !Y hO��6FOga " >�a ,k  2�a ,k
 a #�a $& )a a a �a a %Y hY hVO����%l+ &Y h[OY�IO�a ,�  )a a a �a a 'Y h[OY��O�� �	K��UV�� 0 _parseoptions _parseOptions� �W� W  ���
� 0 rawarguments rawArguments� &0 optiondefinitions optionDefinitions�
 &0 hasdefaultoptions hasDefaultOptions�  U �	��������� �������	 0 rawarguments rawArguments� &0 optiondefinitions optionDefinitions� &0 hasdefaultoptions hasDefaultOptions� 20 optiondefinitionsbyname optionDefinitionsByName� (0 asocparametersdict asocParametersDict� 0 thearg theArg� 0 
optionname 
optionName� $0 optiondefinition optionDefinition� 0 ishelp isHelp�  0 	isversion 	isVersion�� 0 propertyname propertyName�� 0 thevalue theValue�� 0 thelist theListV 4��������	r������	�	�����������	�	�	���������������
4
r
u

���
���
���
���������������
�
�����������A���� (0 _buildoptionstable _buildOptionsTable
�� misccura�� *0 nsmutabledictionary NSMutableDictionary�� 0 
dictionary  
�� 
ascr
�� 
txdl
�� 
cobj
�� 
rest
�� 
citm
�� 
kocl
�� .corecnte****       ****
�� 
ctxt
�� 
cha 
�� 
bool
�� 
leng�� 0 objectforkey_ objectForKey_
�� 
msng
�� 
****�� 0 	valuetype 	valueType�� $0 removeallobjects removeAllObjects�� $0 setvalue_forkey_ setValue_forKey_
�� 
errn�� 0 propertyname propertyName�� 0 defaultvalue defaultValue��  ��  ���\
�� 
erob�� �� 0 _unpackvalue _unpackValue�� 0 islist isList��  0 nsmutablearray NSMutableArray�� $0 arraywithobject_ arrayWithObject_�� 0 
addobject_ 
addObject_�� &0 setobject_forkey_ setObject_forKey_�o*�k+  E�O��,j+ E�O���,FONh�jv ��k/E�O�� C��  ��,E�OY hO��k/E�O���l k �[�\[�l/\Zi2��k/FY ��,E�Y ��� ��a  
 a �a l/a & Y hO�[�\[Zk\Zl2E�O�a ,l L�[�\[Zm\Zi2��k/FO��k+ E�O�a 	 �a &a ,a  a & a ��k/%��k/FY hY ��,E�Y O��k+ E�O�a   x� _a a lv�kva a lv�kvlvE[�k/E�Z[�l/E�ZO�
 �a & %�j+ O��a l+  O��a !l+  OjvE�OY hY hO)a "b  
la #�%Y hO�a &E�O�a $,E�O�a ,a   1 �a %,E�W  X & ')a "a (a )�a %,a *a +�%Y 0�jv  )a "b  
la ,�%Y hO*��k/�l+ -E�O��,E�O�a .,E /��k+ E�O�a   �a /,�k+ 0E�Y ��k+ 1O�E�Y #��k+ a  )a "b  
la 2�%Y hO���l+ 3[OY��O��lv� ��Z����XY���� (0 _adddefaultoptions _addDefaultOptions�� ��Z�� Z  ������ (0 asocparametersdict asocParametersDict�� &0 optiondefinitions optionDefinitions��  X ������������������ (0 asocparametersdict asocParametersDict�� &0 optiondefinitions optionDefinitions�� 0 recref recRef�� 0 rec  �� 0 propertyname propertyName�� 0 thevalue theValue�� 0 
optionname 
optionName�� 0 aref aRefY ����������q��u����������������������
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
reco�� 0 propertyname propertyName�� 0 longname longName�� 0 defaultvalue defaultValue�� �� 0 objectforkey_ objectForKey_
�� 
msng�� 0 	shortname 	shortName
� 
errn
� misccura� 0 nsnull NSNull� 0 null  � &0 setobject_forkey_ setObject_forKey_�� � ��[��l kh ��&�����b  �%E�O��,E�O��  
��,E�Y hO��k+ �  e��,E�O�b    1���,%E�O��  �a ,%E�Y hO)a b  
la �%Y hO��  a a ,j+ E�Y hO���l+ Y h[OY�bO 1a a lv[��l kh ��k+ �  �f�l+ Y h[OY��� ���[\�� "0 _parsearguments _parseArguments� �]� ]  ���� 0 argumentslist argumentsList� *0 argumentdefinitions argumentDefinitions� (0 asocparametersdict asocParametersDict�  [ 	���������� 0 argumentslist argumentsList� *0 argumentdefinitions argumentDefinitions� (0 asocparametersdict asocParametersDict� 0 i  � 0 argcount argCount� 0 argref argRef� (0 argumentdefinition argumentDefinition� 0 thevalue theValue� 0 aref aRef\ �������8�����G����Koq�������
� 
leng
� 
kocl
� 
cobj
� .corecnte****       ****
� 
pcnt
� 
reco� 0 propertyname propertyName� 0 	valuetype 	valueType
� 
ctxt� 0 islist isList� 0 defaultvalue defaultValue� 
� 
errn��Y
� 
erob� � 0 _unpackvalue _unpackValue
� 
rest� &0 setobject_forkey_ setObject_forKey_�jE�O��,E�O ��[��l kh �kE�O��,�&�����f�b  �%E�O��,�  )��a �a a Y hO�jv  +��,E�O�b    )�b  
la �%a %Y hY *��k/�l+ E�O�a ,E�O��,E L���, )��a �a a Y hO�kvE�O  �[��l kh *��,�l+ �6F[OY��OjvE�Y hO����,l+ [OY�!O�jv )�b  
la ��,%a %�%a %Y h� ����^_��  0 _formatoptions _formatOptions� �`� `  ����� &0 optiondefinitions optionDefinitions� 0 vtstyle vtStyle�� &0 hasdefaultoptions hasDefaultOptions�  ^ ��������������������������������~�}�� &0 optiondefinitions optionDefinitions�� 0 vtstyle vtStyle�� &0 hasdefaultoptions hasDefaultOptions��  0 defaultoptions defaultOptions��  0 booleanoptions booleanOptions�� 0 otheroptions otherOptions��  0 optionssection optionsSection�� 0 	optionref 	optionRef�� $0 optiondefinition optionDefinition�� 0 	shortname 	shortName�� 0 longname longName�� 0 	valuetype 	valueType�� 0 islist isList�� $0 valueplaceholder valuePlaceholder�� $0 valuedescription valueDescription� 0 
optionname 
optionName�~ 0 
isoptional 
isOptional�} "0 optionssynopsis optionsSynopsis_ D� �|�{�z�y�x�w�v.�u2�t�s�r�q�p<�o?�n�m�l�ka���j�i���h�g�f������e��d�c1�bPW�at}��������������
�| 
cobj�{ 0 b  �z 0 n  
�y 
kocl
�x .corecnte****       ****
�w 
reco�v 0 	shortname 	shortName�u 0 longname longName�t 0 	valuetype 	valueType
�s 
ctxt�r 0 islist isList�q 0 defaultvalue defaultValue�p $0 valueplaceholder valuePlaceholder�o $0 valuedescription valueDescription�n 
�m 
type
�l 
bool�k  a �`�_�^
�` 
errn�_�\�^  �j �i 60 throwinvalidparametertype throwInvalidParameterType
�h 
errn�g�Y
�f 
erob
�e 
spac�d 40 _defaultvalueplaceholder _defaultValuePlaceholder�c 0 u  �b *0 _formatdefaultvalue _formatDefaultValue
�a 
lnfd�����mvE[�k/E�Z[�l/E�Z[�m/E�ZO��,�%��,%E�Oݠ[��l kh ��&������a fa b  a a a a a %E�O >��,�&E�O��,�&E�O��,a &E�O�a ,a &E�O�a ,�&E�O�a ,�&E�W X  b  �a a �a + O�b  %b  %E�O�a   1�a    )a !a "a #�a a $Y hO�E�O�a %%�%E�Y %�E�O�a &%�%E�O�a ' �a (%�%E�Y hO�a   
��%E�Y ��a ,b  E^ O�_ )%E�O]  �a *%E�Y hO�a +%�%E�O�E�O�a ,  *�k+ -E�Y hO�a .,�%��,%E�O�_ )%�%E�O]  �a /%E�Y hO�_ )%�%E�O�a ,b   �*�k+ 0%E�Y hO� �a 1%E�Y hO�a 2 �_ 3%b  %�%_ )%E�Y h[OY�1O� r�a 4 .a 5�%E�O�b  %b  %a 6%_ 3%b  %a 7%E�Y hO�a 8 .�a 9%E�O�b  %b  %a :%_ 3%b  %a ;%E�Y hY hOa <E^ O�a = ] a >%�%a ?%E^ Y hO�a @ ] a A%�%a B%E^ Y hO�a C ] �%E^ Y hO] �lv� �]��\�[bc�Z�] $0 _formatarguments _formatArguments�\ �Yd�Y d  �X�W�X *0 argumentdefinitions argumentDefinitions�W 0 vtstyle vtStyle�[  b 
�V�U�T�S�R�Q�P�O�N�M�V *0 argumentdefinitions argumentDefinitions�U 0 vtstyle vtStyle�T &0 argumentssynopsis argumentsSynopsis�S $0 argumentssection argumentsSection�R 0 argumentref argumentRef�Q (0 argumentdefinition argumentDefinition�P 0 	valuetype 	valueType�O 0 islist isList�N $0 valueplaceholder valuePlaceholder�M $0 valuedescription valueDescriptionc &�L"�K�J�I�H�G�F�E�D�C�B=�A@�@�?�>�=equ�<�;~�:��9�8��7���6��L 0 b  �K 0 n  
�J 
kocl
�I 
cobj
�H .corecnte****       ****
�G 
reco�F 0 	valuetype 	valueType
�E 
ctxt�D 0 islist isList�C 0 defaultvalue defaultValue�B $0 valueplaceholder valuePlaceholder�A $0 valuedescription valueDescription�@ 

�? 
type
�> 
bool�=  e �5�4�3
�5 
errn�4�\�3  �< �; 60 throwinvalidparametertype throwInvalidParameterType�: 40 _defaultvalueplaceholder _defaultValuePlaceholder�9 0 u  �8 *0 _formatdefaultvalue _formatDefaultValue
�7 
lnfd
�6 
spac�Z?�jv  
��lvY hO�E�O��,�%��,%E�O�[��l kh ��&���f�b  ��a a a %E�O *��,a &E�O��,a &E�O��,�&E�O�a ,�&E�W X  b  �a a �a + O�a   *�k+ E�Y hO� �a %E�Y hO�b  %b  %�a ,%�%��,%E�O��,b   �*�k+ %E�Y hO�a   �_ !%b  %�%E�Y hO��,b   a "�%a #%E�Y hO�_ $%�%E�[OY��Oa %�%�lv� �2��1�0fg�/
�2 .Fil:Argvnull���     ****�1 0 argv  �0 �.hi
�. 
OpsDh {�-�,�+�- &0 optiondefinitions optionDefinitions�,  �+  i �*jk
�* 
OpsAj {�)�(l�) *0 argumentdefinitions argumentDefinitions�(  l �'m�' m  nn �& o�& 0 propertyname propertyNameo �%�$�#�% 0 islist isList
�$ boovtrue�#  k �"p�!
�" 
DefOp {� ���  &0 hasdefaultoptions hasDefaultOptions�  
� boovtrue�!  f ������������ 0 argv  � &0 optiondefinitions optionDefinitions� *0 argumentdefinitions argumentDefinitions� &0 hasdefaultoptions hasDefaultOptions� 0 oldtids oldTIDs� (0 asocparametersdict asocParametersDict� 0 argumentslist argumentsList� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTog ���������
q�	������
� 
ascr
� 
txdl� "0 aslistparameter asListParameter
� 
cobj� 0 _parseoptions _parseOptions� (0 _adddefaultoptions _addDefaultOptions� "0 _parsearguments _parseArguments
� 
****�
 0 etext eTextq ��r
� 
errn� 0 enumber eNumberr �� s
� 
erob�  0 efrom eFroms ������
�� 
errt�� 
0 eto eTo��  
�	 
errn
� 
erob
� 
errt� � � 
0 _error  �/ ��� ���,E�O ab  �k+ E�Ob  �k+ E�Ob  �k+ E�O*��-��m+ E[�k/E�Z[�l/E�ZO*��l+ O*���m+ O���,FO��&W 2X 
 ���,FO�b  
  )�����Y *a ����a + V� �������tu��
�� .Fil:FHlpnull��� ��� null��  �� ��vw
�� 
Namev {������� 0 commandname commandName��  w ��xy
�� 
Summx {������� $0 shortdescription shortDescription��  y ��z{
�� 
Usagz {�������� "0 commandsynopses commandSynopses��  ��  { ��|}
�� 
OpsD| {�������� &0 optiondefinitions optionDefinitions��  ��  } ��~
�� 
OpsA~ {������� *0 argumentdefinitions argumentDefinitions��  � ����� �  �� ������ 0 propertyname propertyName� �������� 0 islist isList
�� boovtrue��   ����
�� 
Docu� {������� "0 longdescription longDescription��  � ����
�� 
VFmt� {�������� 0 isstyled isStyled��  
�� boovtrue� �����
�� 
DefO� {�������� &0 hasdefaultoptions hasDefaultOptions��  
�� boovtrue��  t ���������������������������������������� 0 commandname commandName�� $0 shortdescription shortDescription�� "0 commandsynopses commandSynopses�� &0 optiondefinitions optionDefinitions�� *0 argumentdefinitions argumentDefinitions�� "0 longdescription longDescription�� 0 isstyled isStyled�� &0 hasdefaultoptions hasDefaultOptions�� 0 vtstyle vtStyle�� 0 helptext helpText�� 00 defaultoptionssynopsis defaultOptionsSynopsis��  0 optionssection optionsSection�� 40 defaultargumentssynopsis defaultArgumentsSynopsis�� $0 argumentssection argumentsSection�� 0 textref textRef�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTou /������+7D���������]adq����������������
��$6���H���� "0 astextparameter asTextParameter�� "0 aslistparameter asListParameter�� (0 asbooleanparameter asBooleanParameter�� 0 n  � 0 vt100 VT100� 0 b  � 0 u  � � 
� .Fil:EnVanull��� ��� null� 0 _  
� .Fil:SplPnull���     ctxt�  �  �  0 _formatoptions _formatOptions
� 
cobj� $0 _formatarguments _formatArguments
� 
kocl
� .corecnte****       ****� ���
� 
errn��\�  
� 
list� 60 throwinvalidparametertype throwInvalidParameterType
� 
lnfd� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �������b  ��l+ E�Ob  �k+ E�Ob  �k+ E�Ob  �k+ E�Ob  ��l+ E�Ob  ��l+ E�Ob  ��l+  �*jk+ 
�*kk+ 
�*�k+ 
�E�Y ���a �a �E�O�a   $ *j a ,j E�W X  a E�Y hO��,a %��,%b  %b  %�%E�O�a  �a %�%E�Y hO*���m+ E[a k/E�Z[a l/E�ZO*��l+ E[a k/E�Z[a l/E�ZO�b  %��,%a %��,%E�O�jv  ��%�%kvE�Y hO / )�[a  a l !kh �b  %b  %�%E�[OY��W X  "b  �a #a $a %�+ &O�b  %�%b  %�%E�O�a ' "�b  %��,%a (%��,%b  %�%E�Y hO�_ )%W X * +*a ,�] ] ] a -+ .V� �^�����
� .Fil:CurFnull��� ��� null�  �  � ������ 0 asocpath asocPath� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �������u�������
� misccura� 0 nsfilemanager NSFileManager�  0 defaultmanager defaultManager� ,0 currentdirectorypath currentDirectoryPath
� 
msng
� 
errn��@
� 
ctxt
� 
psxf� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � ; *��,j+ j+ E�O��  )��l�Y hO��&�&W X 
 *졢���+ � �������
� .Fil:EnVanull��� ��� null�  �  �  � ���~�}�|
� misccura� 0 nsprocessinfo NSProcessInfo�~ 0 processinfo processInfo�} 0 environment  
�| 
****� ��,j+ j+ �&� �{��z�y���x
�{ .Fil:RSInnull��� ��� null�z  �y �w��
�w 
Prmt� {�v�u��v 0 
prompttext 
promptText�u  � �t��s
�t 
ReTo� {�r�q�p�r 0 isinteractive isInteractive�q  
�p boovfals�s  � 	�o�n�m�l�k�j�i�h�g�o 0 
prompttext 
promptText�n 0 isinteractive isInteractive�m 0 	asocstdin 	asocStdin�l 0 asocdata asocData�k 0 
asocstring 
asocString�j 0 etext eText�i 0 enumber eNumber�h 0 efrom eFrom�g 
0 eto eTo� �f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V��U�T�S�R�Q��P�O
�f misccura�e 0 nsfilehandle NSFileHandle�d :0 filehandlewithstandardinput fileHandleWithStandardInput
�c 
SLiB
�b 
ALiE�a 
�` .Fil:WSOunull���     ctxt�_ 0 availabledata availableData�^ 
0 length  
�] 
msng�\ *0 readdatatoendoffile readDataToEndOfFile�[ 0 nsstring NSString�Z 	0 alloc  �Y ,0 nsutf8stringencoding NSUTF8StringEncoding�X 00 initwithdata_encoding_ initWithData_encoding_
�W 
errn�V�\
�U 
lnfd�T 0 
hassuffix_ 
hasSuffix_�S &0 substringtoindex_ substringToIndex_
�R 
ctxt�Q 0 etext eText� �N�M�
�N 
errn�M 0 enumber eNumber� �L�K�
�L 
erob�K 0 efrom eFrom� �J�I�H
�J 
errt�I 
0 eto eTo�H  �P �O 
0 _error  �x � ���,j+ E�O� '��f�f� O�j+ E�O�j+ j  �Y hY 	�j+ 
E�O��,j+ ���,l+ E�O��  )�a la Y hO�_ k+  ��j+ kk+ E�Y hO�a &W X  *a ����a + � �G/�F�E���D
�G .Fil:WSOunull���     ctxt�F 0 thetext theText�E �C��
�C 
SLiB� {�B�A�@�B 0 uselinefeeds useLinefeeds�A  
�@ boovtrue� �?��>
�? 
ALiE� {�=�<�;�=  0 withlineending withLineEnding�<  
�; boovtrue�>  � 	�:�9�8�7�6�5�4�3�2�: 0 thetext theText�9 0 uselinefeeds useLinefeeds�8  0 withlineending withLineEnding�7 0 
asocstring 
asocString�6 0 
asocstdout 
asocStdout�5 0 etext eText�4 0 enumber eNumber�3 0 efrom eFrom�2 
0 eto eTo� M�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� �����1 "0 astextparameter asTextParameter�0 &0 asnsmutablestring asNSMutableString
�/ 
ret 
�. 
lnfd�- 0 location  �, 
0 length  �+ �* l0 4replaceoccurrencesofstring_withstring_options_range_ 4replaceOccurrencesOfString_withString_options_range_�) 0 
hassuffix_ 
hasSuffix_
�( 
bool�' 0 appendstring_ appendString_
�& misccura�% 0 nsfilehandle NSFileHandle�$ <0 filehandlewithstandardoutput fileHandleWithStandardOutput�# ,0 nsutf8stringencoding NSUTF8StringEncoding�" (0 datausingencoding_ dataUsingEncoding_�! 0 
writedata_ 
writeData_�  0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �D � �b  b  ��l+ k+ E�O� ,���%�j�j�j+ ��+ O���j�j�j+ ��+ Y hO�	 ��k+ 	�& ��k+ Y hO��,j+ E�O����,k+ k+ OhW X  *a ����a +  ascr  ��ޭ