FasdUAS 1.101.10   ��   ��    k             l      ��  ��   c] Text -- commonly-used text processing commands

Notes: 

- When matching text item delimiters in text value, AppleScript uses the current scope's existing considering/ignoring case, diacriticals, hyphens, punctuation, white space and numeric strings settings; thus, wrapping a `search text` command in different considering/ignoring blocks can produce different results. For example, `search text "fud" for "F" will normally match the first character since AppleScript uses case-insensitive matching by default, whereas enclosing it in a `considering case` block will cause the same command to return zero matches. Conversely, `search text "f ud" for "fu"` will normally return zero matches as AppleScript considers white space by default, but when enclosed in an `ignoring white space` block will match the first three characters: "f u". This is how AppleScript is designed to work, but users need to be reminded of this as considering/ignoring blocks affect ALL script handlers called within that block, including nested calls (and all to any osax and application handlers that understand considering/ignoring attributes).

- Unlike AS text values, which preserve original Unicode normalization but ignore differences in form when comparing and counting, NSString and NSRegularExpression don't ignore normalization differences when comparing for equality. Therefore, handlers such as `search text`, `split text`, etc. that perform comparison operations on/using these Cocoa classes must normalize their input and pattern text first. (Be aware that this means that these commands may output text that uses different normalization form to input text; this shouldn't affect AppleScript itself, but might be a consideration when using that text elsewhere, e.g. in text files or scriptable apps.)

- Useful summary of NSString and Unicode: https://www.objc.io/issues/9-strings/unicode/

     � 	 	�   T e x t   - -   c o m m o n l y - u s e d   t e x t   p r o c e s s i n g   c o m m a n d s 
 
 N o t e s :   
 
 -   W h e n   m a t c h i n g   t e x t   i t e m   d e l i m i t e r s   i n   t e x t   v a l u e ,   A p p l e S c r i p t   u s e s   t h e   c u r r e n t   s c o p e ' s   e x i s t i n g   c o n s i d e r i n g / i g n o r i n g   c a s e ,   d i a c r i t i c a l s ,   h y p h e n s ,   p u n c t u a t i o n ,   w h i t e   s p a c e   a n d   n u m e r i c   s t r i n g s   s e t t i n g s ;   t h u s ,   w r a p p i n g   a   ` s e a r c h   t e x t `   c o m m a n d   i n   d i f f e r e n t   c o n s i d e r i n g / i g n o r i n g   b l o c k s   c a n   p r o d u c e   d i f f e r e n t   r e s u l t s .   F o r   e x a m p l e ,   ` s e a r c h   t e x t   " f u d "   f o r   " F "   w i l l   n o r m a l l y   m a t c h   t h e   f i r s t   c h a r a c t e r   s i n c e   A p p l e S c r i p t   u s e s   c a s e - i n s e n s i t i v e   m a t c h i n g   b y   d e f a u l t ,   w h e r e a s   e n c l o s i n g   i t   i n   a   ` c o n s i d e r i n g   c a s e `   b l o c k   w i l l   c a u s e   t h e   s a m e   c o m m a n d   t o   r e t u r n   z e r o   m a t c h e s .   C o n v e r s e l y ,   ` s e a r c h   t e x t   " f   u d "   f o r   " f u " `   w i l l   n o r m a l l y   r e t u r n   z e r o   m a t c h e s   a s   A p p l e S c r i p t   c o n s i d e r s   w h i t e   s p a c e   b y   d e f a u l t ,   b u t   w h e n   e n c l o s e d   i n   a n   ` i g n o r i n g   w h i t e   s p a c e `   b l o c k   w i l l   m a t c h   t h e   f i r s t   t h r e e   c h a r a c t e r s :   " f   u " .   T h i s   i s   h o w   A p p l e S c r i p t   i s   d e s i g n e d   t o   w o r k ,   b u t   u s e r s   n e e d   t o   b e   r e m i n d e d   o f   t h i s   a s   c o n s i d e r i n g / i g n o r i n g   b l o c k s   a f f e c t   A L L   s c r i p t   h a n d l e r s   c a l l e d   w i t h i n   t h a t   b l o c k ,   i n c l u d i n g   n e s t e d   c a l l s   ( a n d   a l l   t o   a n y   o s a x   a n d   a p p l i c a t i o n   h a n d l e r s   t h a t   u n d e r s t a n d   c o n s i d e r i n g / i g n o r i n g   a t t r i b u t e s ) . 
 
 -   U n l i k e   A S   t e x t   v a l u e s ,   w h i c h   p r e s e r v e   o r i g i n a l   U n i c o d e   n o r m a l i z a t i o n   b u t   i g n o r e   d i f f e r e n c e s   i n   f o r m   w h e n   c o m p a r i n g   a n d   c o u n t i n g ,   N S S t r i n g   a n d   N S R e g u l a r E x p r e s s i o n   d o n ' t   i g n o r e   n o r m a l i z a t i o n   d i f f e r e n c e s   w h e n   c o m p a r i n g   f o r   e q u a l i t y .   T h e r e f o r e ,   h a n d l e r s   s u c h   a s   ` s e a r c h   t e x t ` ,   ` s p l i t   t e x t ` ,   e t c .   t h a t   p e r f o r m   c o m p a r i s o n   o p e r a t i o n s   o n / u s i n g   t h e s e   C o c o a   c l a s s e s   m u s t   n o r m a l i z e   t h e i r   i n p u t   a n d   p a t t e r n   t e x t   f i r s t .   ( B e   a w a r e   t h a t   t h i s   m e a n s   t h a t   t h e s e   c o m m a n d s   m a y   o u t p u t   t e x t   t h a t   u s e s   d i f f e r e n t   n o r m a l i z a t i o n   f o r m   t o   i n p u t   t e x t ;   t h i s   s h o u l d n ' t   a f f e c t   A p p l e S c r i p t   i t s e l f ,   b u t   m i g h t   b e   a   c o n s i d e r a t i o n   w h e n   u s i n g   t h a t   t e x t   e l s e w h e r e ,   e . g .   i n   t e x t   f i l e s   o r   s c r i p t a b l e   a p p s . ) 
 
 -   U s e f u l   s u m m a r y   o f   N S S t r i n g   a n d   U n i c o d e :   h t t p s : / / w w w . o b j c . i o / i s s u e s / 9 - s t r i n g s / u n i c o d e / 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      record types     �        r e c o r d   t y p e s   ! " ! l     ��������  ��  ��   "  # $ # j    �� %�� (0 _unmatchedtexttype _UnmatchedTextType % m    ��
�� 
TxtU $  & ' & j    �� (�� $0 _matchedtexttype _MatchedTextType ( m    ��
�� 
TxtM '  ) * ) j    �� +�� &0 _matchedgrouptype _MatchedGroupType + m    ��
�� 
TxtG *  , - , l     ��������  ��  ��   -  . / . l     ��������  ��  ��   /  0 1 0 l     �� 2 3��   2 J D--------------------------------------------------------------------    3 � 4 4 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 1  5 6 5 l     �� 7 8��   7   support    8 � 9 9    s u p p o r t 6  : ; : l     ��������  ��  ��   ;  < = < l      > ? @ > j     &�� A�� 0 _support   A N     % B B 4     $�� C
�� 
scpt C m   " # D D � E E  T y p e S u p p o r t ? "  used for parameter checking    @ � F F 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g =  G H G l     ��������  ��  ��   H  I J I l     ��������  ��  ��   J  K L K i  ' * M N M I      �� O���� 
0 _error   O  P Q P o      ���� 0 handlername handlerName Q  R S R o      ���� 0 etext eText S  T U T o      ���� 0 enumber eNumber U  V W V o      ���� 0 efrom eFrom W  X�� X o      ���� 
0 eto eTo��  ��   N n     Y Z Y I    �� [���� &0 throwcommanderror throwCommandError [  \ ] \ m     ^ ^ � _ _  T e x t ]  ` a ` o    ���� 0 handlername handlerName a  b c b o    ���� 0 etext eText c  d e d o    	���� 0 enumber eNumber e  f g f o   	 
���� 0 efrom eFrom g  h�� h o   
 ���� 
0 eto eTo��  ��   Z o     ���� 0 _support   L  i j i l     ��������  ��  ��   j  k l k l     ��������  ��  ��   l  m n m l     �� o p��   o J D--------------------------------------------------------------------    p � q q � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - n  r s r l     ��������  ��  ��   s  t u t i  + . v w v I      �� x���� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter x  y z y o      ���� 0 patterntext patternText z  {�� { o      ���� 0 parametername parameterName��  ��   w l     | } ~ | L        n     � � � I    �� ����� @0 asnsregularexpressionparameter asNSRegularExpressionParameter �  � � � o    ���� 0 patterntext patternText �  � � � l 	   ����� � l    ����� � [     � � � [     � � � [     � � � l   
 ����� � e    
 � � n   
 � � � o    	���� H0 "nsregularexpressioncaseinsensitive "NSRegularExpressionCaseInsensitive � m    ��
�� misccura��  ��   � l 	 
  ����� � l  
  ����� � e   
  � � n  
  � � � o    ���� L0 $nsregularexpressionanchorsmatchlines $NSRegularExpressionAnchorsMatchLines � m   
 ��
�� misccura��  ��  ��  ��   � l 	   ����� � l    ����� � e     � � n    � � � o    ���� Z0 +nsregularexpressiondotmatcheslineseparators +NSRegularExpressionDotMatchesLineSeparators � m    ��
�� misccura��  ��  ��  ��   � l 	   ����� � l    ����� � e     � � n    � � � o    ���� Z0 +nsregularexpressionuseunicodewordboundaries +NSRegularExpressionUseUnicodeWordBoundaries � m    ��
�� misccura��  ��  ��  ��  ��  ��  ��  ��   �  ��� � o    ���� 0 parametername parameterName��  ��   � o     ���� 0 _support   } H B returns a regexp object with `(?imsw)` options enabled by default    ~ � � � �   r e t u r n s   a   r e g e x p   o b j e c t   w i t h   ` ( ? i m s w ) `   o p t i o n s   e n a b l e d   b y   d e f a u l t u  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   / 1�� ��� 0 _tokens   � m   / 0 � � � � �" 
 \ \ 	 	 	 	 	 	 	 	 #   m a t c h   a   b a c k s l a s h   e s c a p e ,   f o l l o w e d   b y   o n e   o f : 
           ( ? : ( n | r | t | \ \ ) 	 	 	 #   n e w l i n e ,   r e t u r n ,   t a b   o r   b a c k s l a s h   c h a r a c t e r 
       |   (   [ 0 - 9 ]   ) 	 	 	 	 	 #   b a c k s l a s h   +   s i n g l e   d i g i t   ( i n s e r t i o n   i n d e x ) 
       |   \ {   ( [ ^ } { \ \ ] * )   \ } 	 	 #   b a c k s l a s h   +   a n y   t e x t   i n   b r a c e s   ( i n s e r t i o n   i n d e x   o r   n a m e ) 
 ) � � � note: \N{...}, \u1234, and \U00123456 escape sequences are processed separately (via ICU transforms); any other backslash sequences are unrecognized and left unchanged    � � � �P   n o t e :   \ N { . . . } ,   \ u 1 2 3 4 ,   a n d   \ U 0 0 1 2 3 4 5 6   e s c a p e   s e q u e n c e s   a r e   p r o c e s s e d   s e p a r a t e l y   ( v i a   I C U   t r a n s f o r m s ) ;   a n y   o t h e r   b a c k s l a s h   s e q u e n c e s   a r e   u n r e c o g n i z e d   a n d   l e f t   u n c h a n g e d �  � � � l     ��������  ��  ��   �  � � � i  2 5 � � � I      �� ����� (0 _parsetemplatetext _parseTemplateText �  ��� � o      ���� 0 templatetext templateText��  ��   � l   c � � � � k    c � �  � � � r     
 � � � n     � � � I    �� ����� &0 stringwithstring_ stringWithString_ �  ��� � o    �� 0 templatetext templateText��  ��   � n     � � � o    �~�~ 0 nsstring NSString � m     �}
�} misccura � o      �|�| 0 
asocstring 
asocString �  � � � r     � � � n    � � � I    �{ ��z�{ Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_ �  � � � l 
   ��y�x � o    �w�w 0 _tokens  �y  �x   �  � � � l    ��v�u � e     � � n    � � � o    �t�t ^0 -nsregularexpressionallowcommentsandwhitespace -NSRegularExpressionAllowCommentsAndWhitespace � m    �s
�s misccura�v  �u   �  ��r � l    ��q�p � m    �o
�o 
msng�q  �p  �r  �z   � n    � � � o    �n�n *0 nsregularexpression NSRegularExpression � m    �m
�m misccura � o      �l�l 0 asocpattern asocPattern �  � � � r    " � � � m     �k�k   � o      �j�j &0 asocnonmatchstart asocNonMatchStart �  � � � r   # ' � � � J   # %�i�i   � o      �h�h 0 
resultlist 
resultList �  � � � r   ( 9 � � � n  ( 7 � � � I   ) 7�g ��f�g @0 matchesinstring_options_range_ matchesInString_options_range_ �  � � � o   ) *�e�e 0 
asocstring 
asocString �  � � � m   * +�d�d   �  ��c � J   + 3 � �  � � � m   + ,�b�b   �  ��a � n  , 1 � � � I   - 1�`�_�^�` 
0 length  �_  �^   � o   , -�]�] 0 
asocstring 
asocString�a  �c  �f   � o   ( )�\�\ 0 asocpattern asocPattern � o      �[�[  0 asocmatcharray asocMatchArray �  � � � r   : = � � � m   : ;�Z
�Z boovfals � o      �Y�Y 0 
concatnext 
concatNext �  � � � Y   >0 ��X � ��W � k   N+    r   N V l  N T�V�U n  N T I   O T�T�S�T  0 objectatindex_ objectAtIndex_ 	�R	 o   O P�Q�Q 0 i  �R  �S   o   N O�P�P  0 asocmatcharray asocMatchArray�V  �U   o      �O�O 0 	asocmatch 	asocMatch 

 r   W _ l  W ]�N�M n  W ] I   X ]�L�K�L 0 rangeatindex_ rangeAtIndex_ �J m   X Y�I�I  �J  �K   o   W X�H�H 0 	asocmatch 	asocMatch�N  �M   o      �G�G  0 asocmatchrange asocMatchRange  l  ` `�F�F   T N get text before match, convert entities to characters, and add to result list    � �   g e t   t e x t   b e f o r e   m a t c h ,   c o n v e r t   e n t i t i e s   t o   c h a r a c t e r s ,   a n d   a d d   t o   r e s u l t   l i s t  r   ` g n  ` e I   a e�E�D�C�E 0 location  �D  �C   o   ` a�B�B  0 asocmatchrange asocMatchRange o      �A�A  0 asocmatchstart asocMatchStart  l  h  !"  r   h #$# c   h }%&% l  h y'�@�?' n  h y()( I   s y�>*�=�> H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_* +,+ l  s t-�<�;- m   s t.. �// $ H e x - A n y / C ; N a m e - A n y�<  �;  , 0�:0 m   t u�9
�9 boovfals�:  �=  ) l  h s1�8�71 n  h s232 I   i s�64�5�6 *0 substringwithrange_ substringWithRange_4 5�45 J   i o66 787 o   i j�3�3 &0 asocnonmatchstart asocNonMatchStart8 9�29 l  j m:�1�0: \   j m;<; o   j k�/�/  0 asocmatchstart asocMatchStart< o   k l�.�. &0 asocnonmatchstart asocNonMatchStart�1  �0  �2  �4  �5  3 o   h i�-�- 0 
asocstring 
asocString�8  �7  �@  �?  & m   y |�,
�, 
ctxt$ o      �+�+ 0 nonmatchtext nonMatchText! X R convert \u1234, \U00123456, \N{CHARNAME} escapes to specified characters (10.11+)   " �== �   c o n v e r t   \ u 1 2 3 4 ,   \ U 0 0 1 2 3 4 5 6 ,   \ N { C H A R N A M E }   e s c a p e s   t o   s p e c i f i e d   c h a r a c t e r s   ( 1 0 . 1 1 + ) >?> Z   � �@A�*B@ o   � ��)�) 0 
concatnext 
concatNextA l  � �CDEC k   � �FF GHG r   � �IJI b   � �KLK n   � �MNM 4  � ��(O
�( 
cobjO m   � ��'�'��N o   � ��&�& 0 
resultlist 
resultListL o   � ��%�% 0 nonmatchtext nonMatchTextJ n      PQP 4  � ��$R
�$ 
cobjR m   � ��#�#��Q o   � ��"�" 0 
resultlist 
resultListH S�!S r   � �TUT m   � �� 
�  boovfalsU o      �� 0 
concatnext 
concatNext�!  D 8 2 only item indexes/names should be at even indexes   E �VV d   o n l y   i t e m   i n d e x e s / n a m e s   s h o u l d   b e   a t   e v e n   i n d e x e s�*  B r   � �WXW o   � ��� 0 nonmatchtext nonMatchTextX n      YZY  ;   � �Z o   � ��� 0 
resultlist 
resultList? [\[ r   � �]^] [   � �_`_ o   � ���  0 asocmatchstart asocMatchStart` l  � �a��a n  � �bcb I   � ����� 
0 length  �  �  c o   � ���  0 asocmatchrange asocMatchRange�  �  ^ o      �� &0 asocnonmatchstart asocNonMatchStart\ ded l  � ��fg�  f L F get the matched text (escaped linefeed, etc. or insertion index/name)   g �hh �   g e t   t h e   m a t c h e d   t e x t   ( e s c a p e d   l i n e f e e d ,   e t c .   o r   i n s e r t i o n   i n d e x / n a m e )e i�i Y   �+j�kl�j l  �&mnom k   �&pp qrq r   � �sts l  � �u��u n  � �vwv I   � ��x�� 0 rangeatindex_ rangeAtIndex_x y�y o   � ��� 0 j  �  �  w o   � ��
�
 0 	asocmatch 	asocMatch�  �  t o      �	�	  0 asocgrouprange asocGroupRanger z�z Z   �&{|��{ ?   � �}~} n  � �� I   � ����� 
0 length  �  �  � o   � ���  0 asocgrouprange asocGroupRange~ m   � ���  | k   �"�� ��� r   � ���� l  � ��� ��� n  � ���� I   � �������� *0 substringwithrange_ substringWithRange_� ���� o   � �����  0 asocgrouprange asocGroupRange��  ��  � o   � ����� 0 
asocstring 
asocString�   ��  � o      ���� "0 asocmatchstring asocMatchString� ��� r   � ���� c   � ���� o   � ����� "0 asocmatchstring asocMatchString� m   � ���
�� 
ctxt� o      ���� 0 itemtext itemText� ��� Z   � ������ =   � ���� o   � ����� 0 j  � m   � ����� � k   ��� ��� r   ���� b   ���� n   � ���� 4  � ����
�� 
cobj� m   � �������� o   � ����� 0 
resultlist 
resultList� l  ������� n   ���� 4   ����
�� 
cobj� l  ������� I  ������ z����
�� .sysooffslong    ��� null
�� misccura��  � ����
�� 
psof� o   � ����� 0 itemtext itemText� �����
�� 
psin� m  �� ���  n r t \��  ��  ��  � J   � ��� ��� 1   � ���
�� 
lnfd� ��� o   � ���
�� 
ret � ��� 1   � ���
�� 
tab � ���� m   � ��� ���  \��  ��  ��  � n      ��� 4 ���
�� 
cobj� m  ������� o  ���� 0 
resultlist 
resultList� ���� r  ��� m  ��
�� boovtrue� o      ���� 0 
concatnext 
concatNext��  ��  � r   ��� o  ���� 0 itemtext itemText� n      ���  ;  � o  ���� 0 
resultlist 
resultList� ����  S  !"��  �  �  �  n G A _tokens defines 3 groups (index 0 is full match, so ignore that)   o ��� �   _ t o k e n s   d e f i n e s   3   g r o u p s   ( i n d e x   0   i s   f u l l   m a t c h ,   s o   i g n o r e   t h a t )� 0 j  k m   � ����� l m   � ����� �  �  �X 0 i   � m   A B����   � \   B I��� l  B G������ n  B G��� I   C G�������� 	0 count  ��  ��  � o   B C����  0 asocmatcharray asocMatchArray��  ��  � m   G H���� �W   � ��� l 1E���� r  1E��� c  1C��� l 1?������ n 1?��� I  7?������� H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_� ��� l 7:������ m  7:�� ��� $ H e x - A n y / C ; N a m e - A n y��  ��  � ���� m  :;��
�� boovfals��  ��  � l 17������ n 17��� I  27������� *0 substringfromindex_ substringFromIndex_� ���� o  23���� &0 asocnonmatchstart asocNonMatchStart��  ��  � o  12���� 0 
asocstring 
asocString��  ��  ��  ��  � m  ?B��
�� 
ctxt� o      ���� 0 itemtext itemText� ( " trailing text; convert and append   � ��� D   t r a i l i n g   t e x t ;   c o n v e r t   a n d   a p p e n d� ��� Z  F`������ o  FG���� 0 
concatnext 
concatNext� r  JY��� b  JR��� n  JP��� 4 KP���
�� 
cobj� m  NO������� o  JK���� 0 
resultlist 
resultList� o  PQ���� 0 itemtext itemText� n      ��� 4 SX���
�� 
cobj� m  VW������� o  RS���� 0 
resultlist 
resultList��  � r  \`��� o  \]���� 0 itemtext itemText� n      ���  ;  ^_� o  ]^���� 0 
resultlist 
resultList� ���� L  ac�� o  ab���� 0 
resultlist 
resultList��   � convert template text containing backslashed special characters (\t, \u1234, \3, etc.) to a list of text items of form {text, index or name, ..., text}, where every 2nd item is an unprocessed back reference; used by the _parseSearchTemplate and _parseFormatTemplate handlers    � ���&   c o n v e r t   t e m p l a t e   t e x t   c o n t a i n i n g   b a c k s l a s h e d   s p e c i a l   c h a r a c t e r s   ( \ t ,   \ u 1 2 3 4 ,   \ 3 ,   e t c . )   t o   a   l i s t   o f   t e x t   i t e m s   o f   f o r m   { t e x t ,   i n d e x   o r   n a m e ,   . . . ,   t e x t } ,   w h e r e   e v e r y   2 n d   i t e m   i s   a n   u n p r o c e s s e d   b a c k   r e f e r e n c e ;   u s e d   b y   t h e   _ p a r s e S e a r c h T e m p l a t e   a n d   _ p a r s e F o r m a t T e m p l a t e   h a n d l e r s � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� � � l     ����   B < parse template text used in `search text` and `format text`    � x   p a r s e   t e m p l a t e   t e x t   u s e d   i n   ` s e a r c h   t e x t `   a n d   ` f o r m a t   t e x t `   l     ����   F @ (note: last parsed template is cached for more efficient reuse)    � �   ( n o t e :   l a s t   p a r s e d   t e m p l a t e   i s   c a c h e d   f o r   m o r e   e f f i c i e n t   r e u s e ) 	
	 l     ��������  ��  ��  
  j   6 :���� :0 _previoussearchtemplatetext _previousSearchTemplateText m   6 9 �    j   ; ?���� F0 !_previoussearchtemplateparsedtext !_previousSearchTemplateParsedText m   ; > �    l     ��������  ��  ��    i  @ C I      ������ ,0 _parsesearchtemplate _parseSearchTemplate �� o      ���� 0 templatetext templateText��  ��   P     � k    �   !"! Z    �#$����# >   %&% o    ���� 0 templatetext templateText& o    ���� :0 _previoussearchtemplatetext _previousSearchTemplateText$ k    �'' ()( r    *+* I    ��,���� (0 _parsetemplatetext _parseTemplateText, -��- o    ���� 0 templatetext templateText��  ��  + o      ���� 0 templateitems templateItems) ./. Y    �0��12��0 k   % �33 454 r   % +676 n   % )898 4   & )��:
�� 
cobj: o   ' (���� 0 i  9 o   % &���� 0 templateitems templateItems7 o      ���� 0 itemtext itemText5 ;��; Z   , �<=��>< =   , 1?@? `   , /ABA o   , -���� 0 i  B m   - .���� @ m   / 0����  = l  4 hCDEC k   4 hFF GHG r   4 ;IJI b   4 9KLK m   4 5MM �NN  $L l  5 8O����O c   5 8PQP o   5 6���� 0 itemtext itemTextQ m   6 7��
�� 
long��  ��  J o      ���� 0 itemtext itemTextH RSR r   < DTUT n   < BVWV 4   = B��X
�� 
cobjX l  > AY����Y [   > AZ[Z o   > ?���� 0 i  [ m   ? @�� ��  ��  W o   < =�~�~ 0 templateitems templateItemsU o      �}�} 0 nextitem nextItemS \]\ l  E a^_`^ Z  E aab�|�{a F   E Ucdc ?   E Jefe n  E Hghg 1   F H�z
�z 
lengh o   E F�y�y 0 nextitem nextItemf m   H I�x�x  d E  M Siji m   M Nkk �ll  1 2 3 4 5 6 7 8 9 0j n  N Rmnm 4   O R�wo
�w 
cha o m   P Q�v�v n o   N O�u�u 0 nextitem nextItemb r   X ]pqp b   X [rsr o   X Y�t�t 0 itemtext itemTexts m   Y Ztt �uu  \q o      �s�s 0 itemtext itemText�|  �{  _ 8 2 make sure ICT template doesn't consume next digit   ` �vv d   m a k e   s u r e   I C T   t e m p l a t e   d o e s n ' t   c o n s u m e   n e x t   d i g i t] w�rw r   b hxyx o   b c�q�q 0 itemtext itemTexty n      z{z 4   d g�p|
�p 
cobj| o   e f�o�o 0 i  { o   c d�n�n 0 templateitems templateItems�r  D #  substitute integer N with $N   E �}} :   s u b s t i t u t e   i n t e g e r   N   w i t h   $ N��  > l  k �~�~ k   k ��� ��� r   k w��� n  k u��� I   p u�m��l�m 0 
asnsstring 
asNSString� ��k� o   p q�j�j 0 itemtext itemText�k  �l  � o   k p�i�i 0 _support  � o      �h�h 0 
asocstring 
asocString� ��g� r   x ���� c   x ���� l  x ���f�e� n  x ���� I   y ��d��c�d �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m   y z�� ���  ( [ \ $ ] )� ��� m   z {�� ���  \ \ $ 1� ��� l  { ~��b�a� n  { ~��� o   | ~�`�` 60 nsregularexpressionsearch NSRegularExpressionSearch� m   { |�_
�_ misccura�b  �a  � ��^� J   ~ ��� ��� m   ~ �]�]  � ��\� n   ���� I   � ��[�Z�Y�[ 
0 length  �Z  �Y  � o    ��X�X 0 
asocstring 
asocString�\  �^  �c  � o   x y�W�W 0 
asocstring 
asocString�f  �e  � m   � ��V
�V 
ctxt� n      ��� 4   � ��U�
�U 
cobj� o   � ��T�T 0 i  � o   � ��S�S 0 templateitems templateItems�g     re-escape '/' and '$'   � ��� ,   r e - e s c a p e   ' / '   a n d   ' $ '��  �� 0 i  1 m    �R�R 2 n    ��� 1    �Q
�Q 
leng� o    �P�P 0 templateitems templateItems��  / ��� r   � ���� I   � ��O��N�O 0 	_jointext 	_joinText� ��� o   � ��M�M 0 templateitems templateItems� ��L� m   � ��� ���  �L  �N  � o      �K�K F0 !_previoussearchtemplateparsedtext !_previousSearchTemplateParsedText� ��J� r   � ���� o   � ��I�I 0 templatetext templateText� o      �H�H :0 _previoussearchtemplatetext _previousSearchTemplateText�J  ��  ��  " ��G� L   � ��� o   � ��F�F F0 !_previoussearchtemplateparsedtext !_previousSearchTemplateParsedText�G   �E�
�E conscase� �D�
�D consdiac� �C�
�C conshyph� �B�
�B conspunc� �A�@
�A conswhit�@   �?�>
�? consnume�>   ��� l     �=�<�;�=  �<  �;  � ��� l     �:�9�8�:  �9  �8  � ��� j   D H�7��7 :0 _previousformattemplatetext _previousFormatTemplateText� m   D G�� ���  � ��� l     ���� j   I M�6��6 H0 "_previousformattemplateparseditems "_previousFormatTemplateParsedItems� m   I L�� ���  � 4 . list of form {text, index or name, ..., text}   � ��� \   l i s t   o f   f o r m   { t e x t ,   i n d e x   o r   n a m e ,   . . . ,   t e x t }� ��� l     �5�4�3�5  �4  �3  � ��� i  N Q��� I      �2��1�2 ,0 _parseformattemplate _parseFormatTemplate� ��0� o      �/�/ 0 templatetext templateText�0  �1  � P     2���� k    1�� ��� Z    '���.�-� >   ��� o    �,�, 0 templatetext templateText� o    �+�+ :0 _previousformattemplatetext _previousFormatTemplateText� k    #�� ��� r    ��� I    �*��)�* (0 _parsetemplatetext _parseTemplateText� ��(� o    �'�' 0 templatetext templateText�(  �)  � o      �&�& H0 "_previousformattemplateparseditems "_previousFormatTemplateParsedItems� ��%� r    #��� o    �$�$ 0 templatetext templateText� o      �#�# :0 _previousformattemplatetext _previousFormatTemplateText�%  �.  �-  � ��"� L   ( 1�� n  ( 0��� 2  - /�!
�! 
cobj� o   ( -� �  H0 "_previousformattemplateparseditems "_previousFormatTemplateParsedItems�"  � ��
� conscase� ��
� consdiac� ��
� conshyph� ��
� conspunc� ��
� conswhit�  � ��
� consnume�  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� � � l     ��     Find and Replace Suite    � .   F i n d   a n d   R e p l a c e   S u i t e   l     ����  �  �    l     �	�     find pattern   	 �

    f i n d   p a t t e r n  l     ��
�	�  �
  �	    i  R U I      ��� $0 _matchinforecord _matchInfoRecord  o      �� 0 
asocstring 
asocString  o      ��  0 asocmatchrange asocMatchRange  o      �� 0 
textoffset 
textOffset � o      �� 0 
recordtype 
recordType�  �   k     #  r     
 c      l     ��   n    !"! I    ��#���� *0 substringwithrange_ substringWithRange_# $��$ o    ����  0 asocmatchrange asocMatchRange��  ��  " o     ���� 0 
asocstring 
asocString�  �    m    ��
�� 
ctxt o      ���� 0 	foundtext 	foundText %&% l   '()' r    *+* [    ,-, o    ���� 0 
textoffset 
textOffset- l   .����. n    /0/ 1    ��
�� 
leng0 o    ���� 0 	foundtext 	foundText��  ��  + o      ����  0 nexttextoffset nextTextOffset( : 4 calculate the start index of the next AS text range   ) �11 h   c a l c u l a t e   t h e   s t a r t   i n d e x   o f   t h e   n e x t   A S   t e x t   r a n g e& 232 l   ��45��  4
 note: record keys are identifiers, not keywords, as 1. library-defined keywords are a huge pain to use outside of `tell script...` blocks and 2. importing the library's terminology into the global namespace via `use script...` is an excellent way to create keyword conflicts; only the class value is a keyword since Script Editor/OSAKit don't correctly handle records that use non-typename values (e.g. `{class:"matched text",...}`), but this shouldn't impact usability as it's really only used for informational purposes   5 �66   n o t e :   r e c o r d   k e y s   a r e   i d e n t i f i e r s ,   n o t   k e y w o r d s ,   a s   1 .   l i b r a r y - d e f i n e d   k e y w o r d s   a r e   a   h u g e   p a i n   t o   u s e   o u t s i d e   o f   ` t e l l   s c r i p t . . . `   b l o c k s   a n d   2 .   i m p o r t i n g   t h e   l i b r a r y ' s   t e r m i n o l o g y   i n t o   t h e   g l o b a l   n a m e s p a c e   v i a   ` u s e   s c r i p t . . . `   i s   a n   e x c e l l e n t   w a y   t o   c r e a t e   k e y w o r d   c o n f l i c t s ;   o n l y   t h e   c l a s s   v a l u e   i s   a   k e y w o r d   s i n c e   S c r i p t   E d i t o r / O S A K i t   d o n ' t   c o r r e c t l y   h a n d l e   r e c o r d s   t h a t   u s e   n o n - t y p e n a m e   v a l u e s   ( e . g .   ` { c l a s s : " m a t c h e d   t e x t " , . . . } ` ) ,   b u t   t h i s   s h o u l d n ' t   i m p a c t   u s a b i l i t y   a s   i t ' s   r e a l l y   o n l y   u s e d   f o r   i n f o r m a t i o n a l   p u r p o s e s3 7��7 L    #88 J    "99 :;: K    << ��=>
�� 
pcls= o    ���� 0 
recordtype 
recordType> ��?@�� 0 
startindex 
startIndex? o    ���� 0 
textoffset 
textOffset@ ��AB�� 0 endindex endIndexA \    CDC o    ����  0 nexttextoffset nextTextOffsetD m    ���� B ��E���� 0 	foundtext 	foundTextE o    ���� 0 	foundtext 	foundText��  ; F��F o     ����  0 nexttextoffset nextTextOffset��  ��   GHG l     ��������  ��  ��  H IJI l     ��������  ��  ��  J KLK i  V YMNM I      ��O���� 0 _matchrecords _matchRecordsO PQP o      ���� 0 
asocstring 
asocStringQ RSR o      ����  0 asocmatchrange asocMatchRangeS TUT o      ����  0 asocstartindex asocStartIndexU VWV o      ���� 0 
textoffset 
textOffsetW XYX o      ���� (0 nonmatchrecordtype nonMatchRecordTypeY Z��Z o      ���� "0 matchrecordtype matchRecordType��  ��  N k     V[[ \]\ l     ��^_��  ^TN important: NSString character indexes aren't guaranteed to be same as AS character indexes (AS sensibly counts glyphs but NSString only counts UTF16 codepoints, and a glyph may be composed of more than one codepoint), so reconstruct both non-matching and matching AS text values, and calculate accurate AS character ranges from those   _ �``�   i m p o r t a n t :   N S S t r i n g   c h a r a c t e r   i n d e x e s   a r e n ' t   g u a r a n t e e d   t o   b e   s a m e   a s   A S   c h a r a c t e r   i n d e x e s   ( A S   s e n s i b l y   c o u n t s   g l y p h s   b u t   N S S t r i n g   o n l y   c o u n t s   U T F 1 6   c o d e p o i n t s ,   a n d   a   g l y p h   m a y   b e   c o m p o s e d   o f   m o r e   t h a n   o n e   c o d e p o i n t ) ,   s o   r e c o n s t r u c t   b o t h   n o n - m a t c h i n g   a n d   m a t c h i n g   A S   t e x t   v a l u e s ,   a n d   c a l c u l a t e   a c c u r a t e   A S   c h a r a c t e r   r a n g e s   f r o m   t h o s e] aba r     cdc n    efe I    �������� 0 location  ��  ��  f o     ����  0 asocmatchrange asocMatchRanged o      ����  0 asocmatchstart asocMatchStartb ghg r    iji [    klk o    	����  0 asocmatchstart asocMatchStartl l  	 m����m n  	 non I   
 �������� 
0 length  ��  ��  o o   	 
����  0 asocmatchrange asocMatchRange��  ��  j o      ���� 0 asocmatchend asocMatchEndh pqp r    rsr K    tt ��uv�� 0 location  u o    ����  0 asocstartindex asocStartIndexv ��w���� 
0 length  w \    xyx o    ����  0 asocmatchstart asocMatchStarty o    ����  0 asocstartindex asocStartIndex��  s o      ���� &0 asocnonmatchrange asocNonMatchRangeq z{z r    5|}| I      ��~���� $0 _matchinforecord _matchInfoRecord~ � o    ���� 0 
asocstring 
asocString� ��� o     ���� &0 asocnonmatchrange asocNonMatchRange� ��� o     !���� 0 
textoffset 
textOffset� ���� o   ! "���� (0 nonmatchrecordtype nonMatchRecordType��  ��  } J      �� ��� o      ���� 0 nonmatchinfo nonMatchInfo� ���� o      ���� 0 
textoffset 
textOffset��  { ��� r   6 N��� I      ������� $0 _matchinforecord _matchInfoRecord� ��� o   7 8���� 0 
asocstring 
asocString� ��� o   8 9����  0 asocmatchrange asocMatchRange� ��� o   9 :���� 0 
textoffset 
textOffset� ���� o   : ;���� "0 matchrecordtype matchRecordType��  ��  � J      �� ��� o      ���� 0 	matchinfo 	matchInfo� ���� o      ���� 0 
textoffset 
textOffset��  � ���� L   O V�� J   O U�� ��� o   O P���� 0 nonmatchinfo nonMatchInfo� ��� o   P Q���� 0 	matchinfo 	matchInfo� ��� o   Q R���� 0 asocmatchend asocMatchEnd� ���� o   R S���� 0 
textoffset 
textOffset��  ��  L ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  Z ]��� I      ������� &0 _matchedgrouplist _matchedGroupList� ��� o      ���� 0 
asocstring 
asocString� ��� o      ���� 0 	asocmatch 	asocMatch� ��� o      ���� 0 
textoffset 
textOffset� ���� o      ���� &0 includenonmatches includeNonMatches��  ��  � k     ��� ��� r     ��� J     ����  � o      ���� "0 submatchresults subMatchResults� ��� r    ��� \    ��� l   
������ n   
��� I    
��������  0 numberofranges numberOfRanges��  ��  � o    ���� 0 	asocmatch 	asocMatch��  ��  � m   
 ���� � o      ���� 0 groupindexes groupIndexes� ��� Z    �������� ?    ��� o    ���� 0 groupindexes groupIndexes� m    ����  � k    ��� ��� r    ��� n   ��� I    ������� 0 rangeatindex_ rangeAtIndex_� ���� m    ����  ��  ��  � o    ���� 0 	asocmatch 	asocMatch� o      ���� (0 asocfullmatchrange asocFullMatchRange� ��� r    %��� n   #��� I    #�������� 0 location  ��  ��  � o    ���� (0 asocfullmatchrange asocFullMatchRange� o      ���� &0 asocnonmatchstart asocNonMatchStart� ��� r   & /��� [   & -��� o   & '���� &0 asocnonmatchstart asocNonMatchStart� l  ' ,���~� n  ' ,��� I   ( ,�}�|�{�} 
0 length  �|  �{  � o   ' (�z�z (0 asocfullmatchrange asocFullMatchRange�  �~  � o      �y�y $0 asocfullmatchend asocFullMatchEnd� ��� Y   0 ���x���w� k   : ��� ��� r   : o��� I      �v��u�v 0 _matchrecords _matchRecords� ��� o   ; <�t�t 0 
asocstring 
asocString� ��� n  < B��� I   = B�s��r�s 0 rangeatindex_ rangeAtIndex_� ��q� o   = >�p�p 0 i  �q  �r  � o   < =�o�o 0 	asocmatch 	asocMatch� ��� o   B C�n�n &0 asocnonmatchstart asocNonMatchStart� ��� o   C D�m�m 0 
textoffset 
textOffset� ��� o   D I�l�l (0 _unmatchedtexttype _UnmatchedTextType� ��k� o   I N�j�j &0 _matchedgrouptype _MatchedGroupType�k  �u  � J      �� ��� o      �i�i 0 nonmatchinfo nonMatchInfo� ��� o      �h�h 0 	matchinfo 	matchInfo� � � o      �g�g &0 asocnonmatchstart asocNonMatchStart  �f o      �e�e 0 
textoffset 
textOffset�f  �  Z  p |�d�c o   p q�b�b &0 includenonmatches includeNonMatches r   t x o   t u�a�a 0 nonmatchinfo nonMatchInfo n      	  ;   v w	 o   u v�`�` "0 submatchresults subMatchResults�d  �c   
�_
 r   } � o   } ~�^�^ 0 	matchinfo 	matchInfo n        ;    � o   ~ �]�] "0 submatchresults subMatchResults�_  �x 0 i  � m   3 4�\�\ � o   4 5�[�[ 0 groupindexes groupIndexes�w  � �Z Z   � ��Y�X o   � ��W�W &0 includenonmatches includeNonMatches k   � �  r   � � K   � � �V�V 0 location   o   � ��U�U &0 asocnonmatchstart asocNonMatchStart �T�S�T 
0 length   \   � � o   � ��R�R $0 asocfullmatchend asocFullMatchEnd o   � ��Q�Q &0 asocnonmatchstart asocNonMatchStart�S   o      �P�P &0 asocnonmatchrange asocNonMatchRange �O r   � � n   � � !  4   � ��N"
�N 
cobj" m   � ��M�M ! I   � ��L#�K�L $0 _matchinforecord _matchInfoRecord# $%$ o   � ��J�J 0 
asocstring 
asocString% &'& o   � ��I�I &0 asocnonmatchrange asocNonMatchRange' ()( o   � ��H�H 0 
textoffset 
textOffset) *�G* o   � ��F�F (0 _unmatchedtexttype _UnmatchedTextType�G  �K   n      +,+  ;   � �, o   � ��E�E "0 submatchresults subMatchResults�O  �Y  �X  �Z  ��  ��  � -�D- L   � �.. o   � ��C�C "0 submatchresults subMatchResults�D  � /0/ l     �B�A�@�B  �A  �@  0 121 l     �?�>�=�?  �>  �=  2 343 l     �<�;�:�<  �;  �:  4 565 i  ^ a787 I      �99�8�9 0 _findpattern _findPattern9 :;: o      �7�7 0 thetext theText; <=< o      �6�6 0 patterntext patternText= >?> o      �5�5 &0 includenonmatches includeNonMatches? @�4@ o      �3�3  0 includematches includeMatches�4  �8  8 k    AA BCB r     DED n    FGF I    �2H�1�2 (0 asbooleanparameter asBooleanParameterH IJI o    �0�0 &0 includenonmatches includeNonMatchesJ K�/K m    LL �MM  u n m a t c h e d   t e x t�/  �1  G o     �.�. 0 _support  E o      �-�- &0 includenonmatches includeNonMatchesC NON r    PQP n   RSR I    �,T�+�, (0 asbooleanparameter asBooleanParameterT UVU o    �*�*  0 includematches includeMatchesV W�)W m    XX �YY  m a t c h e d   t e x t�)  �+  S o    �(�( 0 _support  Q o      �'�'  0 includematches includeMatchesO Z[Z r    %\]\ I    #�&^�%�& B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter^ _`_ o    �$�$ 0 patterntext patternText` a�#a m    bb �cc  f o r�#  �%  ] o      �"�" 0 asocpattern asocPattern[ ded r   & 2fgf n  & 0hih I   + 0�!j� �! ,0 asnormalizednsstring asNormalizedNSStringj k�k o   + ,�� 0 thetext theText�  �   i o   & +�� 0 _support  g o      �� 0 
asocstring 
asocStringe lml l  3 6nopn r   3 6qrq m   3 4��  r o      �� &0 asocnonmatchstart asocNonMatchStarto G A used to calculate NSRanges for non-matching portions of NSString   p �ss �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n gm tut l  7 :vwxv r   7 :yzy m   7 8�� z o      �� 0 
textoffset 
textOffsetw B < used to calculate correct AppleScript start and end indexes   x �{{ x   u s e d   t o   c a l c u l a t e   c o r r e c t   A p p l e S c r i p t   s t a r t   a n d   e n d   i n d e x e su |}| r   ; ?~~ J   ; =��   o      �� 0 
resultlist 
resultList} ��� l  @ @����  � @ : iterate over each non-matched + matched range in NSString   � ��� t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g� ��� r   @ Q��� n  @ O��� I   A O���� @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   A B�� 0 
asocstring 
asocString� ��� m   B C��  � ��� J   C K�� ��� m   C D��  � ��� n  D I��� I   E I���� 
0 length  �  �  � o   D E�
�
 0 
asocstring 
asocString�  �  �  � o   @ A�	�	 0 asocpattern asocPattern� o      ��  0 asocmatcharray asocMatchArray� ��� Y   R ������� k   b ��� ��� r   b j��� l  b h���� n  b h��� I   c h����  0 objectatindex_ objectAtIndex_� ��� o   c d� �  0 i  �  �  � o   b c����  0 asocmatcharray asocMatchArray�  �  � o      ���� 0 	asocmatch 	asocMatch� ��� l  k k������  � � � the first range in match identifies the text matched by the entire pattern, so generate records for full match and its preceding (unmatched) text   � ���$   t h e   f i r s t   r a n g e   i n   m a t c h   i d e n t i f i e s   t h e   t e x t   m a t c h e d   b y   t h e   e n t i r e   p a t t e r n ,   s o   g e n e r a t e   r e c o r d s   f o r   f u l l   m a t c h   a n d   i t s   p r e c e d i n g   ( u n m a t c h e d )   t e x t� ��� r   k ���� I      ������� 0 _matchrecords _matchRecords� ��� o   l m���� 0 
asocstring 
asocString� ��� n  m s��� I   n s������� 0 rangeatindex_ rangeAtIndex_� ���� m   n o����  ��  ��  � o   m n���� 0 	asocmatch 	asocMatch� ��� o   s t���� &0 asocnonmatchstart asocNonMatchStart� ��� o   t u���� 0 
textoffset 
textOffset� ��� o   u z���� (0 _unmatchedtexttype _UnmatchedTextType� ���� o   z ���� $0 _matchedtexttype _MatchedTextType��  ��  � J      �� ��� o      ���� 0 nonmatchinfo nonMatchInfo� ��� o      ���� 0 	matchinfo 	matchInfo� ��� o      ���� &0 asocnonmatchstart asocNonMatchStart� ���� o      ���� 0 
textoffset 
textOffset��  � ��� Z  � �������� o   � ����� &0 includenonmatches includeNonMatches� r   � ���� o   � ����� 0 nonmatchinfo nonMatchInfo� n      ���  ;   � �� o   � ����� 0 
resultlist 
resultList��  ��  � ���� Z   � �������� o   � �����  0 includematches includeMatches� k   � ��� ��� l  � �������  � any additional ranges in match identify text matched by group references within regexp pattern, e.g. "([0-9]{4})-([0-9]{2})-([0-9]{2})" will match `YYYY-MM-DD` style date strings, returning the entire text match, plus sub-matches representing year, month and day text   � ���   a n y   a d d i t i o n a l   r a n g e s   i n   m a t c h   i d e n t i f y   t e x t   m a t c h e d   b y   g r o u p   r e f e r e n c e s   w i t h i n   r e g e x p   p a t t e r n ,   e . g .   " ( [ 0 - 9 ] { 4 } ) - ( [ 0 - 9 ] { 2 } ) - ( [ 0 - 9 ] { 2 } ) "   w i l l   m a t c h   ` Y Y Y Y - M M - D D `   s t y l e   d a t e   s t r i n g s ,   r e t u r n i n g   t h e   e n t i r e   t e x t   m a t c h ,   p l u s   s u b - m a t c h e s   r e p r e s e n t i n g   y e a r ,   m o n t h   a n d   d a y   t e x t� ���� r   � ���� b   � ���� o   � ����� 0 	matchinfo 	matchInfo� K   � ��� ������� 0 foundgroups foundGroups� I   � �������� &0 _matchedgrouplist _matchedGroupList� ��� o   � ����� 0 
asocstring 
asocString� ��� o   � ����� 0 	asocmatch 	asocMatch� ��� n  � ���� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 	matchinfo 	matchInfo� ���� o   � ����� &0 includenonmatches includeNonMatches��  ��  ��  � n      ���  ;   � �� o   � ����� 0 
resultlist 
resultList��  ��  ��  ��  � 0 i  � m   U V����  � \   V ]��� l  V [������ n  V [��� I   W [�������� 	0 count  ��  ��  � o   V W����  0 asocmatcharray asocMatchArray��  ��  � m   [ \���� �  � ��� l  � �������  � "  add final non-matched range   � ��� 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e� ��� Z   �������� o   � ����� &0 includenonmatches includeNonMatches� k   ��� ��� r   � ���� c   � ���� l  � � ����  n  � � I   � ������� *0 substringfromindex_ substringFromIndex_ �� o   � ����� &0 asocnonmatchstart asocNonMatchStart��  ��   o   � ����� 0 
asocstring 
asocString��  ��  � m   � ���
�� 
ctxt� o      ���� 0 	foundtext 	foundText� �� r   � K   � � ��	

�� 
pcls	 o   � ����� (0 _unmatchedtexttype _UnmatchedTextType
 ���� 0 
startindex 
startIndex o   � ����� 0 
textoffset 
textOffset ���� 0 endindex endIndex n   � � 1   � ���
�� 
leng o   � ����� 0 thetext theText ������ 0 	foundtext 	foundText o   � ����� 0 	foundtext 	foundText��   n        ;   �  o   � ����� 0 
resultlist 
resultList��  ��  ��  � �� L   o  ���� 0 
resultlist 
resultList��  6  l     ��������  ��  ��    l     ��������  ��  ��    l     ����    -----    � 
 - - - - -   l     ��!"��  !   replace pattern   " �##     r e p l a c e   p a t t e r n  $%$ l     ��������  ��  ��  % &'& i  b e()( I      ��*���� "0 _replacepattern _replacePattern* +,+ o      ���� 0 thetext theText, -.- o      ���� 0 patterntext patternText. /��/ o      ���� 0 templatetext templateText��  ��  ) k    t00 121 r     343 n    
565 I    
��7���� ,0 asnormalizednsstring asNormalizedNSString7 8��8 o    ���� 0 thetext theText��  ��  6 o     ���� 0 _support  4 o      ���� 0 
asocstring 
asocString2 9:9 r    ;<; I    ��=���� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter= >?> o    ���� 0 patterntext patternText? @��@ m    AA �BB  f o r��  ��  < o      ���� 0 asocpattern asocPattern: C��C Z   tDE��FD =    "GHG l    I����I I    ��JK
�� .corecnte****       ****J J    LL M��M o    ���� 0 templatetext templateText��  K ��N��
�� 
koclN m    ��
�� 
scpt��  ��  ��  H m     !���� E k   %WOO PQP h   % ,��R�� 0 
resultlist 
resultListR j     ��S�� 
0 _list_  S J     ����  Q TUT r   - 0VWV m   - .����  W o      ���� &0 asocnonmatchstart asocNonMatchStartU XYX r   1 BZ[Z n  1 @\]\ I   2 @��^���� @0 matchesinstring_options_range_ matchesInString_options_range_^ _`_ o   2 3���� 0 
asocstring 
asocString` aba m   3 4����  b c��c J   4 <dd efe m   4 5��  f g�~g n  5 :hih I   6 :�}�|�{�} 
0 length  �|  �{  i o   5 6�z�z 0 
asocstring 
asocString�~  ��  ��  ] o   1 2�y�y 0 asocpattern asocPattern[ o      �x�x  0 asocmatcharray asocMatchArrayY jkj Y   Cl�wmn�vl k   S	oo pqp l  S [rstr r   S [uvu l  S Yw�u�tw n  S Yxyx I   T Y�sz�r�s  0 objectatindex_ objectAtIndex_z {�q{ o   T U�p�p 0 i  �q  �r  y o   S T�o�o  0 asocmatcharray asocMatchArray�u  �t  v o      �n�n 0 	asocmatch 	asocMatchs   a single match   t �||    a   s i n g l e   m a t c hq }~} l  \ d�� r   \ d��� l  \ b��m�l� n  \ b��� I   ] b�k��j�k 0 rangeatindex_ rangeAtIndex_� ��i� m   ] ^�h�h  �i  �j  � o   \ ]�g�g 0 	asocmatch 	asocMatch�m  �l  � o      �f�f  0 asocmatchrange asocMatchRange� "  the full range of the match   � ��� 8   t h e   f u l l   r a n g e   o f   t h e   m a t c h~ ��� r   e l��� n  e j��� I   f j�e�d�c�e 0 location  �d  �c  � o   e f�b�b  0 asocmatchrange asocMatchRange� o      �a�a  0 asocmatchstart asocMatchStart� ��� r   m w��� K   m u�� �`���` 0 location  � o   n o�_�_ &0 asocnonmatchstart asocNonMatchStart� �^��]�^ 
0 length  � \   p s��� o   p q�\�\  0 asocmatchstart asocMatchStart� o   q r�[�[ &0 asocnonmatchstart asocNonMatchStart�]  � o      �Z�Z &0 asocnonmatchrange asocNonMatchRange� ��� l  x ����� r   x ���� c   x ���� l  x ~��Y�X� n  x ~��� I   y ~�W��V�W *0 substringwithrange_ substringWithRange_� ��U� o   y z�T�T &0 asocnonmatchrange asocNonMatchRange�U  �V  � o   x y�S�S 0 
asocstring 
asocString�Y  �X  � m   ~ ��R
�R 
ctxt� n      ���  ;   � �� n  � ���� o   � ��Q�Q 
0 _list_  � o   � ��P�P 0 
resultlist 
resultList�   interstitial text   � ��� $   i n t e r s t i t i a l   t e x t� ��� l  � ����� r   � ���� c   � ���� l  � ���O�N� n  � ���� I   � ��M��L�M *0 substringwithrange_ substringWithRange_� ��K� o   � ��J�J  0 asocmatchrange asocMatchRange�K  �L  � o   � ��I�I 0 
asocstring 
asocString�O  �N  � m   � ��H
�H 
ctxt� o      �G�G 0 	foundtext 	foundText�   range 0 is full match   � ��� ,   r a n g e   0   i s   f u l l   m a t c h� ��� r   � ���� J   � ��F�F  � o      �E�E 0 foundgroups foundGroups� ��� Y   � ���D���C� l  � ����� r   � ���� c   � ���� l  � ���B�A� n  � ���� I   � ��@��?�@ *0 substringwithrange_ substringWithRange_� ��>� l  � ���=�<� n  � ���� I   � ��;��:�; 0 rangeatindex_ rangeAtIndex_� ��9� o   � ��8�8 0 j  �9  �:  � o   � ��7�7 0 	asocmatch 	asocMatch�=  �<  �>  �?  � o   � ��6�6 0 
asocstring 
asocString�B  �A  � m   � ��5
�5 
ctxt� n      ���  ;   � �� o   � ��4�4 0 foundgroups foundGroups� ' ! ranges above 0 are group matches   � ��� B   r a n g e s   a b o v e   0   a r e   g r o u p   m a t c h e s�D 0 j  � m   � ��3�3 � \   � ���� l  � ���2�1� n  � ���� I   � ��0�/�.�0  0 numberofranges numberOfRanges�/  �.  � o   � ��-�- 0 	asocmatch 	asocMatch�2  �1  � m   � ��,�, �C  � ��� Q   � ����� r   � ���� c   � ���� n  � ���� I   � ��+��*�+  0 replacepattern replacePattern� ��� o   � ��)�) 0 	foundtext 	foundText� ��(� o   � ��'�' 0 foundgroups foundGroups�(  �*  � o   � ��&�& 0 templatetext templateText� m   � ��%
�% 
ctxt� n      ���  ;   � �� n  � ���� o   � ��$�$ 
0 _list_  � o   � ��#�# 0 
resultlist 
resultList� R      �"��
�" .ascrerr ****      � ****� o      �!�! 0 etext eText� � ��
�  
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � R   � ����
� .ascrerr ****      � ****� b   � ���� m   � ��� ��� � A n   e r r o r   o c c u r r e d   w h e n   c a l l i n g   t h e    r e p l a c i n g   w i t h    p a r a m e t e r  s    r e p l a c e P a t t e r n    h a n d l e r :  � o   � ��� 0 etext eText� ���
� 
errn� o   � ��� 0 enumber eNumber� � 
� 
erob  o   � ��� 0 efrom eFrom ��
� 
errt o   � ��� 
0 eto eTo�  � � l  	 r   	 [   	
	 o   ��  0 asocmatchstart asocMatchStart
 l �� n  I  ���
� 
0 length  �  �
   o  �	�	  0 asocmatchrange asocMatchRange�  �   o      �� &0 asocnonmatchstart asocNonMatchStart   asocMatchEnd    �    a s o c M a t c h E n d�  �w 0 i  m m   F G��  n \   G N l  G L�� n  G L I   H L���� 	0 count  �  �   o   G H��  0 asocmatcharray asocMatchArray�  �   m   L M� �  �v  k  l ����   "  add final non-matched range    � 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e  l   r    c   !  l "����" n #$# I  ��%���� *0 substringfromindex_ substringFromIndex_% &��& o  ���� &0 asocnonmatchstart asocNonMatchStart��  ��  $ o  ���� 0 
asocstring 
asocString��  ��  ! m  ��
�� 
ctxt n      '('  ;  ( n )*) o  ���� 
0 _list_  * o  ���� 0 
resultlist 
resultList   last interstitial    �++ $   l a s t   i n t e r s t i t i a l ,-, r  !,./. n !(010 1  $(��
�� 
txdl1 1  !$��
�� 
ascr/ o      ���� 0 oldtids oldTIDs- 232 r  -8454 m  -066 �77  5 n     898 1  37��
�� 
txdl9 1  03��
�� 
ascr3 :;: r  9F<=< c  9B>?> n 9>@A@ o  :>���� 
0 _list_  A o  9:���� 0 
resultlist 
resultList? m  >A��
�� 
ctxt= o      ���� 0 
resulttext 
resultText; BCB r  GRDED o  GJ���� 0 oldtids oldTIDsE n     FGF 1  MQ��
�� 
txdlG 1  JM��
�� 
ascrC H��H L  SWII o  SV���� 0 
resulttext 
resultText��  ��  F L  ZtJJ c  ZsKLK l ZoM����M n ZoNON I  [o��P���� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_P QRQ l 
[\S����S o  [\���� 0 
asocstring 
asocString��  ��  R TUT m  \]����  U VWV J  ]eXX YZY m  ]^����  Z [��[ n ^c\]\ I  _c�������� 
0 length  ��  ��  ] o  ^_���� 0 
asocstring 
asocString��  W ^��^ I  ek��_���� ,0 _parsesearchtemplate _parseSearchTemplate_ `��` o  fg���� 0 templatetext templateText��  ��  ��  ��  O o  Z[���� 0 asocpattern asocPattern��  ��  L m  or��
�� 
ctxt��  ' aba l     ��������  ��  ��  b cdc l     ��������  ��  ��  d efe l     ��gh��  g  -----   h �ii 
 - - - - -f jkj l     ��lm��  l  
 find text   m �nn    f i n d   t e x tk opo l     ��������  ��  ��  p qrq i  f ists I      ��u���� 0 	_findtext 	_findTextu vwv o      ���� 0 thetext theTextw xyx o      ���� 0 fortext forTexty z{z o      ���� &0 includenonmatches includeNonMatches{ |��| o      ����  0 includematches includeMatches��  ��  t k    	}} ~~ r     ��� J     ����  � o      ���� 0 
resultlist 
resultList ��� r    
��� n   ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ��� r    ��� o    ���� 0 fortext forText� n     ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� ��� r    ��� m    ���� � o      ���� 0 
startindex 
startIndex� ��� r    ��� n    ��� 1    ��
�� 
leng� n    ��� 4    ���
�� 
citm� m    ���� � o    ���� 0 thetext theText� o      ���� 0 endindex endIndex� ��� Z    Q������� o    ���� &0 includenonmatches includeNonMatches� k   " M�� ��� Z   " ;������ B   " %��� o   " #���� 0 
startindex 
startIndex� o   # $���� 0 endindex endIndex� r   ( 5��� n   ( 3��� 7  ) 3����
�� 
ctxt� o   - /���� 0 
startindex 
startIndex� o   0 2���� 0 endindex endIndex� o   ( )���� 0 thetext theText� o      ���� 0 	foundtext 	foundText��  � r   8 ;��� m   8 9�� ���  � o      ���� 0 	foundtext 	foundText� ���� r   < M��� K   < J�� ����
�� 
pcls� o   = B���� (0 _unmatchedtexttype _UnmatchedTextType� ������ 0 
startindex 
startIndex� o   C D���� 0 
startindex 
startIndex� ������ 0 endindex endIndex� o   E F���� 0 endindex endIndex� ������� 0 	foundtext 	foundText� o   G H���� 0 	foundtext 	foundText��  � n      ���  ;   K L� o   J K���� 0 
resultlist 
resultList��  ��  ��  � ��� Y   R �������� k   b ��� ��� r   b g��� [   b e��� o   b c���� 0 endindex endIndex� m   c d���� � o      ���� 0 
startindex 
startIndex� ��� r   h }��� \   h {��� l  h k������ n   h k��� 1   i k��
�� 
leng� o   h i���� 0 thetext theText��  ��  � l  k z������ n   k z��� 1   x z��
�� 
leng� n   k x��� 7  l x����
�� 
ctxt� l  p s������ 4   p s���
�� 
citm� o   q r���� 0 i  ��  ��  � l  t w������ 4   t w���
�� 
citm� m   u v��������  ��  � o   k l���� 0 thetext theText��  ��  � o      ���� 0 endindex endIndex� ��� Z   ~ �������� o   ~ ����  0 includematches includeMatches� k   � ��� ��� Z   � ������ B   � ���� o   � ��~�~ 0 
startindex 
startIndex� o   � ��}�} 0 endindex endIndex� r   � ���� n   � ���� 7  � ��|��
�| 
ctxt� o   � ��{�{ 0 
startindex 
startIndex� o   � ��z�z 0 endindex endIndex� o   � ��y�y 0 thetext theText� o      �x�x 0 	foundtext 	foundText�  � r   � ���� m   � ��� ���  � o      �w�w 0 	foundtext 	foundText� ��v� r   � ���� K   � ��� �u��
�u 
pcls� o   � ��t�t $0 _matchedtexttype _MatchedTextType� �s���s 0 
startindex 
startIndex� o   � ��r�r 0 
startindex 
startIndex� �q���q 0 endindex endIndex� o   � ��p�p 0 endindex endIndex� �o���o 0 	foundtext 	foundText� o   � ��n�n 0 	foundtext 	foundText� �m �l�m 0 foundgroups foundGroups  J   � ��k�k  �l  � n        ;   � � o   � ��j�j 0 
resultlist 
resultList�v  ��  ��  �  r   � � [   � � o   � ��i�i 0 endindex endIndex m   � ��h�h  o      �g�g 0 
startindex 
startIndex 	
	 r   � � \   � � [   � � o   � ��f�f 0 
startindex 
startIndex l  � ��e�d n   � � 1   � ��c
�c 
leng n   � � 4   � ��b
�b 
citm o   � ��a�a 0 i   o   � ��`�` 0 thetext theText�e  �d   m   � ��_�_  o      �^�^ 0 endindex endIndex
 �] Z   � ��\�[ o   � ��Z�Z &0 includenonmatches includeNonMatches k   � �  Z   � ��Y B   � � !  o   � ��X�X 0 
startindex 
startIndex! o   � ��W�W 0 endindex endIndex r   � �"#" n   � �$%$ 7  � ��V&'
�V 
ctxt& o   � ��U�U 0 
startindex 
startIndex' o   � ��T�T 0 endindex endIndex% o   � ��S�S 0 thetext theText# o      �R�R 0 	foundtext 	foundText�Y   r   � �()( m   � �** �++  ) o      �Q�Q 0 	foundtext 	foundText ,�P, r   � �-.- K   � �// �O01
�O 
pcls0 o   � ��N�N (0 _unmatchedtexttype _UnmatchedTextType1 �M23�M 0 
startindex 
startIndex2 o   � ��L�L 0 
startindex 
startIndex3 �K45�K 0 endindex endIndex4 o   � ��J�J 0 endindex endIndex5 �I6�H�I 0 	foundtext 	foundText6 o   � ��G�G 0 	foundtext 	foundText�H  . n      787  ;   � �8 o   � ��F�F 0 
resultlist 
resultList�P  �\  �[  �]  �� 0 i  � m   U V�E�E � I  V ]�D9�C
�D .corecnte****       ****9 n   V Y:;: 2  W Y�B
�B 
citm; o   V W�A�A 0 thetext theText�C  ��  � <=< r  >?> o  �@�@ 0 oldtids oldTIDs? n     @A@ 1  �?
�? 
txdlA 1  �>
�> 
ascr= B�=B L  	CC o  �<�< 0 
resultlist 
resultList�=  r DED l     �;�:�9�;  �:  �9  E FGF l     �8�7�6�8  �7  �6  G HIH l     �5JK�5  J  -----   K �LL 
 - - - - -I MNM l     �4OP�4  O   replace text   P �QQ    r e p l a c e   t e x tN RSR l     �3�2�1�3  �2  �1  S TUT i  j mVWV I      �0X�/�0 0 _replacetext _replaceTextX YZY o      �.�. 0 thetext theTextZ [\[ o      �-�- 0 fortext forText\ ]�,] o      �+�+ 0 newtext newText�,  �/  W k    '^^ _`_ r     aba n    cdc 1    �*
�* 
txdld 1     �)
�) 
ascrb o      �(�( 0 oldtids oldTIDs` efe r    ghg o    �'�' 0 fortext forTexth n     iji 1    
�&
�& 
txdlj 1    �%
�% 
ascrf klk Z   mn�$om >    pqp l   r�#�"r I   �!st
�! .corecnte****       ****s J    uu v� v o    �� 0 newtext newText�   t �w�
� 
koclw m    �
� 
scpt�  �#  �"  q m    ��  n k    �xx yzy r    ;{|{ J    %}} ~~ J    ��   ��� m    �� � ��� n    #��� 1   ! #�
� 
leng� n    !��� 4    !��
� 
citm� m     �� � o    �� 0 thetext theText�  | J      �� ��� o      �� 0 
resultlist 
resultList� ��� o      �� 0 
startindex 
startIndex� ��� o      �� 0 endindex endIndex�  z ��� Z  < T����� B   < ?��� o   < =�� 0 
startindex 
startIndex� o   = >�� 0 endindex endIndex� r   B P��� n   B M��� 7  C M���
� 
ctxt� o   G I�
�
 0 
startindex 
startIndex� o   J L�	�	 0 endindex endIndex� o   B C�� 0 thetext theText� n      ���  ;   N O� o   M N�� 0 
resultlist 
resultList�  �  � ��� Y   U ������� k   e ��� ��� r   e j��� [   e h��� o   e f�� 0 endindex endIndex� m   f g�� � o      �� 0 
startindex 
startIndex� ��� r   k ���� \   k ~��� l  k n��� � n   k n��� 1   l n��
�� 
leng� o   k l���� 0 thetext theText�  �   � l  n }������ n   n }��� 1   { }��
�� 
leng� n   n {��� 7  o {����
�� 
ctxt� l  s v������ 4   s v���
�� 
citm� o   t u���� 0 i  ��  ��  � l  w z������ 4   w z���
�� 
citm� m   x y��������  ��  � o   n o���� 0 thetext theText��  ��  � o      ���� 0 endindex endIndex� ��� Z   � ������� B   � ���� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� r   � ���� n   � ���� 7  � �����
�� 
ctxt� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� o   � ����� 0 thetext theText� o      ���� 0 	foundtext 	foundText��  � r   � ���� m   � ��� ���  � o      ���� 0 	foundtext 	foundText� ��� Q   � ����� r   � ���� c   � ���� n  � ���� I   � �������� 0 replacetext replaceText� ���� o   � ����� 0 	foundtext 	foundText��  ��  � o   � ����� 0 newtext newText� m   � ���
�� 
ctxt� n      ���  ;   � �� o   � ����� 0 
resultlist 
resultList� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � R   � �����
�� .ascrerr ****      � ****� b   � ���� m   � ��� ��� � A n   e r r o r   o c c u r r e d   w h e n   c a l l i n g   t h e    r e p l a c i n g   w i t h    p a r a m e t e r  s    r e p l a c e T e x t    h a n d l e r :  � o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enumber eNumber� ����
�� 
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  � ��� r   � ���� [   � ���� o   � ����� 0 endindex endIndex� m   � ����� � o      ���� 0 
startindex 
startIndex� ��� r   � ���� \   � ���� [   � ���� o   � ����� 0 
startindex 
startIndex� l  � ������� n   � ���� 1   � ���
�� 
leng� n   � �� � 4   � ���
�� 
citm o   � ����� 0 i    o   � ����� 0 thetext theText��  ��  � m   � ����� � o      ���� 0 endindex endIndex� �� Z  � ����� B   � � o   � ����� 0 
startindex 
startIndex o   � ����� 0 endindex endIndex r   � � n   � �	
	 7  � ���
�� 
ctxt o   � ����� 0 
startindex 
startIndex o   � ����� 0 endindex endIndex
 o   � ����� 0 thetext theText n        ;   � � o   � ����� 0 
resultlist 
resultList��  ��  ��  � 0 i  � m   X Y���� � I  Y `����
�� .corecnte****       **** n   Y \ 2  Z \��
�� 
citm o   Y Z���� 0 thetext theText��  �  � �� r   � � m   � � �   n      1   � ���
�� 
txdl 1   � ���
�� 
ascr��  �$  o l  � k   �  l  � ��� ��     replace with text     �!! $   r e p l a c e   w i t h   t e x t "#" r   �$%$ n  �
&'& I  
��(���� "0 astextparameter asTextParameter( )*) o  ���� 0 newtext newText* +��+ m  ,, �--  r e p l a c i n g   w i t h��  ��  ' o   ����� 0 _support  % o      ���� 0 newtext newText# ./. l 0120 r  343 n 565 2 ��
�� 
citm6 o  ���� 0 thetext theText4 o      ���� 0 
resultlist 
resultList1 J D note: TID-based matching uses current considering/ignoring settings   2 �77 �   n o t e :   T I D - b a s e d   m a t c h i n g   u s e s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s/ 8��8 r  9:9 o  ���� 0 newtext newText: n     ;<; 1  ��
�� 
txdl< 1  ��
�� 
ascr��   * $ replace with callback-supplied text    �== H   r e p l a c e   w i t h   c a l l b a c k - s u p p l i e d   t e x tl >?> r  @A@ c  BCB o  ���� 0 
resultlist 
resultListC m  ��
�� 
ctxtA o      ���� 0 
resulttext 
resultText? DED r  $FGF o   ���� 0 oldtids oldTIDsG n     HIH 1  !#��
�� 
txdlI 1   !��
�� 
ascrE J��J L  %'KK o  %&���� 0 
resulttext 
resultText��  U LML l     ��������  ��  ��  M NON l     ��������  ��  ��  O PQP l     ��RS��  R  -----   S �TT 
 - - - - -Q UVU l     ��������  ��  ��  V WXW i  n qYZY I     ��[\
�� .Txt:Srchnull���     ctxt[ o      ���� 0 thetext theText\ ��]^
�� 
For_] o      ���� 0 fortext forText^ ��_`
�� 
Usin_ |����a��b��  ��  a o      ���� 0 matchformat matchFormat��  b l 
    c����c l     d����d m      ��
�� SerECmpI��  ��  ��  ��  ` ��ef
�� 
Reple |���g�~h��  �  g o      �}�} 0 newtext newText�~  h l     i�|�{i m      �z
�z 
msng�|  �{  f �yj�x
�y 
Retuj |�w�vk�ul�w  �v  k o      �t�t 0 resultformat resultFormat�u  l l     m�s�rm m      �q
�q RetEMatT�s  �r  �x  Z Q    bnopn k   Lqq rsr r    tut n   vwv I    �px�o�p "0 astextparameter asTextParameterx yzy o    	�n�n 0 thetext theTextz {�m{ m   	 
|| �}}  �m  �o  w o    �l�l 0 _support  u o      �k�k 0 thetext theTexts ~~ r    ��� n   ��� I    �j��i�j "0 astextparameter asTextParameter� ��� o    �h�h 0 fortext forText� ��g� m    �� ���  f o r�g  �i  � o    �f�f 0 _support  � o      �e�e 0 fortext forText ��� Z   8���d�c� =    $��� n   "��� 1     "�b
�b 
leng� o     �a�a 0 fortext forText� m   " #�`�`  � n  ' 4��� I   , 4�_��^�_ .0 throwinvalidparameter throwInvalidParameter� ��� o   , -�]�] 0 fortext forText� ��� m   - .�� ���  f o r� ��� m   . /�\
�\ 
ctxt� ��[� m   / 0�� ��� ( C a n  t   b e   e m p t y   t e x t .�[  �^  � o   ' ,�Z�Z 0 _support  �d  �c  � ��Y� Z   9L���X�� =  9 <��� o   9 :�W�W 0 newtext newText� m   : ;�V
�V 
msng� l  ?����� k   ?��� ��� Z   ? j���U�T� =   ? D��� n  ? B��� 1   @ B�S
�S 
leng� o   ? @�R�R 0 thetext theText� m   B C�Q�Q  � Z   G f���P�� =  G J��� o   G H�O�O 0 resultformat resultFormat� m   H I�N
�N RetEMatT� L   M P�� J   M O�M�M  �P  � L   S f�� J   S e�� ��L� K   S c�� �K��
�K 
pcls� o   T Y�J�J (0 _unmatchedtexttype _UnmatchedTextType� �I���I 0 
startindex 
startIndex� m   Z [�H�H � �G���G 0 endindex endIndex� m   \ ]�F�F  � �E��D�E 0 	foundtext 	foundText� m   ^ _�� ���  �D  �L  �U  �T  � ��� Z   k ������ =  k n��� o   k l�C�C 0 resultformat resultFormat� m   l m�B
�B RetEMatT� r   q ���� J   q u�� ��� m   q r�A
�A boovfals� ��@� m   r s�?
�? boovtrue�@  � J      �� ��� o      �>�> &0 includenonmatches includeNonMatches� ��=� o      �<�<  0 includematches includeMatches�=  � ��� =  � ���� o   � ��;�; 0 resultformat resultFormat� m   � ��:
�: RetEUmaT� ��� r   � ���� J   � ��� ��� m   � ��9
�9 boovtrue� ��8� m   � ��7
�7 boovfals�8  � J      �� ��� o      �6�6 &0 includenonmatches includeNonMatches� ��5� o      �4�4  0 includematches includeMatches�5  � ��� =  � ���� o   � ��3�3 0 resultformat resultFormat� m   � ��2
�2 RetEAllT� ��1� r   � ���� J   � ��� ��� m   � ��0
�0 boovtrue� ��/� m   � ��.
�. boovtrue�/  � J      �� ��� o      �-�- &0 includenonmatches includeNonMatches� ��,� o      �+�+  0 includematches includeMatches�,  �1  � n  � ���� I   � ��*��)�* >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ��(�( 0 resultformat resultFormat� ��'� m   � ��� ���  r e t u r n i n g�'  �)  � o   � ��&�& 0 _support  � ��%� Z   ���	 		� =  � �			 o   � ��$�$ 0 matchformat matchFormat	 m   � ��#
�# SerECmpI	  P   � �				 L   � �		 I   � ��"		�!�" 0 	_findtext 	_findText		 	
		
 o   � �� �  0 thetext theText	 			 o   � ��� 0 fortext forText	 			 o   � ��� &0 includenonmatches includeNonMatches	 	�	 o   � ���  0 includematches includeMatches�  �!  	 �	
� consdiac	 �	
� conshyph	 �	
� conspunc	 �	
� conswhit	 ��
� consnume�  	 ��
� conscase�  	 			 =  �			 o   � ��� 0 matchformat matchFormat	 m   � �
� SerECmpP	 			 L  		 I  �	�� 0 _findpattern _findPattern	 			 o  �� 0 thetext theText	 		 	 o  �� 0 fortext forText	  	!	"	! o  �� &0 includenonmatches includeNonMatches	" 	#�	# o  	��  0 includematches includeMatches�  �  	 	$	%	$ = 	&	'	& o  �
�
 0 matchformat matchFormat	' m  �	
�	 SerECmpC	% 	(	)	( P  +	*	+�	* L   *	,	, I   )�	-�� 0 	_findtext 	_findText	- 	.	/	. o  !"�� 0 thetext theText	/ 	0	1	0 o  "#�� 0 fortext forText	1 	2	3	2 o  #$�� &0 includenonmatches includeNonMatches	3 	4�	4 o  $%��  0 includematches includeMatches�  �  	+ � 	5
�  conscase	5 ��	6
�� consdiac	6 ��	7
�� conshyph	7 ��	8
�� conspunc	8 ��	9
�� conswhit	9 ����
�� consnume��  �  	) 	:	;	: = .3	<	=	< o  ./���� 0 matchformat matchFormat	= m  /2��
�� SerECmpE	; 	>	?	> P  6J	@	A	B	@ L  ?I	C	C I  ?H��	D���� 0 	_findtext 	_findText	D 	E	F	E o  @A���� 0 thetext theText	F 	G	H	G o  AB���� 0 fortext forText	H 	I	J	I o  BC���� &0 includenonmatches includeNonMatches	J 	K��	K o  CD����  0 includematches includeMatches��  ��  	A ��	L
�� conscase	L ��	M
�� consdiac	M ��	N
�� conshyph	N ��	O
�� conspunc	O ����
�� conswhit��  	B ����
�� consnume��  	? 	P	Q	P = MR	R	S	R o  MN���� 0 matchformat matchFormat	S m  NQ��
�� SerECmpD	Q 	T��	T k  U}	U	U 	V	W	V l Ur	X	Y	Z	X Z Ur	[	\����	[ = UZ	]	^	] o  UV���� 0 fortext forText	^ m  VY	_	_ �	`	`  	\ n ]n	a	b	a I  bn��	c���� .0 throwinvalidparameter throwInvalidParameter	c 	d	e	d o  bc���� 0 fortext forText	e 	f	g	f m  cf	h	h �	i	i  f o r	g 	j	k	j m  fg��
�� 
ctxt	k 	l��	l m  gj	m	m �	n	n ~ O n l y   c o n t a i n s   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r a t i o n s .��  ��  	b o  ]b���� 0 _support  ��  ��  	Y�� checks if all characters in forText are ignored by current considering/ignoring settings (the alternative would be to return each character as a non-match separated by a zero-length match, but that's probably not what the user intended); note that unlike `aString's length = 0`, which is what library code normally uses to check for empty text, on this occasion we do want to take into account the current considering/ignoring settings so deliberately use `forText is ""` here. For example, when ignoring punctuation, searching for the TID `"!?"` is no different to searching for `""`, because all of its characters are being ignored when comparing the text being searched against the text being searched for. Thus, a simple `forText is ""` test can be used to check in advance if the text contains any matchable characters under the current considering/ignoring settings, and report a meaningful error if not.   	Z �	o	o   c h e c k s   i f   a l l   c h a r a c t e r s   i n   f o r T e x t   a r e   i g n o r e d   b y   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   ( t h e   a l t e r n a t i v e   w o u l d   b e   t o   r e t u r n   e a c h   c h a r a c t e r   a s   a   n o n - m a t c h   s e p a r a t e d   b y   a   z e r o - l e n g t h   m a t c h ,   b u t   t h a t ' s   p r o b a b l y   n o t   w h a t   t h e   u s e r   i n t e n d e d ) ;   n o t e   t h a t   u n l i k e   ` a S t r i n g ' s   l e n g t h   =   0 ` ,   w h i c h   i s   w h a t   l i b r a r y   c o d e   n o r m a l l y   u s e s   t o   c h e c k   f o r   e m p t y   t e x t ,   o n   t h i s   o c c a s i o n   w e   d o   w a n t   t o   t a k e   i n t o   a c c o u n t   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   s o   d e l i b e r a t e l y   u s e   ` f o r T e x t   i s   " " `   h e r e .   F o r   e x a m p l e ,   w h e n   i g n o r i n g   p u n c t u a t i o n ,   s e a r c h i n g   f o r   t h e   T I D   ` " ! ? " `   i s   n o   d i f f e r e n t   t o   s e a r c h i n g   f o r   ` " " ` ,   b e c a u s e   a l l   o f   i t s   c h a r a c t e r s   a r e   b e i n g   i g n o r e d   w h e n   c o m p a r i n g   t h e   t e x t   b e i n g   s e a r c h e d   a g a i n s t   t h e   t e x t   b e i n g   s e a r c h e d   f o r .   T h u s ,   a   s i m p l e   ` f o r T e x t   i s   " " `   t e s t   c a n   b e   u s e d   t o   c h e c k   i n   a d v a n c e   i f   t h e   t e x t   c o n t a i n s   a n y   m a t c h a b l e   c h a r a c t e r s   u n d e r   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s ,   a n d   r e p o r t   a   m e a n i n g f u l   e r r o r   i f   n o t .	W 	p��	p L  s}	q	q I  s|��	r���� 0 	_findtext 	_findText	r 	s	t	s o  tu���� 0 thetext theText	t 	u	v	u o  uv���� 0 fortext forText	v 	w	x	w o  vw���� &0 includenonmatches includeNonMatches	x 	y��	y o  wx����  0 includematches includeMatches��  ��  ��  ��  	 n ��	z	{	z I  ����	|���� >0 throwinvalidconstantparameter throwInvalidConstantParameter	| 	}	~	} o  ������ 0 matchformat matchFormat	~ 	��	 m  ��	�	� �	�	� 
 u s i n g��  ��  	{ o  ������ 0 _support  �%  �   find matches   � �	�	�    f i n d   m a t c h e s�X  � l �L	�	�	�	� k  �L	�	� 	�	�	� Z ��	�	�����	� =  ��	�	�	� n ��	�	�	� 1  ����
�� 
leng	� o  ������ 0 thetext theText	� m  ������  	� L  ��	�	� m  ��	�	� �	�	�  ��  ��  	� 	���	� Z  �L	�	�	�	�	� = ��	�	�	� o  ������ 0 matchformat matchFormat	� m  ����
�� SerECmpI	� P  ��	�	�	�	� L  ��	�	� I  ����	����� 0 _replacetext _replaceText	� 	�	�	� o  ������ 0 thetext theText	� 	�	�	� o  ������ 0 fortext forText	� 	���	� o  ������ 0 newtext newText��  ��  	� ��	�
�� consdiac	� ��	�
�� conshyph	� ��	�
�� conspunc	� ��	�
�� conswhit	� ����
�� consnume��  	� ����
�� conscase��  	� 	�	�	� = ��	�	�	� o  ������ 0 matchformat matchFormat	� m  ����
�� SerECmpP	� 	�	�	� L  ��	�	� I  ����	����� "0 _replacepattern _replacePattern	� 	�	�	� o  ������ 0 thetext theText	� 	�	�	� o  ������ 0 fortext forText	� 	���	� o  ������ 0 newtext newText��  ��  	� 	�	�	� = ��	�	�	� o  ������ 0 matchformat matchFormat	� m  ����
�� SerECmpE	� 	�	�	� P  ��	�	�	�	� L  ��	�	� I  ����	����� 0 _replacetext _replaceText	� 	�	�	� o  ������ 0 thetext theText	� 	�	�	� o  ������ 0 fortext forText	� 	���	� o  ������ 0 newtext newText��  ��  	� ��	�
�� conscase	� ��	�
�� consdiac	� ��	�
�� conshyph	� ��	�
�� conspunc	� ����
�� conswhit��  	� ����
�� consnume��  	� 	�	�	� = ��	�	�	� o  ������ 0 matchformat matchFormat	� m  ����
�� SerECmpC	� 	�	�	� P  �
	�	���	� L   		�	� I   ��	����� 0 _replacetext _replaceText	� 	�	�	� o  ���� 0 thetext theText	� 	�	�	� o  ���� 0 fortext forText	� 	���	� o  ���� 0 newtext newText��  ��  	� ��	�
�� conscase	� ��	�
�� consdiac	� ��	�
�� conshyph	� ��	�
�� conspunc	� ��	�
�� conswhit	� ����
�� consnume��  ��  	� 	�	�	� = 	�	�	� o  ���� 0 matchformat matchFormat	� m  ��
�� SerECmpD	� 	���	� k  <	�	� 	�	�	� Z 2	�	�����	� = 	�	�	� o  ���� 0 fortext forText	� m  	�	� �	�	�  	� n .	�	�	� I  ".��	����� .0 throwinvalidparameter throwInvalidParameter	� 	�	�	� o  "#���� 0 fortext forText	� 	�	�	� m  #&	�	� �	�	�  f o r	� 	�	�	� m  &'��
�� 
ctxt	� 	���	� m  '*	�	� �	�	� ~ O n l y   c o n t a i n s   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r a t i o n s .��  ��  	� o  "���� 0 _support  ��  ��  	� 	���	� L  3<	�	� I  3;��	����� 0 _replacetext _replaceText	� 	�	�	� o  45���� 0 thetext theText	� 	�	�	� o  56���� 0 fortext forText	� 	���	� o  67�� 0 newtext newText��  ��  ��  ��  	� n ?L
 

  I  DL�~
�}�~ >0 throwinvalidconstantparameter throwInvalidConstantParameter
 


 o  DE�|�| 0 matchformat matchFormat
 
�{
 m  EH

 �

 
 u s i n g�{  �}  
 o  ?D�z�z 0 _support  ��  	�   replace matches   	� �

     r e p l a c e   m a t c h e s�Y  o R      �y
	


�y .ascrerr ****      � ****
	 o      �x�x 0 etext eText

 �w


�w 
errn
 o      �v�v 0 enumber eNumber
 �u


�u 
erob
 o      �t�t 0 efrom eFrom
 �s
�r
�s 
errt
 o      �q�q 
0 eto eTo�r  p I  Tb�p
�o�p 
0 _error  
 


 m  UX

 �

  s e a r c h   t e x t
 


 o  XY�n�n 0 etext eText
 


 o  YZ�m�m 0 enumber eNumber
 


 o  Z[�l�l 0 efrom eFrom
 
�k
 o  [\�j�j 
0 eto eTo�k  �o  X 


 l     �i�h�g�i  �h  �g  
 


 l     �f�e�d�f  �e  �d  
 
 
!
  i  r u
"
#
" I     �c
$�b
�c .Txt:EPatnull���     ctxt
$ o      �a�a 0 thetext theText�b  
# Q     *
%
&
'
% L    
(
( c    
)
*
) l   
+�`�_
+ n   
,
-
, I    �^
.�]�^ 40 escapedpatternforstring_ escapedPatternForString_
. 
/�\
/ l   
0�[�Z
0 n   
1
2
1 I    �Y
3�X�Y "0 astextparameter asTextParameter
3 
4
5
4 o    �W�W 0 thetext theText
5 
6�V
6 m    
7
7 �
8
8  �V  �X  
2 o    �U�U 0 _support  �[  �Z  �\  �]  
- n   
9
:
9 o    �T�T *0 nsregularexpression NSRegularExpression
: m    �S
�S misccura�`  �_  
* m    �R
�R 
ctxt
& R      �Q
;
<
�Q .ascrerr ****      � ****
; o      �P�P 0 etext eText
< �O
=
>
�O 
errn
= o      �N�N 0 enumber eNumber
> �M
?
@
�M 
erob
? o      �L�L 0 efrom eFrom
@ �K
A�J
�K 
errt
A o      �I�I 
0 eto eTo�J  
' I     *�H
B�G�H 
0 _error  
B 
C
D
C m   ! "
E
E �
F
F  e s c a p e   p a t t e r n
D 
G
H
G o   " #�F�F 0 etext eText
H 
I
J
I o   # $�E�E 0 enumber eNumber
J 
K
L
K o   $ %�D�D 0 efrom eFrom
L 
M�C
M o   % &�B�B 
0 eto eTo�C  �G  
! 
N
O
N l     �A�@�?�A  �@  �?  
O 
P
Q
P l     �>�=�<�>  �=  �<  
Q 
R
S
R i  v y
T
U
T I     �;
V�:
�; .Txt:ETemnull���     ctxt
V o      �9�9 0 thetext theText�:  
U Q     -
W
X
Y
W L    
Z
Z I    �8
[�7�8 0 	_jointext 	_joinText
[ 
\
]
\ I    �6
^�5�6 0 
_splittext 
_splitText
^ 
_
`
_ n   
a
b
a I   
 �4
c�3�4 "0 astextparameter asTextParameter
c 
d
e
d o   
 �2�2 0 thetext theText
e 
f�1
f m    
g
g �
h
h  �1  �3  
b o    
�0�0 0 _support  
` 
i�/
i m    
j
j �
k
k  \�/  �5  
] 
l�.
l m    
m
m �
n
n  \ \�.  �7  
X R      �-
o
p
�- .ascrerr ****      � ****
o o      �,�, 0 etext eText
p �+
q
r
�+ 
errn
q o      �*�* 0 enumber eNumber
r �)
s
t
�) 
erob
s o      �(�( 0 efrom eFrom
t �'
u�&
�' 
errt
u o      �%�% 
0 eto eTo�&  
Y I   # -�$
v�#�$ 
0 _error  
v 
w
x
w m   $ %
y
y �
z
z  e s c a p e   t e m p l a t e
x 
{
|
{ o   % &�"�" 0 etext eText
| 
}
~
} o   & '�!�! 0 enumber eNumber
~ 

�
 o   ' (� �  0 efrom eFrom
� 
��
� o   ( )�� 
0 eto eTo�  �#  
S 
�
�
� l     ����  �  �  
� 
�
�
� l     ����  �  �  
� 
�
�
� l     �
�
��  
� J D--------------------------------------------------------------------   
� �
�
� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
� 
�
�
� l     �
�
��  
�   Conversion Suite   
� �
�
� "   C o n v e r s i o n   S u i t e
� 
�
�
� l     ����  �  �  
� 
�
�
� i  z }
�
�
� I     �
�
�
� .Txt:UppTnull���     ctxt
� o      �� 0 thetext theText
� �
��
� 
Loca
� |��
��
��  �  
� o      �� 0 
localecode 
localeCode�  
� m      �

�
 
msng�  
� Q     P
�
�
�
� k    >
�
� 
�
�
� r    
�
�
� n   
�
�
� I    �	
���	 0 
asnsstring 
asNSString
� 
��
� n   
�
�
� I    �
��� "0 astextparameter asTextParameter
� 
�
�
� o    �� 0 thetext theText
� 
��
� m    
�
� �
�
�  �  �  
� o    �� 0 _support  �  �  
� o    �� 0 _support  
� o      � �  0 
asocstring 
asocString
� 
���
� Z    >
�
���
�
� =   
�
�
� o    ���� 0 
localecode 
localeCode
� m    ��
�� 
msng
� L     (
�
� c     '
�
�
� l    %
�����
� n    %
�
�
� I   ! %�������� "0 uppercasestring uppercaseString��  ��  
� o     !���� 0 
asocstring 
asocString��  ��  
� m   % &��
�� 
ctxt��  
� L   + >
�
� c   + =
�
�
� l  + ;
�����
� n  + ;
�
�
� I   , ;��
����� 80 uppercasestringwithlocale_ uppercaseStringWithLocale_
� 
���
� l  , 7
�����
� n  , 7
�
�
� I   1 7��
����� *0 asnslocaleparameter asNSLocaleParameter
� 
�
�
� o   1 2���� 0 
localecode 
localeCode
� 
���
� m   2 3
�
� �
�
�  f o r   l o c a l e��  ��  
� o   , 1���� 0 _support  ��  ��  ��  ��  
� o   + ,���� 0 
asocstring 
asocString��  ��  
� m   ; <��
�� 
ctxt��  
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
� o      ���� 0 enumber eNumber
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
� I   F P��
����� 
0 _error  
� 
�
�
� m   G H
�
� �
�
�  u p p e r c a s e   t e x t
� 
�
�
� o   H I���� 0 etext eText
� 
�
�
� o   I J���� 0 enumber eNumber
� 
�
�
� o   J K���� 0 efrom eFrom
� 
���
� o   K L���� 
0 eto eTo��  ��  
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� i  ~ �
�
�
� I     ��
�
�
�� .Txt:CapTnull���     ctxt
� o      ���� 0 thetext theText
� ��
���
�� 
Loca
� |����
���
���  ��  
� o      ���� 0 
localecode 
localeCode��  
� m      ��
�� 
msng��  
� Q     P
�
�
�
� k    >
�
� 
�
�
� r    
�
�
� n   
�
�
� I    ��
����� 0 
asnsstring 
asNSString
� 
���
� n   
�
�
� I    ��
����� "0 astextparameter asTextParameter
� 
�
�
� o    ���� 0 thetext theText
� 
���
� m    
�
� �
�
�  ��  ��  
� o    ���� 0 _support  ��  ��  
� o    ���� 0 _support  
� o      ���� 0 
asocstring 
asocString
�  ��  Z    >�� =    o    ���� 0 
localecode 
localeCode m    ��
�� 
msng L     ( c     ' l    %	����	 n    %

 I   ! %�������� &0 capitalizedstring capitalizedString��  ��   o     !���� 0 
asocstring 
asocString��  ��   m   % &��
�� 
ctxt��   L   + > c   + = l  + ;���� n  + ; I   , ;������ <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_ �� l  , 7���� n  , 7 I   1 7������ *0 asnslocaleparameter asNSLocaleParameter  o   1 2���� 0 
localecode 
localeCode �� m   2 3 �  f o r   l o c a l e��  ��   o   , 1���� 0 _support  ��  ��  ��  ��   o   + ,���� 0 
asocstring 
asocString��  ��   m   ; <��
�� 
ctxt��  
� R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText �� 
�� 
errn o      ���� 0 enumber eNumber  ��!"
�� 
erob! o      ���� 0 efrom eFrom" ��#��
�� 
errt# o      ���� 
0 eto eTo��  
� I   F P��$���� 
0 _error  $ %&% m   G H'' �((  c a p i t a l i z e   t e x t& )*) o   H I���� 0 etext eText* +,+ o   I J���� 0 enumber eNumber, -.- o   J K���� 0 efrom eFrom. /��/ o   K L���� 
0 eto eTo��  ��  
� 010 l     ��������  ��  ��  1 232 l     ��������  ��  ��  3 454 i  � �676 I     ��89
�� .Txt:LowTnull���     ctxt8 o      ���� 0 thetext theText9 ��:��
�� 
Loca: |����;��<��  ��  ; o      ���� 0 
localecode 
localeCode��  < m      ��
�� 
msng��  7 Q     P=>?= k    >@@ ABA r    CDC n   EFE I    ��G���� 0 
asnsstring 
asNSStringG H��H n   IJI I    ��K���� "0 astextparameter asTextParameterK LML o    ���� 0 thetext theTextM N�N m    OO �PP  �  ��  J o    �~�~ 0 _support  ��  ��  F o    �}�} 0 _support  D o      �|�| 0 
asocstring 
asocStringB Q�{Q Z    >RS�zTR =   UVU o    �y�y 0 
localecode 
localeCodeV m    �x
�x 
msngS L     (WW c     'XYX l    %Z�w�vZ n    %[\[ I   ! %�u�t�s�u "0 lowercasestring lowercaseString�t  �s  \ o     !�r�r 0 
asocstring 
asocString�w  �v  Y m   % &�q
�q 
ctxt�z  T L   + >]] c   + =^_^ l  + ;`�p�o` n  + ;aba I   , ;�nc�m�n 80 lowercasestringwithlocale_ lowercaseStringWithLocale_c d�ld l  , 7e�k�je n  , 7fgf I   1 7�ih�h�i *0 asnslocaleparameter asNSLocaleParameterh iji o   1 2�g�g 0 
localecode 
localeCodej k�fk m   2 3ll �mm  f o r   l o c a l e�f  �h  g o   , 1�e�e 0 _support  �k  �j  �l  �m  b o   + ,�d�d 0 
asocstring 
asocString�p  �o  _ m   ; <�c
�c 
ctxt�{  > R      �bno
�b .ascrerr ****      � ****n o      �a�a 0 etext eTexto �`pq
�` 
errnp o      �_�_ 0 enumber eNumberq �^rs
�^ 
erobr o      �]�] 0 efrom eFroms �\t�[
�\ 
errtt o      �Z�Z 
0 eto eTo�[  ? I   F P�Yu�X�Y 
0 _error  u vwv m   G Hxx �yy  l o w e r c a s e   t e x tw z{z o   H I�W�W 0 etext eText{ |}| o   I J�V�V 0 enumber eNumber} ~~ o   J K�U�U 0 efrom eFrom ��T� o   K L�S�S 
0 eto eTo�T  �X  5 ��� l     �R�Q�P�R  �Q  �P  � ��� l     �O�N�M�O  �N  �M  � ��� i  � ���� I     �L��
�L .Txt:FTxtnull���     ctxt� o      �K�K 0 templatetext templateText� �J��I
�J 
Usin� |�H�G��F��H  �G  � o      �E�E 0 	thevalues 	theValues�F  � J      �D�D  �I  � Q     ����� P    ����� k    ��� ��� r    ��� I    �C��B�C ,0 _parseformattemplate _parseFormatTemplate� ��A� n  	 ��� I    �@��?�@ "0 astextparameter asTextParameter� ��� o    �>�> 0 templatetext templateText� ��=� m    �� ���  �=  �?  � o   	 �<�< 0 _support  �A  �B  � o      �;�; 0 templateitems templateItems� ��� r    ��� m    �:�: � o      �9�9 0 i  � ��� Q    ����� Z   " ����8�� =   " -��� l  " +��7�6� I  " +�5��
�5 .corecnte****       ****� J   " %�� ��4� o   " #�3�3 0 	thevalues 	theValues�4  � �2��1
�2 
kocl� m   & '�0
�0 
scpt�1  �7  �6  � m   + ,�/�/ � l  0 S���� Y   0 S��.���� r   = N��� c   = I��� n  = G��� I   > G�-��,�- 0 getitem getItem� ��+� e   > C�� n   > C��� 4   ? B�*�
�* 
cobj� o   @ A�)�) 0 i  � o   > ?�(�( 0 templateitems templateItems�+  �,  � o   = >�'�' 0 	thevalues 	theValues� m   G H�&
�& 
ctxt� n      ��� 4   J M�%�
�% 
cobj� o   K L�$�$ 0 i  � o   I J�#�# 0 templateitems templateItems�. 0 i  � m   3 4�"�" � n  4 8��� 1   5 7�!
�! 
leng� o   4 5� �  0 templateitems templateItems� m   8 9�� � S M assume it's a script object with getItem handler (e.g. DictionaryCollection)   � ��� �   a s s u m e   i t ' s   a   s c r i p t   o b j e c t   w i t h   g e t I t e m   h a n d l e r   ( e . g .   D i c t i o n a r y C o l l e c t i o n )�8  � l  V ����� k   V ��� ��� r   V c��� n  V a��� I   [ a���� "0 aslistparameter asListParameter� ��� o   [ \�� 0 	thevalues 	theValues� ��� m   \ ]�� ��� 
 u s i n g�  �  � o   V [�� 0 _support  � o      �� 0 	thevalues 	theValues� ��� Y   d ������� r   q ���� c   q ~��� l  q |���� e   q |�� n  q |��� 4   r {��
� 
cobj� l  s z���� c   s z��� l  s x���� e   s x�� n   s x��� 4   t w��
� 
cobj� o   u v�� 0 i  � o   s t�� 0 templateitems templateItems�  �  � m   x y�
� 
long�  �  � o   q r�� 0 	thevalues 	theValues�  �  � m   | }�

�
 
ctxt� n      ��� 4    ��	�
�	 
cobj� o   � ��� 0 i  � o   ~ �� 0 templateitems templateItems� 0 i  � m   g h�� � n  h l��� 1   i k�
� 
leng� o   h i�� 0 templateitems templateItems� m   l m�� �  � * $ it's a list (or a single-item list)   � ��� H   i t ' s   a   l i s t   ( o r   a   s i n g l e - i t e m   l i s t )� R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� � ��
�  
errn� o      ���� 0 enumber eNumber� �� 
�� 
erob  o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � R   � ���
�� .ascrerr ****      � **** b   � � b   � � b   � �	
	 m   � � � : C a n  t   s u b s i t u t e   p l a c e h o l d e r   
 n   � � 4   � ���
�� 
cobj o   � ����� 0 i   o   � ����� 0 templateitems templateItems m   � � �   :   o   � ����� 0 etext eText ��
�� 
errn o   � ����� 0 enumber eNumber ��
�� 
erob o   � ����� 0 efrom eFrom ����
�� 
errt o   � ����� 
0 eto eTo��  � �� L   � � I   � ������� 0 	_jointext 	_joinText  o   � ����� 0 templateitems templateItems �� m   � � �  ��  ��  ��  � ��
�� conscase �� 
�� consdiac  ��!
�� conshyph! ��"
�� conspunc" ����
�� conswhit��  � ����
�� consnume��  � R      ��#$
�� .ascrerr ****      � ****# o      ���� 0 etext eText$ ��%&
�� 
errn% o      ���� 0 enumber eNumber& ��'(
�� 
erob' o      ���� 0 efrom eFrom( ��)��
�� 
errt) o      ���� 
0 eto eTo��  � I   � ���*���� 
0 _error  * +,+ m   � �-- �..  f o r m a t   t e x t, /0/ o   � ����� 0 etext eText0 121 o   � ����� 0 enumber eNumber2 343 o   � ����� 0 efrom eFrom4 5��5 o   � ����� 
0 eto eTo��  ��  � 676 l     ��������  ��  ��  7 898 l     ��������  ��  ��  9 :;: i  � �<=< I     ��>?
�� .Txt:Normnull���     ctxt> o      ���� 0 thetext theText? ��@A
�� 
NoFo@ |����B��C��  ��  B o      ���� 0 nopts nOpts��  C J      DD E��E m      ��
�� LiBrLiOX��  A ��F��
�� 
LocaF |����G��H��  ��  G o      ���� 0 
localecode 
localeCode��  H l     I����I m      JJ �KK  n o n e��  ��  ��  = Q    LMNL k   iOO PQP r    RSR n   TUT I    ��V���� "0 astextparameter asTextParameterV WXW o    	���� 0 thetext theTextX Y��Y m   	 
ZZ �[[  ��  ��  U o    ���� 0 _support  S o      ���� 0 thetext theTextQ \]\ r    ^_^ n   `a` I    ��b���� "0 aslistparameter asListParameterb cdc o    ���� 0 nopts nOptsd e��e m    ff �gg 
 u s i n g��  ��  a o    ���� 0 _support  _ o      ���� 0 nopts nOpts] hih l   ��jk��  j   common case shortcuts   k �ll ,   c o m m o n   c a s e   s h o r t c u t si mnm Z   -op����o =    $qrq n   "sts 1     "��
�� 
lengt o     ���� 0 thetext theTextr m   " #����  p L   ' )uu m   ' (vv �ww  ��  ��  n xyx Z  . Dz{����z =  . 3|}| o   . /���� 0 nopts nOpts} J   / 2~~ �� m   / 0��
�� LiBrLiOX��  { L   6 @�� I   6 ?������� 0 	_jointext 	_joinText� ��� n  7 :��� 2  8 :��
�� 
cpar� o   7 8���� 0 thetext theText� ���� 1   : ;��
�� 
lnfd��  ��  ��  ��  y ��� Z  E R������� =  E I��� o   E F���� 0 nopts nOpts� J   F H����  � L   L N�� o   L M���� 0 thetext theText��  ��  � ��� l  S S������  � &   else fully process options list   � ��� @   e l s e   f u l l y   p r o c e s s   o p t i o n s   l i s t� ��� Q   Sb���� k   VG�� ��� Z   V g������ E  V [��� o   V W���� 0 nopts nOpts� J   W Z�� ���� m   W X��
�� LiBrLiOX��  � r   ^ a��� 1   ^ _��
�� 
lnfd� o      ���� 0 	linebreak 	lineBreak��  � r   d g��� m   d e��
�� 
msng� o      ���� 0 	linebreak 	lineBreak� ��� Z   h �������� E  h m��� o   h i���� 0 nopts nOpts� J   i l�� ���� m   i j��
�� LiBrLiCM��  � k   p ��� ��� Z  p �������� >  p s��� o   p q���� 0 	linebreak 	lineBreak� m   q r��
�� 
msng� R   v |����
�� .ascrerr ****      � ****� m   z {�� ��� > C o n f l i c t i n g   l i n e   b r e a k   o p t i o n s .� �����
�� 
errn� m   x y����f��  ��  ��  � ��� Z  � �������� =   � ���� n  � ���� 1   � ��
� 
leng� o   � ��~�~ 0 nopts nOpts� m   � ��}�} � L   � ��� I   � ��|��{�| 0 	_jointext 	_joinText� ��� n  � ���� 2  � ��z
�z 
cpar� o   � ��y�y 0 thetext theText� ��x� o   � ��w
�w 
ret �x  �{  ��  ��  � ��v� r   � ���� o   � ��u
�u 
ret � o      �t�t 0 	linebreak 	lineBreak�v  ��  ��  � ��� Z   � ����s�r� E  � ���� o   � ��q�q 0 nopts nOpts� J   � ��� ��p� m   � ��o
�o LiBrLiWi�p  � k   � ��� ��� Z  � ����n�m� >  � ���� o   � ��l�l 0 	linebreak 	lineBreak� m   � ��k
�k 
msng� R   � ��j��
�j .ascrerr ****      � ****� m   � ��� ��� > C o n f l i c t i n g   l i n e   b r e a k   o p t i o n s .� �i��h
�i 
errn� m   � ��g�gf�h  �n  �m  � ��� Z  � ����f�e� =   � ���� n  � ���� 1   � ��d
�d 
leng� o   � ��c�c 0 nopts nOpts� m   � ��b�b � L   � ��� I   � ��a��`�a 0 	_jointext 	_joinText� ��� n  � ���� 2  � ��_
�_ 
cpar� o   � ��^�^ 0 thetext theText� ��]� b   � ���� o   � ��\
�\ 
ret � 1   � ��[
�[ 
lnfd�]  �`  �f  �e  � ��Z� r   � ���� b   � ���� o   � ��Y
�Y 
ret � 1   � ��X
�X 
lnfd� o      �W�W 0 	linebreak 	lineBreak�Z  �s  �r  � ��� r   � ���� n  � ���� I   � ��V��U�V 0 
asnsstring 
asNSString� ��T� o   � ��S�S 0 thetext theText�T  �U  � o   � ��R�R 0 _support  � o      �Q�Q 0 
asocstring 
asocString� ��� l  � ��P �P    , & fold case, diacriticals, and/or width    � L   f o l d   c a s e ,   d i a c r i t i c a l s ,   a n d / o r   w i d t h�  r   � � m   � ��O�O   o      �N�N 0 foldingflags foldingFlags  Z  �	
�M�L	 E  � � o   � ��K�K 0 nopts nOpts J   � � �J m   � ��I
�I NoFoNoCa�J  
 r   �  [   � � o   � ��H�H 0 foldingflags foldingFlags m   � ��G�G  o      �F�F 0 foldingflags foldingFlags�M  �L    Z �E�D E  o  �C�C 0 nopts nOpts J   �B m  	�A
�A NoFoNoDi�B   r   [   o  �@�@ 0 foldingflags foldingFlags m  �?�? � o      �>�> 0 foldingflags foldingFlags�E  �D     Z 0!"�=�<! E "#$# o  �;�; 0 nopts nOpts$ J  !%% &�:& m  �9
�9 NoFoNoWi�:  " r  %,'(' [  %*)*) o  %&�8�8 0 foldingflags foldingFlags* m  &)�7�7 ( o      �6�6 0 foldingflags foldingFlags�=  �<    +,+ Z 1P-.�5�4- >  14/0/ o  12�3�3 0 foldingflags foldingFlags0 m  23�2�2  . r  7L121 n 7J343 I  8J�15�0�1 H0 "stringbyfoldingwithoptions_locale_ "stringByFoldingWithOptions_locale_5 676 o  89�/�/ 0 foldingflags foldingFlags7 8�.8 l 9F9�-�,9 n 9F:;: I  >F�+<�*�+ *0 asnslocaleparameter asNSLocaleParameter< =>= o  >?�)�) 0 
localecode 
localeCode> ?�(? m  ?B@@ �AA  f o r   l o c a l e�(  �*  ; o  9>�'�' 0 _support  �-  �,  �.  �0  4 o  78�&�& 0 
asocstring 
asocString2 o      �%�% 0 
asocstring 
asocString�5  �4  , BCB l QQ�$DE�$  D !  normalize white space runs   E �FF 6   n o r m a l i z e   w h i t e   s p a c e   r u n sC GHG Z  QIJK�#I E QXLML o  QR�"�" 0 nopts nOptsM J  RWNN O�!O m  RU� 
�  NoFoNoSp�!  J k  [�PP QRQ l [ySTUS r  [yVWV n [wXYX I  \w�Z�� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_Z [\[ m  \_]] �^^ ^ \ A ( ? : \ u 2 0 2 8 | \ u 2 0 2 9 | \ s ) + | ( ? : \ u 2 0 2 8 | \ u 2 0 2 9 | \ s ) + \ z\ _`_ m  _baa �bb  ` cdc l bie��e n bifgf o  ei�� 60 nsregularexpressionsearch NSRegularExpressionSearchg m  be�
� misccura�  �  d h�h J  iqii jkj m  ij��  k l�l n jomnm I  ko���� 
0 length  �  �  n o  jk�� 0 
asocstring 
asocString�  �  �  Y o  [\�� 0 
asocstring 
asocStringW o      �� 0 
asocstring 
asocStringT ( " trim leading/trailing white space   U �oo D   t r i m   l e a d i n g / t r a i l i n g   w h i t e   s p a c eR p�p Z  z�qr�sq = z}tut o  z{�� 0 	linebreak 	lineBreaku m  {|�
� 
msngr l ��vwxv r  ��yzy n ��{|{ I  ���}�� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_} ~~ m  ���� ��� @ ( ? : \ r \ n | \ r | \ n | \ u 2 0 2 8 | \ u 2 0 2 9 | \ s ) + ��� 1  ���

�
 
spac� ��� l ����	�� n ����� o  ���� 60 nsregularexpressionsearch NSRegularExpressionSearch� m  ���
� misccura�	  �  � ��� J  ���� ��� m  ����  � ��� n ����� I  ����� � 
0 length  �  �   � o  ������ 0 
asocstring 
asocString�  �  �  | o  ������ 0 
asocstring 
asocStringz o      ���� 0 
asocstring 
asocStringw b \ also convert line breaks (including Unicode line and paragraph separators) to single spaces   x ��� �   a l s o   c o n v e r t   l i n e   b r e a k s   ( i n c l u d i n g   U n i c o d e   l i n e   a n d   p a r a g r a p h   s e p a r a t o r s )   t o   s i n g l e   s p a c e s�  s l ������ k  ���� ��� r  ����� n ����� I  ��������� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m  ���� ��� N ( ? : \ s * ( ? : \ r \ n | \ r | \ n | \ u 2 0 2 8 | \ u 2 0 2 9 ) ) + \ s *� ��� o  ������ 0 	linebreak 	lineBreak� ��� l �������� n ����� o  ������ 60 nsregularexpressionsearch NSRegularExpressionSearch� m  ����
�� misccura��  ��  � ���� J  ���� ��� m  ������  � ���� n ����� I  ���������� 
0 length  ��  ��  � o  ������ 0 
asocstring 
asocString��  ��  ��  � o  ������ 0 
asocstring 
asocString� o      ���� 0 
asocstring 
asocString� ���� r  ����� n ����� I  ��������� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m  ���� ���  [ \ f \ t \ p { Z } ] +� ��� 1  ����
�� 
spac� ��� l �������� n ����� o  ������ 60 nsregularexpressionsearch NSRegularExpressionSearch� m  ����
�� misccura��  ��  � ���� J  ���� ��� m  ������  � ���� n ����� I  ���������� 
0 length  ��  ��  � o  ������ 0 
asocstring 
asocString��  ��  ��  � o  ������ 0 
asocstring 
asocString� o      ���� 0 
asocstring 
asocString��  � � � convert line break runs (including any other white space) to single `lineBreak`, and any other white space runs (tabs, spaces, etc) to single spaces   � ���*   c o n v e r t   l i n e   b r e a k   r u n s   ( i n c l u d i n g   a n y   o t h e r   w h i t e   s p a c e )   t o   s i n g l e   ` l i n e B r e a k ` ,   a n d   a n y   o t h e r   w h i t e   s p a c e   r u n s   ( t a b s ,   s p a c e s ,   e t c )   t o   s i n g l e   s p a c e s�  K ��� > ����� o  ������ 0 	linebreak 	lineBreak� m  ����
�� 
msng� ���� l ����� r  ���� n ����� I  ��������� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m  ���� ��� 0 \ r \ n | \ r | \ n | \ u 2 0 2 8 | \ u 2 0 2 9� ��� o  ������ 0 	linebreak 	lineBreak� ��� l �������� n ����� o  ������ 60 nsregularexpressionsearch NSRegularExpressionSearch� m  ����
�� misccura��  ��  � ���� J  ���� ��� m  ������  � ���� n ����� I  ���������� 
0 length  ��  ��  � o  ������ 0 
asocstring 
asocString��  ��  ��  � o  ������ 0 
asocstring 
asocString� o      ���� 0 
asocstring 
asocString�   standardize line breaks   � ��� 0   s t a n d a r d i z e   l i n e   b r e a k s��  �#  H ��� l ������  � 8 2 apply punctuation, ASCII-only transforms (10.11+)   � ��� d   a p p l y   p u n c t u a t i o n ,   A S C I I - o n l y   t r a n s f o r m s   ( 1 0 . 1 1 + )� ��� Z  ������� E ��� o  ���� 0 nopts nOpts� J  �� ���� m  
��
�� NoFoNoSP��  � k  @�� ��� Z 4������� G  %��� E ��� o  ���� 0 nopts nOpts� J  �� ���� m  ��
�� NoFoNoTP��  � E !   o  ���� 0 nopts nOpts J    �� m  ��
�� NoFoNoAO��  � R  (0��
�� .ascrerr ****      � **** m  ,/ � J C o n f l i c t i n g   p u n c t u a t i o n / A S C I I   o p t i o n s ����
�� 
errn m  *+����f��  ��  ��  � 	��	 r  5@

 n 5> I  6>������ H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_  l 69���� m  69 �  A n y - P u b l i s h i n g��  ��   �� m  9:��
�� boovfals��  ��   o  56���� 0 
asocstring 
asocString o      ���� 0 
asocstring 
asocString��  �  E CJ o  CD���� 0 nopts nOpts J  DI �� m  DG��
�� NoFoNoTP��    k  Mo  Z Mc !����  E MT"#" o  MN���� 0 nopts nOpts# J  NS$$ %��% m  NQ��
�� NoFoNoAO��  ! R  W_��&'
�� .ascrerr ****      � ****& m  [^(( �)) L C o n f l i c t i n g   p u n c t u a t i o n / A S C I I   o p t i o n s .' ��*��
�� 
errn* m  YZ����f��  ��  ��   +��+ r  do,-, n dm./. I  em��0���� H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_0 121 l eh3����3 m  eh44 �55  P u b l i s h i n g - A n y��  ��  2 6��6 m  hi��
�� boovfals��  ��  / o  de���� 0 
asocstring 
asocString- o      ���� 0 
asocstring 
asocString��   787 E ry9:9 o  rs���� 0 nopts nOpts: J  sx;; <��< m  sv��
�� NoFoNoAO��  8 =��= k  |�>> ?@? r  |�ABA n |�CDC I  }���E���� H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_E FGF l }�H����H m  }�II �JJ * A n y - L a t i n ; L a t i n - A S C I I��  ��  G K��K m  ����
�� boovfals��  ��  D o  |}���� 0 
asocstring 
asocStringB o      ���� 0 
asocstring 
asocString@ L��L r  ��MNM n ��OPO I  ����Q���� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_Q RSR m  ��TT �UU , [ ^ \ r \ n \ t \ u 0 0 2 0 - \ u 0 0 7 e ]S VWV m  ��XX �YY  ?W Z[Z l ��\����\ n ��]^] o  ������ 60 nsregularexpressionsearch NSRegularExpressionSearch^ m  ����
�� misccura��  ��  [ _��_ J  ��`` aba m  ������  b c��c n ��ded I  ���������� 
0 length  ��  ��  e o  ������ 0 
asocstring 
asocString��  ��  ��  P o  ���� 0 
asocstring 
asocStringN o      �~�~ 0 
asocstring 
asocString��  ��  ��  � fgf l ���}hi�}  h 6 0 convert to specified Unicode normalization form   i �jj `   c o n v e r t   t o   s p e c i f i e d   U n i c o d e   n o r m a l i z a t i o n   f o r mg klk Z  ��mn�|om E ��pqp o  ���{�{ 0 nopts nOptsq J  ��rr s�zs m  ���y
�y NoFoNo_C�z  n k  ��tt uvu r  ��wxw n ��yzy I  ���x�w�v�x N0 %precomposedstringwithcanonicalmapping %precomposedStringWithCanonicalMapping�w  �v  z o  ���u�u 0 
asocstring 
asocStringx o      �t�t 0 
asocstring 
asocStringv {�s{ r  ��|}| m  ���r
�r boovtrue} o      �q�q 0 didnormalize didNormalize�s  �|  o r  ��~~ m  ���p
�p boovfals o      �o�o 0 didnormalize didNormalizel ��� Z  �����n�m� E ����� o  ���l�l 0 nopts nOpts� J  ���� ��k� m  ���j
�j NoFoNo_D�k  � k  ���� ��� Z �����i�h� o  ���g�g 0 didnormalize didNormalize� R  ���f��
�f .ascrerr ****      � ****� m  ���� ��� 8 C o n f l i c t i n g   U n i c o d e   o p t i o n s .� �e��d
�e 
errn� m  ���c�cf�d  �i  �h  � ��� r  ����� n ����� I  ���b�a�`�b L0 $decomposedstringwithcanonicalmapping $decomposedStringWithCanonicalMapping�a  �`  � o  ���_�_ 0 
asocstring 
asocString� o      �^�^ 0 
asocstring 
asocString� ��]� r  ����� m  ���\
�\ boovtrue� o      �[�[ 0 didnormalize didNormalize�]  �n  �m  � ��� Z  ����Z�Y� E ����� o  ���X�X 0 nopts nOpts� J  ���� ��W� m  ���V
�V NoFoNoKC�W  � k  ��� ��� Z ����U�T� o  ���S�S 0 didnormalize didNormalize� R   �R��
�R .ascrerr ****      � ****� m  �� ��� 8 C o n f l i c t i n g   U n i c o d e   o p t i o n s .� �Q��P
�Q 
errn� m  �O�Of�P  �U  �T  � ��� r  ��� n ��� I  �N�M�L�N V0 )precomposedstringwithcompatibilitymapping )precomposedStringWithCompatibilityMapping�M  �L  � o  �K�K 0 
asocstring 
asocString� o      �J�J 0 
asocstring 
asocString� ��I� r  ��� m  �H
�H boovtrue� o      �G�G 0 didnormalize didNormalize�I  �Z  �Y  � ��F� Z  G���E�D� E $��� o  �C�C 0 nopts nOpts� J  #�� ��B� m  !�A
�A NoFoNoKD�B  � k  'C�� ��� Z '7���@�?� o  '(�>�> 0 didnormalize didNormalize� R  +3�=��
�= .ascrerr ****      � ****� m  /2�� ��� 8 C o n f l i c t i n g   U n i c o d e   o p t i o n s .� �<��;
�< 
errn� m  -.�:�:f�;  �@  �?  � ��� r  8?��� n 8=��� I  9=�9�8�7�9 T0 (decomposedstringwithcompatibilitymapping (decomposedStringWithCompatibilityMapping�8  �7  � o  89�6�6 0 
asocstring 
asocString� o      �5�5 0 
asocstring 
asocString� ��4� r  @C��� m  @A�3
�3 boovtrue� o      �2�2 0 didnormalize didNormalize�4  �E  �D  �F  � R      �1��
�1 .ascrerr ****      � ****� o      �0�0 0 etext eText� �/��.
�/ 
errn� m      �-�-f�.  � n Ob��� I  Tb�,��+�, .0 throwinvalidparameter throwInvalidParameter� ��� o  TU�*�* 0 nopts nOpts� ��� m  UX�� ��� 
 u s i n g� ��� m  X[�)
�) 
list� ��(� o  [\�'�' 0 etext eText�(  �+  � o  OT�&�& 0 _support  � ��%� L  ci�� c  ch��� o  cd�$�$ 0 
asocstring 
asocString� m  dg�#
�# 
ctxt�%  M R      �"��
�" .ascrerr ****      � ****� o      �!�! 0 etext eText� � ��
�  
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  N I  q���� 
0 _error  � ��� m  ru�� ���  n o r m a l i z e   t e x t� ��� o  uv�� 0 etext eText� ��� o  vw�� 0 enumber eNumber� ��� o  wx�� 0 efrom eFrom� ��� o  xy�� 
0 eto eTo�  �  ; ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Txt:PadTnull���     ctxt� o      �� 0 thetext theText� �
 
�
 
toPl  o      �	�	 0 	textwidth 	textWidth �
� 
Char |����  �   o      �� 0 padtext padText�   l     �� m       �                                  �  �   �	� 
� 
From	 |����
����  ��  
 o      ���� 0 whichend whichEnd��   l     ���� m      ��
�� LeTrLCha��  ��  �   � Q     k     r     n    I    ������ "0 astextparameter asTextParameter  o    	���� 0 thetext theText �� m   	 
 �  ��  ��   o    ���� 0 _support   o      ���� 0 thetext theText  r      n   !"! I    ��#���� (0 asintegerparameter asIntegerParameter# $%$ o    ���� 0 	textwidth 	textWidth% &��& m    '' �((  t o   p l a c e s��  ��  " o    ���� 0 _support    o      ���� 0 	textwidth 	textWidth )*) r    &+,+ \    $-.- o     ���� 0 	textwidth 	textWidth. l    #/����/ n    #010 1   ! #��
�� 
leng1 o     !���� 0 thetext theText��  ��  , o      ���� 0 
widthtoadd 
widthToAdd* 232 Z  ' 345����4 B   ' *676 o   ' (���� 0 
widthtoadd 
widthToAdd7 m   ( )����  5 L   - /88 o   - .���� 0 thetext theText��  ��  3 9:9 r   4 A;<; n  4 ?=>= I   9 ?��?���� "0 astextparameter asTextParameter? @A@ o   9 :���� 0 padtext padTextA B��B m   : ;CC �DD 
 u s i n g��  ��  > o   4 9���� 0 _support  < o      ���� 0 padtext padText: EFE r   B GGHG n  B EIJI 1   C E��
�� 
lengJ o   B C���� 0 padtext padTextH o      ���� 0 padsize padSizeF KLK Z  H aMN����M =   H MOPO n  H KQRQ 1   I K��
�� 
lengR o   H I���� 0 padtext padTextP m   K L����  N n  P ]STS I   U ]��U���� .0 throwinvalidparameter throwInvalidParameterU VWV o   U V���� 0 padtext padTextW XYX m   V WZZ �[[ 
 u s i n gY \]\ m   W X��
�� 
ctxt] ^��^ m   X Y__ �`` ( C a n  t   b e   e m p t y   t e x t .��  ��  T o   P U���� 0 _support  ��  ��  L aba V   b xcdc r   n sefe b   n qghg o   n o���� 0 padtext padTexth o   o p���� 0 padtext padTextf o      ���� 0 padtext padTextd A   f miji n  f iklk 1   g i��
�� 
lengl o   f g���� 0 padtext padTextj l  i lm����m [   i lnon o   i j���� 0 
widthtoadd 
widthToAddo o   j k���� 0 padsize padSize��  ��  b p��p Z   yqrstq =  y |uvu o   y z���� 0 whichend whichEndv m   z {��
�� LeTrLChar L    �ww b    �xyx l   �z����z n   �{|{ 7  � ���}~
�� 
ctxt} m   � ����� ~ o   � ����� 0 
widthtoadd 
widthToAdd| o    ����� 0 padtext padText��  ��  y o   � ����� 0 thetext theTexts � =  � ���� o   � ����� 0 whichend whichEnd� m   � ���
�� LeTrTCha� ��� k   � ��� ��� r   � ���� `   � ���� l  � ������� n  � ���� 1   � ���
�� 
leng� o   � ����� 0 thetext theText��  ��  � o   � ����� 0 padsize padSize� o      ���� 0 	padoffset 	padOffset� ���� L   � ��� b   � ���� o   � ����� 0 thetext theText� l  � ������� n  � ���� 7  � �����
�� 
ctxt� l  � ������� [   � ���� m   � ����� � o   � ����� 0 	padoffset 	padOffset��  ��  � l  � ������� [   � ���� o   � ����� 0 	padoffset 	padOffset� o   � ����� 0 
widthtoadd 
widthToAdd��  ��  � o   � ����� 0 padtext padText��  ��  ��  � ��� =  � ���� o   � ����� 0 whichend whichEnd� m   � ���
�� LeTrBCha� ���� k   � ��� ��� Z  � �������� ?   � ���� o   � ����� 0 
widthtoadd 
widthToAdd� m   � ����� � r   � ���� b   � ���� n  � ���� 7  � �����
�� 
ctxt� m   � ����� � l  � ������� _   � ���� o   � ����� 0 
widthtoadd 
widthToAdd� m   � ����� ��  ��  � o   � ����� 0 padtext padText� o   � ����� 0 thetext theText� o      ���� 0 thetext theText��  ��  � ��� r   � ���� `   � ���� l  � ������� n  � ���� 1   � ���
�� 
leng� o   � ����� 0 thetext theText��  ��  � o   � ����� 0 padsize padSize� o      ���� 0 	padoffset 	padOffset� ���� L   � ��� b   � ���� o   � ����� 0 thetext theText� l  � ������� n  � ���� 7  � �����
�� 
ctxt� l  � ������� [   � ���� m   � ����� � o   � ����� 0 	padoffset 	padOffset��  ��  � l  � ������� [   � ���� o   � ����� 0 	padoffset 	padOffset� _   � ���� l  � ������� [   � ���� o   � ����� 0 
widthtoadd 
widthToAdd� m   � ��� ��  ��  � m   � ��~�~ ��  ��  � o   � ��}�} 0 padtext padText��  ��  ��  ��  t n  ���� I   ��|��{�| >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ��z�z 0 whichend whichEnd� ��y� m   � ��� ���  a d d i n g�y  �{  � o   � ��x�x 0 _support  ��   R      �w��
�w .ascrerr ****      � ****� o      �v�v 0 etext eText� �u��
�u 
errn� o      �t�t 0 enumber eNumber� �s��
�s 
erob� o      �r�r 0 efrom eFrom� �q��p
�q 
errt� o      �o�o 
0 eto eTo�p   I  	�n��m�n 
0 _error  � ��� m  
�� ���  p a d   t e x t� ��� o  �l�l 0 etext eText� ��� o  �k�k 0 enumber eNumber� ��� o  �j�j 0 efrom eFrom� ��i� o  �h�h 
0 eto eTo�i  �m  � ��� l     �g�f�e�g  �f  �e  � ��� l     �d�c�b�d  �c  �b  � ��� i  � ���� I     �a��
�a .Txt:SliTnull���     ctxt� o      �`�` 0 thetext theText� �_��
�_ 
FIdx� |�^�]��\��^  �]  � o      �[�[ 0 
startindex 
startIndex�\  � l     ��Z�Y� m      �X
�X 
msng�Z  �Y  � �W��V
�W 
TIdx� |�U�T��S��U  �T  � o      �R�R 0 endindex endIndex�S  � l     ��Q�P� m      �O
�O 
msng�Q  �P  �V  � Q    �   k   �  r     n   	 I    �N
�M�N "0 astextparameter asTextParameter
  o    	�L�L 0 thetext theText �K m   	 
 �  �K  �M  	 o    �J�J 0 _support   o      �I�I 0 thetext theText  r     n    1    �H
�H 
leng o    �G�G 0 thetext theText o      �F�F 0 	thelength 	theLength  Z    S�E�D =     o    �C�C 0 	thelength 	theLength m    �B�B   k    O  l   �A �A   � � note: index 0 is always disallowed as its position is ambiguous, being both before index 1 at start of text and after index -1 at end of text     �!!   n o t e :   i n d e x   0   i s   a l w a y s   d i s a l l o w e d   a s   i t s   p o s i t i o n   i s   a m b i g u o u s ,   b e i n g   b o t h   b e f o r e   i n d e x   1   a t   s t a r t   o f   t e x t   a n d   a f t e r   i n d e x   - 1   a t   e n d   o f   t e x t "#" Z   4$%�@�?$ =     &'& o    �>�> 0 
startindex 
startIndex' m    �=�=  % n  # 0()( I   ( 0�<*�;�< .0 throwinvalidparameter throwInvalidParameter* +,+ o   ( )�:�: 0 
startindex 
startIndex, -.- m   ) *// �00  f r o m. 121 m   * +�9
�9 
long2 3�83 m   + ,44 �55 " I n d e x   c a n  t   b e   0 .�8  �;  ) o   # (�7�7 0 _support  �@  �?  # 676 Z  5 L89�6�58 =   5 8:;: o   5 6�4�4 0 endindex endIndex; m   6 7�3�3  9 n  ; H<=< I   @ H�2>�1�2 .0 throwinvalidparameter throwInvalidParameter> ?@? o   @ A�0�0 0 endindex endIndex@ ABA m   A BCC �DD  t oB EFE m   B C�/
�/ 
longF G�.G m   C DHH �II " I n d e x   c a n  t   b e   0 .�.  �1  = o   ; @�-�- 0 _support  �6  �5  7 J�,J L   M OKK m   M NLL �MM  �,  �E  �D   NON Z   T �PQR�+P >  T WSTS o   T U�*�* 0 
startindex 
startIndexT m   U V�)
�) 
msngQ k   Z �UU VWV r   Z gXYX n  Z eZ[Z I   _ e�(\�'�( (0 asintegerparameter asIntegerParameter\ ]^] o   _ `�&�& 0 
startindex 
startIndex^ _�%_ m   ` a`` �aa  f r o m�%  �'  [ o   Z _�$�$ 0 _support  Y o      �#�# 0 
startindex 
startIndexW bcb Z  h de�"�!d =   h kfgf o   h i� �  0 
startindex 
startIndexg m   i j��  e n  n {hih I   s {�j�� .0 throwinvalidparameter throwInvalidParameterj klk o   s t�� 0 
startindex 
startIndexl mnm m   t uoo �pp  f r o mn qrq m   u v�
� 
longr s�s m   v wtt �uu " I n d e x   c a n  t   b e   0 .�  �  i o   n s�� 0 _support  �"  �!  c v�v Z   � �wx��w =  � �yzy o   � ��� 0 endindex endIndexz m   � ��
� 
msngx Z   � �{|}~{ A   � �� o   � ��� 0 
startindex 
startIndex� d   � ��� o   � ��� 0 	thelength 	theLength| L   � ��� o   � ��� 0 thetext theText} ��� ?   � ���� o   � ��� 0 
startindex 
startIndex� o   � ��� 0 	thelength 	theLength� ��� L   � ��� m   � ��� ���  �  ~ L   � ��� n  � ���� 7  � ����
� 
ctxt� o   � ��� 0 
startindex 
startIndex� m   � ������ o   � ��
�
 0 thetext theText�  �  �  R ��� =  � ���� o   � ��	�	 0 endindex endIndex� m   � ��
� 
msng� ��� R   � ����
� .ascrerr ****      � ****� m   � ��� ��� v E x p e c t e d    f r o m    a n d / o r    t o    p a r a m e t e r   b u t   r e c e i v e d   n e i t h e r .� ���
� 
errn� m   � ����[�  �  �+  O ��� Z   �4����� >  � ���� o   � �� �  0 endindex endIndex� m   � ���
�� 
msng� k   �0�� ��� r   � ���� n  � ���� I   � �������� (0 asintegerparameter asIntegerParameter� ��� o   � ����� 0 endindex endIndex� ���� m   � ��� ���  t o��  ��  � o   � ����� 0 _support  � o      ���� 0 endindex endIndex� ��� Z  � �������� =   � ���� o   � ����� 0 endindex endIndex� m   � �����  � n  � ���� I   � �������� .0 throwinvalidparameter throwInvalidParameter� ��� o   � ����� 0 endindex endIndex� ��� m   � ��� ���  t o� ��� m   � ���
�� 
long� ���� m   � ��� ��� " I n d e x   c a n  t   b e   0 .��  ��  � o   � ����� 0 _support  ��  ��  � ���� Z   �0������� =  ���� o   � ����� 0 
startindex 
startIndex� m   � ��
�� 
msng� Z  ,����� A  ��� o  ���� 0 endindex endIndex� d  �� o  ���� 0 	thelength 	theLength� L  �� m  �� ���  � ��� ?  ��� o  ���� 0 endindex endIndex� o  ���� 0 	thelength 	theLength� ���� L  �� o  ���� 0 thetext theText��  � L  ,�� n +��� 7 *����
�� 
ctxt� m  $&���� � o  ')���� 0 endindex endIndex� o  ���� 0 thetext theText��  ��  ��  �  �  � ��� l 55������  � + % both start and end indexes are given   � ��� J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e n� ��� Z 5F������� A  58��� o  56���� 0 
startindex 
startIndex� m  67����  � r  ;B��� [  ;@��� [  ;>��� o  ;<���� 0 	thelength 	theLength� m  <=���� � o  >?���� 0 
startindex 
startIndex� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z GX������� A  GJ��� o  GH���� 0 endindex endIndex� m  HI����  � r  MT��� [  MR��� [  MP��� o  MN���� 0 	thelength 	theLength� m  NO���� � o  PQ���� 0 endindex endIndex� o      ���� 0 endindex endIndex��  ��  � ��� Z Y�������� G  Y���� G  Yp��� ?  Y\   o  YZ���� 0 
startindex 
startIndex o  Z[���� 0 endindex endIndex� F  _l A  _b o  _`���� 0 
startindex 
startIndex m  `a����  A  eh o  ef���� 0 endindex endIndex l 
fg���� m  fg���� ��  ��  � F  s�	
	 ?  sv o  st���� 0 
startindex 
startIndex o  tu���� 0 	thelength 	theLength
 ?  y| o  yz���� 0 endindex endIndex o  z{���� 0 	thelength 	theLength� L  �� m  �� �  ��  ��  �  Z  ���� A  �� o  ������ 0 
startindex 
startIndex m  ������  r  �� m  ������  o      ���� 0 
startindex 
startIndex  ?  �� o  ������ 0 
startindex 
startIndex o  ������ 0 	thelength 	theLength �� r  �� !  o  ������ 0 	thelength 	theLength! o      ���� 0 
startindex 
startIndex��  ��   "#" Z  ��$%&��$ A  ��'(' o  ������ 0 endindex endIndex( m  ������ % r  ��)*) m  ������ * o      ���� 0 endindex endIndex& +,+ ?  ��-.- o  ������ 0 endindex endIndex. o  ������ 0 	thelength 	theLength, /��/ r  ��010 o  ������ 0 	thelength 	theLength1 o      ���� 0 endindex endIndex��  ��  # 2��2 L  ��33 n  ��454 7 ����67
�� 
ctxt6 o  ������ 0 
startindex 
startIndex7 o  ������ 0 endindex endIndex5 o  ������ 0 thetext theText��   R      ��89
�� .ascrerr ****      � ****8 o      ���� 0 etext eText9 ��:;
�� 
errn: o      ���� 0 enumber eNumber; ��<=
�� 
erob< o      ���� 0 efrom eFrom= ��>��
�� 
errt> o      ���� 
0 eto eTo��   I  ����?���� 
0 _error  ? @A@ m  ��BB �CC  s l i c e   t e x tA DED o  ������ 0 etext eTextE FGF o  ������ 0 enumber eNumberG HIH o  ������ 0 efrom eFromI J��J o  ������ 
0 eto eTo��  ��  � KLK l     ��������  ��  ��  L MNM l     ��������  ��  ��  N OPO i  � �QRQ I     ��ST
�� .Txt:TrmTnull���     ctxtS o      ���� 0 thetext theTextT �U�
� 
FromU |��V�W�  �  V o      �� 0 whichend whichEnd�  W l     X��X m      �
� LeTrBCha�  �  �  R Q     �YZ[Y k    �\\ ]^] r    _`_ n   aba I    �c�� "0 astextparameter asTextParameterc ded o    	�� 0 thetext theTexte f�f m   	 
gg �hh  �  �  b o    �� 0 _support  ` o      �� 0 thetext theText^ iji Z    -kl��k H    mm E   non J    pp qrq m    �~
�~ LeTrLChar sts m    �}
�} LeTrTChat u�|u m    �{
�{ LeTrBCha�|  o J    vv w�zw o    �y�y 0 whichend whichEnd�z  l n   )xyx I   # )�xz�w�x >0 throwinvalidconstantparameter throwInvalidConstantParameterz {|{ o   # $�v�v 0 whichend whichEnd| }�u} m   $ %~~ �  r e m o v i n g�u  �w  y o    #�t�t 0 _support  �  �  j ��s� P   . ����� k   3 ��� ��� l  3 ?���� Z  3 ?���r�q� =  3 6��� o   3 4�p�p 0 thetext theText� m   4 5�� ���  � L   9 ;�� m   9 :�� ���  �r  �q  � H B check if theText is empty or contains white space characters only   � ��� �   c h e c k   i f   t h e T e x t   i s   e m p t y   o r   c o n t a i n s   w h i t e   s p a c e   c h a r a c t e r s   o n l y� ��� r   @ S��� J   @ D�� ��� m   @ A�o�o � ��n� m   A B�m�m���n  � J      �� ��� o      �l�l 0 
startindex 
startIndex� ��k� o      �j�j 0 endindex endIndex�k  � ��� Z   T x���i�h� E  T \��� J   T X�� ��� m   T U�g
�g LeTrLCha� ��f� m   U V�e
�e LeTrBCha�f  � J   X [�� ��d� o   X Y�c�c 0 whichend whichEnd�d  � V   _ t��� r   j o��� [   j m��� o   j k�b�b 0 
startindex 
startIndex� m   k l�a�a � o      �`�` 0 
startindex 
startIndex� =  c i��� n   c g��� 4   d g�_�
�_ 
cha � o   e f�^�^ 0 
startindex 
startIndex� o   c d�]�] 0 thetext theText� m   g h�� ���  �i  �h  � ��� Z   y ����\�[� E  y ���� J   y }�� ��� m   y z�Z
�Z LeTrTCha� ��Y� m   z {�X
�X LeTrBCha�Y  � J   } ��� ��W� o   } ~�V�V 0 whichend whichEnd�W  � V   � ���� r   � ���� \   � ���� o   � ��U�U 0 endindex endIndex� m   � ��T�T � o      �S�S 0 endindex endIndex� =  � ���� n   � ���� 4   � ��R�
�R 
cha � o   � ��Q�Q 0 endindex endIndex� o   � ��P�P 0 thetext theText� m   � ��� ���  �\  �[  � ��O� L   � ��� n   � ���� 7  � ��N��
�N 
ctxt� o   � ��M�M 0 
startindex 
startIndex� o   � ��L�L 0 endindex endIndex� o   � ��K�K 0 thetext theText�O  � �J�
�J conscase� �I�
�I consdiac� �H�
�H conshyph� �G�F
�G conspunc�F  � �E�
�E consnume� �D�C
�D conswhit�C  �s  Z R      �B��
�B .ascrerr ****      � ****� o      �A�A 0 etext eText� �@��
�@ 
errn� o      �?�? 0 enumber eNumber� �>��
�> 
erob� o      �=�= 0 efrom eFrom� �<��;
�< 
errt� o      �:�: 
0 eto eTo�;  [ I   � ��9��8�9 
0 _error  � ��� m   � ��� ���  t r i m   t e x t� ��� o   � ��7�7 0 etext eText� ��� o   � ��6�6 0 enumber eNumber� ��� o   � ��5�5 0 efrom eFrom� ��4� o   � ��3�3 
0 eto eTo�4  �8  P ��� l     �2�1�0�2  �1  �0  � ��� l     �/�.�-�/  �.  �-  � ��� l     �,���,  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �+���+  �   Split and Join Suite   � ��� *   S p l i t   a n d   J o i n   S u i t e� ��� l     �*�)�(�*  �)  �(  � � � i  � � I      �'�&�' .0 _aslinebreakparameter _asLineBreakParameter  o      �%�% 0 linebreaktype lineBreakType �$ o      �#�# 0 parametername parameterName�$  �&   l    /	 Z     /

 =     o     �"�" 0 linebreaktype lineBreakType m    �!
�! LiBrLiOX L    	 1    � 
�  
lnfd  =    o    �� 0 linebreaktype lineBreakType m    �
� LiBrLiCM  L     o    �
� 
ret   =    o    �� 0 linebreaktype lineBreakType m    �
� LiBrLiWi � L    ! b      o    �
� 
ret  1    �
� 
lnfd�   n  $ / !  I   ) /�"�� >0 throwinvalidconstantparameter throwInvalidConstantParameter" #$# o   ) *�� 0 linebreaktype lineBreakType$ %�% o   * +�� 0 parametername parameterName�  �  ! o   $ )�� 0 _support   < 6 used by `join paragraphs` and `normalize line breaks`   	 �&& l   u s e d   b y   ` j o i n   p a r a g r a p h s `   a n d   ` n o r m a l i z e   l i n e   b r e a k s `  '(' l     ����  �  �  ( )*) l     ����  �  �  * +,+ i  � �-.- I      �/�
� 0 
_splittext 
_splitText/ 010 o      �	�	 0 thetext theText1 2�2 o      �� 0 theseparator theSeparator�  �
  . l    ^3453 k     ^66 787 r     9:9 n    
;<; I    
�=�� 0 aslist asList= >�> o    �� 0 theseparator theSeparator�  �  < o     �� 0 _support  : o      �� 0 delimiterlist delimiterList8 ?@? X    CA� BA Q    >CDEC l    )FGHF r     )IJI c     %KLK n     #MNM 1   ! #��
�� 
pcntN o     !���� 0 aref aRefL m   # $��
�� 
ctxtJ n      OPO 1   & (��
�� 
pcntP o   % &���� 0 aref aRefG�� caution: AS silently ignores invalid TID values, so separator items must be explicitly validated to catch any user errors; for now, just coerce to text and catch errors, but might want to make it more rigorous in future (e.g. if a list of lists is given, should sublist be treated as an error instead of just coercing it to text, which is itself TIDs sensitive); see also existing TODO on TypeSupport's asTextParameter handler   H �QQV   c a u t i o n :   A S   s i l e n t l y   i g n o r e s   i n v a l i d   T I D   v a l u e s ,   s o   s e p a r a t o r   i t e m s   m u s t   b e   e x p l i c i t l y   v a l i d a t e d   t o   c a t c h   a n y   u s e r   e r r o r s ;   f o r   n o w ,   j u s t   c o e r c e   t o   t e x t   a n d   c a t c h   e r r o r s ,   b u t   m i g h t   w a n t   t o   m a k e   i t   m o r e   r i g o r o u s   i n   f u t u r e   ( e . g .   i f   a   l i s t   o f   l i s t s   i s   g i v e n ,   s h o u l d   s u b l i s t   b e   t r e a t e d   a s   a n   e r r o r   i n s t e a d   o f   j u s t   c o e r c i n g   i t   t o   t e x t ,   w h i c h   i s   i t s e l f   T I D s   s e n s i t i v e ) ;   s e e   a l s o   e x i s t i n g   T O D O   o n   T y p e S u p p o r t ' s   a s T e x t P a r a m e t e r   h a n d l e rD R      ����R
�� .ascrerr ****      � ****��  R ��S��
�� 
errnS d      TT m      �������  E n  1 >UVU I   6 >��W���� 60 throwinvalidparametertype throwInvalidParameterTypeW XYX o   6 7���� 0 aref aRefY Z[Z m   7 8\\ �]] 
 u s i n g[ ^_^ m   8 9��
�� 
ctxt_ `��` m   9 :aa �bb  l i s t   o f   t e x t��  ��  V o   1 6���� 0 _support  �  0 aref aRefB o    ���� 0 delimiterlist delimiterList@ cdc r   D Iefe n  D Gghg 1   E G��
�� 
txdlh 1   D E��
�� 
ascrf o      ���� 0 oldtids oldTIDsd iji r   J Oklk o   J K���� 0 delimiterlist delimiterListl n     mnm 1   L N��
�� 
txdln 1   K L��
�� 
ascrj opo r   P Uqrq n   P Ssts 2  Q S��
�� 
citmt o   P Q���� 0 thetext theTextr o      ���� 0 
resultlist 
resultListp uvu r   V [wxw o   V W���� 0 oldtids oldTIDsx n     yzy 1   X Z��
�� 
txdlz 1   W X��
�� 
ascrv {��{ L   \ ^|| o   \ ]���� 0 
resultlist 
resultList��  4 � � used by `split text` to split text using one or more text item delimiters and current or predefined considering/ignoring settings   5 �}}   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   o n e   o r   m o r e   t e x t   i t e m   d e l i m i t e r s   a n d   c u r r e n t   o r   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s, ~~ l     ��������  ��  ��   ��� l     ��������  ��  ��  � ��� i  � ���� I      ������� 0 _splitpattern _splitPattern� ��� o      ���� 0 thetext theText� ���� o      ���� 0 patterntext patternText��  ��  � l    ����� k     ��� ��� Z    ������� =     ��� l    	������ I    	����
�� .corecnte****       ****� J     �� ���� o     ���� 0 patterntext patternText��  � �����
�� 
kocl� m    ��
�� 
list��  ��  ��  � m   	 
���� � r    ��� I   ����
�� .Txt:JoiTnull���     ****� o    ���� 0 patterntext patternText� �����
�� 
Sepa� m    �� ���  |��  � o      ���� 0 patterntext patternText��  ��  � ��� r    %��� I    #������� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter� ��� o    ���� 0 patterntext patternText� ���� m    �� ���  a t��  ��  � o      ���� 0 asocpattern asocPattern� ��� r   & 2��� n  & 0��� I   + 0������ ,0 asnormalizednsstring asNormalizedNSString� ��� o   + ,�� 0 thetext theText�  �  � o   & +�� 0 _support  � o      �� 0 
asocstring 
asocString� ��� l  3 6���� r   3 6��� m   3 4��  � o      �� &0 asocnonmatchstart asocNonMatchStart� G A used to calculate NSRanges for non-matching portions of NSString   � ��� �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n g� ��� r   7 ;��� J   7 9��  � o      �� 0 
resultlist 
resultList� ��� l  < <����  � @ : iterate over each non-matched + matched range in NSString   � ��� t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g� ��� r   < M��� n  < K��� I   = K���� @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   = >�� 0 
asocstring 
asocString� ��� m   > ?��  � ��� J   ? G�� ��� m   ? @��  � ��� n  @ E��� I   A E���� 
0 length  �  �  � o   @ A�� 0 
asocstring 
asocString�  �  �  � o   < =�� 0 asocpattern asocPattern� o      ��  0 asocmatcharray asocMatchArray� ��� Y   N ������� k   ^ ��� ��� r   ^ k��� l  ^ i���� n  ^ i��� I   d i���� 0 rangeatindex_ rangeAtIndex_� ��� m   d e��  �  �  � l  ^ d���� n  ^ d��� I   _ d����  0 objectatindex_ objectAtIndex_� ��� o   _ `�� 0 i  �  �  � o   ^ _��  0 asocmatcharray asocMatchArray�  �  �  �  � o      ��  0 asocmatchrange asocMatchRange� ��� r   l s��� n  l q��� I   m q���� 0 location  �  �  � o   l m��  0 asocmatchrange asocMatchRange� o      ��  0 asocmatchstart asocMatchStart� ��� r   t ���� c   t ���� l  t ����� n  t ���� I   u ����� *0 substringwithrange_ substringWithRange_� ��� K   u }�� ���� 0 location  � o   v w�� &0 asocnonmatchstart asocNonMatchStart� ���� 
0 length  � \   x {� � o   x y��  0 asocmatchstart asocMatchStart  o   y z�� &0 asocnonmatchstart asocNonMatchStart�  �  �  � o   t u�� 0 
asocstring 
asocString�  �  � m   � ��
� 
ctxt� n        ;   � � o   � ��� 0 
resultlist 
resultList� � r   � � [   � � o   � ���  0 asocmatchstart asocMatchStart l  � ��� n  � �	
	 I   � ����� 
0 length  �  �  
 o   � ��~�~  0 asocmatchrange asocMatchRange�  �   o      �}�} &0 asocnonmatchstart asocNonMatchStart�  � 0 i  � m   Q R�|�|  � \   R Y l  R W�{�z n  R W I   S W�y�x�w�y 	0 count  �x  �w   o   R S�v�v  0 asocmatcharray asocMatchArray�{  �z   m   W X�u�u �  �  l  � ��t�t   "  add final non-matched range    � 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e  r   � � c   � � l  � ��s�r n  � � I   � ��q�p�q *0 substringfromindex_ substringFromIndex_ �o o   � ��n�n &0 asocnonmatchstart asocNonMatchStart�o  �p   o   � ��m�m 0 
asocstring 
asocString�s  �r   m   � ��l
�l 
ctxt n       !   ;   � �! o   � ��k�k 0 
resultlist 
resultList "#" l  � �$%&$ Z  � �'(�j�i' F   � �)*) =   � �+,+ n  � �-.- 1   � ��h
�h 
leng. o   � ��g�g 0 
resultlist 
resultList, m   � ��f�f * =   � �/0/ n  � �121 1   � ��e
�e 
leng2 n  � �343 4   � ��d5
�d 
cobj5 m   � ��c�c 4 o   � ��b�b 0 
resultlist 
resultList0 m   � ��a�a  ( L   � �66 J   � ��`�`  �j  �i  % U O for consistency with _splitText(), where `text items of ""` returns empty list   & �77 �   f o r   c o n s i s t e n c y   w i t h   _ s p l i t T e x t ( ) ,   w h e r e   ` t e x t   i t e m s   o f   " " `   r e t u r n s   e m p t y   l i s t# 8�_8 L   � �99 o   � ��^�^ 0 
resultlist 
resultList�_  � Q K used by `split text` to split text using a regular expression as separator   � �:: �   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   a   r e g u l a r   e x p r e s s i o n   a s   s e p a r a t o r� ;<; l     �]�\�[�]  �\  �[  < =>= l     �Z�Y�X�Z  �Y  �X  > ?@? i  � �ABA I      �WC�V�W 0 	_jointext 	_joinTextC DED o      �U�U 0 thelist theListE F�TF o      �S�S 0 separatortext separatorText�T  �V  B k     8GG HIH r     JKJ n    LML 1    �R
�R 
txdlM 1     �Q
�Q 
ascrK o      �P�P 0 oldtids oldTIDsI NON r    PQP o    �O�O 0 separatortext separatorTextQ n     RSR 1    
�N
�N 
txdlS 1    �M
�M 
ascrO TUT Q    /VWXV r    YZY c    [\[ o    �L�L 0 thelist theList\ m    �K
�K 
ctxtZ o      �J�J 0 
resulttext 
resultTextW R      �I�H]
�I .ascrerr ****      � ****�H  ] �G^�F
�G 
errn^ d      __ m      �E�E��F  X k    /`` aba r    !cdc o    �D�D 0 oldtids oldTIDsd n     efe 1     �C
�C 
txdlf 1    �B
�B 
ascrb g�Ag n  " /hih I   ' /�@j�?�@ .0 throwinvalidparameter throwInvalidParameterj klk o   ' (�>�> 0 thelist theListl mnm m   ( )oo �pp  n qrq m   ) *�=
�= 
listr s�<s m   * +tt �uu , E x p e c t e d   l i s t   o f   t e x t .�<  �?  i o   " '�;�; 0 _support  �A  U vwv r   0 5xyx o   0 1�:�: 0 oldtids oldTIDsy n     z{z 1   2 4�9
�9 
txdl{ 1   1 2�8
�8 
ascrw |�7| L   6 8}} o   6 7�6�6 0 
resulttext 
resultText�7  @ ~~ l     �5�4�3�5  �4  �3   ��� l     �2�1�0�2  �1  �0  � ��� l     �/���/  �  -----   � ��� 
 - - - - -� ��� l     �.�-�,�.  �-  �,  � ��� i  � ���� I     �+��
�+ .Txt:SplTnull���     ctxt� o      �*�* 0 thetext theText� �)��
�) 
Sepa� |�(�'��&��(  �'  � o      �%�% 0 theseparator theSeparator�&  � l     ��$�#� m      �"
�" 
msng�$  �#  � �!�� 
�! 
Usin� |������  �  � o      �� 0 matchformat matchFormat�  � l     ���� m      �
� SerECmpI�  �  �   � k     ��� ��� l     ����  � � � convenience handler for splitting text using TIDs that can also use a regular expression pattern as separator; similar to Python's str.split()   � ���   c o n v e n i e n c e   h a n d l e r   f o r   s p l i t t i n g   t e x t   u s i n g   T I D s   t h a t   c a n   a l s o   u s e   a   r e g u l a r   e x p r e s s i o n   p a t t e r n   a s   s e p a r a t o r ;   s i m i l a r   t o   P y t h o n ' s   s t r . s p l i t ( )� ��� Q     ����� k    ��� ��� r    ��� n   ��� I    ���� "0 astextparameter asTextParameter� ��� o    	�� 0 thetext theText� ��� m   	 
�� ���  �  �  � o    �� 0 _support  � o      �� 0 thetext theText� ��� Z    ����� =    ��� n   ��� 1    �
� 
leng� o    �� 0 thetext theText� m    ��  � L    �� J    ��  �  �  � ��
� Z   ! ������ =  ! $��� o   ! "�	�	 0 theseparator theSeparator� m   " #�
� 
msng� l  ' 3���� L   ' 3�� I   ' 2���� 0 _splitpattern _splitPattern� ��� I  ( -���
� .Txt:TrmTnull���     ctxt� o   ( )�� 0 thetext theText�  � ��� m   - .�� ���  \ s +�  �  � � � if `at` parameter is omitted, trim ends then then split on whitespace runs, same as Python's str.split() default behavior (any `using` options are ignored)   � ���8   i f   ` a t `   p a r a m e t e r   i s   o m i t t e d ,   t r i m   e n d s   t h e n   t h e n   s p l i t   o n   w h i t e s p a c e   r u n s ,   s a m e   a s   P y t h o n ' s   s t r . s p l i t ( )   d e f a u l t   b e h a v i o r   ( a n y   ` u s i n g `   o p t i o n s   a r e   i g n o r e d )� ��� =  6 9��� o   6 7�� 0 matchformat matchFormat� m   7 8� 
�  SerECmpI� ��� P   < J���� L   A I�� I   A H������� 0 
_splittext 
_splitText� ��� o   B C���� 0 thetext theText� ���� o   C D���� 0 theseparator theSeparator��  ��  � ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  � ����
�� conscase��  � ��� =  M P��� o   M N���� 0 matchformat matchFormat� m   N O��
�� SerECmpP� ��� L   S [�� I   S Z������� 0 _splitpattern _splitPattern� ��� o   T U���� 0 thetext theText� ���� o   U V���� 0 theseparator theSeparator��  ��  � ��� =  ^ a��� o   ^ _���� 0 matchformat matchFormat� m   _ `��
�� SerECmpC� ��� P   d r����� L   i q�� I   i p������� 0 
_splittext 
_splitText� ��� o   j k���� 0 thetext theText� ���� o   k l���� 0 theseparator theSeparator��  ��  � ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  ��  � ��� =  u x��� o   u v���� 0 matchformat matchFormat� m   v w��
�� SerECmpE� ��� P   { �   L   � � I   � ������� 0 
_splittext 
_splitText  o   � ����� 0 thetext theText �� o   � ����� 0 theseparator theSeparator��  ��   ��
�� conscase ��	
�� consdiac	 ��

�� conshyph
 ��
�� conspunc ����
�� conswhit��   ����
�� consnume��  �  =  � � o   � ����� 0 matchformat matchFormat m   � ���
�� SerECmpD �� L   � � I   � ������� 0 
_splittext 
_splitText  o   � ����� 0 thetext theText �� o   � ����� 0 theseparator theSeparator��  ��  ��  � n  � � I   � ������� >0 throwinvalidconstantparameter throwInvalidConstantParameter  o   � ����� 0 matchformat matchFormat �� m   � � � 
 u s i n g��  ��   o   � ����� 0 _support  �
  � R      ��
�� .ascrerr ****      � **** o      �� 0 etext eText � !
� 
errn  o      �� 0 enumber eNumber! �"#
� 
erob" o      �� 0 efrom eFrom# �$�
� 
errt$ o      �� 
0 eto eTo�  � I   � ��%�� 
0 _error  % &'& m   � �(( �))  s p l i t   t e x t' *+* o   � ��� 0 etext eText+ ,-, o   � ��� 0 enumber eNumber- ./. o   � ��� 0 efrom eFrom/ 0�0 o   � ��� 
0 eto eTo�  �  �  � 121 l     ����  �  �  2 343 l     ����  �  �  4 565 i  � �787 I     �9:
� .Txt:JoiTnull���     ****9 o      �� 0 thelist theList: �;�
� 
Sepa; |��<�=�  �  < o      �� 0 separatortext separatorText�  = m      >> �??  �  8 Q     1@AB@ L    CC I    �D�� 0 	_jointext 	_joinTextD EFE n   GHG I   	 �I�� "0 aslistparameter asListParameterI JKJ o   	 
�� 0 thelist theListK L�L m   
 MM �NN  �  �  H o    	�� 0 _support  F O�O n   PQP I    �R�� "0 astextparameter asTextParameterR STS o    �� 0 separatortext separatorTextT U�U m    VV �WW 
 u s i n g�  �  Q o    �� 0 _support  �  �  A R      �XY
� .ascrerr ****      � ****X o      �� 0 etext eTextY �Z[
� 
errnZ o      �� 0 enumber eNumber[ �\]
� 
erob\ o      �� 0 efrom eFrom] �^�
� 
errt^ o      �� 
0 eto eTo�  B I   ' 1�_�� 
0 _error  _ `a` m   ( )bb �cc  j o i n   t e x ta ded o   ) *�� 0 etext eTexte fgf o   * +�� 0 enumber eNumberg hih o   + ,�� 0 efrom eFromi j�j o   , -�� 
0 eto eTo�  �  6 klk l     ����  �  �  l mnm l     ����  �  �  n opo i  � �qrq I     �s�~
� .Txt:SplPnull���     ctxts o      �}�} 0 thetext theText�~  r Q     $tuvt L    ww n    xyx 2   �|
�| 
cpary n   z{z I    �{|�z�{ "0 astextparameter asTextParameter| }~} o    	�y�y 0 thetext theText~ �x m   	 
�� ���  �x  �z  { o    �w�w 0 _support  u R      �v��
�v .ascrerr ****      � ****� o      �u�u 0 etext eText� �t��
�t 
errn� o      �s�s 0 enumber eNumber� �r��
�r 
erob� o      �q�q 0 efrom eFrom� �p��o
�p 
errt� o      �n�n 
0 eto eTo�o  v I    $�m��l�m 
0 _error  � ��� m    �� ���   s p l i t   p a r a g r a p h s� ��� o    �k�k 0 etext eText� ��� o    �j�j 0 enumber eNumber� ��� o    �i�i 0 efrom eFrom� ��h� o     �g�g 
0 eto eTo�h  �l  p ��� l     �f�e�d�f  �e  �d  � ��� l     �c�b�a�c  �b  �a  � ��� i  � ���� I     �`��
�` .Txt:JoiPnull���     ****� o      �_�_ 0 thelist theList� �^��]
�^ 
LiBr� |�\�[��Z��\  �[  � o      �Y�Y 0 linebreaktype lineBreakType�Z  � l     ��X�W� m      �V
�V LiBrLiOX�X  �W  �]  � Q     -���� L    �� I    �U��T�U 0 	_jointext 	_joinText� ��� n   ��� I   	 �S��R�S "0 aslistparameter asListParameter� ��� o   	 
�Q�Q 0 thelist theList� ��P� m   
 �� ���  �P  �R  � o    	�O�O 0 _support  � ��N� I    �M��L�M .0 _aslinebreakparameter _asLineBreakParameter� ��� o    �K�K 0 linebreaktype lineBreakType� ��J� m    �� ��� 
 u s i n g�J  �L  �N  �T  � R      �I��
�I .ascrerr ****      � ****� o      �H�H 0 etext eText� �G��
�G 
errn� o      �F�F 0 enumber eNumber� �E��
�E 
erob� o      �D�D 0 efrom eFrom� �C��B
�C 
errt� o      �A�A 
0 eto eTo�B  � I   # -�@��?�@ 
0 _error  � ��� m   $ %�� ���  j o i n   p a r a g r a p h s� ��� o   % &�>�> 0 etext eText� ��� o   & '�=�= 0 enumber eNumber� ��� o   ' (�<�< 0 efrom eFrom� ��;� o   ( )�:�: 
0 eto eTo�;  �?  � ��� l     �9�8�7�9  �8  �7  � ��6� l     �5�4�3�5  �4  �3  �6       +�2���1�0�/��� ���������������������������������2  � )�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ����������������������
�	���
�. 
pimr�- (0 _unmatchedtexttype _UnmatchedTextType�, $0 _matchedtexttype _MatchedTextType�+ &0 _matchedgrouptype _MatchedGroupType�* 0 _support  �) 
0 _error  �( B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter�' 0 _tokens  �& (0 _parsetemplatetext _parseTemplateText�% :0 _previoussearchtemplatetext _previousSearchTemplateText�$ F0 !_previoussearchtemplateparsedtext !_previousSearchTemplateParsedText�# ,0 _parsesearchtemplate _parseSearchTemplate�" :0 _previousformattemplatetext _previousFormatTemplateText�! H0 "_previousformattemplateparseditems "_previousFormatTemplateParsedItems�  ,0 _parseformattemplate _parseFormatTemplate� $0 _matchinforecord _matchInfoRecord� 0 _matchrecords _matchRecords� &0 _matchedgrouplist _matchedGroupList� 0 _findpattern _findPattern� "0 _replacepattern _replacePattern� 0 	_findtext 	_findText� 0 _replacetext _replaceText
� .Txt:Srchnull���     ctxt
� .Txt:EPatnull���     ctxt
� .Txt:ETemnull���     ctxt
� .Txt:UppTnull���     ctxt
� .Txt:CapTnull���     ctxt
� .Txt:LowTnull���     ctxt
� .Txt:FTxtnull���     ctxt
� .Txt:Normnull���     ctxt
� .Txt:PadTnull���     ctxt
� .Txt:SliTnull���     ctxt
� .Txt:TrmTnull���     ctxt� .0 _aslinebreakparameter _asLineBreakParameter� 0 
_splittext 
_splitText� 0 _splitpattern _splitPattern�
 0 	_jointext 	_joinText
�	 .Txt:SplTnull���     ctxt
� .Txt:JoiTnull���     ****
� .Txt:SplPnull���     ctxt
� .Txt:JoiPnull���     ****� ��� �  ��� ���
� 
cobj� ��   � 
� 
frmk�  � ��� 
� 
cobj� ��   ��
�� 
osax�   
�1 
TxtU
�0 
TxtM
�/ 
TxtG� ��   �� D
�� 
scpt� �� N���������� 
0 _error  �� ����� �  ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  � ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�  ^������ �� &0 throwcommanderror throwCommandError�� b  ࠡ����+ � �� w���������� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter�� ����� �  ������ 0 patterntext patternText�� 0 parametername parameterName��  � ������ 0 patterntext patternText�� 0 parametername parameterName� ������������
�� misccura�� H0 "nsregularexpressioncaseinsensitive "NSRegularExpressionCaseInsensitive�� L0 $nsregularexpressionanchorsmatchlines $NSRegularExpressionAnchorsMatchLines�� Z0 +nsregularexpressiondotmatcheslineseparators +NSRegularExpressionDotMatchesLineSeparators�� Z0 +nsregularexpressionuseunicodewordboundaries +NSRegularExpressionUseUnicodeWordBoundaries�� @0 asnsregularexpressionparameter asNSRegularExpressionParameter��  b  ���,E��,E��,E��,E�m+ � �� ������ ���� (0 _parsetemplatetext _parseTemplateText�� ����   ���� 0 templatetext templateText��  � ���������������������������������� 0 templatetext templateText�� 0 
asocstring 
asocString�� 0 asocpattern asocPattern�� &0 asocnonmatchstart asocNonMatchStart�� 0 
resultlist 
resultList��  0 asocmatcharray asocMatchArray�� 0 
concatnext 
concatNext�� 0 i  �� 0 	asocmatch 	asocMatch��  0 asocmatchrange asocMatchRange��  0 asocmatchstart asocMatchStart�� 0 nonmatchtext nonMatchText�� 0 j  ��  0 asocgrouprange asocGroupRange�� "0 asocmatchstring asocMatchString�� 0 itemtext itemText  ����������������������.��������������
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� *0 nsregularexpression NSRegularExpression�� ^0 -nsregularexpressionallowcommentsandwhitespace -NSRegularExpressionAllowCommentsAndWhitespace
�� 
msng�� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_�� 
0 length  � @0 matchesinstring_options_range_ matchesInString_options_range_� 	0 count  �  0 objectatindex_ objectAtIndex_� 0 rangeatindex_ rangeAtIndex_� 0 location  � *0 substringwithrange_ substringWithRange_� H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_
� 
ctxt
� 
cobj
� 
lnfd
� 
ret 
� 
tab � 
� 
psof
� 
psin
� .sysooffslong    ��� null� *0 substringfromindex_ substringFromIndex_��d��,�k+ E�O��,b  ��,E�m+ E�OjE�OjvE�O��jj�j+ lvm+ E�OfE�O �j�j+ 	kkh ��k+ 
E�O�jk+ E�O�j+ E�O����lvk+ �fl+ a &E�O� �a i/�%�a i/FOfE�Y ��6FO��j+ E�O �kmkh ��k+ E�O�j+ j a��k+ E�O�a &E�O�k  A�a i/_ _ _ a a va � *a �a a a  U/%�a i/FOeE�Y ��6FOY h[OY��[OY�O��k+ a fl+ a &E�O� �a i/�%�a i/FY ��6FO�� ����� ,0 _parsesearchtemplate _parseSearchTemplate� ��   �� 0 templatetext templateText�   ������� 0 templatetext templateText� 0 templateitems templateItems� 0 i  � 0 itemtext itemText� 0 nextitem nextItem� 0 
asocstring 
asocString ���M�k��t������������ (0 _parsetemplatetext _parseTemplateText
� 
leng
� 
cobj
� 
long
� 
cha 
� 
bool� 0 
asnsstring 
asNSString
� misccura� 60 nsregularexpressionsearch NSRegularExpressionSearch� 
0 length  � � �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_
� 
ctxt� 0 	_jointext 	_joinText� ��� ��b  	 �*�k+ E�O �k��,Ekh ��/E�O�l#j  9��&%E�O��k/E�O��,j	 
��k/�& 
��%E�Y hO���/FY ,b  �k+ E�O�����,j�j+ lva + a &��/F[OY��O*�a l+ Ec  
O�Ec  	Y hOb  
V� ������ ,0 _parseformattemplate _parseFormatTemplate� ��   �� 0 templatetext templateText�   �� 0 templatetext templateText ����� (0 _parsetemplatetext _parseTemplateText
� 
cobj� 3�� /�b   *�k+ Ec  O�Ec  Y hOb  �-EV� ���	�� $0 _matchinforecord _matchInfoRecord� �
� 
  ����� 0 
asocstring 
asocString�  0 asocmatchrange asocMatchRange� 0 
textoffset 
textOffset� 0 
recordtype 
recordType�   �����~�}� 0 
asocstring 
asocString�  0 asocmatchrange asocMatchRange� 0 
textoffset 
textOffset� 0 
recordtype 
recordType�~ 0 	foundtext 	foundText�}  0 nexttextoffset nextTextOffset	 �|�{�z�y�x�w�v�u�| *0 substringwithrange_ substringWithRange_
�{ 
ctxt
�z 
leng
�y 
pcls�x 0 
startindex 
startIndex�w 0 endindex endIndex�v 0 	foundtext 	foundText�u � $��k+  �&E�O���,E�O���k���lv� �tN�s�r�q�t 0 _matchrecords _matchRecords�s �p�p   �o�n�m�l�k�j�o 0 
asocstring 
asocString�n  0 asocmatchrange asocMatchRange�m  0 asocstartindex asocStartIndex�l 0 
textoffset 
textOffset�k (0 nonmatchrecordtype nonMatchRecordType�j "0 matchrecordtype matchRecordType�r   �i�h�g�f�e�d�c�b�a�`�_�i 0 
asocstring 
asocString�h  0 asocmatchrange asocMatchRange�g  0 asocstartindex asocStartIndex�f 0 
textoffset 
textOffset�e (0 nonmatchrecordtype nonMatchRecordType�d "0 matchrecordtype matchRecordType�c  0 asocmatchstart asocMatchStart�b 0 asocmatchend asocMatchEnd�a &0 asocnonmatchrange asocNonMatchRange�` 0 nonmatchinfo nonMatchInfo�_ 0 	matchinfo 	matchInfo �^�]�\�[�Z�^ 0 location  �] 
0 length  �\ �[ $0 _matchinforecord _matchInfoRecord
�Z 
cobj�q W�j+  E�O��j+ E�O�ᦢ�E�O*�����+ E[�k/E�Z[�l/E�ZO*�����+ E[�k/E�Z[�l/E�ZO�����v� �Y��X�W�V�Y &0 _matchedgrouplist _matchedGroupList�X �U�U   �T�S�R�Q�T 0 
asocstring 
asocString�S 0 	asocmatch 	asocMatch�R 0 
textoffset 
textOffset�Q &0 includenonmatches includeNonMatches�W   �P�O�N�M�L�K�J�I�H�G�F�E�D�P 0 
asocstring 
asocString�O 0 	asocmatch 	asocMatch�N 0 
textoffset 
textOffset�M &0 includenonmatches includeNonMatches�L "0 submatchresults subMatchResults�K 0 groupindexes groupIndexes�J (0 asocfullmatchrange asocFullMatchRange�I &0 asocnonmatchstart asocNonMatchStart�H $0 asocfullmatchend asocFullMatchEnd�G 0 i  �F 0 nonmatchinfo nonMatchInfo�E 0 	matchinfo 	matchInfo�D &0 asocnonmatchrange asocNonMatchRange 	�C�B�A�@�?�>�=�<�;�C  0 numberofranges numberOfRanges�B 0 rangeatindex_ rangeAtIndex_�A 0 location  �@ 
0 length  �? �> 0 _matchrecords _matchRecords
�= 
cobj�< �; $0 _matchinforecord _matchInfoRecord�V �jvE�O�j+  kE�O�j ��jk+ E�O�j+ E�O��j+ E�O Uk�kh 	*���k+ ��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO��6F[OY��O� #�㨧�E�O*���b  �+ �k/�6FY hY hO�� �:8�9�8�7�: 0 _findpattern _findPattern�9 �6�6   �5�4�3�2�5 0 thetext theText�4 0 patterntext patternText�3 &0 includenonmatches includeNonMatches�2  0 includematches includeMatches�8   �1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�1 0 thetext theText�0 0 patterntext patternText�/ &0 includenonmatches includeNonMatches�.  0 includematches includeMatches�- 0 asocpattern asocPattern�, 0 
asocstring 
asocString�+ &0 asocnonmatchstart asocNonMatchStart�* 0 
textoffset 
textOffset�) 0 
resultlist 
resultList�(  0 asocmatcharray asocMatchArray�' 0 i  �& 0 	asocmatch 	asocMatch�% 0 nonmatchinfo nonMatchInfo�$ 0 	matchinfo 	matchInfo�# 0 	foundtext 	foundText L�"Xb�!� ��������������������" (0 asbooleanparameter asBooleanParameter�! B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter�  ,0 asnormalizednsstring asNormalizedNSString� 
0 length  � @0 matchesinstring_options_range_ matchesInString_options_range_� 	0 count  �  0 objectatindex_ objectAtIndex_� 0 rangeatindex_ rangeAtIndex_� � 0 _matchrecords _matchRecords
� 
cobj� � 0 foundgroups foundGroups� 0 
startindex 
startIndex� &0 _matchedgrouplist _matchedGroupList� *0 substringfromindex_ substringFromIndex_
� 
ctxt
� 
pcls� 0 endindex endIndex
� 
leng� 0 	foundtext 	foundText� �7	b  ��l+ E�Ob  ��l+ E�O*��l+ E�Ob  �k+ E�OjE�OkE�OjvE�O��jj�j+ lvm+ E�O }j�j+ kkh 
��k+ 	E�O*��jk+ 
��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO� ��*���a ,��+ l%�6FY h[OY��O� 1��k+ a &E�Oa b  a �a �a ,a �a �6FY hO�� �)��
�	� "0 _replacepattern _replacePattern� ��   ���� 0 thetext theText� 0 patterntext patternText� 0 templatetext templateText�
   ����� ����������������������������������� 0 thetext theText� 0 patterntext patternText� 0 templatetext templateText� 0 
asocstring 
asocString�  0 asocpattern asocPattern�� 0 
resultlist 
resultList�� &0 asocnonmatchstart asocNonMatchStart��  0 asocmatcharray asocMatchArray�� 0 i  �� 0 	asocmatch 	asocMatch��  0 asocmatchrange asocMatchRange��  0 asocmatchstart asocMatchStart�� &0 asocnonmatchrange asocNonMatchRange�� 0 	foundtext 	foundText�� 0 foundgroups foundGroups�� 0 j  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 oldtids oldTIDs�� 0 
resulttext 
resultText "��A����������R�����������������������������������������6������ ,0 asnormalizednsstring asNormalizedNSString�� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter
�� 
kocl
�� 
scpt
�� .corecnte****       ****�� 0 
resultlist 
resultList ��������
�� .ascrinit****      � **** k      R����  ��  ��   ���� 
0 _list_   ���� 
0 _list_  �� jv��� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 rangeatindex_ rangeAtIndex_�� 0 location  �� �� *0 substringwithrange_ substringWithRange_
�� 
ctxt�� 
0 _list_  ��  0 numberofranges numberOfRanges��  0 replacepattern replacePattern�� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob
�� 
errt�� �� *0 substringfromindex_ substringFromIndex_
�� 
ascr
�� 
txdl�� ,0 _parsesearchtemplate _parseSearchTemplate�� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_�	ub  �k+  E�O*��l+ E�O�kv��l k 7��K S�OjE�O��jj�j+ 	lvm+ 
E�O �j�j+ kkh ��k+ E�O�jk+ E�O�j+ E�O�髦�E�O��k+ a &�a ,6FO��k+ a &E�OjvE�O &k�j+ kkh ���k+ k+ a &�6F[OY��O ���l+ a &�a ,6FW %X  )a ] a ] a ] a a ] %O��j+ 	E�[OY�DO��k+ a &�a ,6FO_ a ,E^ Oa _ a ,FO�a ,a &E^ O] _ a ,FO] Y ��jj�j+ 	lv*�k+  �+ !a &� ��t���� ���� 0 	_findtext 	_findText�� ��!�� !  ����� 0 thetext theText� 0 fortext forText� &0 includenonmatches includeNonMatches�  0 includematches includeMatches��   
����������� 0 thetext theText� 0 fortext forText� &0 includenonmatches includeNonMatches�  0 includematches includeMatches� 0 
resultlist 
resultList� 0 oldtids oldTIDs� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	foundtext 	foundText� 0 i    ���������������*
� 
ascr
� 
txdl
� 
citm
� 
leng
� 
ctxt
� 
pcls� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	foundtext 	foundText� 
� .corecnte****       ****� 0 foundgroups foundGroups� 
��
jvE�O��,E�O���,FOkE�O��k/�,E�O� 0�� �[�\[Z�\Z�2E�Y �E�O�b  �����6FY hO �l��-j kh 	�kE�O��,�[�\[�/\�i/2�,E�O� 3�� �[�\[Z�\Z�2E�Y �E�O�b  ����jv��6FY hO�kE�O���/�,kE�O� 0�� �[�\[Z�\Z�2E�Y �E�O�b  �����6FY h[OY�aO���,FO�� �W��"#�� 0 _replacetext _replaceText� �$� $  ���� 0 thetext theText� 0 fortext forText� 0 newtext newText�  " ���������������� 0 thetext theText� 0 fortext forText� 0 newtext newText� 0 oldtids oldTIDs� 0 
resultlist 
resultList� 0 
startindex 
startIndex� 0 endindex endIndex� 0 i  � 0 	foundtext 	foundText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo�� 0 
resulttext 
resultText# �����������������������%���������,�
�� 
ascr
�� 
txdl
�� 
kocl
�� 
scpt
�� .corecnte****       ****
�� 
citm
�� 
leng
�� 
cobj
�� 
ctxt�� 0 replacetext replaceText�� 0 etext eText% �~�}&
�~ 
errn�} 0 enumber eNumber& �|�{'
�| 
erob�{ 0 efrom eFrom' �z�y�x
�z 
errt�y 
0 eto eTo�x  
�� 
errn
�� 
erob
�� 
errt�� � "0 astextparameter asTextParameter�(��,E�O���,FO�kv��l j �jvk��k/�,mvE[�k/E�Z[�l/E�Z[�m/E�ZO�� �[�\[Z�\Z�2�6FY hO �l��-j kh �kE�O��,�[�\[�/\�i/2�,E�O�� �[�\[Z�\Z�2E�Y �E�O ��k+ 
�&�6FW X  )����a a �%O�kE�O���/�,kE�O�� �[�\[Z�\Z�2�6FY h[OY�rOa ��,FY b  �a l+ E�O��-E�O���,FO��&E�O���,FO�� �wZ�v�u()�t
�w .Txt:Srchnull���     ctxt�v 0 thetext theText�u �s�r*
�s 
For_�r 0 fortext forText* �q+,
�q 
Usin+ {�p�o�n�p 0 matchformat matchFormat�o  
�n SerECmpI, �m-.
�m 
Repl- {�l�k�j�l 0 newtext newText�k  
�j 
msng. �i/�h
�i 
Retu/ {�g�f�e�g 0 resultformat resultFormat�f  
�e RetEMatT�h  ( �d�c�b�a�`�_�^�]�\�[�Z�d 0 thetext theText�c 0 fortext forText�b 0 matchformat matchFormat�a 0 newtext newText�` 0 resultformat resultFormat�_ &0 includenonmatches includeNonMatches�^  0 includematches includeMatches�] 0 etext eText�\ 0 enumber eNumber�[ 0 efrom eFrom�Z 
0 eto eTo) 2|�Y��X��W��V�U�T�S�R�Q�P�O��N�M�L�K��J�I		�H�G�F�E	+�D	A	B�C	_	h	m	�	��B�A	�	�	�
�@0
�?�>�Y "0 astextparameter asTextParameter
�X 
leng
�W 
ctxt�V �U .0 throwinvalidparameter throwInvalidParameter
�T 
msng
�S RetEMatT
�R 
pcls�Q 0 
startindex 
startIndex�P 0 endindex endIndex�O 0 	foundtext 	foundText�N 
�M 
cobj
�L RetEUmaT
�K RetEAllT�J >0 throwinvalidconstantparameter throwInvalidConstantParameter
�I SerECmpI�H 0 	_findtext 	_findText
�G SerECmpP�F 0 _findpattern _findPattern
�E SerECmpC
�D SerECmpE
�C SerECmpD�B 0 _replacetext _replaceText�A "0 _replacepattern _replacePattern�@ 0 etext eText0 �=�<1
�= 
errn�< 0 enumber eNumber1 �;�:2
�; 
erob�: 0 efrom eFrom2 �9�8�7
�9 
errt�8 
0 eto eTo�7  �? �> 
0 _error  �tcNb  ��l+ E�Ob  ��l+ E�O��,j  b  �����+ Y hO�� S��,j  $��  jvY �b  �k�j��a kvY hO��  felvE[a k/E�Z[a l/E�ZY S�a   eflvE[a k/E�Z[a l/E�ZY 1�a   eelvE[a k/E�Z[a l/E�ZY b  �a l+ O�a   a a  *�����+ VY ��a   *�����+ Y ~�a   a g *�����+ VY a�a   a a   *�����+ VY B�a !  -�a "  b  �a #�a $�+ Y hO*�����+ Y b  �a %l+ Y ���,j  	a &Y hO�a   a a  *���m+ 'VY ��a   *���m+ (Y {�a   a a   *���m+ 'VY ]�a   a g *���m+ 'VY A�a !  ,�a )  b  �a *�a +�+ Y hO*���m+ 'Y b  �a ,l+ W X - .*a /����a 0+ 1� �6
#�5�434�3
�6 .Txt:EPatnull���     ctxt�5 0 thetext theText�4  3 �2�1�0�/�.�2 0 thetext theText�1 0 etext eText�0 0 enumber eNumber�/ 0 efrom eFrom�. 
0 eto eTo4 �-�,
7�+�*�)�(5
E�'�&
�- misccura�, *0 nsregularexpression NSRegularExpression�+ "0 astextparameter asTextParameter�* 40 escapedpatternforstring_ escapedPatternForString_
�) 
ctxt�( 0 etext eText5 �%�$6
�% 
errn�$ 0 enumber eNumber6 �#�"7
�# 
erob�" 0 efrom eFrom7 �!� �
�! 
errt�  
0 eto eTo�  �' �& 
0 _error  �3 + ��,b  ��l+ k+ �&W X  *衢���+ 
� �
U��89�
� .Txt:ETemnull���     ctxt� 0 thetext theText�  8 ������ 0 thetext theText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo9 
g�
j�
m��:
y��� "0 astextparameter asTextParameter� 0 
_splittext 
_splitText� 0 	_jointext 	_joinText� 0 etext eText: ��;
� 
errn� 0 enumber eNumber; ��<
� 
erob� 0 efrom eFrom< ��
�	
� 
errt�
 
0 eto eTo�	  � � 
0 _error  � . **b  ��l+ �l+ �l+ W X  *衢���+ 
� �
���=>�
� .Txt:UppTnull���     ctxt� 0 thetext theText� �?�
� 
Loca? {��� � 0 
localecode 
localeCode�  
�  
msng�  = ���������������� 0 thetext theText�� 0 
localecode 
localeCode�� 0 
asocstring 
asocString�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo> 
�����������
�������@
������� "0 astextparameter asTextParameter�� 0 
asnsstring 
asNSString
�� 
msng�� "0 uppercasestring uppercaseString
�� 
ctxt�� *0 asnslocaleparameter asNSLocaleParameter�� 80 uppercasestringwithlocale_ uppercaseStringWithLocale_�� 0 etext eText@ ����A
�� 
errn�� 0 enumber eNumberA ����B
�� 
erob�� 0 efrom eFromB ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � ��
�����CD��
�� .Txt:CapTnull���     ctxt�� 0 thetext theText�� ��E��
�� 
LocaE {�������� 0 
localecode 
localeCode��  
�� 
msng��  C ���������������� 0 thetext theText�� 0 
localecode 
localeCode�� 0 
asocstring 
asocString�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToD 
�����������������F'������ "0 astextparameter asTextParameter�� 0 
asnsstring 
asNSString
�� 
msng�� &0 capitalizedstring capitalizedString
�� 
ctxt�� *0 asnslocaleparameter asNSLocaleParameter�� <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_�� 0 etext eTextF ����G
�� 
errn�� 0 enumber eNumberG ����H
�� 
erob�� 0 efrom eFromH ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � ��7����IJ��
�� .Txt:LowTnull���     ctxt�� 0 thetext theText�� ��K��
�� 
LocaK {������ 0 
localecode 
localeCode�  
� 
msng��  I �������� 0 thetext theText� 0 
localecode 
localeCode� 0 
asocstring 
asocString� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToJ O�����l���Lx��� "0 astextparameter asTextParameter� 0 
asnsstring 
asNSString
� 
msng� "0 lowercasestring lowercaseString
� 
ctxt� *0 asnslocaleparameter asNSLocaleParameter� 80 lowercasestringwithlocale_ lowercaseStringWithLocale_� 0 etext eTextL ��M
� 
errn� 0 enumber eNumberM ��N
� 
erob� 0 efrom eFromN ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � ����OP�
� .Txt:FTxtnull���     ctxt� 0 templatetext templateText� �Q�
� 
UsinQ {���� 0 	thevalues 	theValues�  �  �  O ��������� 0 templatetext templateText� 0 	thevalues 	theValues� 0 templateitems templateItems� 0 i  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToP ����������������R�����-��� "0 astextparameter asTextParameter� ,0 _parseformattemplate _parseFormatTemplate
� 
kocl
� 
scpt
� .corecnte****       ****
� 
leng
� 
cobj� 0 getitem getItem
� 
ctxt� "0 aslistparameter asListParameter
� 
long� 0 etext eTextR ��S
� 
errn� 0 enumber eNumberS ��~T
� 
erob�~ 0 efrom eFromT �}�|�{
�} 
errt�| 
0 eto eTo�{  
� 
errn
� 
erob
� 
errt� � 0 	_jointext 	_joinText� � 
0 _error  � � ��� �*b  ��l+ k+ E�OlE�O k�kv��l k  ( "l��,Elh ���/Ek+ 
�&��/F[OY��Y 4b  ��l+ E�O #l��,Elh ���/E�&/E�&��/F[OY��W &X  )a �a �a �a a ��/%a %�%O*�a l+ VW X  *a ����a + � �z=�y�xUV�w
�z .Txt:Normnull���     ctxt�y 0 thetext theText�x �vWX
�v 
NoFoW {�u�tY�u 0 nopts nOpts�t  Y �sZ�s Z  �r
�r LiBrLiOXX �q[�p
�q 
Loca[ {�o�nJ�o 0 
localecode 
localeCode�n  �p  U �m�l�k�j�i�h�g�f�e�d�c�m 0 thetext theText�l 0 nopts nOpts�k 0 
localecode 
localeCode�j 0 	linebreak 	lineBreak�i 0 
asocstring 
asocString�h 0 foldingflags foldingFlags�g 0 didnormalize didNormalize�f 0 etext eText�e 0 enumber eNumber�d 0 efrom eFrom�c 
0 eto eToV IZ�bf�a�`v�_�^�]�\�[�Z�Y�X��W�V��U�T�S�R�Q�P@�O�N�M]a�L�K�J�I�H��G����F�E�D�C�B(4ITX�A�@�?��>�=��<�;��:�9\��8�7�6]��5�4�b "0 astextparameter asTextParameter�a "0 aslistparameter asListParameter
�` 
leng
�_ LiBrLiOX
�^ 
cpar
�] 
lnfd�\ 0 	_jointext 	_joinText
�[ 
msng
�Z LiBrLiCM
�Y 
errn�Xf
�W 
ret 
�V LiBrLiWi�U 0 
asnsstring 
asNSString
�T NoFoNoCa
�S NoFoNoDi�R �
�Q NoFoNoWi�P �O *0 asnslocaleparameter asNSLocaleParameter�N H0 "stringbyfoldingwithoptions_locale_ "stringByFoldingWithOptions_locale_
�M NoFoNoSp
�L misccura�K 60 nsregularexpressionsearch NSRegularExpressionSearch�J 
0 length  �I �H �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_
�G 
spac
�F NoFoNoSP
�E NoFoNoTP
�D NoFoNoAO
�C 
bool�B H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_
�A NoFoNo_C�@ N0 %precomposedstringwithcanonicalmapping %precomposedStringWithCanonicalMapping
�? NoFoNo_D�> L0 $decomposedstringwithcanonicalmapping $decomposedStringWithCanonicalMapping
�= NoFoNoKC�< V0 )precomposedstringwithcompatibilitymapping )precomposedStringWithCompatibilityMapping
�; NoFoNoKD�: T0 (decomposedstringwithcompatibilitymapping (decomposedStringWithCompatibilityMapping�9 0 etext eText\ �3�2�1
�3 
errn�2f�1  
�8 
list�7 .0 throwinvalidparameter throwInvalidParameter
�6 
ctxt] �0�/^
�0 
errn�/ 0 enumber eNumber^ �.�-_
�. 
erob�- 0 efrom eFrom_ �,�+�*
�, 
errt�+ 
0 eto eTo�*  �5 �4 
0 _error  �w�kb  ��l+ E�Ob  ��l+ E�O��,j  �Y hO��kv  *��-�l+ 	Y hO�jv  �Y hO���kv �E�Y �E�O��kv 0�� )��l�Y hO��,k  *��-�l+ 	Y hO�E�Y hO�a kv 6�� )��la Y hO��,k  *��-��%l+ 	Y hO��%E�Y hOb  �k+ E�OjE�O�a kv 
�kE�Y hO�a kv �a E�Y hO�a kv �a E�Y hO�j ��b  �a l+ l+ E�Y hO�a kv ��a a a a ,j�j+  lva !+ "E�O��  #�a #_ $a a ,j�j+  lva !+ "E�Y =�a %�a a ,j�j+  lva !+ "E�O�a &_ $a a ,j�j+  lva !+ "E�Y (�� !�a '�a a ,j�j+  lva !+ "E�Y hO�a (kv 5�a )kv
 �a *kva +& )��la ,Y hO�a -fl+ .E�Y i�a )kv '�a *kv )��la /Y hO�a 0fl+ .E�Y :�a *kv /�a 1fl+ .E�O�a 2a 3a a ,j�j+  lva !+ "E�Y hO�a 4kv �j+ 5E�OeE�Y fE�O�a 6kv !� )��la 7Y hO�j+ 8E�OeE�Y hO�a 9kv !� )��la :Y hO�j+ ;E�OeE�Y hO�a <kv !� )��la =Y hO�j+ >E�OeE�Y hW X ? @b  �a Aa B�a !+ CO�a D&W X ? E*a F����a G+ H� �)��(�'`a�&
�) .Txt:PadTnull���     ctxt�( 0 thetext theText�' �%�$b
�% 
toPl�$ 0 	textwidth 	textWidthb �#cd
�# 
Charc {�"�!�" 0 padtext padText�!  d � e�
�  
Frome {���� 0 whichend whichEnd�  
� LeTrLCha�  ` ������������ 0 thetext theText� 0 	textwidth 	textWidth� 0 padtext padText� 0 whichend whichEnd� 0 
widthtoadd 
widthToAdd� 0 padsize padSize� 0 	padoffset 	padOffset� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToa �'��CZ�_���
�	����f���� "0 astextparameter asTextParameter� (0 asintegerparameter asIntegerParameter
� 
leng
� 
ctxt� � .0 throwinvalidparameter throwInvalidParameter
�
 LeTrLCha
�	 LeTrTCha
� LeTrBCha� >0 throwinvalidconstantparameter throwInvalidConstantParameter� 0 etext eTextf ��g
� 
errn� 0 enumber eNumberg �� h
� 
erob�  0 efrom eFromh ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  �&b  ��l+ E�Ob  ��l+ E�O���,E�O�j �Y hOb  ��l+ E�O��,E�O��,j  b  �����+ 
Y hO h��,����%E�[OY��O��  �[�\[Zk\Z�2�%Y s��  ��,�#E�O��[�\[Zk�\Z��2%Y P��  ?�k �[�\[Zk\Z�l"2�%E�Y hO��,�#E�O��[�\[Zk�\Z��kl"2%Y b  ��l+ W X  *a ����a + � �������ij��
�� .Txt:SliTnull���     ctxt�� 0 thetext theText�� ��kl
�� 
FIdxk {�������� 0 
startindex 
startIndex��  
�� 
msngl ��m��
�� 
TIdxm {�������� 0 endindex endIndex��  
�� 
msng��  i ������������������ 0 thetext theText�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 	thelength 	theLength�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToj  ����/��4����CHL��`��ot����������������nB������ "0 astextparameter asTextParameter
�� 
leng
�� 
long�� �� .0 throwinvalidparameter throwInvalidParameter
�� 
msng�� (0 asintegerparameter asIntegerParameter
�� 
ctxt
�� 
errn���[
�� 
bool�� 0 etext eTextn ����o
�� 
errn�� 0 enumber eNumbero ����p
�� 
erob�� 0 efrom eFromp ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  ����b  ��l+ E�O��,E�O�j  7�j  b  �����+ Y hO�j  b  �����+ Y hO�Y hO�� ]b  ��l+ E�O�j  b  �����+ Y hO��  -��' �Y �� 	a Y �[a \[Z�\Zi2EY hY ��  )a a la Y hO�� cb  �a l+ E�O�j  b  �a �a �+ Y hO��  -��' 	a Y �� �Y �[a \[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO��
 �k	 	�ka &a &
 ��	 	��a &a & 	a Y hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[a \[Z�\Z�2EW X  *a ����a + � ��R����qr��
�� .Txt:TrmTnull���     ctxt�� 0 thetext theText�� ��s��
�� 
Froms {�������� 0 whichend whichEnd��  
�� LeTrBCha��  q ������������������ 0 thetext theText�� 0 whichend whichEnd�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTor g������~�����������t����� "0 astextparameter asTextParameter
�� LeTrLCha
� LeTrTCha
� LeTrBCha� >0 throwinvalidconstantparameter throwInvalidConstantParameter
� 
cobj
� 
cha 
� 
ctxt� 0 etext eTextt ��u
� 
errn� 0 enumber eNumberu ��v
� 
erob� 0 efrom eFromv ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� � �b  ��l+ E�O���mv�kv b  ��l+ Y hO�� {��  �Y hOkilvE[�k/E�Z[�l/E�ZO��lv�kv  h��/� �kE�[OY��Y hO��lv�kv  h��/� �kE�[OY��Y hO�[�\[Z�\Z�2EVW X  *a ����a + � ���wx�� .0 _aslinebreakparameter _asLineBreakParameter� �y� y  ��� 0 linebreaktype lineBreakType� 0 parametername parameterName�  w ��� 0 linebreaktype lineBreakType� 0 parametername parameterNamex ������
� LiBrLiOX
� 
lnfd
� LiBrLiCM
� 
ret 
� LiBrLiWi� >0 throwinvalidconstantparameter throwInvalidConstantParameter� 0��  �EY %��  �Y ��  	��%Y b  ��l+ � �.��z{�� 0 
_splittext 
_splitText� �|� |  ��� 0 thetext theText� 0 theseparator theSeparator�  z ������� 0 thetext theText� 0 theseparator theSeparator� 0 delimiterlist delimiterList� 0 aref aRef� 0 oldtids oldTIDs� 0 
resultlist 
resultList{ �������}\a������ 0 aslist asList
� 
kocl
� 
cobj
� .corecnte****       ****
� 
pcnt
� 
ctxt�  } ���
� 
errn��\�  � � 60 throwinvalidparametertype throwInvalidParameterType
� 
ascr
� 
txdl
� 
citm� _b  �k+  E�O 5�[��l kh  ��,�&��,FW X  b  �����+ [OY��O��,E�O���,FO��-E�O���,FO�� ����~�� 0 _splitpattern _splitPattern� ��� �  ��~� 0 thetext theText�~ 0 patterntext patternText�  ~ 
�}�|�{�z�y�x�w�v�u�t�} 0 thetext theText�| 0 patterntext patternText�{ 0 asocpattern asocPattern�z 0 
asocstring 
asocString�y &0 asocnonmatchstart asocNonMatchStart�x 0 
resultlist 
resultList�w  0 asocmatcharray asocMatchArray�v 0 i  �u  0 asocmatchrange asocMatchRange�t  0 asocmatchstart asocMatchStart �s�r�q�p��o��n�m�l�k�j�i�h�g�f�e�d�c�b�a�`
�s 
kocl
�r 
list
�q .corecnte****       ****
�p 
Sepa
�o .Txt:JoiTnull���     ****�n B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter�m ,0 asnormalizednsstring asNormalizedNSString�l 
0 length  �k @0 matchesinstring_options_range_ matchesInString_options_range_�j 	0 count  �i  0 objectatindex_ objectAtIndex_�h 0 rangeatindex_ rangeAtIndex_�g 0 location  �f �e *0 substringwithrange_ substringWithRange_
�d 
ctxt�c *0 substringfromindex_ substringFromIndex_
�b 
leng
�a 
cobj
�` 
bool� Ρkv��l k  ���l E�Y hO*��l+ E�Ob  �k+ E�OjE�OjvE�O��jj�j+ 	lvm+ 
E�O Hj�j+ kkh ��k+ jk+ E�O�j+ E�O��驤�k+ a &�6FO��j+ 	E�[OY��O��k+ a &�6FO�a ,k 	 �a k/a ,j a & jvY hO�� �_B�^�]���\�_ 0 	_jointext 	_joinText�^ �[��[ �  �Z�Y�Z 0 thelist theList�Y 0 separatortext separatorText�]  � �X�W�V�U�X 0 thelist theList�W 0 separatortext separatorText�V 0 oldtids oldTIDs�U 0 
resulttext 
resultText� 
�T�S�R�Q�o�Pt�O�N
�T 
ascr
�S 
txdl
�R 
ctxt�Q  � �M�L�K
�M 
errn�L�\�K  
�P 
list�O �N .0 throwinvalidparameter throwInvalidParameter�\ 9��,E�O���,FO 
��&E�W X  ���,FOb  �����+ 	O���,FO�� �J��I�H���G
�J .Txt:SplTnull���     ctxt�I 0 thetext theText�H �F��
�F 
Sepa� {�E�D�C�E 0 theseparator theSeparator�D  
�C 
msng� �B��A
�B 
Usin� {�@�?�>�@ 0 matchformat matchFormat�?  
�> SerECmpI�A  � �=�<�;�:�9�8�7�= 0 thetext theText�< 0 theseparator theSeparator�; 0 matchformat matchFormat�: 0 etext eText�9 0 enumber eNumber�8 0 efrom eFrom�7 
0 eto eTo� ��6�5�4�3��2�1���0�/�.��-�,�+�*�(�)�(�6 "0 astextparameter asTextParameter
�5 
leng
�4 
msng
�3 .Txt:TrmTnull���     ctxt�2 0 _splitpattern _splitPattern
�1 SerECmpI�0 0 
_splittext 
_splitText
�/ SerECmpP
�. SerECmpC
�- SerECmpE
�, SerECmpD�+ >0 throwinvalidconstantparameter throwInvalidConstantParameter�* 0 etext eText� �'�&�
�' 
errn�& 0 enumber eNumber� �%�$�
�% 
erob�$ 0 efrom eFrom� �#�"�!
�# 
errt�" 
0 eto eTo�!  �) �( 
0 _error  �G � �b  ��l+ E�O��,j  jvY hO��  *�j �l+ Y z��  �� *��l+ 
VY c��  *��l+ Y R��  �g *��l+ 
VY ;��  �a  *��l+ 
VY "�a   *��l+ 
Y b  �a l+ W X  *a ����a + � � 8�����
�  .Txt:JoiTnull���     ****� 0 thelist theList� ���
� 
Sepa� {��>� 0 separatortext separatorText�  �  � ������� 0 thelist theList� 0 separatortext separatorText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� 
M�V����b��� "0 aslistparameter asListParameter� "0 astextparameter asTextParameter� 0 	_jointext 	_joinText� 0 etext eText� ���
� 
errn� 0 enumber eNumber� �
�	�
�
 
erob�	 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � 2 !*b  ��l+ b  ��l+ l+ W X  *碣���+ 	� �r�����
� .Txt:SplPnull���     ctxt� 0 thetext theText�  � �� ������� 0 thetext theText�  0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ��������������� "0 astextparameter asTextParameter
�� 
cpar�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � % b  ��l+ �-EW X  *塢���+ � �����������
�� .Txt:JoiPnull���     ****�� 0 thelist theList�� �����
�� 
LiBr� {�������� 0 linebreaktype lineBreakType��  
�� LiBrLiOX��  � �������������� 0 thelist theList�� 0 linebreaktype lineBreakType�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� 
������������������ "0 aslistparameter asListParameter�� .0 _aslinebreakparameter _asLineBreakParameter�� 0 	_jointext 	_joinText�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� . *b  ��l+ *��l+ l+ W X  *碣���+ 	ascr  ��ޭ