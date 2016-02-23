FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� Date -- make, parse, and format dates and date strings

Notes:

- `join date` and `parse date` provide robust alternatives to `date TEXT` specifier for constructing date objects, (`date dateString` has serious portability and usability problems as it requires a precisely formatted *localized* date string): `join date` takes a record of numeric year/month/day/etc values, `parse date` takes a fixed format (ISO8601) by default


Caution:

- AppleScript's date objects are mutable(!), so any time a new date object is needed, either construct it from scratch using ASOC's `(NSDate's date...()) as date`, Standard Additions' `current date` command, or `copy _defaultDate to newDate` and work on the *copy*. NEVER use, modify, or return _defaultDate (or any other retained date object) directly, as allowing a shared mutable object to escape from this library and run loose around users' programs is a guaranteed recipe for chaos and disaster. (It's bad enough when lists and records do this, but dates don't look like mutable collections so users are even less likely to realize they contain shareable state.)


TO DO: 

- `timezone info [for tzName]` that returns record of tzName, tzAbbreviation, secondsToGMT, and daylight savings (isDST and secondsToDST, nextDSTransition)? what about localized name?

- should `join date` implement optional `with/without rollover allowed` parameter to determine if out-of-range values should be allowed to rollover or not (default: error if rollover detected) check for any out-of-range properties, as AS will silently roll over (Q. what about leap-seconds?) TBH, probably be simpler and safer to range-check year+month+hours+minutes (all those ranges are fixed, so as long as the rec's properties are anywhere within those ranges they're ok), and comparison-check the day (allowing some flexibility in the event that a leap second nudges it over to the next day), and finally check the seconds isn't obviously invalid (e.g. -1, 70)

- any value in having `seconds from GMT to tzName` convenience command? (this'd be same as `seconds to GMT` except it returns -ve value; e.g. `seconds from GMT to "America/New_York"`-> +5 hours)

- what about parsing/formatting time text as no. of seconds since midnight?

     � 	 	�   D a t e   - -   m a k e ,   p a r s e ,   a n d   f o r m a t   d a t e s   a n d   d a t e   s t r i n g s 
 
 N o t e s : 
 
 -   ` j o i n   d a t e `   a n d   ` p a r s e   d a t e `   p r o v i d e   r o b u s t   a l t e r n a t i v e s   t o   ` d a t e   T E X T `   s p e c i f i e r   f o r   c o n s t r u c t i n g   d a t e   o b j e c t s ,   ( ` d a t e   d a t e S t r i n g `   h a s   s e r i o u s   p o r t a b i l i t y   a n d   u s a b i l i t y   p r o b l e m s   a s   i t   r e q u i r e s   a   p r e c i s e l y   f o r m a t t e d   * l o c a l i z e d *   d a t e   s t r i n g ) :   ` j o i n   d a t e `   t a k e s   a   r e c o r d   o f   n u m e r i c   y e a r / m o n t h / d a y / e t c   v a l u e s ,   ` p a r s e   d a t e `   t a k e s   a   f i x e d   f o r m a t   ( I S O 8 6 0 1 )   b y   d e f a u l t 
 
 
 C a u t i o n : 
 
 -   A p p l e S c r i p t ' s   d a t e   o b j e c t s   a r e   m u t a b l e ( ! ) ,   s o   a n y   t i m e   a   n e w   d a t e   o b j e c t   i s   n e e d e d ,   e i t h e r   c o n s t r u c t   i t   f r o m   s c r a t c h   u s i n g   A S O C ' s   ` ( N S D a t e ' s   d a t e . . . ( ) )   a s   d a t e ` ,   S t a n d a r d   A d d i t i o n s '   ` c u r r e n t   d a t e `   c o m m a n d ,   o r   ` c o p y   _ d e f a u l t D a t e   t o   n e w D a t e `   a n d   w o r k   o n   t h e   * c o p y * .   N E V E R   u s e ,   m o d i f y ,   o r   r e t u r n   _ d e f a u l t D a t e   ( o r   a n y   o t h e r   r e t a i n e d   d a t e   o b j e c t )   d i r e c t l y ,   a s   a l l o w i n g   a   s h a r e d   m u t a b l e   o b j e c t   t o   e s c a p e   f r o m   t h i s   l i b r a r y   a n d   r u n   l o o s e   a r o u n d   u s e r s '   p r o g r a m s   i s   a   g u a r a n t e e d   r e c i p e   f o r   c h a o s   a n d   d i s a s t e r .   ( I t ' s   b a d   e n o u g h   w h e n   l i s t s   a n d   r e c o r d s   d o   t h i s ,   b u t   d a t e s   d o n ' t   l o o k   l i k e   m u t a b l e   c o l l e c t i o n s   s o   u s e r s   a r e   e v e n   l e s s   l i k e l y   t o   r e a l i z e   t h e y   c o n t a i n   s h a r e a b l e   s t a t e . ) 
 
 
 T O   D O :   
 
 -   ` t i m e z o n e   i n f o   [ f o r   t z N a m e ] `   t h a t   r e t u r n s   r e c o r d   o f   t z N a m e ,   t z A b b r e v i a t i o n ,   s e c o n d s T o G M T ,   a n d   d a y l i g h t   s a v i n g s   ( i s D S T   a n d   s e c o n d s T o D S T ,   n e x t D S T r a n s i t i o n ) ?   w h a t   a b o u t   l o c a l i z e d   n a m e ?  
 
 -   s h o u l d   ` j o i n   d a t e `   i m p l e m e n t   o p t i o n a l   ` w i t h / w i t h o u t   r o l l o v e r   a l l o w e d `   p a r a m e t e r   t o   d e t e r m i n e   i f   o u t - o f - r a n g e   v a l u e s   s h o u l d   b e   a l l o w e d   t o   r o l l o v e r   o r   n o t   ( d e f a u l t :   e r r o r   i f   r o l l o v e r   d e t e c t e d )   c h e c k   f o r   a n y   o u t - o f - r a n g e   p r o p e r t i e s ,   a s   A S   w i l l   s i l e n t l y   r o l l   o v e r   ( Q .   w h a t   a b o u t   l e a p - s e c o n d s ? )   T B H ,   p r o b a b l y   b e   s i m p l e r   a n d   s a f e r   t o   r a n g e - c h e c k   y e a r + m o n t h + h o u r s + m i n u t e s   ( a l l   t h o s e   r a n g e s   a r e   f i x e d ,   s o   a s   l o n g   a s   t h e   r e c ' s   p r o p e r t i e s   a r e   a n y w h e r e   w i t h i n   t h o s e   r a n g e s   t h e y ' r e   o k ) ,   a n d   c o m p a r i s o n - c h e c k   t h e   d a y   ( a l l o w i n g   s o m e   f l e x i b i l i t y   i n   t h e   e v e n t   t h a t   a   l e a p   s e c o n d   n u d g e s   i t   o v e r   t o   t h e   n e x t   d a y ) ,   a n d   f i n a l l y   c h e c k   t h e   s e c o n d s   i s n ' t   o b v i o u s l y   i n v a l i d   ( e . g .   - 1 ,   7 0 ) 
 
 -   a n y   v a l u e   i n   h a v i n g   ` s e c o n d s   f r o m   G M T   t o   t z N a m e `   c o n v e n i e n c e   c o m m a n d ?   ( t h i s ' d   b e   s a m e   a s   ` s e c o n d s   t o   G M T `   e x c e p t   i t   r e t u r n s   - v e   v a l u e ;   e . g .   ` s e c o n d s   f r o m   G M T   t o   " A m e r i c a / N e w _ Y o r k " ` - >   + 5   h o u r s ) 
 
 -   w h a t   a b o u t   p a r s i n g / f o r m a t t i n g   t i m e   t e x t   a s   n o .   o f   s e c o n d s   s i n c e   m i d n i g h t ? 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �        s u p p o r t   ! " ! l     ��������  ��  ��   "  # $ # l      % & ' % j    �� (�� 0 _support   ( N     ) ) 4    �� *
�� 
scpt * m     + + � , ,  T y p e S u p p o r t & "  used for parameter checking    ' � - - 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g $  . / . l     ��������  ��  ��   /  0 1 0 i   ! 2 3 2 I      �� 4���� 
0 _error   4  5 6 5 o      ���� 0 handlername handlerName 6  7 8 7 o      ���� 0 etext eText 8  9 : 9 o      ���� 0 enumber eNumber :  ; < ; o      ���� 0 efrom eFrom <  =�� = o      ���� 
0 eto eTo��  ��   3 n     > ? > I    �� @���� &0 throwcommanderror throwCommandError @  A B A m     C C � D D  D a t e B  E F E o    ���� 0 handlername handlerName F  G H G o    ���� 0 etext eText H  I J I o    	���� 0 enumber eNumber J  K L K o   	 
���� 0 efrom eFrom L  M�� M o   
 ���� 
0 eto eTo��  ��   ? o     ���� 0 _support   1  N O N l     ��������  ��  ��   O  P Q P l     ��������  ��  ��   Q  R S R l     ��������  ��  ��   S  T U T i  " % V W V I      �������� $0 _makedefaultdate _makeDefaultDate��  ��   W l    E X Y Z X O     E [ \ [ k    D ] ]  ^ _ ^ r    ) ` a ` J     b b  c d c m    	����� d  e f e m   	 
����  f  g�� g m   
 ���� ��   a J       h h  i j i n      k l k 1    ��
�� 
year l  g     j  m n m n      o p o m    ��
�� 
mnth p  g     n  q�� q n      r s r 1   % '��
�� 
day  s  g   $ %��   _  t u t l  * A v w x v r   * A y z y J   * . { {  | } | m   * +����  }  ~�� ~ m   + ,����  ��   z J          � � � n      � � � m   4 6��
�� 
mnth �  g   3 4 �  ��� � n      � � � 1   = ?��
�� 
time �  g   < =��   w=7 note: month property normally needs set twice as it may have rolled over to next month if date's original `day` property was greater than no. of days in the new month (it doesn't actually matter in this particular case as January always has 31 days, but it's included anyway as a cautionary reminder to others)    x � � �n   n o t e :   m o n t h   p r o p e r t y   n o r m a l l y   n e e d s   s e t   t w i c e   a s   i t   m a y   h a v e   r o l l e d   o v e r   t o   n e x t   m o n t h   i f   d a t e ' s   o r i g i n a l   ` d a y `   p r o p e r t y   w a s   g r e a t e r   t h a n   n o .   o f   d a y s   i n   t h e   n e w   m o n t h   ( i t   d o e s n ' t   a c t u a l l y   m a t t e r   i n   t h i s   p a r t i c u l a r   c a s e   a s   J a n u a r y   a l w a y s   h a s   3 1   d a y s ,   b u t   i t ' s   i n c l u d e d   a n y w a y   a s   a   c a u t i o n a r y   r e m i n d e r   t o   o t h e r s ) u  ��� � L   B D � �  g   B C��   \ l     ����� � I    ������
�� .misccurdldt    ��� null��  ��  ��  ��   Y � � kludge that avoids having to use AppleScript's `date "..."` specifier syntax in this code (which requires the string literal to be written in the host system's localized date format, making the source code non-portable)    Z � � ��   k l u d g e   t h a t   a v o i d s   h a v i n g   t o   u s e   A p p l e S c r i p t ' s   ` d a t e   " . . . " `   s p e c i f i e r   s y n t a x   i n   t h i s   c o d e   ( w h i c h   r e q u i r e s   t h e   s t r i n g   l i t e r a l   t o   b e   w r i t t e n   i n   t h e   h o s t   s y s t e m ' s   l o c a l i z e d   d a t e   f o r m a t ,   m a k i n g   t h e   s o u r c e   c o d e   n o n - p o r t a b l e ) U  � � � l     ��������  ��  ��   �  � � � l      � � � � j   & ,�� ��� 0 _defaultdate _defaultDate � I   & +�������� $0 _makedefaultdate _makeDefaultDate��  ��   � 1 + 1 January 2001, 00:00:00, i.e. Cocoa epoch    � � � � V   1   J a n u a r y   2 0 0 1 ,   0 0 : 0 0 : 0 0 ,   i . e .   C o c o a   e p o c h �  � � � l     ��������  ��  ��   �  � � � j   - L�� ��� 0 _months   � J   - K � �  � � � m   - .��
�� 
jan  �  � � � m   . /��
�� 
feb  �  � � � m   / 0��
�� 
mar  �  � � � m   0 1��
�� 
apr  �  � � � m   1 2��
�� 
may  �  � � � m   2 5��
�� 
jun  �  � � � m   5 8��
�� 
jul  �  � � � m   8 ;��
�� 
aug  �  � � � m   ; >��
�� 
sep  �  � � � m   > A��
�� 
oct  �  � � � m   A D��
�� 
nov  �  ��� � m   D G��
�� 
dec ��   �  � � � j   M g�� ��� 0 	_weekdays   � J   M f � �  � � � m   M P��
�� 
mon  �  � � � m   P S��
�� 
tue  �  � � � m   S V��
�� 
wed  �  � � � m   V Y��
�� 
thu  �  � � � m   Y \��
�� 
fri  �  � � � m   \ _��
�� 
sat  �  ��� � m   _ b��
�� 
sun ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   constants     � � � �    c o n s t a n t s   �  � � � l     ��������  ��  ��   �  � � � i  h k � � � I     ������
�� .Dat:Mthsnull��� ��� null��  ��   � l    	 � � � � L     	 � � n      � � � 2   ��
�� 
cobj � o     ���� 0 _months   � �  shallow copy list before returning it to ensure any changes the user might make to the returned list won't affect the original    � � � � �   s h a l l o w   c o p y   l i s t   b e f o r e   r e t u r n i n g   i t   t o   e n s u r e   a n y   c h a n g e s   t h e   u s e r   m i g h t   m a k e   t o   t h e   r e t u r n e d   l i s t   w o n ' t   a f f e c t   t h e   o r i g i n a l �  � � � l     ��������  ��  ��   �  � � � i  l o � � � I     ������
�� .Dat:Wkdsnull��� ��� null��  ��   � l    	 � � � � L     	 � � n      � � � 2   �
� 
cobj � o     �~�~ 0 	_weekdays   �   ditto    � � � �    d i t t o �  � � � l     �}�|�{�}  �|  �{   �  � � � l     �z�y�x�z  �y  �x   �  � � � l     �w � ��w   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �v � ��v   �   dates    � � � �    d a t e s �  � � � l     �u�t�s�u  �t  �s   �  � � � i  p s � � � I      �r ��q�r 00 _asnstimezoneparameter _asNSTimeZoneParameter �    o      �p�p 0 timezone timeZone �o o      �n�n 0 parametername parameterName�o  �q   � Z     _�m =      l    	�l�k I    	�j	

�j .corecnte****       ****	 J      �i o     �h�h 0 timezone timeZone�i  
 �g�f
�g 
kocl m    �e
�e 
nmbr�f  �l  �k   m   	 
�d�d  k    %  r     n    I    �c�b�c (0 asintegerparameter asIntegerParameter  o    �a�a 0 timezone timeZone �` m     �  t i m e   z o n e�`  �b   o    �_�_ 0 _support   o      �^�^ 0 timezone timeZone �] L    % n   $ I    $�\�[�\ 80 timezoneforsecondsfromgmt_ timeZoneForSecondsFromGMT_  �Z  o     �Y�Y 0 timezone timeZone�Z  �[   n   !"! o    �X�X 0 
nstimezone 
NSTimeZone" m    �W
�W misccura�]  �m   k   ( _## $%$ r   ( 5&'& n  ( 3()( I   - 3�V*�U�V "0 astextparameter asTextParameter* +,+ o   - .�T�T 0 timezone timeZone, -�S- o   . /�R�R 0 parametername parameterName�S  �U  ) o   ( -�Q�Q 0 _support  ' o      �P�P 0 timezone timeZone% ./. r   6 @010 n  6 >232 I   9 >�O4�N�O &0 timezonewithname_ timeZoneWithName_4 5�M5 o   9 :�L�L 0 timezone timeZone�M  �N  3 n  6 9676 o   7 9�K�K 0 
nstimezone 
NSTimeZone7 m   6 7�J
�J misccura1 o      �I�I 0 asoctimezone asocTimeZone/ 898 Z  A \:;�H�G: =  A D<=< o   A B�F�F 0 asoctimezone asocTimeZone= m   B C�E
�E 
msng; n  G X>?> I   L X�D@�C�D .0 throwinvalidparameter throwInvalidParameter@ ABA o   L M�B�B 0 timezone timeZoneB CDC o   M N�A�A 0 parametername parameterNameD EFE m   N O�@
�@ 
ctxtF G�?G b   O THIH b   O RJKJ m   O PLL �MM ( u n k n o w n   t i m e   z o n e :   K o   P Q�>�> 0 timezone timeZoneI m   R SNN �OO     n a m e�?  �C  ? o   G L�=�= 0 _support  �H  �G  9 P�<P L   ] _QQ o   ] ^�;�; 0 asoctimezone asocTimeZone�<   � RSR l     �:�9�8�:  �9  �8  S TUT l     �7�6�5�7  �6  �5  U VWV i  t wXYX I      �4Z�3�4 0 
_datestyle 
_dateStyleZ [\[ o      �2�2 0 	theformat 	theFormat\ ]�1] o      �0�0 0 formatstyles formatStyles�1  �3  Y Z     �^_`a^ =    bcb o     �/�/ 0 	theformat 	theFormatc m    �.
�. FDStFDS1_ L    dd J    ee fgf m    �-
�- boovtrueg h�,h n   iji o    
�+�+ 60 nsdateformattershortstyle NSDateFormatterShortStylej m    �*
�* misccura�,  ` klk =   mnm o    �)�) 0 	theformat 	theFormatn m    �(
�( FDStFDS2l opo L    qq J    rr sts m    �'
�' boovtruet u�&u n   vwv o    �%�% 80 nsdateformattermediumstyle NSDateFormatterMediumStylew m    �$
�$ misccura�&  p xyx =  " %z{z o   " #�#�# 0 	theformat 	theFormat{ m   # $�"
�" FDStFDS3y |}| L   ( 0~~ J   ( / ��� m   ( )�!
�! boovtrue� �� � n  ) -��� o   * ,�� 40 nsdateformatterlongstyle NSDateFormatterLongStyle� m   ) *�
� misccura�   } ��� =  3 6��� o   3 4�� 0 	theformat 	theFormat� m   4 5�
� FDStFDS4� ��� L   9 A�� J   9 @�� ��� m   9 :�
� boovtrue� ��� n  : >��� o   ; =�� 40 nsdateformatterfullstyle NSDateFormatterFullStyle� m   : ;�
� misccura�  � ��� =  D G��� o   D E�� 0 	theformat 	theFormat� m   E F�
� FDStFDS6� ��� L   J R�� J   J Q�� ��� m   J K�
� boovfals� ��� n  K O��� o   L N�� 60 nsdateformattershortstyle NSDateFormatterShortStyle� m   K L�
� misccura�  � ��� =  U X��� o   U V�� 0 	theformat 	theFormat� m   V W�
� FDStFDS7� ��� L   [ c�� J   [ b�� ��� m   [ \�
� boovfals� ��� n  \ `��� o   ] _�� 80 nsdateformattermediumstyle NSDateFormatterMediumStyle� m   \ ]�
� misccura�  � ��� =  f i��� o   f g�� 0 	theformat 	theFormat� m   g h�

�
 FDStFDS8� ��� L   l t�� J   l s�� ��� m   l m�	
�	 boovfals� ��� n  m q��� o   n p�� 40 nsdateformatterlongstyle NSDateFormatterLongStyle� m   m n�
� misccura�  � ��� =  w z��� o   w x�� 0 	theformat 	theFormat� m   x y�
� FDStFDS9� ��� L   } ��� J   } ��� ��� m   } ~�
� boovfals� ��� n  ~ ���� o    �� �  40 nsdateformatterfullstyle NSDateFormatterFullStyle� m   ~ ��
�� misccura�  �  a n  � ���� I   � �������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ����� 0 formatstyles formatStyles� ���� m   � ��� ��� 
 u s i n g��  ��  � o   � ����� 0 _support  W ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  x {��� I      ������� (0 _makedateformatter _makeDateFormatter� ��� o      ���� 0 	theformat 	theFormat� ��� o      ���� 0 
localecode 
localeCode� ���� o      ���� 0 timezone timeZone��  ��  � k    K�� ��� r     ��� n    ��� I    �������� 0 init  ��  ��  � n    ��� I    �������� 	0 alloc  ��  ��  � n    ��� o    ���� "0 nsdateformatter NSDateFormatter� m     ��
�� misccura� o      ���� 0 asocformatter asocFormatter� ��� Z   ������ =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 	theformat 	theFormat��  � �����
�� 
kocl� m    ��
�� 
ctxt��  ��  ��  � m    ���� � l   ,���� n   ,��� I    ,�������  0 setdateformat_ setDateFormat_� ���� l   (������ n   (��� I   " (������� "0 astextparameter asTextParameter� ��� o   " #���� 0 	theformat 	theFormat�  ��  m   # $ � 
 u s i n g��  ��  � o    "���� 0 _support  ��  ��  ��  ��  � o    ���� 0 asocformatter asocFormatter�   use custom format string   � � 2   u s e   c u s t o m   f o r m a t   s t r i n g��  � l  / k   / 	 r   / ;

 n  / 9 I   4 9������ "0 aslistparameter asListParameter �� o   4 5���� 0 	theformat 	theFormat��  ��   o   / 4���� 0 _support   o      ���� 0 formattypes formatTypes	  Z   < ^���� =  < A o   < =���� 0 formattypes formatTypes J   = @ �� m   = >��
�� FDStFDS0��   l  D Z k   D Z  n  D J I   E J�� ����  0 setdateformat_ setDateFormat_  !��! m   E F"" �## 4 y y y y - M M - d d ' T ' H H : m m : s s Z Z Z Z Z��  ��   o   D E���� 0 asocformatter asocFormatter $%$ n  K W&'& I   L W��(���� 0 
setlocale_ 
setLocale_( )��) l  L S*����* n  L S+,+ I   O S�������� 0 systemlocale systemLocale��  ��  , n  L O-.- o   M O���� 0 nslocale NSLocale. m   L M��
�� misccura��  ��  ��  ��  ' o   K L���� 0 asocformatter asocFormatter% /��/ L   X Z00 o   X Y���� 0 asocformatter asocFormatter��     return ISO8601 formatter    �11 2   r e t u r n   I S O 8 6 0 1   f o r m a t t e r��  ��   232 n  _ i454 I   ` i��6���� 0 setdatestyle_ setDateStyle_6 7��7 l  ` e8����8 n  ` e9:9 o   a e���� 00 nsdateformatternostyle NSDateFormatterNoStyle: m   ` a��
�� misccura��  ��  ��  ��  5 o   _ `���� 0 asocformatter asocFormatter3 ;<; n  j t=>= I   k t��?���� 0 settimestyle_ setTimeStyle_? @��@ l  k pA����A n  k pBCB o   l p���� 00 nsdateformatternostyle NSDateFormatterNoStyleC m   k l��
�� misccura��  ��  ��  ��  > o   j k���� 0 asocformatter asocFormatter< DED r   u �FGF J   u yHH IJI m   u v��
�� boovfalsJ K��K m   v w��
�� boovfals��  G J      LL MNM o      ���� 0 	isdateset 	isDateSetN O��O o      ���� 0 	istimeset 	isTimeSet��  E P��P X   �Q��RQ k   �SS TUT r   � �VWV I      ��X���� 0 
_datestyle 
_dateStyleX YZY n  � �[\[ 1   � ���
�� 
pcnt\ o   � ����� 0 aref aRefZ ]��] o   � ����� 0 	theformat 	theFormat��  ��  W J      ^^ _`_ o      ���� 0 isdate isDate` a��a o      ���� 0 
asocoption 
asocOption��  U b��b Z   �cd��ec o   � ����� 0 isdate isDated k   � �ff ghg Z  � �ij����i o   � ����� 0 	isdateset 	isDateSetj n  � �klk I   � ���m���� .0 throwinvalidparameter throwInvalidParameterm non o   � ����� 0 formattypes formatTypeso pqp m   � �rr �ss 
 u s i n gq tut m   � ���
�� 
listu v��v m   � �ww �xx * t o o   m a n y   d a t e   f o r m a t s��  ��  l o   � ����� 0 _support  ��  ��  h yzy l  � �{����{ n  � �|}| I   � ���~���� 0 setdatestyle_ setDateStyle_~ �� o   � ����� 0 
asocoption 
asocOption��  ��  } o   � ����� 0 asocformatter asocFormatter��  ��  z ��� r   � ���� m   � ��~
�~ boovtrue� o      �}�} 0 	isdateset 	isDateSet�  ��  e k   ��� ��� Z  �
���|�{� o   � ��z�z 0 	istimeset 	isTimeSet� n  ���� I   ��y��x�y .0 throwinvalidparameter throwInvalidParameter� ��� o   � ��w�w 0 formattypes formatTypes� ��� m   � ��� ��� 
 u s i n g� ��� m   � ��v
�v 
list� ��u� m   � �� ��� * t o o   m a n y   t i m e   f o r m a t s�u  �x  � o   � ��t�t 0 _support  �|  �{  � ��� l ��s�r� n ��� I  �q��p�q 0 settimestyle_ setTimeStyle_� ��o� o  �n�n 0 
asocoption 
asocOption�o  �p  � o  �m�m 0 asocformatter asocFormatter�s  �r  � ��l� r  ��� m  �k
�k boovtrue� o      �j�j 0 	istimeset 	isTimeSet�l  ��  �� 0 aref aRefR o   � ��i�i 0 formattypes formatTypes��   < 6 use predefined date-style and/or time-style constants    ��� l   u s e   p r e d e f i n e d   d a t e - s t y l e   a n d / o r   t i m e - s t y l e   c o n s t a n t s� ��� n -��� I  -�h��g�h 0 
setlocale_ 
setLocale_� ��f� l )��e�d� n )��� I  !)�c��b�c *0 asnslocaleparameter asNSLocaleParameter� ��� o  !"�a�a 0 
localecode 
localeCode� ��`� m  "%�� ���  f o r   l o c a l e�`  �b  � o  !�_�_ 0 _support  �e  �d  �f  �g  � o  �^�^ 0 asocformatter asocFormatter� ��� Z .H���]�\� > .3��� o  ./�[�[ 0 timezone timeZone� m  /2�Z
�Z 
msng� n 6D��� I  7D�Y��X�Y 0 settimezone_ setTimeZone_� ��W� l 7@��V�U� I  7@�T��S�T 00 _asnstimezoneparameter _asNSTimeZoneParameter� ��� o  89�R�R 0 timezone timeZone� ��Q� m  9<�� ���  t i m e   z o n e�Q  �S  �V  �U  �W  �X  � o  67�P�P 0 asocformatter asocFormatter�]  �\  � ��O� L  IK�� o  IJ�N�N 0 asocformatter asocFormatter�O  � ��� l     �M�L�K�M  �L  �K  � ��� l     �J�I�H�J  �I  �H  � ��� l     �G�F�E�G  �F  �E  � ��� i  | ��� I     �D��
�D .Dat:FDatnull���     ldt � o      �C�C 0 thedate theDate� �B��
�B 
Usin� |�A�@��?��A  �@  � o      �>�> 0 	theformat 	theFormat�?  � l     ��=�<� J      �� ��;� m      �:
�: FDStFDS0�;  �=  �<  � �9��
�9 
Loca� |�8�7��6��8  �7  � o      �5�5 0 
localecode 
localeCode�6  � l     ��4�3� m      �2
�2 LclELclS�4  �3  � �1��0
�1 
TZon� |�/�.��-��/  �.  � o      �,�, 0 timezone timeZone�-  � l     ��+�*� m      �)
�) 
msng�+  �*  �0  � Q     7���� k    %�� ��� r    ��� n   ��� I    �(��'�( "0 asdateparameter asDateParameter� ��� o    	�&�& 0 thedate theDate� ��%� m   	 
�� ���  �%  �'  � o    �$�$ 0 _support  � o      �#�# 0 thedate theDate� ��� r    ��� I    �"��!�" (0 _makedateformatter _makeDateFormatter� ��� o    � �  0 	theformat 	theFormat� ��� o    �� 0 
localecode 
localeCode� ��� o    �� 0 timezone timeZone�  �!  � o      �� 0 asocformatter asocFormatter� ��� L    %�� c    $��� l   "���� n   "��� I    "� �� "0 stringfromdate_ stringFromDate_  � o    �� 0 thedate theDate�  �  � o    �� 0 asocformatter asocFormatter�  �  � m   " #�
� 
ctxt�  � R      �
� .ascrerr ****      � **** o      �� 0 etext eText �
� 
errn o      �� 0 enumber eNumber �
� 
erob o      �� 0 efrom eFrom ��
� 
errt o      �
�
 
0 eto eTo�  � I   - 7�		��	 
0 _error  	 

 m   . / �  f o r m a t   d a t e  o   / 0�� 0 etext eText  o   0 1�� 0 enumber eNumber  o   1 2�� 0 efrom eFrom � o   2 3�� 
0 eto eTo�  �  �  l     ��� �  �  �     l     ��������  ��  ��    i  � � I     ��
�� .Dat:PDatnull���     ctxt o      ���� 0 thetext theText �� 
�� 
Usin |����!��"��  ��  ! o      ���� 0 	theformat 	theFormat��  " l     #����# J      $$ %��% m      ��
�� FDStFDS0��  ��  ��    ��&'
�� 
Loca& |����(��)��  ��  ( o      ���� 0 
localecode 
localeCode��  ) l     *����* m      ��
�� LclELclS��  ��  ' ��+��
�� 
TZon+ |����,��-��  ��  , o      ���� 0 timezone timeZone��  - l     .����. m      ��
�� 
msng��  ��  ��   l    �/01/ Q     �2342 k    �55 676 r    898 n   :;: I    ��<���� &0 stringwithstring_ stringWithString_< =��= l   >����> n   ?@? I    ��A���� "0 astextparameter asTextParameterA BCB o    ���� 0 thetext theTextC D��D m    EE �FF  ��  ��  @ o    ���� 0 _support  ��  ��  ��  ��  ; n   GHG o    ���� 0 nsstring NSStringH m    ��
�� misccura9 o      ���� 0 asoctext asocText7 IJI r    "KLK I     ��M���� (0 _makedateformatter _makeDateFormatterM NON o    ���� 0 	theformat 	theFormatO PQP o    ���� 0 
localecode 
localeCodeQ R��R o    ���� 0 timezone timeZone��  ��  L o      ���� 0 asocformatter asocFormatterJ STS r   # +UVU n  # )WXW I   $ )��Y���� "0 datefromstring_ dateFromString_Y Z��Z o   $ %���� 0 thetext theText��  ��  X o   # $���� 0 asocformatter asocFormatterV o      ���� 0 asocdate asocDateT [\[ Z   , �]^����] =  , /_`_ o   , -���� 0 asocdate asocDate` m   - .��
�� 
msng^ l  2 �abca k   2 �dd efe r   2 =ghg n  2 ;iji I   7 ;�������� $0 localeidentifier localeIdentifier��  ��  j n  2 7klk I   3 7�������� 
0 locale  ��  ��  l o   2 3���� 0 asocformatter asocFormatterh o      ���� $0 localeidentifier localeIdentifierf mnm Z   > ]op��qo G   > Mrsr =  > Atut o   > ?���� $0 localeidentifier localeIdentifieru m   ? @��
�� 
msngs =   D Kvwv n  D Ixyx 1   G I��
�� 
lengy l  D Gz����z c   D G{|{ o   D E���� $0 localeidentifier localeIdentifier| m   E F��
�� 
ctxt��  ��  w m   I J����  p r   P S}~} m   P Q ���  s t a n d a r d~ o      ���� $0 localeidentifier localeIdentifier��  q r   V ]��� b   V [��� b   V Y��� m   V W�� ���  � o   W X���� $0 localeidentifier localeIdentifier� m   Y Z�� ���  � o      ���� $0 localeidentifier localeIdentifiern ���� R   ^ �����
�� .ascrerr ****      � ****� l  l ������ b   l ��� b   l {��� b   l y��� b   l u��� m   l o�� ��� t T e x t   i s   n o t   i n   t h e   c o r r e c t   f o r m a t   ( e x p e c t e d   d a t e   t e x t   i n   � l  o t������ n  o t��� I   p t�������� 0 
dateformat 
dateFormat��  ��  � o   o p���� 0 asocformatter asocFormatter��  ��  � m   u x�� ��� "    f o r m a t   f o r   t h e  � o   y z���� $0 localeidentifier localeIdentifier� m   { ~�� ���    l o c a l e . )��  ��  � ����
�� 
errn� m   b e�����Y� �����
�� 
erob� o   h i���� 0 thetext theText��  ��  b &   parsing failed, so report error   c ��� @   p a r s i n g   f a i l e d ,   s o   r e p o r t   e r r o r��  ��  \ ���� l  � ����� L   � ��� c   � ���� o   � ����� 0 asocdate asocDate� m   � ���
�� 
ldt � � � note that AS dates don't include time zone info, so resulting date object always uses host machine's current tz, regardless of what tz theText used, adjusting the date object's time appropriately   � ����   n o t e   t h a t   A S   d a t e s   d o n ' t   i n c l u d e   t i m e   z o n e   i n f o ,   s o   r e s u l t i n g   d a t e   o b j e c t   a l w a y s   u s e s   h o s t   m a c h i n e ' s   c u r r e n t   t z ,   r e g a r d l e s s   o f   w h a t   t z   t h e T e x t   u s e d ,   a d j u s t i n g   t h e   d a t e   o b j e c t ' s   t i m e   a p p r o p r i a t e l y��  3 R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  4 I   � �������� 
0 _error  � ��� m   � ��� ���  p a r s e   d a t e� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  0 N H note that `time zone` param is ignored when TZ is provided by date text   1 ��� �   n o t e   t h a t   ` t i m e   z o n e `   p a r a m   i s   i g n o r e d   w h e n   T Z   i s   p r o v i d e d   b y   d a t e   t e x t ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Date creation   � ���    D a t e   c r e a t i o n� ��� l     ��������  ��  ��  � ��� l     ����~��  �  �~  � ��� i  � ���� I     �}��|
�} .Dat:ReDanull��� ��� WebC� |�{�z��y��{  �z  � o      �x�x  0 dateproperties dateProperties�y  � l     ��w�v� J      �u�u  �w  �v  �|  � Q    ���� k   ��� ��� s    ��� o    �t�t 0 _defaultdate _defaultDate� o      �s�s 0 newdate newDate� ��� l   *���� r    *��� l   (��r�q� b    (��� n   ��� I    �p��o�p &0 asrecordparameter asRecordParameter� ��� o    �n�n  0 dateproperties dateProperties� ��m� m    �� ���  �m  �o  � o    �l�l 0 _support  � K    '�� �k��
�k 
year� m    �j�j�� �i��
�i 
mnth� m    �h�h � �g��
�g 
day � m    �f�f � �e��
�e 
hour� m    �d�d  � �c��
�c 
min � m     !�b�b  � �a� 
�a 
scnd� m   " #�`�`    �_�^
�_ 
time m   $ %�]
�] 
msng�^  �r  �q  � o      �\�\ 0 rec  � @ : use the Cocoa epoch (1 January 2001, 00:00:00) as default   � � t   u s e   t h e   C o c o a   e p o c h   ( 1   J a n u a r y   2 0 0 1 ,   0 0 : 0 0 : 0 0 )   a s   d e f a u l t�  Q   + X r   . 7	 c   . 3

 n  . 1 1   / 1�[
�[ 
year o   . /�Z�Z 0 rec   m   1 2�Y
�Y 
long	 n      1   4 6�X
�X 
year o   3 4�W�W 0 newdate newDate R      �V
�V .ascrerr ****      � **** o      �U�U 0 etext eText �T�S
�T 
errn d       m      �R�R��S   R   ? X�Q
�Q .ascrerr ****      � **** b   R W m   R U � 2 I n v a l i d    y e a r    p r o p e r t y :   o   U V�P�P 0 etext eText �O
�O 
errn m   A D�N�N�Y �M
�M 
erob l  G K�L�K N   G K n   G J !  1   H J�J
�J 
year! o   G H�I�I  0 dateproperties dateProperties�L  �K   �H"�G
�H 
errt" m   N O�F
�F 
long�G   #$# Z   Y �%&�E'% E  Y d()( o   Y ^�D�D 0 _months  ) J   ^ c** +�C+ n  ^ a,-, m   _ a�B
�B 
mnth- o   ^ _�A�A 0 rec  �C  & l  g n./0. r   g n121 n  g j343 m   h j�@
�@ 
mnth4 o   g h�?�? 0 rec  2 n     565 m   k m�>
�> 
mnth6 o   j k�=�= 0 newdate newDate/ unlike year/day/time properties, which require numbers, a date object's `month` property accepts either an integer or a month constant; however, it also happily accepts weekday constants which is obviously wrong, so make sure a given constant is a valid month before assigning it   0 �770   u n l i k e   y e a r / d a y / t i m e   p r o p e r t i e s ,   w h i c h   r e q u i r e   n u m b e r s ,   a   d a t e   o b j e c t ' s   ` m o n t h `   p r o p e r t y   a c c e p t s   e i t h e r   a n   i n t e g e r   o r   a   m o n t h   c o n s t a n t ;   h o w e v e r ,   i t   a l s o   h a p p i l y   a c c e p t s   w e e k d a y   c o n s t a n t s   w h i c h   i s   o b v i o u s l y   w r o n g ,   s o   m a k e   s u r e   a   g i v e n   c o n s t a n t   i s   a   v a l i d   m o n t h   b e f o r e   a s s i g n i n g   i t�E  ' l  q �89:8 Q   q �;<=; r   t }>?> c   t y@A@ n  t wBCB m   u w�<
�< 
mnthC o   t u�;�; 0 rec  A m   w x�:
�: 
long? n     DED m   z |�9
�9 
mnthE o   y z�8�8 0 newdate newDate< R      �7FG
�7 .ascrerr ****      � ****F o      �6�6 0 etext eTextG �5H�4
�5 
errnH d      II m      �3�3��4  = R   � ��2JK
�2 .ascrerr ****      � ****J b   � �LML m   � �NN �OO 4 I n v a l i d    m o n t h    p r o p e r t y :  M o   � ��1�1 0 etext eTextK �0PQ
�0 
errnP m   � ��/�/�YQ �.RS
�. 
erobR l  � �T�-�,T N   � �UU n   � �VWV m   � ��+
�+ 
mnthW o   � ��*�*  0 dateproperties dateProperties�-  �,  S �)X�(
�) 
errtX J   � �YY Z[Z m   � ��'
�' 
enum[ \�&\ m   � ��%
�% 
long�&  �(  9 , & otherwise it must be an integer value   : �]] L   o t h e r w i s e   i t   m u s t   b e   a n   i n t e g e r   v a l u e$ ^_^ Q   � �`ab` r   � �cdc c   � �efe n  � �ghg 1   � ��$
�$ 
day h o   � ��#�# 0 rec  f m   � ��"
�" 
longd n     iji 1   � ��!
�! 
day j o   � �� �  0 newdate newDatea R      �kl
� .ascrerr ****      � ****k o      �� 0 etext eTextl �m�
� 
errnm d      nn m      ����  b R   � ��op
� .ascrerr ****      � ****o b   � �qrq m   � �ss �tt 0 I n v a l i d    d a y    p r o p e r t y :  r o   � ��� 0 etext eTextp �uv
� 
errnu m   � ����Yv �wx
� 
erobw l  � �y��y N   � �zz n   � �{|{ 1   � ��
� 
day | o   � ���  0 dateproperties dateProperties�  �  x �}�
� 
errt} m   � ��
� 
long�  _ ~~ Z   �1����� F   ���� F   � ���� =   � ���� l  � ����� I  � ��
��
�
 .corecnte****       ****� J   � ��� ��	� n  � ���� m   � ��
� 
mnth� o   � ��� 0 rec  �	  � ���
� 
kocl� m   � ��
� 
nmbr�  �  �  � m   � ���  � =   � ���� l  � ����� I  � �� ��
�  .corecnte****       ****� J   � ��� ���� n  � ���� m   � ���
�� 
mnth� o   � ����� 0 rec  ��  � �����
�� 
kocl� m   � ���
�� 
ctxt��  �  �  � m   � �����  � H   �
�� E  �	��� o   ����� 0 _months  � J  �� ���� n ��� m  ��
�� 
mnth� o  ���� 0 rec  ��  � l -���� R  -����
�� .ascrerr ****      � ****� m  ),�� ��� p I n v a l i d    m o n t h    p r o p e r t y   ( e x p e c t e d   i n t e g e r   o r   c o n s t a n t ) .� ����
�� 
errn� m  �����Y� ����
�� 
erob� l ������ N  �� n  ��� m  ��
�� 
mnth� o  ����  0 dateproperties dateProperties��  ��  � �����
�� 
errt� J   &�� ��� m   #��
�� 
enum� ���� m  #$��
�� 
long��  ��  � o i TO DO: revise this: first check for constant and cast if found, then try integer cast and error if fails   � ��� �   T O   D O :   r e v i s e   t h i s :   f i r s t   c h e c k   f o r   c o n s t a n t   a n d   c a s t   i f   f o u n d ,   t h e n   t r y   i n t e g e r   c a s t   a n d   e r r o r   i f   f a i l s�  �   ��� Z  2������� = 27��� n 25��� 1  35��
�� 
time� o  23���� 0 rec  � m  56��
�� 
msng� k  :��� ��� Q  :i���� r  =H��� [  =F��� o  =>���� 0 newdate newDate� ]  >E��� l >?������ 1  >?��
�� 
hour��  ��  � l ?D������ c  ?D��� n ?B��� 1  @B��
�� 
hour� o  ?@���� 0 rec  � m  BC��
�� 
long��  ��  � o      ���� 0 newdate newDate� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� �����
�� 
errn� d      �� m      �������  � R  Pi����
�� .ascrerr ****      � ****� b  ch��� m  cf�� ��� 4 I n v a l i d    h o u r s    p r o p e r t y :  � o  fg���� 0 etext eText� ����
�� 
errn� m  RU�����Y� ����
�� 
erob� l X\������ N  X\�� n  X[��� 1  Y[��
�� 
hour� o  XY����  0 dateproperties dateProperties��  ��  � �����
�� 
errt� m  _`��
�� 
long��  � ��� Q  j����� r  mx��� [  mv��� o  mn���� 0 newdate newDate� ]  nu��� l no������ 1  no��
�� 
min ��  ��  � l ot������ c  ot��� n or��� 1  pr��
�� 
min � o  op���� 0 rec  � m  rs��
�� 
long��  ��  � o      ���� 0 newdate newDate� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� �����
�� 
errn� d      �� m      �������  � R  ������
�� .ascrerr ****      � ****� b  ����� m  ���� ��� 8 I n v a l i d    m i n u t e s    p r o p e r t y :  � o  ������ 0 etext eText� ��� 
�� 
errn� m  �������Y  ��
�� 
erob l ������ N  �� n  �� 1  ����
�� 
min  o  ������  0 dateproperties dateProperties��  ��   ����
�� 
errt m  ����
�� 
long��  � �� Q  ��	
	 r  �� [  �� o  ������ 0 newdate newDate l ������ c  �� n �� m  ����
�� 
scnd o  ������ 0 rec   m  ����
�� 
long��  ��   o      ���� 0 newdate newDate
 R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ����
�� 
errn d       m      �������   R  ����
�� .ascrerr ****      � **** b  �� m  �� � 8 I n v a l i d    s e c o n d s    p r o p e r t y :   o  ������ 0 etext eText �� 
�� 
errn m  �������Y  ��!"
�� 
erob! l ��#����# N  ��$$ n  ��%&% m  ����
�� 
scnd& o  ������  0 dateproperties dateProperties��  ��  " ��'��
�� 
errt' m  ����
�� 
long��  ��  ��  � Q  ��()*( r  ��+,+ c  ��-.- n ��/0/ 1  ����
�� 
time0 o  ������ 0 rec  . m  ����
�� 
long, n     121 1  ����
�� 
time2 o  ������ 0 newdate newDate) R      ��34
�� .ascrerr ****      � ****3 o      ���� 0 etext eText4 ��5��
�� 
errn5 d      66 m      �������  * R  ����78
�� .ascrerr ****      � ****7 b  ��9:9 m  ��;; �<< 2 I n v a l i d    t i m e    p r o p e r t y :  : o  ������ 0 etext eText8 ��=>
�� 
errn= m  �������Y> ��?@
�� 
erob? l ��A����A N  ��BB n  ��CDC 1  ����
�� 
timeD o  ������  0 dateproperties dateProperties��  ��  @ ��E��
�� 
errtE m  ���
� 
long��  � F�~F L  ��GG o  ���}�} 0 newdate newDate�~  � R      �|HI
�| .ascrerr ****      � ****H o      �{�{ 0 etext eTextI �zJK
�z 
errnJ o      �y�y 0 enumber eNumberK �xLM
�x 
erobL o      �w�w 0 efrom eFromM �vN�u
�v 
errtN o      �t�t 
0 eto eTo�u  � I  �sO�r�s 
0 _error  O PQP m  RR �SS  j o i n   d a t eQ TUT o  �q�q 0 etext eTextU VWV o  �p�p 0 enumber eNumberW XYX o  	�o�o 0 efrom eFromY Z�nZ o  	
�m�m 
0 eto eTo�n  �r  � [\[ l     �l�k�j�l  �k  �j  \ ]^] l     �i�h�g�i  �h  �g  ^ _`_ i  � �aba I     �fc�e
�f .Dat:DaRenull��� ��� ldt c |�d�cd�be�d  �c  d o      �a�a 0 thedate theDate�b  e l     f�`�_f m      �^
�^ 
msng�`  �_  �e  b Q     ^ghig k    Hjj klk Z     mn�]om =   pqp o    �\�\ 0 thedate theDateq m    �[
�[ 
msngn r   	 rsr o   	 �Z�Z 0 _defaultdate _defaultDates o      �Y�Y 0 thedate theDate�]  o r     tut n   vwv I    �Xx�W�X "0 asdateparameter asDateParameterx yzy o    �V�V 0 thedate theDatez {�U{ m    || �}}  �U  �W  w o    �T�T 0 _support  u o      �S�S 0 thedate theDatel ~�R~ L   ! H K   ! G�� �Q��
�Q 
year� n  " &��� 1   # %�P
�P 
year� o   " #�O�O 0 thedate theDate� �N��
�N 
mnth� c   ' ,��� n  ' *��� m   ( *�M
�M 
mnth� o   ' (�L�L 0 thedate theDate� m   * +�K
�K 
long� �J��
�J 
day � n  - 1��� 1   . 0�I
�I 
day � o   - .�H�H 0 thedate theDate� �G��
�G 
hour� _   2 7��� l  2 5��F�E� n  2 5��� 1   3 5�D
�D 
time� o   2 3�C�C 0 thedate theDate�F  �E  � m   5 6�B�B� �A��
�A 
min � `   8 ?��� _   8 =��� l  8 ;��@�?� n  8 ;��� 1   9 ;�>
�> 
time� o   8 9�=�= 0 thedate theDate�@  �?  � m   ; <�<�< <� m   = >�;�; <� �:��9
�: 
scnd� `   @ E��� l  @ C��8�7� n  @ C��� 1   A C�6
�6 
time� o   @ A�5�5 0 thedate theDate�8  �7  � m   C D�4�4 <�9  �R  h R      �3��
�3 .ascrerr ****      � ****� o      �2�2 0 etext eText� �1��
�1 
errn� o      �0�0 0 enumber eNumber� �/��
�/ 
erob� o      �.�. 0 efrom eFrom� �-��,
�- 
errt� o      �+�+ 
0 eto eTo�,  i I   P ^�*��)�* 
0 _error  � ��� m   Q T�� ���  s p l i t   d a t e� ��� o   T U�(�( 0 etext eText� ��� o   U V�'�' 0 enumber eNumber� ��� o   V W�&�& 0 efrom eFrom� ��%� o   W X�$�$ 
0 eto eTo�%  �)  ` ��� l     �#�"�!�#  �"  �!  � ��� l     � ���   �  �  � ��� l     ����  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ����  �   time zone support   � ��� $   t i m e   z o n e   s u p p o r t� ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I     ���
� .Dat:LiTznull��� ��� null�  �  � l    ���� L     �� c     ��� l    ���� n    ��� I    ���� 60 sortedarrayusingselector_ sortedArrayUsingSelector_� ��� m    �� ���  c o m p a r e :�  �  � n    ��� I    ���� (0 knowntimezonenames knownTimeZoneNames�  �  � n    ��� o    �
�
 0 
nstimezone 
NSTimeZone� m     �	
�	 misccura�  �  � m    �
� 
list� � �> {"Africa/Abidjan", "Africa/Accra", "Africa/Addis_Ababa", ...} -- what about optional parameter for specifying no of seconds from GMT? if given, list would be filtered for time zones with that offset only   � ���� >   { " A f r i c a / A b i d j a n " ,   " A f r i c a / A c c r a " ,   " A f r i c a / A d d i s _ A b a b a " ,   . . . }   - -   w h a t   a b o u t   o p t i o n a l   p a r a m e t e r   f o r   s p e c i f y i n g   n o   o f   s e c o n d s   f r o m   G M T ?   i f   g i v e n ,   l i s t   w o u l d   b e   f i l t e r e d   f o r   t i m e   z o n e s   w i t h   t h a t   o f f s e t   o n l y� ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I     �� ��
� .Dat:CuTznull��� ��� null�   ��  � L     �� c     ��� l    ������ n    ��� I    �������� 0 name  ��  ��  � n    ��� I    �������� 0 localtimezone localTimeZone��  ��  � n    ��� o    ���� 0 
nstimezone 
NSTimeZone� m     ��
�� misccura��  ��  � m    ��
�� 
ctxt� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Dat:TzGMnull��� ��� null��  � �����
�� 
From� |����������  ��  � o      ���� 0 tzname tzName��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q     Z� � Z    D�� =    o    ���� 0 tzname tzName m    ��
�� 
msng l  	 	 L   	 

 n  	  I    ��������  0 secondsfromgmt secondsFromGMT��  ��   n  	  I    �������� 0 localtimezone localTimeZone��  ��   n  	  o   
 ���� 0 
nstimezone 
NSTimeZone m   	 
��
�� misccura 6 0 equivalent to Standard Additions' `time to GMT`   	 � `   e q u i v a l e n t   t o   S t a n d a r d   A d d i t i o n s '   ` t i m e   t o   G M T `��   k    D  Z   7���� =    # l   !���� I   !��
�� .corecnte****       **** J     �� o    ���� 0 tzname tzName��   ����
�� 
kocl m    ��
�� 
ctxt��  ��  ��   m   ! "����   n  & 3  I   + 3��!���� 60 throwinvalidparametertype throwInvalidParameterType! "#" o   + ,���� 0 tzname tzName# $%$ m   , -&& �''  f r o m% ()( m   - .��
�� 
ctxt) *��* m   . /++ �,,  t e x t��  ��    o   & +���� 0 _support  ��  ��   -��- L   8 D.. n  8 C/0/ I   ? C��������  0 secondsfromgmt secondsFromGMT��  ��  0 I   8 ?��1���� 00 _asnstimezoneparameter _asNSTimeZoneParameter1 232 o   9 :���� 0 tzname tzName3 4��4 m   : ;55 �66  ��  ��  ��    R      ��78
�� .ascrerr ****      � ****7 o      ���� 0 etext eText8 ��9:
�� 
errn9 o      ���� 0 enumber eNumber: ��;<
�� 
erob; o      ���� 0 efrom eFrom< ��=��
�� 
errt= o      ���� 
0 eto eTo��   I   L Z��>���� 
0 _error  > ?@? m   M PAA �BB  s e c o n d s   t o   G M T@ CDC o   P Q���� 0 etext eTextD EFE o   Q R���� 0 enumber eNumberF GHG o   R S���� 0 efrom eFromH I��I o   S T���� 
0 eto eTo��  ��  � JKJ l     ��������  ��  ��  K LML l     ��������  ��  ��  M N��N l     ��������  ��  ��  ��       ��OPQRSTUVWXYZ[\]^_`ab��  O ��������������������������������������
�� 
pimr�� 0 _support  �� 
0 _error  �� $0 _makedefaultdate _makeDefaultDate�� 0 _defaultdate _defaultDate�� 0 _months  �� 0 	_weekdays  
�� .Dat:Mthsnull��� ��� null
�� .Dat:Wkdsnull��� ��� null�� 00 _asnstimezoneparameter _asNSTimeZoneParameter�� 0 
_datestyle 
_dateStyle�� (0 _makedateformatter _makeDateFormatter
�� .Dat:FDatnull���     ldt 
�� .Dat:PDatnull���     ctxt
�� .Dat:ReDanull��� ��� WebC
�� .Dat:DaRenull��� ��� ldt 
�� .Dat:LiTznull��� ��� null
�� .Dat:CuTznull��� ��� null
�� .Dat:TzGMnull��� ��� nullP ��c�� c  ded ��f��
�� 
cobjf gg   �� 
�� 
frmk��  e ��h��
�� 
cobjh ii   ��
�� 
osax��  Q jj   �� +
�� 
scptR �� 3����kl���� 
0 _error  �� ��m�� m  ����������� 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom� 
0 eto eTo��  k �~�}�|�{�z�~ 0 handlername handlerName�} 0 etext eText�| 0 enumber eNumber�{ 0 efrom eFrom�z 
0 eto eTol  C�y�x�y �x &0 throwcommanderror throwCommandError�� b  ࠡ����+ S �w W�v�uno�t�w $0 _makedefaultdate _makeDefaultDate�v  �u  n  o �s�r�q�p�o�n�m
�s .misccurdldt    ��� null�r�
�q 
cobj
�p 
year
�o 
mnth
�n 
day 
�m 
time�t F*j   >�kkmvE[�k/*�,FZ[�l/*�,FZ[�m/*�,FZOkjlvE[�k/*�,FZ[�l/*�,FZO*UT ldt     �uy U �lp�l p  �k�j�i�h�g�f�e�d�c�b�a�`
�k 
jan 
�j 
feb 
�i 
mar 
�h 
apr 
�g 
may 
�f 
jun 
�e 
jul 
�d 
aug 
�c 
sep 
�b 
oct 
�a 
nov 
�` 
dec V �_q�_ q  �^�]�\�[�Z�Y�X
�^ 
mon 
�] 
tue 
�\ 
wed 
�[ 
thu 
�Z 
fri 
�Y 
sat 
�X 
sun W �W ��V�Urs�T
�W .Dat:Mthsnull��� ��� null�V  �U  r  s �S
�S 
cobj�T 
b  �-EX �R ��Q�Ptu�O
�R .Dat:Wkdsnull��� ��� null�Q  �P  t  u �N
�N 
cobj�O 
b  �-EY �M ��L�Kvw�J�M 00 _asnstimezoneparameter _asNSTimeZoneParameter�L �Ix�I x  �H�G�H 0 timezone timeZone�G 0 parametername parameterName�K  v �F�E�D�F 0 timezone timeZone�E 0 parametername parameterName�D 0 asoctimezone asocTimeZonew �C�B�A�@�?�>�=�<�;�:�9LN�8�7
�C 
kocl
�B 
nmbr
�A .corecnte****       ****�@ (0 asintegerparameter asIntegerParameter
�? misccura�> 0 
nstimezone 
NSTimeZone�= 80 timezoneforsecondsfromgmt_ timeZoneForSecondsFromGMT_�< "0 astextparameter asTextParameter�; &0 timezonewithname_ timeZoneWithName_
�: 
msng
�9 
ctxt�8 �7 .0 throwinvalidparameter throwInvalidParameter�J `�kv��l k  b  ��l+ E�O��,�k+ Y 9b  ��l+ E�O��,�k+ 	E�O��  b  ����%�%�+ Y hO�Z �6Y�5�4yz�3�6 0 
_datestyle 
_dateStyle�5 �2{�2 {  �1�0�1 0 	theformat 	theFormat�0 0 formatstyles formatStyles�4  y �/�.�/ 0 	theformat 	theFormat�. 0 formatstyles formatStylesz �-�,�+�*�)�(�'�&�%�$�#�"�!�� 
�- FDStFDS1
�, misccura�+ 60 nsdateformattershortstyle NSDateFormatterShortStyle
�* FDStFDS2�) 80 nsdateformattermediumstyle NSDateFormatterMediumStyle
�( FDStFDS3�' 40 nsdateformatterlongstyle NSDateFormatterLongStyle
�& FDStFDS4�% 40 nsdateformatterfullstyle NSDateFormatterFullStyle
�$ FDStFDS6
�# FDStFDS7
�" FDStFDS8
�! FDStFDS9�  >0 throwinvalidconstantparameter throwInvalidConstantParameter�3 ���  e��,ElvY ���  e��,ElvY s��  e��,ElvY b��  e��,ElvY Q��  f��,ElvY @��  f��,ElvY /��  f��,ElvY ��  f��,ElvY b  ��l+ [ ����|}�� (0 _makedateformatter _makeDateFormatter� �~� ~  ���� 0 	theformat 	theFormat� 0 
localecode 
localeCode� 0 timezone timeZone�  | 
����������� 0 	theformat 	theFormat� 0 
localecode 
localeCode� 0 timezone timeZone� 0 asocformatter asocFormatter� 0 formattypes formatTypes� 0 	isdateset 	isDateSet� 0 	istimeset 	isTimeSet� 0 aref aRef� 0 isdate isDate� 0 
asocoption 
asocOption} #����
�	������"��� ������������r��w����������������
� misccura� "0 nsdateformatter NSDateFormatter� 	0 alloc  �
 0 init  
�	 
kocl
� 
ctxt
� .corecnte****       ****� "0 astextparameter asTextParameter�  0 setdateformat_ setDateFormat_� "0 aslistparameter asListParameter
� FDStFDS0� 0 nslocale NSLocale� 0 systemlocale systemLocale�  0 
setlocale_ 
setLocale_�� 00 nsdateformatternostyle NSDateFormatterNoStyle�� 0 setdatestyle_ setDateStyle_�� 0 settimestyle_ setTimeStyle_
�� 
cobj
�� 
pcnt�� 0 
_datestyle 
_dateStyle
�� 
list�� �� .0 throwinvalidparameter throwInvalidParameter�� *0 asnslocaleparameter asNSLocaleParameter
�� 
msng�� 00 _asnstimezoneparameter _asNSTimeZoneParameter�� 0 settimezone_ setTimeZone_�L��,j+ j+ E�O�kv��l k  �b  ��l+ k+ 	Y �b  �k+ 
E�O��kv  ��k+ 	O���,j+ k+ O�Y hO��a ,k+ O��a ,k+ OfflvE[a k/E�Z[a l/E�ZO ��[�a l kh *�a ,�l+ E[a k/E�Z[a l/E�ZO� -� b  �a a a a + Y hO��k+ OeE�Y *� b  �a a a a + Y hO��k+ OeE�[OY��O�b  �a l+ k+ O�a  �*�a  l+ !k+ "Y hO�\ ����������
�� .Dat:FDatnull���     ldt �� 0 thedate theDate�� ����
�� 
Usin� {������� 0 	theformat 	theFormat��  � ����� �  ��
�� FDStFDS0� ����
�� 
Loca� {�������� 0 
localecode 
localeCode��  
�� LclELclS� �����
�� 
TZon� {�������� 0 timezone timeZone��  
�� 
msng��   	�������������������� 0 thedate theDate�� 0 	theformat 	theFormat�� 0 
localecode 
localeCode�� 0 timezone timeZone�� 0 asocformatter asocFormatter�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� 
������������������ "0 asdateparameter asDateParameter�� (0 _makedateformatter _makeDateFormatter�� "0 stringfromdate_ stringFromDate_
�� 
ctxt�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� 8 'b  ��l+ E�O*���m+ E�O��k+ �&W X  *祦���+ 	] ����������
�� .Dat:PDatnull���     ctxt�� 0 thetext theText�� ����
�� 
Usin� {������� 0 	theformat 	theFormat��  � ����� �  ��
�� FDStFDS0� ����
�� 
Loca� {�������� 0 
localecode 
localeCode��  
�� LclELclS� �����
�� 
TZon� {�������� 0 timezone timeZone��  
�� 
msng��  � �������������������������� 0 thetext theText�� 0 	theformat 	theFormat�� 0 
localecode 
localeCode�� 0 timezone timeZone�� 0 asoctext asocText�� 0 asocformatter asocFormatter�� 0 asocdate asocDate�� $0 localeidentifier localeIdentifier�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� ����E���������������������������������������������
�� misccura�� 0 nsstring NSString�� "0 astextparameter asTextParameter�� &0 stringwithstring_ stringWithString_�� (0 _makedateformatter _makeDateFormatter�� "0 datefromstring_ dateFromString_
�� 
msng�� 
0 locale  �� $0 localeidentifier localeIdentifier
�� 
ctxt
�� 
leng
�� 
bool
�� 
errn���Y
�� 
erob�� �� 0 
dateformat 
dateFormat
�� 
ldt �� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� � ���,b  ��l+ k+ E�O*���m+ E�O��k+ E�O��  S�j+ j+ 	E�O�� 
 ��&�,j �& �E�Y 	�%�%E�O)a a a �a a �j+ %a %�%a %Y hO�a &W X  *a ����a + ^ �����������
�� .Dat:ReDanull��� ��� WebC�� {��������  0 dateproperties dateProperties��  ��  ��  � ����������������  0 dateproperties dateProperties�� 0 newdate newDate�� 0 rec  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� &�������~�}�|�{�z�y�x�w�v�u��t�s�r�q�p�oNs�n�m�l�k�j���;�R�i�h�� &0 asrecordparameter asRecordParameter
�� 
year��
�~ 
mnth
�} 
day 
�| 
hour
�{ 
min 
�z 
scnd
�y 
time
�x 
msng�w 
�v 
long�u 0 etext eText� �g�f�e
�g 
errn�f�\�e  
�t 
errn�s�Y
�r 
erob
�q 
errt�p 
�o 
enum
�n 
kocl
�m 
nmbr
�l .corecnte****       ****
�k 
ctxt
�j 
bool� �d�c�
�d 
errn�c 0 enumber eNumber� �b�a�
�b 
erob�a 0 efrom eFrom� �`�_�^
�` 
errt�_ 
0 eto eTo�^  �i �h 
0 _error  ���b  EQ�Ob  ��l+ ���k�k�j�j�j���%E�O ��,�&��,FW  X  )�a a ��,a �a a �%Ob  ��,kv ��,��,FY 4 ��,�&��,FW %X  )�a a ��,a a �lva a �%O ��,�&��,FW  X  )�a a ��,a �a a �%O��,kva a l j 	 ��,kva a l j a &	 b  ��,kva & !)�a a ��,a a �lva a Y hO��,�  � �Ƣ�,�& E�W  X  )�a a ��,a �a a �%O �Ǣ�,�& E�W  X  )�a a ��,a �a a �%O ���,�&E�W  X  )�a a ��,a �a a  �%Y / ��,�&��,FW  X  )�a a ��,a �a a !�%O�W X  "*a #����a $+ %_ �]b�\�[���Z
�] .Dat:DaRenull��� ��� ldt �\ {�Y�X�W�Y 0 thedate theDate�X  
�W 
msng�[  � �V�U�T�S�R�V 0 thedate theDate�U 0 etext eText�T 0 enumber eNumber�S 0 efrom eFrom�R 
0 eto eTo� �Q|�P�O�N�M�L�K�J�I�H�G�F�E�D���C�B
�Q 
msng�P "0 asdateparameter asDateParameter
�O 
year
�N 
mnth
�M 
long
�L 
day 
�K 
hour
�J 
time�I
�H 
min �G <
�F 
scnd�E �D 0 etext eText� �A�@�
�A 
errn�@ 0 enumber eNumber� �?�>�
�? 
erob�> 0 efrom eFrom� �=�<�;
�= 
errt�< 
0 eto eTo�;  �C �B 
0 _error  �Z _ J��  b  E�Y b  ��l+ E�O��,E��,�&��,E��,�"��,�"�#��,�#�W X  *a ����a + ` �:��9�8���7
�: .Dat:LiTznull��� ��� null�9  �8  �  � �6�5�4��3�2
�6 misccura�5 0 
nstimezone 
NSTimeZone�4 (0 knowntimezonenames knownTimeZoneNames�3 60 sortedarrayusingselector_ sortedArrayUsingSelector_
�2 
list�7 ��,j+ �k+ �&a �1��0�/���.
�1 .Dat:CuTznull��� ��� null�0  �/  �  � �-�,�+�*�)
�- misccura�, 0 
nstimezone 
NSTimeZone�+ 0 localtimezone localTimeZone�* 0 name  
�) 
ctxt�. ��,j+ j+ �&b �(��'�&���%
�( .Dat:TzGMnull��� ��� null�'  �& �$��#
�$ 
From� {�"�!� �" 0 tzname tzName�!  
�  
msng�#  � ������ 0 tzname tzName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ��������&+��5���A��
� 
msng
� misccura� 0 
nstimezone 
NSTimeZone� 0 localtimezone localTimeZone�  0 secondsfromgmt secondsFromGMT
� 
kocl
� 
ctxt
� .corecnte****       ****� � 60 throwinvalidparametertype throwInvalidParameterType� 00 _asnstimezoneparameter _asNSTimeZoneParameter� 0 etext eText� ���
� 
errn� 0 enumber eNumber� �
�	�
�
 
erob�	 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �% [ F��  ��,j+ j+ Y .�kv��l j  b  �����+ Y hO*��l+ j+ W X  *a ����a + ascr  ��ޭ