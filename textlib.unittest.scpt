FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        x     �� 	����   	 4   6 <�� 

�� 
scpt 
 m   8 ;   �    T e s t L i b��        l     ��������  ��  ��        l          x    �� ����    4    �� 
�� 
scpt  m       �    T e x t L i b��    � � the script being tested (note: when testing non-library scripts, Standard Additions' `load script` should be used instead; eventually TestLib should provide convenience APIs to do this automatically)     �  �   t h e   s c r i p t   b e i n g   t e s t e d   ( n o t e :   w h e n   t e s t i n g   n o n - l i b r a r y   s c r i p t s ,   S t a n d a r d   A d d i t i o n s '   ` l o a d   s c r i p t `   s h o u l d   b e   u s e d   i n s t e a d ;   e v e n t u a l l y   T e s t L i b   s h o u l d   p r o v i d e   c o n v e n i e n c e   A P I s   t o   d o   t h i s   a u t o m a t i c a l l y )      l     ��������  ��  ��        l     ��  ��    � � note: more library idiocy: keyword-based library handlers in imported library take precedence over identically named handlers in script that imported them� what could possibly go wrong?     �  t   n o t e :   m o r e   l i b r a r y   i d i o c y :   k e y w o r d - b a s e d   l i b r a r y   h a n d l e r s   i n   i m p o r t e d   l i b r a r y   t a k e   p r e c e d e n c e   o v e r   i d e n t i c a l l y   n a m e d   h a n d l e r s   i n   s c r i p t   t h a t   i m p o r t e d   t h e m &   w h a t   c o u l d   p o s s i b l y   g o   w r o n g ?     !   l     ��������  ��  ��   !  " # " h    �� $�� $0 suite_modifytext suite_ModifyText $ k       % %  & ' & l     ��������  ��  ��   '  ( ) ( i     *�� * I      �������� 0 setup setUp��  ��  ��   )  + , + l     ��������  ��  ��   ,  - . - i    /�� / I      �������� 0 teardown tearDown��  ��  ��   .  0 1 0 l     ��������  ��  ��   1  2 3 2 l     �� 4 5��   4 d ^ consider optional handler for determining if a given test should run, skip, or expect to fail    5 � 6 6 �   c o n s i d e r   o p t i o n a l   h a n d l e r   f o r   d e t e r m i n i n g   i f   a   g i v e n   t e s t   s h o u l d   r u n ,   s k i p ,   o r   e x p e c t   t o   f a i l 3  7 8 7 l     ��������  ��  ��   8  9 : 9 i    ; < ; I      �������� 0 test_uppercase  ��  ��   < k     � = =  > ? > I     @�� A @ z�� 	
�� .���:AsRenull��� ��� null��   A �� B C
�� 
Valu B l  	  D���� D I  	  E F�� E z�� 
�� .Txt:UppTnull���     ctxt F m     G G � H H  f o � b � r��  ��  ��   C �� I��
�� 
Equa I m     J J � K K  F O � B � R��   ?  L M L X    [ N�� O N I  6 V P�� Q P z�� 	
�� .���:AsErnull��� ��� null��   Q �� R S
�� 
Args R n  C H T U T 1   D H��
�� 
pcnt U o   C D���� 0 aref aRef S �� V��
�� 
Equa V K   I Q W W �� X���� 0 errornumber errorNumber X m   L O�����Y��  ��  �� 0 aref aRef O J   ! * Y Y  Z [ Z K   ! % \ \ �� ]���� 0 a   ] m   " # ^ ^ � _ _  f o o��   [  `�� ` J   % ( a a  b�� b 1   % &��
�� 
ascr��  ��   M  c�� c l  \ � d e f d I  \ � g�� h g z�� 	
�� .���:AsRenull��� ��� null��   h �� i j
�� 
Valu i l  g x k���� k I  g x l m�� l z�� 
�� .Txt:UppTnull���     ctxt m m   p s n n � o o  b o b��  ��  ��   j �� p��
�� 
Equa p m   y | q q � r r  m a r y��   e 7 1 TEST (contrived to fail to test error reporting)    f � s s b   T E S T   ( c o n t r i v e d   t o   f a i l   t o   t e s t   e r r o r   r e p o r t i n g )��   :  t u t l     ��������  ��  ��   u  v w v i    x y x I      �������� 0 test_lowercase  ��  ��   y k     [ z z  { | { I     }�� ~ } z�� 	
�� .���:AsRenull��� ��� null��   ~ ��  �
�� 
Valu  l  	  ����� � I  	  � ��� � z�� 
�� .Txt:LowTnull���     ctxt � m     � � � � �  F O � B � R��  ��  ��   � �� ���
�� 
Equa � m     � � � � �  f o � b � r��   |  ��� � X    [ ��� � � I  6 V ��� � � z�� 	
�� .���:AsErnull��� ��� null��   � �� � �
�� 
Args � n  C H � � � 1   D H��
�� 
pcnt � o   C D���� 0 aref aRef � �� ���
�� 
Equa � K   I Q � � �� ����� 0 errornumber errorNumber � m   L O�����Y��  ��  �� 0 aref aRef � J   ! * � �  � � � K   ! % � � �� ����� 0 a   � m   " # � � � � �  f o o��   �  ��� � J   % ( � �  ��� � 1   % &��
�� 
ascr��  ��  ��   w  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� 0 call_uppercase   �  ��� � o      ���� 0 directparam directParam��  ��   � l     � � � � I     � ��� � z�� 
�� .Txt:UppTnull���     ctxt � o    ���� 0 directparam directParam��   � X R important: call_NAME handlers contain ONLY the command being tested; nothing else    � � � � �   i m p o r t a n t :   c a l l _ N A M E   h a n d l e r s   c o n t a i n   O N L Y   t h e   c o m m a n d   b e i n g   t e s t e d ;   n o t h i n g   e l s e �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� 0 call_lowercase   �  ��� � o      �� 0 directparam directParam��  ��   � k      � �  � � � l     � � � � L      � � m      � � � � �  w i b b l e �   TEST    � � � � 
   T E S T �  ��~ � I    � ��} � z�| 
�| .Txt:LowTnull���     ctxt � o   
 �{�{ 0 directparam directParam�}  �~   �  � � � l     �z�y�x�z  �y  �x   �  ��w � l     �v�u�t�v  �u  �t  �w   #  � � � l     �s�r�q�s  �r  �q   �  � � � l     �p�o�n�p  �o  �n   �  � � � l     �m � ��m   �   DEBUG    � � � �    D E B U G �  � � � l     �l�k�j�l  �k  �j   �  � � � l      �i � ��i   �PJ-- this code-generated handler is compiled into each new script instance by `osatest`to __performUnitTest__(testDataRecord)	return 4	--return script "TestLib"'s __performUnitTest__(suite_ModifyText, testDataRecord)end __performUnitTest__-- `osatest` then sends the following event to run that testset TestReport to __performUnitTest__({suiteName:"suite_ModifyText", handlerName:"test_uc1", allHandlerNames:{}, isStyled:true})(*OK, , expected result, FO�B�R*)-- Result: �script TestReport�

-- `osatest` then calls TestReport's raw data iterator, converting AS values to their literal text representationsrepeat 20 times	set v to TestReport's nextRawData()	try		log {"LITERALIZE:", v}	on error number 6502		log "DONE"		return TestReport's renderReport()	end try	TestReport's updateRawData("�LITERAL-VALUE�")end repeat    � � � ��  - -   t h i s   c o d e - g e n e r a t e d   h a n d l e r   i s   c o m p i l e d   i n t o   e a c h   n e w   s c r i p t   i n s t a n c e   b y   ` o s a t e s t `  t o   _ _ p e r f o r m U n i t T e s t _ _ ( t e s t D a t a R e c o r d )  	 r e t u r n   4  	 - - r e t u r n   s c r i p t   " T e s t L i b " ' s   _ _ p e r f o r m U n i t T e s t _ _ ( s u i t e _ M o d i f y T e x t ,   t e s t D a t a R e c o r d )  e n d   _ _ p e r f o r m U n i t T e s t _ _    - -   ` o s a t e s t `   t h e n   s e n d s   t h e   f o l l o w i n g   e v e n t   t o   r u n   t h a t   t e s t  s e t   T e s t R e p o r t   t o   _ _ p e r f o r m U n i t T e s t _ _ ( { s u i t e N a m e : " s u i t e _ M o d i f y T e x t " ,   h a n d l e r N a m e : " t e s t _ u c 1 " ,   a l l H a n d l e r N a m e s : { } ,   i s S t y l e d : t r u e } )   ( * O K ,   ,   e x p e c t e d   r e s u l t ,   F O � B � R * )  - -   R e s u l t :   � s c r i p t   T e s t R e p o r t �  
 
 - -   ` o s a t e s t `   t h e n   c a l l s   T e s t R e p o r t ' s   r a w   d a t a   i t e r a t o r ,   c o n v e r t i n g   A S   v a l u e s   t o   t h e i r   l i t e r a l   t e x t   r e p r e s e n t a t i o n s  r e p e a t   2 0   t i m e s  	 s e t   v   t o   T e s t R e p o r t ' s   n e x t R a w D a t a ( )  	 t r y  	 	 l o g   { " L I T E R A L I Z E : " ,   v }  	 o n   e r r o r   n u m b e r   6 5 0 2  	 	 l o g   " D O N E "  	 	 r e t u r n   T e s t R e p o r t ' s   r e n d e r R e p o r t ( )  	 e n d   t r y  	 T e s t R e p o r t ' s   u p d a t e R a w D a t a ( " � L I T E R A L - V A L U E � " )  e n d   r e p e a t    �  � � � l     �h�g�f�h  �g  �f   �  � � � l     �e�d�c�e  �d  �c   �  ��b � l     �a�`�_�a  �`  �_  �b       �^ � � ��^   � �]�\
�] 
pimr�\ $0 suite_modifytext suite_ModifyText � �[ ��[  �   � � � �Z ��Y
�Z 
cobj �  � �   �X 
�X 
scpt�Y   � �W ��V
�W 
cobj �  � �   �U 
�U 
scpt�V   � �T $   ��T $0 suite_modifytext suite_ModifyText � �S � � � � � � ��S   � �R�Q�P�O�N�M�R 0 setup setUp�Q 0 teardown tearDown�P 0 test_uppercase  �O 0 test_lowercase  �N 0 call_uppercase  �M 0 call_lowercase   � �L�K�J�I � ��H�L 0 setup setUp�K  �J  �I   �   �  �H h � �G�F�E�D � ��C�G 0 teardown tearDown�F  �E  �D   �   �  �C h � �B <�A�@ � ��?�B 0 test_uppercase  �A  �@   � �>�> 0 aref aRef � �= �<  G�;�: J�9�8�7 ^�6�5�4�3 �2�1�0�/�.   n q
�= 
scpt
�< 
Valu
�; .Txt:UppTnull���     ctxt
�: 
Equa�9 
�8 .���:AsRenull��� ��� null�7 0 a  
�6 
ascr
�5 
kocl
�4 
cobj
�3 .corecnte****       ****
�2 
Args
�1 
pcnt�0 0 errornumber errorNumber�/�Y
�. .���:AsErnull��� ��� null�? �)��/ *�)��/ �j U��� 	UO <��l�kvlv[��l kh  )�a / *a �a ,�a a l� U[OY��O)�a / *�)�a / 	a j U�a � 	U � �- y�,�+ � ��*�- 0 test_lowercase  �,  �+   � �)�) 0 aref aRef � �( �'  ��&�% ��$�#�" ��!� �� �����
�( 
scpt
�' 
Valu
�& .Txt:LowTnull���     ctxt
�% 
Equa�$ 
�# .���:AsRenull��� ��� null�" 0 a  
�! 
ascr
�  
kocl
� 
cobj
� .corecnte****       ****
� 
Args
� 
pcnt� 0 errornumber errorNumber��Y
� .���:AsErnull��� ��� null�* \)��/ *�)��/ �j U��� 	UO <��l�kvlv[��l kh  )�a / *a �a ,�a a l� U[OY�� � � ��� � ��� 0 call_uppercase  � � ��  �  �� 0 directparam directParam�   � �� 0 directparam directParam � � �
� 
scpt
� .Txt:UppTnull���     ctxt� )��/ �j U � � ��� � ��� 0 call_lowercase  � � ��  �  �
�
 0 directparam directParam�   � �	�	 0 directparam directParam �  �� �
� 
scpt
� .Txt:LowTnull���     ctxt� �O)��/ �j Uascr  ��ޭ