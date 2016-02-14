FasdUAS 1.101.10   ��   ��    k             l      ��  ��   JD Text -- commonly-used text processing commands

Notes: 

- When matching text item delimiters in text value, AppleScript uses the current scope's existing considering/ignoring case, diacriticals, hyphens, punctuation, white space and numeric strings settings; thus, wrapping a `search text` command in different considering/ignoring blocks can produce different results. For example, `search text "fud" for "F" will normally match the first character since AppleScript uses case-insensitive matching by default, whereas enclosing it in a `considering case` block will cause the same command to return zero matches. Conversely, `search text "f ud" for "fu"` will normally return zero matches as AppleScript considers white space by default, but when enclosed in an `ignoring white space` block will match the first three characters: "f u". This is how AppleScript is designed to work, but users need to be reminded of this as considering/ignoring blocks affect ALL script handlers called within that block, including nested calls (and all to any osax and application handlers that understand considering/ignoring attributes).

- Unlike AS text values, NSString and NSRegularExpression don't ignore normalization differences when comparing for equality, so `search text`, `split text`, etc. must normalize input and pattern text; this means that result text may have different normalization to input.


TO DO:

- `slice text` (and `slice list`) should return empty value if start index > end index; this'll better differentiate their use cases from `text i thru j` specifiers, making them more useful than they currently are (e.g. consider start and end indexes returned by `search text`, where [e.g.] {startIndex:2,endIndex:1} describes zero-length text, whereas `text startIndex thru endIndex` would wrongly select 2 chars)

- decide if predefined considering/ignoring options in `search text`, etc. should consider or ignore diacriticals and numeric strings; once decided, use same combinations for List library's text comparator for consistency? (currently Text library's `case [in]sensitivity` options consider diacriticals for equality whereas List library ignores them for ordering)

- implement `precompose/decompose characters TEXT [with/without compatibility mapping]` commands? One could argue this is just out of scope for stdlib as AS itself does the sensible thing when dealing with composed vs decomposed glyphs, treating them as logically equal. The problem is when AS interfaces with other systems that aren't (including shell and NSString), at which point AS code should normalize text before handing it off to ensure consistent behavior.

	- AS preserves composed vs decomposed unicode chars as-is (getting `id` produces different results) but is smart enough to compare them as equal; however, it doesn't normalize when reading/writing or crossing ASOC bridge so written files will vary and NSString (which is old-school UTF16) compares them as not-equal, so any operations involving NSString's `isEqual[ToString]:` will need to normalize both strings first to ensure consistent behavior using one of the following NSString methods:
	
		decomposedStringWithCanonicalMapping (Unicode Normalization Form D)
		decomposedStringWithCompatibilityMapping (Unicode Normalization Form KD)
		precomposedStringWithCanonicalMapping (Unicode Normalization Form C)
		precomposedStringWithCompatibilityMapping (Unicode Normalization Form KC)

 	- note that Satimage.osax provides a `normalize unicode` command, although it only covers 2 of 4 forms (most likely KD and KC) -- TO DO: use `precomposed characters` and `compatibility mapping` boolean params? (also, need to figure out which is preferred form to use as default: e.g. compiling "�" in SE gives precomposed form - though whether this is SE or AS or keyboard input has yet to be determined)


- worth adding a `hash` command?


- `insert into text`, `delete from text` for inserting/replacing/deleting ranges of characters (c.f. `insert into list`, `delete from list` in List library)


- add `matching first item only` boolean option to `search text` (this allows users to perform incremental matching fairly efficiently without having to use an Iterator API)? Currently inclined to reject this, as `search text` command is already fairly complex so am reluctant to add any more parameters unless a convincing use case is identified first.


- would it be worth implementing a `compare text` command that allows considering/ignoring options to be supplied as `considering`/`ignoring` parameters (considering/ignoring blocks can't be parameterized as they require hardcoded constants) as this would allow comparisons to be safely performed without having to futz with considering/ignoring blocks all the time (c.f. Number library's `compare number`); for extra flexibility, the comparator constructor should also be exposed as a public command, and the returned object implement the same `makeKey`+`compareItems` methods as List library's sort comparators, allowing them to be used interchangeably (one could even argue for putting all comparators into their own lib, which other libraries and user scripts can import whenever they need to parameterize comparison behavior). Currently inclined to reject this: while reliably comparing text in AS is a PITA, don't think having such a command will do much to improve things (end users will likely continue to use standard operators in their own code, and library developers will be better off adding considering/ignoring blocks as required.)

- Q. what difference does locale make to uppercase/capitalize/lowercase text? (i.e. what value does the `using locale` parameter actually add to these commands?)

- what, if any, additional localization info (via NSLocale) might be relevant/useful to AS users?



- not sure about formatting type class and symbol constants in `literal representation` (IIRC, AS only binds application info to reference objects, not type/constant objects, in which case only terms defined in AS's own dictionary will format as keywords and the rest will format using raw chevron syntax (though currently even app specifers, which do know app identity, appear as raw syntax)

     � 	 	0�   T e x t   - -   c o m m o n l y - u s e d   t e x t   p r o c e s s i n g   c o m m a n d s 
 
 N o t e s :   
 
 -   W h e n   m a t c h i n g   t e x t   i t e m   d e l i m i t e r s   i n   t e x t   v a l u e ,   A p p l e S c r i p t   u s e s   t h e   c u r r e n t   s c o p e ' s   e x i s t i n g   c o n s i d e r i n g / i g n o r i n g   c a s e ,   d i a c r i t i c a l s ,   h y p h e n s ,   p u n c t u a t i o n ,   w h i t e   s p a c e   a n d   n u m e r i c   s t r i n g s   s e t t i n g s ;   t h u s ,   w r a p p i n g   a   ` s e a r c h   t e x t `   c o m m a n d   i n   d i f f e r e n t   c o n s i d e r i n g / i g n o r i n g   b l o c k s   c a n   p r o d u c e   d i f f e r e n t   r e s u l t s .   F o r   e x a m p l e ,   ` s e a r c h   t e x t   " f u d "   f o r   " F "   w i l l   n o r m a l l y   m a t c h   t h e   f i r s t   c h a r a c t e r   s i n c e   A p p l e S c r i p t   u s e s   c a s e - i n s e n s i t i v e   m a t c h i n g   b y   d e f a u l t ,   w h e r e a s   e n c l o s i n g   i t   i n   a   ` c o n s i d e r i n g   c a s e `   b l o c k   w i l l   c a u s e   t h e   s a m e   c o m m a n d   t o   r e t u r n   z e r o   m a t c h e s .   C o n v e r s e l y ,   ` s e a r c h   t e x t   " f   u d "   f o r   " f u " `   w i l l   n o r m a l l y   r e t u r n   z e r o   m a t c h e s   a s   A p p l e S c r i p t   c o n s i d e r s   w h i t e   s p a c e   b y   d e f a u l t ,   b u t   w h e n   e n c l o s e d   i n   a n   ` i g n o r i n g   w h i t e   s p a c e `   b l o c k   w i l l   m a t c h   t h e   f i r s t   t h r e e   c h a r a c t e r s :   " f   u " .   T h i s   i s   h o w   A p p l e S c r i p t   i s   d e s i g n e d   t o   w o r k ,   b u t   u s e r s   n e e d   t o   b e   r e m i n d e d   o f   t h i s   a s   c o n s i d e r i n g / i g n o r i n g   b l o c k s   a f f e c t   A L L   s c r i p t   h a n d l e r s   c a l l e d   w i t h i n   t h a t   b l o c k ,   i n c l u d i n g   n e s t e d   c a l l s   ( a n d   a l l   t o   a n y   o s a x   a n d   a p p l i c a t i o n   h a n d l e r s   t h a t   u n d e r s t a n d   c o n s i d e r i n g / i g n o r i n g   a t t r i b u t e s ) . 
 
 -   U n l i k e   A S   t e x t   v a l u e s ,   N S S t r i n g   a n d   N S R e g u l a r E x p r e s s i o n   d o n ' t   i g n o r e   n o r m a l i z a t i o n   d i f f e r e n c e s   w h e n   c o m p a r i n g   f o r   e q u a l i t y ,   s o   ` s e a r c h   t e x t ` ,   ` s p l i t   t e x t ` ,   e t c .   m u s t   n o r m a l i z e   i n p u t   a n d   p a t t e r n   t e x t ;   t h i s   m e a n s   t h a t   r e s u l t   t e x t   m a y   h a v e   d i f f e r e n t   n o r m a l i z a t i o n   t o   i n p u t . 
 
 
 T O   D O : 
 
 -   ` s l i c e   t e x t `   ( a n d   ` s l i c e   l i s t ` )   s h o u l d   r e t u r n   e m p t y   v a l u e   i f   s t a r t   i n d e x   >   e n d   i n d e x ;   t h i s ' l l   b e t t e r   d i f f e r e n t i a t e   t h e i r   u s e   c a s e s   f r o m   ` t e x t   i   t h r u   j `   s p e c i f i e r s ,   m a k i n g   t h e m   m o r e   u s e f u l   t h a n   t h e y   c u r r e n t l y   a r e   ( e . g .   c o n s i d e r   s t a r t   a n d   e n d   i n d e x e s   r e t u r n e d   b y   ` s e a r c h   t e x t ` ,   w h e r e   [ e . g . ]   { s t a r t I n d e x : 2 , e n d I n d e x : 1 }   d e s c r i b e s   z e r o - l e n g t h   t e x t ,   w h e r e a s   ` t e x t   s t a r t I n d e x   t h r u   e n d I n d e x `   w o u l d   w r o n g l y   s e l e c t   2   c h a r s ) 
 
 -   d e c i d e   i f   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   i n   ` s e a r c h   t e x t ` ,   e t c .   s h o u l d   c o n s i d e r   o r   i g n o r e   d i a c r i t i c a l s   a n d   n u m e r i c   s t r i n g s ;   o n c e   d e c i d e d ,   u s e   s a m e   c o m b i n a t i o n s   f o r   L i s t   l i b r a r y ' s   t e x t   c o m p a r a t o r   f o r   c o n s i s t e n c y ?   ( c u r r e n t l y   T e x t   l i b r a r y ' s   ` c a s e   [ i n ] s e n s i t i v i t y `   o p t i o n s   c o n s i d e r   d i a c r i t i c a l s   f o r   e q u a l i t y   w h e r e a s   L i s t   l i b r a r y   i g n o r e s   t h e m   f o r   o r d e r i n g ) 
 
 -   i m p l e m e n t   ` p r e c o m p o s e / d e c o m p o s e   c h a r a c t e r s   T E X T   [ w i t h / w i t h o u t   c o m p a t i b i l i t y   m a p p i n g ] `   c o m m a n d s ?   O n e   c o u l d   a r g u e   t h i s   i s   j u s t   o u t   o f   s c o p e   f o r   s t d l i b   a s   A S   i t s e l f   d o e s   t h e   s e n s i b l e   t h i n g   w h e n   d e a l i n g   w i t h   c o m p o s e d   v s   d e c o m p o s e d   g l y p h s ,   t r e a t i n g   t h e m   a s   l o g i c a l l y   e q u a l .   T h e   p r o b l e m   i s   w h e n   A S   i n t e r f a c e s   w i t h   o t h e r   s y s t e m s   t h a t   a r e n ' t   ( i n c l u d i n g   s h e l l   a n d   N S S t r i n g ) ,   a t   w h i c h   p o i n t   A S   c o d e   s h o u l d   n o r m a l i z e   t e x t   b e f o r e   h a n d i n g   i t   o f f   t o   e n s u r e   c o n s i s t e n t   b e h a v i o r . 
 
 	 -   A S   p r e s e r v e s   c o m p o s e d   v s   d e c o m p o s e d   u n i c o d e   c h a r s   a s - i s   ( g e t t i n g   ` i d `   p r o d u c e s   d i f f e r e n t   r e s u l t s )   b u t   i s   s m a r t   e n o u g h   t o   c o m p a r e   t h e m   a s   e q u a l ;   h o w e v e r ,   i t   d o e s n ' t   n o r m a l i z e   w h e n   r e a d i n g / w r i t i n g   o r   c r o s s i n g   A S O C   b r i d g e   s o   w r i t t e n   f i l e s   w i l l   v a r y   a n d   N S S t r i n g   ( w h i c h   i s   o l d - s c h o o l   U T F 1 6 )   c o m p a r e s   t h e m   a s   n o t - e q u a l ,   s o   a n y   o p e r a t i o n s   i n v o l v i n g   N S S t r i n g ' s   ` i s E q u a l [ T o S t r i n g ] : `   w i l l   n e e d   t o   n o r m a l i z e   b o t h   s t r i n g s   f i r s t   t o   e n s u r e   c o n s i s t e n t   b e h a v i o r   u s i n g   o n e   o f   t h e   f o l l o w i n g   N S S t r i n g   m e t h o d s : 
 	 
 	 	 d e c o m p o s e d S t r i n g W i t h C a n o n i c a l M a p p i n g   ( U n i c o d e   N o r m a l i z a t i o n   F o r m   D ) 
 	 	 d e c o m p o s e d S t r i n g W i t h C o m p a t i b i l i t y M a p p i n g   ( U n i c o d e   N o r m a l i z a t i o n   F o r m   K D ) 
 	 	 p r e c o m p o s e d S t r i n g W i t h C a n o n i c a l M a p p i n g   ( U n i c o d e   N o r m a l i z a t i o n   F o r m   C ) 
 	 	 p r e c o m p o s e d S t r i n g W i t h C o m p a t i b i l i t y M a p p i n g   ( U n i c o d e   N o r m a l i z a t i o n   F o r m   K C ) 
 
   	 -   n o t e   t h a t   S a t i m a g e . o s a x   p r o v i d e s   a   ` n o r m a l i z e   u n i c o d e `   c o m m a n d ,   a l t h o u g h   i t   o n l y   c o v e r s   2   o f   4   f o r m s   ( m o s t   l i k e l y   K D   a n d   K C )   - -   T O   D O :   u s e   ` p r e c o m p o s e d   c h a r a c t e r s `   a n d   ` c o m p a t i b i l i t y   m a p p i n g `   b o o l e a n   p a r a m s ?   ( a l s o ,   n e e d   t o   f i g u r e   o u t   w h i c h   i s   p r e f e r r e d   f o r m   t o   u s e   a s   d e f a u l t :   e . g .   c o m p i l i n g   " � "   i n   S E   g i v e s   p r e c o m p o s e d   f o r m   -   t h o u g h   w h e t h e r   t h i s   i s   S E   o r   A S   o r   k e y b o a r d   i n p u t   h a s   y e t   t o   b e   d e t e r m i n e d ) 
 
 
 -   w o r t h   a d d i n g   a   ` h a s h `   c o m m a n d ? 
 
 
 -   ` i n s e r t   i n t o   t e x t ` ,   ` d e l e t e   f r o m   t e x t `   f o r   i n s e r t i n g / r e p l a c i n g / d e l e t i n g   r a n g e s   o f   c h a r a c t e r s   ( c . f .   ` i n s e r t   i n t o   l i s t ` ,   ` d e l e t e   f r o m   l i s t `   i n   L i s t   l i b r a r y ) 
 
 
 -   a d d   ` m a t c h i n g   f i r s t   i t e m   o n l y `   b o o l e a n   o p t i o n   t o   ` s e a r c h   t e x t `   ( t h i s   a l l o w s   u s e r s   t o   p e r f o r m   i n c r e m e n t a l   m a t c h i n g   f a i r l y   e f f i c i e n t l y   w i t h o u t   h a v i n g   t o   u s e   a n   I t e r a t o r   A P I ) ?   C u r r e n t l y   i n c l i n e d   t o   r e j e c t   t h i s ,   a s   ` s e a r c h   t e x t `   c o m m a n d   i s   a l r e a d y   f a i r l y   c o m p l e x   s o   a m   r e l u c t a n t   t o   a d d   a n y   m o r e   p a r a m e t e r s   u n l e s s   a   c o n v i n c i n g   u s e   c a s e   i s   i d e n t i f i e d   f i r s t . 
 
 
 -   w o u l d   i t   b e   w o r t h   i m p l e m e n t i n g   a   ` c o m p a r e   t e x t `   c o m m a n d   t h a t   a l l o w s   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   t o   b e   s u p p l i e d   a s   ` c o n s i d e r i n g ` / ` i g n o r i n g `   p a r a m e t e r s   ( c o n s i d e r i n g / i g n o r i n g   b l o c k s   c a n ' t   b e   p a r a m e t e r i z e d   a s   t h e y   r e q u i r e   h a r d c o d e d   c o n s t a n t s )   a s   t h i s   w o u l d   a l l o w   c o m p a r i s o n s   t o   b e   s a f e l y   p e r f o r m e d   w i t h o u t   h a v i n g   t o   f u t z   w i t h   c o n s i d e r i n g / i g n o r i n g   b l o c k s   a l l   t h e   t i m e   ( c . f .   N u m b e r   l i b r a r y ' s   ` c o m p a r e   n u m b e r ` ) ;   f o r   e x t r a   f l e x i b i l i t y ,   t h e   c o m p a r a t o r   c o n s t r u c t o r   s h o u l d   a l s o   b e   e x p o s e d   a s   a   p u b l i c   c o m m a n d ,   a n d   t h e   r e t u r n e d   o b j e c t   i m p l e m e n t   t h e   s a m e   ` m a k e K e y ` + ` c o m p a r e I t e m s `   m e t h o d s   a s   L i s t   l i b r a r y ' s   s o r t   c o m p a r a t o r s ,   a l l o w i n g   t h e m   t o   b e   u s e d   i n t e r c h a n g e a b l y   ( o n e   c o u l d   e v e n   a r g u e   f o r   p u t t i n g   a l l   c o m p a r a t o r s   i n t o   t h e i r   o w n   l i b ,   w h i c h   o t h e r   l i b r a r i e s   a n d   u s e r   s c r i p t s   c a n   i m p o r t   w h e n e v e r   t h e y   n e e d   t o   p a r a m e t e r i z e   c o m p a r i s o n   b e h a v i o r ) .   C u r r e n t l y   i n c l i n e d   t o   r e j e c t   t h i s :   w h i l e   r e l i a b l y   c o m p a r i n g   t e x t   i n   A S   i s   a   P I T A ,   d o n ' t   t h i n k   h a v i n g   s u c h   a   c o m m a n d   w i l l   d o   m u c h   t o   i m p r o v e   t h i n g s   ( e n d   u s e r s   w i l l   l i k e l y   c o n t i n u e   t o   u s e   s t a n d a r d   o p e r a t o r s   i n   t h e i r   o w n   c o d e ,   a n d   l i b r a r y   d e v e l o p e r s   w i l l   b e   b e t t e r   o f f   a d d i n g   c o n s i d e r i n g / i g n o r i n g   b l o c k s   a s   r e q u i r e d . ) 
 
 -   Q .   w h a t   d i f f e r e n c e   d o e s   l o c a l e   m a k e   t o   u p p e r c a s e / c a p i t a l i z e / l o w e r c a s e   t e x t ?   ( i . e .   w h a t   v a l u e   d o e s   t h e   ` u s i n g   l o c a l e `   p a r a m e t e r   a c t u a l l y   a d d   t o   t h e s e   c o m m a n d s ? ) 
 
 -   w h a t ,   i f   a n y ,   a d d i t i o n a l   l o c a l i z a t i o n   i n f o   ( v i a   N S L o c a l e )   m i g h t   b e   r e l e v a n t / u s e f u l   t o   A S   u s e r s ? 
 
 
 
 -   n o t   s u r e   a b o u t   f o r m a t t i n g   t y p e   c l a s s   a n d   s y m b o l   c o n s t a n t s   i n   ` l i t e r a l   r e p r e s e n t a t i o n `   ( I I R C ,   A S   o n l y   b i n d s   a p p l i c a t i o n   i n f o   t o   r e f e r e n c e   o b j e c t s ,   n o t   t y p e / c o n s t a n t   o b j e c t s ,   i n   w h i c h   c a s e   o n l y   t e r m s   d e f i n e d   i n   A S ' s   o w n   d i c t i o n a r y   w i l l   f o r m a t   a s   k e y w o r d s   a n d   t h e   r e s t   w i l l   f o r m a t   u s i n g   r a w   c h e v r o n   s y n t a x   ( t h o u g h   c u r r e n t l y   e v e n   a p p   s p e c i f e r s ,   w h i c h   d o   k n o w   a p p   i d e n t i t y ,   a p p e a r   a s   r a w   s y n t a x ) 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        l     ��������  ��  ��        j    �� �� 60 _textsupportagentbundleid _TextSupportAgentBundleID  m       �   d c o m . a p p l e . S c r i p t E d i t o r . i d . l i b r a r y . T e x t . T e x t S u p p o r t      l     ��������  ��  ��        l     ��������  ��  ��         l     �� ! "��   ! J D--------------------------------------------------------------------    " � # # � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -    $ % $ l     �� & '��   &   record types    ' � ( (    r e c o r d   t y p e s %  ) * ) l     ��������  ��  ��   *  + , + j    �� -�� (0 _unmatchedtexttype _UnmatchedTextType - m    ��
�� 
TxtU ,  . / . j    �� 0�� $0 _matchedtexttype _MatchedTextType 0 m    ��
�� 
TxtM /  1 2 1 j    �� 3�� &0 _matchedgrouptype _MatchedGroupType 3 m    ��
�� 
TxtG 2  4 5 4 l     ��������  ��  ��   5  6 7 6 l     ��������  ��  ��   7  8 9 8 l     �� : ;��   : J D--------------------------------------------------------------------    ; � < < � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 9  = > = l     �� ? @��   ?   support    @ � A A    s u p p o r t >  B C B l     ��������  ��  ��   C  D E D l      F G H F j    �� I�� 0 _support   I N     J J 4    �� K
�� 
scpt K m     L L � M M  T y p e S u p p o r t G "  used for parameter checking    H � N N 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g E  O P O l     ��������  ��  ��   P  Q R Q l     ��������  ��  ��   R  S T S i   ! U V U I      �� W���� 
0 _error   W  X Y X o      ���� 0 handlername handlerName Y  Z [ Z o      ���� 0 etext eText [  \ ] \ o      ���� 0 enumber eNumber ]  ^ _ ^ o      ���� 0 efrom eFrom _  `�� ` o      ���� 
0 eto eTo��  ��   V n     a b a I    �� c���� &0 throwcommanderror throwCommandError c  d e d m     f f � g g  T e x t e  h i h o    ���� 0 handlername handlerName i  j k j o    ���� 0 etext eText k  l m l o    	���� 0 enumber eNumber m  n o n o   	 
���� 0 efrom eFrom o  p�� p o   
 ���� 
0 eto eTo��  ��   b o     ���� 0 _support   T  q r q l     ��������  ��  ��   r  s t s l     �� u v��   u J D--------------------------------------------------------------------    v � w w � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - t  x y x l     �� z {��   z   Find and Replace Suite    { � | | .   F i n d   a n d   R e p l a c e   S u i t e y  } ~ } l     ��������  ��  ��   ~   �  l     �� � ���   �   find pattern    � � � �    f i n d   p a t t e r n �  � � � l     ��������  ��  ��   �  � � � i  " % � � � I      �� ����� $0 _matchinforecord _matchInfoRecord �  � � � o      ���� 0 
asocstring 
asocString �  � � � o      ����  0 asocmatchrange asocMatchRange �  � � � o      ���� 0 
textoffset 
textOffset �  ��� � o      ���� 0 
recordtype 
recordType��  ��   � k     # � �  � � � r     
 � � � c      � � � l     ����� � n     � � � I    �� ����� *0 substringwithrange_ substringWithRange_ �  ��� � o    ����  0 asocmatchrange asocMatchRange��  ��   � o     ���� 0 
asocstring 
asocString��  ��   � m    ��
�� 
ctxt � o      ���� 0 	foundtext 	foundText �  � � � l    � � � � r     � � � [     � � � o    ���� 0 
textoffset 
textOffset � l    ����� � n     � � � 1    ��
�� 
leng � o    ���� 0 	foundtext 	foundText��  ��   � o      ����  0 nexttextoffset nextTextOffset � : 4 calculate the start index of the next AS text range    � � � � h   c a l c u l a t e   t h e   s t a r t   i n d e x   o f   t h e   n e x t   A S   t e x t   r a n g e �  � � � l   �� � ���   �
 note: record keys are identifiers, not keywords, as 1. library-defined keywords are a huge pain to use outside of `tell script...` blocks and 2. importing the library's terminology into the global namespace via `use script...` is an excellent way to create keyword conflicts; only the class value is a keyword since Script Editor/OSAKit don't correctly handle records that use non-typename values (e.g. `{class:"matched text",...}`), but this shouldn't impact usability as it's really only used for informational purposes    � � � �   n o t e :   r e c o r d   k e y s   a r e   i d e n t i f i e r s ,   n o t   k e y w o r d s ,   a s   1 .   l i b r a r y - d e f i n e d   k e y w o r d s   a r e   a   h u g e   p a i n   t o   u s e   o u t s i d e   o f   ` t e l l   s c r i p t . . . `   b l o c k s   a n d   2 .   i m p o r t i n g   t h e   l i b r a r y ' s   t e r m i n o l o g y   i n t o   t h e   g l o b a l   n a m e s p a c e   v i a   ` u s e   s c r i p t . . . `   i s   a n   e x c e l l e n t   w a y   t o   c r e a t e   k e y w o r d   c o n f l i c t s ;   o n l y   t h e   c l a s s   v a l u e   i s   a   k e y w o r d   s i n c e   S c r i p t   E d i t o r / O S A K i t   d o n ' t   c o r r e c t l y   h a n d l e   r e c o r d s   t h a t   u s e   n o n - t y p e n a m e   v a l u e s   ( e . g .   ` { c l a s s : " m a t c h e d   t e x t " , . . . } ` ) ,   b u t   t h i s   s h o u l d n ' t   i m p a c t   u s a b i l i t y   a s   i t ' s   r e a l l y   o n l y   u s e d   f o r   i n f o r m a t i o n a l   p u r p o s e s �  ��� � l   # � � � � L    # � � J    " � �  � � � K     � � �� � �
�� 
pcls � o    ���� 0 
recordtype 
recordType � �� � ��� 0 
startindex 
startIndex � o    ���� 0 
textoffset 
textOffset � �� � ��� 0 endindex endIndex � \     � � � o    ����  0 nexttextoffset nextTextOffset � m    ����  � �� ����� 0 	foundtext 	foundText � o    ���� 0 	foundtext 	foundText��   �  ��� � o     ����  0 nexttextoffset nextTextOffset��   � | v TO DO: use fromIndex/toIndex instead of startIndex/endIndex? (see also List; consistent naming would be good to have)    � � � � �   T O   D O :   u s e   f r o m I n d e x / t o I n d e x   i n s t e a d   o f   s t a r t I n d e x / e n d I n d e x ?   ( s e e   a l s o   L i s t ;   c o n s i s t e n t   n a m i n g   w o u l d   b e   g o o d   t o   h a v e )��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  & ) � � � I      �� ����� 0 _matchrecords _matchRecords �  � � � o      ���� 0 
asocstring 
asocString �  � � � o      ����  0 asocmatchrange asocMatchRange �  � � � o      ����  0 asocstartindex asocStartIndex �  � � � o      ���� 0 
textoffset 
textOffset �  � � � o      �� (0 nonmatchrecordtype nonMatchRecordType �  ��~ � o      �}�} "0 matchrecordtype matchRecordType�~  ��   � k     V � �  � � � l     �| � ��|   �TN important: NSString character indexes aren't guaranteed to be same as AS character indexes (AS sensibly counts glyphs but NSString only counts UTF16 codepoints, and a glyph may be composed of more than one codepoint), so reconstruct both non-matching and matching AS text values, and calculate accurate AS character ranges from those    � � � ��   i m p o r t a n t :   N S S t r i n g   c h a r a c t e r   i n d e x e s   a r e n ' t   g u a r a n t e e d   t o   b e   s a m e   a s   A S   c h a r a c t e r   i n d e x e s   ( A S   s e n s i b l y   c o u n t s   g l y p h s   b u t   N S S t r i n g   o n l y   c o u n t s   U T F 1 6   c o d e p o i n t s ,   a n d   a   g l y p h   m a y   b e   c o m p o s e d   o f   m o r e   t h a n   o n e   c o d e p o i n t ) ,   s o   r e c o n s t r u c t   b o t h   n o n - m a t c h i n g   a n d   m a t c h i n g   A S   t e x t   v a l u e s ,   a n d   c a l c u l a t e   a c c u r a t e   A S   c h a r a c t e r   r a n g e s   f r o m   t h o s e �  � � � r      � � � n     � � � I    �{�z�y�{ 0 location  �z  �y   � o     �x�x  0 asocmatchrange asocMatchRange � o      �w�w  0 asocmatchstart asocMatchStart �  � � � r     � � � [     � � � o    	�v�v  0 asocmatchstart asocMatchStart � l  	  ��u�t � n  	  � � � I   
 �s�r�q�s 
0 length  �r  �q   � o   	 
�p�p  0 asocmatchrange asocMatchRange�u  �t   � o      �o�o 0 asocmatchend asocMatchEnd �  � � � r     � � � K     � � �n � ��n 0 location   � o    �m�m  0 asocstartindex asocStartIndex � �l ��k�l 
0 length   � \     � � � o    �j�j  0 asocmatchstart asocMatchStart � o    �i�i  0 asocstartindex asocStartIndex�k   � o      �h�h &0 asocnonmatchrange asocNonMatchRange �  � � � r    5 � � � I      �g ��f�g $0 _matchinforecord _matchInfoRecord �  � � � o    �e�e 0 
asocstring 
asocString �  � � � o     �d�d &0 asocnonmatchrange asocNonMatchRange �    o     !�c�c 0 
textoffset 
textOffset �b o   ! "�a�a (0 nonmatchrecordtype nonMatchRecordType�b  �f   � J        o      �`�` 0 nonmatchinfo nonMatchInfo �_ o      �^�^ 0 
textoffset 
textOffset�_   �  r   6 N	
	 I      �]�\�] $0 _matchinforecord _matchInfoRecord  o   7 8�[�[ 0 
asocstring 
asocString  o   8 9�Z�Z  0 asocmatchrange asocMatchRange  o   9 :�Y�Y 0 
textoffset 
textOffset �X o   : ;�W�W "0 matchrecordtype matchRecordType�X  �\  
 J        o      �V�V 0 	matchinfo 	matchInfo �U o      �T�T 0 
textoffset 
textOffset�U   �S L   O V J   O U  o   O P�R�R 0 nonmatchinfo nonMatchInfo  o   P Q�Q�Q 0 	matchinfo 	matchInfo  o   Q R�P�P 0 asocmatchend asocMatchEnd  �O  o   R S�N�N 0 
textoffset 
textOffset�O  �S   � !"! l     �M�L�K�M  �L  �K  " #$# l     �J�I�H�J  �I  �H  $ %&% i  * -'(' I      �G)�F�G &0 _matchedgrouplist _matchedGroupList) *+* o      �E�E 0 
asocstring 
asocString+ ,-, o      �D�D 0 	asocmatch 	asocMatch- ./. o      �C�C 0 
textoffset 
textOffset/ 0�B0 o      �A�A &0 includenonmatches includeNonMatches�B  �F  ( k     �11 232 r     454 J     �@�@  5 o      �?�? "0 submatchresults subMatchResults3 676 r    898 \    :;: l   
<�>�=< n   
=>= I    
�<�;�:�<  0 numberofranges numberOfRanges�;  �:  > o    �9�9 0 	asocmatch 	asocMatch�>  �=  ; m   
 �8�8 9 o      �7�7 0 groupindexes groupIndexes7 ?@? Z    �AB�6�5A ?    CDC o    �4�4 0 groupindexes groupIndexesD m    �3�3  B k    �EE FGF r    HIH n   JKJ I    �2L�1�2 0 rangeatindex_ rangeAtIndex_L M�0M m    �/�/  �0  �1  K o    �.�. 0 	asocmatch 	asocMatchI o      �-�- (0 asocfullmatchrange asocFullMatchRangeG NON r    %PQP n   #RSR I    #�,�+�*�, 0 location  �+  �*  S o    �)�) (0 asocfullmatchrange asocFullMatchRangeQ o      �(�( &0 asocnonmatchstart asocNonMatchStartO TUT r   & /VWV [   & -XYX o   & '�'�' &0 asocnonmatchstart asocNonMatchStartY l  ' ,Z�&�%Z n  ' ,[\[ I   ( ,�$�#�"�$ 
0 length  �#  �"  \ o   ' (�!�! (0 asocfullmatchrange asocFullMatchRange�&  �%  W o      � �  $0 asocfullmatchend asocFullMatchEndU ]^] Y   0 �_�`a�_ k   : �bb cdc r   : oefe I      �g�� 0 _matchrecords _matchRecordsg hih o   ; <�� 0 
asocstring 
asocStringi jkj n  < Blml I   = B�n�� 0 rangeatindex_ rangeAtIndex_n o�o o   = >�� 0 i  �  �  m o   < =�� 0 	asocmatch 	asocMatchk pqp o   B C�� &0 asocnonmatchstart asocNonMatchStartq rsr o   C D�� 0 
textoffset 
textOffsets tut o   D I�� (0 _unmatchedtexttype _UnmatchedTextTypeu v�v o   I N�� &0 _matchedgrouptype _MatchedGroupType�  �  f J      ww xyx o      �� 0 nonmatchinfo nonMatchInfoy z{z o      �� 0 	matchinfo 	matchInfo{ |}| o      �� &0 asocnonmatchstart asocNonMatchStart} ~�~ o      �� 0 
textoffset 
textOffset�  d � Z  p |����
� o   p q�	�	 &0 includenonmatches includeNonMatches� r   t x��� o   t u�� 0 nonmatchinfo nonMatchInfo� n      ���  ;   v w� o   u v�� "0 submatchresults subMatchResults�  �
  � ��� r   } ���� o   } ~�� 0 	matchinfo 	matchInfo� n      ���  ;    �� o   ~ �� "0 submatchresults subMatchResults�  � 0 i  ` m   3 4�� a o   4 5�� 0 groupindexes groupIndexes�  ^ ��� Z   � ���� ��� o   � ����� &0 includenonmatches includeNonMatches� k   � ��� ��� r   � ���� K   � ��� ������ 0 location  � o   � ����� &0 asocnonmatchstart asocNonMatchStart� ������� 
0 length  � \   � ���� o   � ����� $0 asocfullmatchend asocFullMatchEnd� o   � ����� &0 asocnonmatchstart asocNonMatchStart��  � o      ���� &0 asocnonmatchrange asocNonMatchRange� ���� r   � ���� n   � ���� 4   � ����
�� 
cobj� m   � ����� � I   � �������� $0 _matchinforecord _matchInfoRecord� ��� o   � ����� 0 
asocstring 
asocString� ��� o   � ����� &0 asocnonmatchrange asocNonMatchRange� ��� o   � ����� 0 
textoffset 
textOffset� ���� o   � ����� (0 _unmatchedtexttype _UnmatchedTextType��  ��  � n      ���  ;   � �� o   � ����� "0 submatchresults subMatchResults��  �   ��  �  �6  �5  @ ���� L   � ��� o   � ����� "0 submatchresults subMatchResults��  & ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  . 1��� I      ������� 0 _findpattern _findPattern� ��� o      ���� 0 thetext theText� ��� o      ���� 0 patterntext patternText� ��� o      ���� &0 includenonmatches includeNonMatches� ���� o      ����  0 includematches includeMatches��  ��  � k    �� ��� r     ��� n    ��� I    ������� (0 asbooleanparameter asBooleanParameter� ��� o    ���� &0 includenonmatches includeNonMatches� ���� m    �� ���  u n m a t c h e d   t e x t��  ��  � o     ���� 0 _support  � o      ���� &0 includenonmatches includeNonMatches� ��� r    ��� n   ��� I    ������� (0 asbooleanparameter asBooleanParameter� ��� o    ����  0 includematches includeMatches� ���� m    �� ���  m a t c h e d   t e x t��  ��  � o    ���� 0 _support  � o      ����  0 includematches includeMatches� ��� r    *��� n   (��� I   ! (������� @0 asnsregularexpressionparameter asNSRegularExpressionParameter� ��� o   ! "���� 0 patterntext patternText� ��� m   " #����  � ���� m   # $�� ���  f o r��  ��  � o    !���� 0 _support  � o      ���� 0 asocpattern asocPattern� ��� r   + 7��� n  + 5��� I   0 5������� ,0 asnormalizednsstring asNormalizedNSString� ���� o   0 1���� 0 thetext theText��  ��  � o   + 0���� 0 _support  � o      ���� 0 
asocstring 
asocString� ��� l  8 ;���� r   8 ;��� m   8 9����  � o      ���� &0 asocnonmatchstart asocNonMatchStart� G A used to calculate NSRanges for non-matching portions of NSString   � ��� �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n g� ��� l  < ?���� r   < ?��� m   < =���� � o      ���� 0 
textoffset 
textOffset� B < used to calculate correct AppleScript start and end indexes   � ��� x   u s e d   t o   c a l c u l a t e   c o r r e c t   A p p l e S c r i p t   s t a r t   a n d   e n d   i n d e x e s� ��� r   @ D� � J   @ B����    o      ���� 0 
resultlist 
resultList�  l  E E����   @ : iterate over each non-matched + matched range in NSString    � t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g  r   E V	 n  E T

 I   F T������ @0 matchesinstring_options_range_ matchesInString_options_range_  o   F G���� 0 
asocstring 
asocString  m   G H����   �� J   H P  m   H I����   �� n  I N I   J N�������� 
0 length  ��  ��   o   I J���� 0 
asocstring 
asocString��  ��  ��   o   E F���� 0 asocpattern asocPattern	 o      ����  0 asocmatcharray asocMatchArray  Y   W ����� k   g �  r   g o !  l  g m"����" n  g m#$# I   h m��%����  0 objectatindex_ objectAtIndex_% &��& o   h i���� 0 i  ��  ��  $ o   g h����  0 asocmatcharray asocMatchArray��  ��  ! o      ���� 0 	asocmatch 	asocMatch '(' l  p p��)*��  ) � � the first range in match identifies the text matched by the entire pattern, so generate records for full match and its preceding (unmatched) text   * �++$   t h e   f i r s t   r a n g e   i n   m a t c h   i d e n t i f i e s   t h e   t e x t   m a t c h e d   b y   t h e   e n t i r e   p a t t e r n ,   s o   g e n e r a t e   r e c o r d s   f o r   f u l l   m a t c h   a n d   i t s   p r e c e d i n g   ( u n m a t c h e d )   t e x t( ,-, r   p �./. I      ��0���� 0 _matchrecords _matchRecords0 121 o   q r���� 0 
asocstring 
asocString2 343 n  r x565 I   s x��7���� 0 rangeatindex_ rangeAtIndex_7 8��8 m   s t����  ��  ��  6 o   r s���� 0 	asocmatch 	asocMatch4 9:9 o   x y���� &0 asocnonmatchstart asocNonMatchStart: ;<; o   y z���� 0 
textoffset 
textOffset< =>= o   z ���� (0 _unmatchedtexttype _UnmatchedTextType> ?��? o    ����� $0 _matchedtexttype _MatchedTextType��  ��  / J      @@ ABA o      ���� 0 nonmatchinfo nonMatchInfoB CDC o      ���� 0 	matchinfo 	matchInfoD EFE o      ���� &0 asocnonmatchstart asocNonMatchStartF G��G o      ���� 0 
textoffset 
textOffset��  - HIH Z  � �JK����J o   � ����� &0 includenonmatches includeNonMatchesK r   � �LML o   � ����� 0 nonmatchinfo nonMatchInfoM n      NON  ;   � �O o   � ����� 0 
resultlist 
resultList��  ��  I P��P Z   � �QR����Q o   � �����  0 includematches includeMatchesR k   � �SS TUT l  � ���VW��  V any additional ranges in match identify text matched by group references within regexp pattern, e.g. "([0-9]{4})-([0-9]{2})-([0-9]{2})" will match `YYYY-MM-DD` style date strings, returning the entire text match, plus sub-matches representing year, month and day text   W �XX   a n y   a d d i t i o n a l   r a n g e s   i n   m a t c h   i d e n t i f y   t e x t   m a t c h e d   b y   g r o u p   r e f e r e n c e s   w i t h i n   r e g e x p   p a t t e r n ,   e . g .   " ( [ 0 - 9 ] { 4 } ) - ( [ 0 - 9 ] { 2 } ) - ( [ 0 - 9 ] { 2 } ) "   w i l l   m a t c h   ` Y Y Y Y - M M - D D `   s t y l e   d a t e   s t r i n g s ,   r e t u r n i n g   t h e   e n t i r e   t e x t   m a t c h ,   p l u s   s u b - m a t c h e s   r e p r e s e n t i n g   y e a r ,   m o n t h   a n d   d a y   t e x tU Y��Y r   � �Z[Z b   � �\]\ o   � ����� 0 	matchinfo 	matchInfo] K   � �^^ ��_���� 0 foundgroups foundGroups_ I   � ���`���� &0 _matchedgrouplist _matchedGroupList` aba o   � ��� 0 
asocstring 
asocStringb cdc o   � ��~�~ 0 	asocmatch 	asocMatchd efe n  � �ghg o   � ��}�} 0 
startindex 
startIndexh o   � ��|�| 0 	matchinfo 	matchInfof i�{i o   � ��z�z &0 includenonmatches includeNonMatches�{  ��  ��  [ n      jkj  ;   � �k o   � ��y�y 0 
resultlist 
resultList��  ��  ��  ��  �� 0 i   m   Z [�x�x   \   [ blml l  [ `n�w�vn n  [ `opo I   \ `�u�t�s�u 	0 count  �t  �s  p o   [ \�r�r  0 asocmatcharray asocMatchArray�w  �v  m m   ` a�q�q ��   qrq l  � ��pst�p  s "  add final non-matched range   t �uu 8   a d d   f i n a l   n o n - m a t c h e d   r a n g er vwv Z   �
xy�o�nx o   � ��m�m &0 includenonmatches includeNonMatchesy k   �zz {|{ r   � �}~} c   � �� l  � ���l�k� n  � ���� I   � ��j��i�j *0 substringfromindex_ substringFromIndex_� ��h� o   � ��g�g &0 asocnonmatchstart asocNonMatchStart�h  �i  � o   � ��f�f 0 
asocstring 
asocString�l  �k  � m   � ��e
�e 
ctxt~ o      �d�d 0 	foundtext 	foundText| ��c� r   ���� K   ��� �b��
�b 
pcls� o   � ��a�a (0 _unmatchedtexttype _UnmatchedTextType� �`���` 0 
startindex 
startIndex� o   � ��_�_ 0 
textoffset 
textOffset� �^���^ 0 endindex endIndex� n   � ���� 1   � ��]
�] 
leng� o   � ��\�\ 0 thetext theText� �[��Z�[ 0 	foundtext 	foundText� o   � ��Y�Y 0 	foundtext 	foundText�Z  � n      ���  ;  � o  �X�X 0 
resultlist 
resultList�c  �o  �n  w ��W� L  �� o  �V�V 0 
resultlist 
resultList�W  � ��� l     �U�T�S�U  �T  �S  � ��� l     �R�Q�P�R  �Q  �P  � ��� l     �O���O  �  -----   � ��� 
 - - - - -� ��� l     �N���N  �   replace pattern   � ���     r e p l a c e   p a t t e r n� ��� l     �M�L�K�M  �L  �K  � ��� i  2 5��� I      �J��I�J "0 _replacepattern _replacePattern� ��� o      �H�H 0 thetext theText� ��� o      �G�G 0 patterntext patternText� ��F� o      �E�E 0 templatetext templateText�F  �I  � k    L�� ��� r     ��� n    
��� I    
�D��C�D ,0 asnormalizednsstring asNormalizedNSString� ��B� o    �A�A 0 thetext theText�B  �C  � o     �@�@ 0 _support  � o      �?�? 0 
asocstring 
asocString� ��� r    ��� n   ��� I    �>��=�> @0 asnsregularexpressionparameter asNSRegularExpressionParameter� ��� o    �<�< 0 patterntext patternText� ��� m    �;�;  � ��:� m    �� ���  f o r�:  �=  � o    �9�9 0 _support  � o      �8�8 0 asocpattern asocPattern� ��7� Z   L���6�� >    '��� l   %��5�4� I   %�3��
�3 .corecnte****       ****� J    �� ��2� o    �1�1 0 templatetext templateText�2  � �0��/
�0 
kocl� m     !�.
�. 
scpt�/  �5  �4  � m   % &�-�-  � k   *8�� ��� r   * F��� J   * 0�� ��� J   * ,�,�,  � ��� m   , -�+�+  � ��*� m   - .�)�) �*  � J      �� ��� o      �(�( 0 
resultlist 
resultList� ��� o      �'�' &0 asocnonmatchstart asocNonMatchStart� ��&� o      �%�% 0 
textoffset 
textOffset�&  � ��� r   G X��� n  G V��� I   H V�$��#�$ @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   H I�"�" 0 
asocstring 
asocString� ��� m   I J�!�!  � �� � J   J R�� ��� m   J K��  � ��� n  K P��� I   L P���� 
0 length  �  �  � o   K L�� 0 
asocstring 
asocString�  �   �#  � o   G H�� 0 asocpattern asocPattern� o      ��  0 asocmatcharray asocMatchArray� ��� Y   Y ������� k   i ��� ��� r   i q� � l  i o�� n  i o I   j o���  0 objectatindex_ objectAtIndex_ � o   j k�� 0 i  �  �   o   i j��  0 asocmatcharray asocMatchArray�  �    o      �� 0 	asocmatch 	asocMatch�  r   r �	 I      �
�� 0 _matchrecords _matchRecords
  o   s t�� 0 
asocstring 
asocString  n  t z I   u z�
�	�
 0 rangeatindex_ rangeAtIndex_ � m   u v��  �  �	   o   t u�� 0 	asocmatch 	asocMatch  o   z {�� &0 asocnonmatchstart asocNonMatchStart  o   { |�� 0 
textoffset 
textOffset  o   | ��� (0 _unmatchedtexttype _UnmatchedTextType � o   � ��� $0 _matchedtexttype _MatchedTextType�  �  	 J        o      � �  0 nonmatchinfo nonMatchInfo  o      ���� 0 	matchinfo 	matchInfo   o      ���� &0 asocnonmatchstart asocNonMatchStart  !��! o      ���� 0 
textoffset 
textOffset��   "#" r   � �$%$ n  � �&'& o   � ����� 0 	foundtext 	foundText' o   � ����� 0 nonmatchinfo nonMatchInfo% n      ()(  ;   � �) o   � ����� 0 
resultlist 
resultList# *+* r   � �,-, I   � ���.���� &0 _matchedgrouplist _matchedGroupList. /0/ o   � ����� 0 
asocstring 
asocString0 121 o   � ����� 0 	asocmatch 	asocMatch2 343 n  � �565 o   � ����� 0 
startindex 
startIndex6 o   � ����� 0 	matchinfo 	matchInfo4 7��7 m   � ���
�� boovtrue��  ��  - o      ���� 0 matchedgroups matchedGroups+ 8��8 Q   � �9:;9 r   � �<=< c   � �>?> n  � �@A@ I   � ���B����  0 replacepattern replacePatternB CDC n  � �EFE o   � ����� 0 	foundtext 	foundTextF o   � ����� 0 	matchinfo 	matchInfoD G��G o   � ����� 0 matchedgroups matchedGroups��  ��  A o   � ����� 0 templatetext templateText? m   � ���
�� 
ctxt= n      HIH  ;   � �I o   � ����� 0 
resultlist 
resultList: R      ��JK
�� .ascrerr ****      � ****J o      ���� 0 etext eTextK ��LM
�� 
errnL o      ���� 0 enumber eNumberM ��NO
�� 
erobN o      ���� 0 efrom eFromO ��P��
�� 
errtP o      ���� 
0 eto eTo��  ; R   � ���QR
�� .ascrerr ****      � ****Q b   � �STS m   � �UU �VV N A n   e r r o r   o c c u r r e d   i n    r e p l a c e P a t t e r n  :  T o   � ����� 0 etext eTextR ��WX
�� 
errnW o   � ����� 0 enumber eNumberX ��YZ
�� 
erobY o   � ����� 0 efrom eFromZ ��[��
�� 
errt[ o   � ����� 
0 eto eTo��  ��  � 0 i  � m   \ ]����  � \   ] d\]\ l  ] b^����^ n  ] b_`_ I   ^ b�������� 	0 count  ��  ��  ` o   ] ^����  0 asocmatcharray asocMatchArray��  ��  ] m   b c���� �  � aba l  � ���cd��  c "  add final non-matched range   d �ee 8   a d d   f i n a l   n o n - m a t c h e d   r a n g eb fgf r   �hih c   �jkj l  � �l����l n  � �mnm I   � ���o���� *0 substringfromindex_ substringFromIndex_o p��p o   � ����� &0 asocnonmatchstart asocNonMatchStart��  ��  n o   � ����� 0 
asocstring 
asocString��  ��  k m   ���
�� 
ctxti n      qrq  ;  r o  ���� 0 
resultlist 
resultListg sts r  uvu n wxw 1  	��
�� 
txdlx 1  	��
�� 
ascrv o      ���� 0 oldtids oldTIDst yzy r  {|{ m  }} �~~  | n     � 1  ��
�� 
txdl� 1  ��
�� 
ascrz ��� r  '��� c  #��� o  ���� 0 
resultlist 
resultList� m  "��
�� 
ctxt� o      ���� 0 
resulttext 
resultText� ��� r  (3��� o  (+���� 0 oldtids oldTIDs� n     ��� 1  .2��
�� 
txdl� 1  +.��
�� 
ascr� ���� L  48�� o  47���� 0 
resulttext 
resultText��  �6  � L  ;L�� n ;K��� I  <K������� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_� ��� l 
<=������ o  <=���� 0 
asocstring 
asocString��  ��  � ��� m  =>����  � ��� J  >F�� ��� m  >?����  � ���� n ?D��� I  @D�������� 
0 length  ��  ��  � o  ?@���� 0 
asocstring 
asocString��  � ���� o  FG���� 0 templatetext templateText��  ��  � o  ;<���� 0 asocpattern asocPattern�7  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  �  
 find text   � ���    f i n d   t e x t� ��� l     ��������  ��  ��  � ��� i  6 9��� I      ������� 0 	_findtext 	_findText� ��� o      ���� 0 thetext theText� ��� o      ���� 0 fortext forText� ��� o      ���� &0 includenonmatches includeNonMatches� ���� o      ����  0 includematches includeMatches��  ��  � k    (�� ��� l     ������  ��� TO DO: is it worth switching to a more efficient algorithim when hypens, punctuation, and white space are all considered and numeric strings ignored (the default)? i.e. given a fixed-length match, the endIndex of a match can be determined using `forText's length + startIndex - 1` instead of measuring the length of all remaining text after `text item i`; will need to implement both approaches and profile them to determine if it makes any significant difference to speed   � ����   T O   D O :   i s   i t   w o r t h   s w i t c h i n g   t o   a   m o r e   e f f i c i e n t   a l g o r i t h i m   w h e n   h y p e n s ,   p u n c t u a t i o n ,   a n d   w h i t e   s p a c e   a r e   a l l   c o n s i d e r e d   a n d   n u m e r i c   s t r i n g s   i g n o r e d   ( t h e   d e f a u l t ) ?   i . e .   g i v e n   a   f i x e d - l e n g t h   m a t c h ,   t h e   e n d I n d e x   o f   a   m a t c h   c a n   b e   d e t e r m i n e d   u s i n g   ` f o r T e x t ' s   l e n g t h   +   s t a r t I n d e x   -   1 `   i n s t e a d   o f   m e a s u r i n g   t h e   l e n g t h   o f   a l l   r e m a i n i n g   t e x t   a f t e r   ` t e x t   i t e m   i ` ;   w i l l   n e e d   t o   i m p l e m e n t   b o t h   a p p r o a c h e s   a n d   p r o f i l e   t h e m   t o   d e t e r m i n e   i f   i t   m a k e s   a n y   s i g n i f i c a n t   d i f f e r e n c e   t o   s p e e d� ��� l    ���� Z    ������� =    ��� o     ���� 0 fortext forText� m    �� ���  � R    ����
�� .ascrerr ****      � ****� m    �� ��� � I n v a l i d    f o r    p a r a m e t e r   ( t e x t   i s   e m p t y ,   o r   o n l y   c o n t a i n s   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s )� ����
�� 
errn� m    	�����Y� �����
�� 
erob� o   
 ���� 0 fortext forText��  ��  ��  ��� checks if all characters in forText are ignored by current considering/ignoring settings (the alternative would be to return each character as a non-match separated by a zero-length match, but that's probably not what the user intended); note that unlike `aString's length = 0`, which is what library code normally uses to check for empty text, on this occasion we do want to take into account the current considering/ignoring settings so deliberately use `forText is ""` here. For example, when ignoring punctuation, searching for the TID `"!?"` is no different to searching for `""`, because all of its characters are being ignored when comparing the text being searched against the text being searched for. Thus, a simple `forText is ""` test can be used to check in advance if the text contains any matchable characters under the current considering/ignoring settings, and report a meaningful error if not.   � ���   c h e c k s   i f   a l l   c h a r a c t e r s   i n   f o r T e x t   a r e   i g n o r e d   b y   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   ( t h e   a l t e r n a t i v e   w o u l d   b e   t o   r e t u r n   e a c h   c h a r a c t e r   a s   a   n o n - m a t c h   s e p a r a t e d   b y   a   z e r o - l e n g t h   m a t c h ,   b u t   t h a t ' s   p r o b a b l y   n o t   w h a t   t h e   u s e r   i n t e n d e d ) ;   n o t e   t h a t   u n l i k e   ` a S t r i n g ' s   l e n g t h   =   0 ` ,   w h i c h   i s   w h a t   l i b r a r y   c o d e   n o r m a l l y   u s e s   t o   c h e c k   f o r   e m p t y   t e x t ,   o n   t h i s   o c c a s i o n   w e   d o   w a n t   t o   t a k e   i n t o   a c c o u n t   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   s o   d e l i b e r a t e l y   u s e   ` f o r T e x t   i s   " " `   h e r e .   F o r   e x a m p l e ,   w h e n   i g n o r i n g   p u n c t u a t i o n ,   s e a r c h i n g   f o r   t h e   T I D   ` " ! ? " `   i s   n o   d i f f e r e n t   t o   s e a r c h i n g   f o r   ` " " ` ,   b e c a u s e   a l l   o f   i t s   c h a r a c t e r s   a r e   b e i n g   i g n o r e d   w h e n   c o m p a r i n g   t h e   t e x t   b e i n g   s e a r c h e d   a g a i n s t   t h e   t e x t   b e i n g   s e a r c h e d   f o r .   T h u s ,   a   s i m p l e   ` f o r T e x t   i s   " " `   t e s t   c a n   b e   u s e d   t o   c h e c k   i n   a d v a n c e   i f   t h e   t e x t   c o n t a i n s   a n y   m a t c h a b l e   c h a r a c t e r s   u n d e r   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s ,   a n d   r e p o r t   a   m e a n i n g f u l   e r r o r   i f   n o t .� ��� r    ��� J    ����  � o      ���� 0 
resultlist 
resultList� ��� r    ��� n   ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ��� r    #��� o    ���� 0 fortext forText� n     ��� 1     "��
�� 
txdl� 1     ��
�� 
ascr� ��� r   $ '��� m   $ %���� � o      ���� 0 
startindex 
startIndex� ��� r   ( 0��� n   ( .��� 1   , .�
� 
leng� n   ( ,��� 4   ) ,�~�
�~ 
citm� m   * +�}�} � o   ( )�|�| 0 thetext theText� o      �{�{ 0 endindex endIndex� ��� Z   1 f���z�y� o   1 2�x�x &0 includenonmatches includeNonMatches� k   5 b�� ��� Z   5 N���w�� B   5 8��� o   5 6�v�v 0 
startindex 
startIndex� o   6 7�u�u 0 endindex endIndex� r   ; H� � n   ; F 7  < F�t
�t 
ctxt o   @ B�s�s 0 
startindex 
startIndex o   C E�r�r 0 endindex endIndex o   ; <�q�q 0 thetext theText  o      �p�p 0 	foundtext 	foundText�w  � r   K N m   K L �   o      �o�o 0 	foundtext 	foundText� 	�n	 r   O b

 K   O _ �m
�m 
pcls o   P U�l�l (0 _unmatchedtexttype _UnmatchedTextType �k�k 0 
startindex 
startIndex o   V W�j�j 0 
startindex 
startIndex �i�i 0 endindex endIndex o   X Y�h�h 0 endindex endIndex �g�f�g 0 	foundtext 	foundText o   Z [�e�e 0 	foundtext 	foundText�f   n        ;   ` a o   _ `�d�d 0 
resultlist 
resultList�n  �z  �y  �  Y   g�c�b k   w  r   w | [   w z !  o   w x�a�a 0 endindex endIndex! m   x y�`�`  o      �_�_ 0 
startindex 
startIndex "#" r   } �$%$ \   } �&'& l  } �(�^�]( n   } �)*) 1   ~ ��\
�\ 
leng* o   } ~�[�[ 0 thetext theText�^  �]  ' l  � �+�Z�Y+ n   � �,-, 1   � ��X
�X 
leng- n   � �./. 7  � ��W01
�W 
ctxt0 l  � �2�V�U2 4   � ��T3
�T 
citm3 o   � ��S�S 0 i  �V  �U  1 l  � �4�R�Q4 4   � ��P5
�P 
citm5 m   � ��O�O���R  �Q  / o   � ��N�N 0 thetext theText�Z  �Y  % o      �M�M 0 endindex endIndex# 676 Z   � �89�L�K8 o   � ��J�J  0 includematches includeMatches9 k   � �:: ;<; Z   � �=>�I?= B   � �@A@ o   � ��H�H 0 
startindex 
startIndexA o   � ��G�G 0 endindex endIndex> r   � �BCB n   � �DED 7  � ��FFG
�F 
ctxtF o   � ��E�E 0 
startindex 
startIndexG o   � ��D�D 0 endindex endIndexE o   � ��C�C 0 thetext theTextC o      �B�B 0 	foundtext 	foundText�I  ? r   � �HIH m   � �JJ �KK  I o      �A�A 0 	foundtext 	foundText< L�@L r   � �MNM K   � �OO �?PQ
�? 
pclsP o   � ��>�> $0 _matchedtexttype _MatchedTextTypeQ �=RS�= 0 
startindex 
startIndexR o   � ��<�< 0 
startindex 
startIndexS �;TU�; 0 endindex endIndexT o   � ��:�: 0 endindex endIndexU �9VW�9 0 	foundtext 	foundTextV o   � ��8�8 0 	foundtext 	foundTextW �7X�6�7 0 foundgroups foundGroupsX J   � ��5�5  �6  N n      YZY  ;   � �Z o   � ��4�4 0 
resultlist 
resultList�@  �L  �K  7 [\[ r   � �]^] [   � �_`_ o   � ��3�3 0 endindex endIndex` m   � ��2�2 ^ o      �1�1 0 
startindex 
startIndex\ aba r   � �cdc \   � �efe [   � �ghg o   � ��0�0 0 
startindex 
startIndexh l  � �i�/�.i n   � �jkj 1   � ��-
�- 
lengk n   � �lml 4   � ��,n
�, 
citmn o   � ��+�+ 0 i  m o   � ��*�* 0 thetext theText�/  �.  f m   � ��)�) d o      �(�( 0 endindex endIndexb o�'o Z   �pq�&�%p o   � ��$�$ &0 includenonmatches includeNonMatchesq k   �rr sts Z   �uv�#wu B   � �xyx o   � ��"�" 0 
startindex 
startIndexy o   � ��!�! 0 endindex endIndexv r   � �z{z n   � �|}| 7  � �� ~
�  
ctxt~ o   � ��� 0 
startindex 
startIndex o   � ��� 0 endindex endIndex} o   � ��� 0 thetext theText{ o      �� 0 	foundtext 	foundText�#  w r   ���� m   � �� ���  � o      �� 0 	foundtext 	foundTextt ��� r  ��� K  �� ���
� 
pcls� o  	�� (0 _unmatchedtexttype _UnmatchedTextType� ���� 0 
startindex 
startIndex� o  
�� 0 
startindex 
startIndex� ���� 0 endindex endIndex� o  �� 0 endindex endIndex� ���� 0 	foundtext 	foundText� o  �� 0 	foundtext 	foundText�  � n      ���  ;  � o  �� 0 
resultlist 
resultList�  �&  �%  �'  �c 0 i   m   j k��  I  k r���
� .corecnte****       ****� n   k n��� 2  l n�
� 
citm� o   k l�� 0 thetext theText�  �b   ��� r   %��� o   !�
�
 0 oldtids oldTIDs� n     ��� 1  "$�	
�	 
txdl� 1  !"�
� 
ascr� ��� L  &(�� o  &'�� 0 
resultlist 
resultList�  � ��� l     ����  �  �  � ��� l     ��� �  �  �   � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ������  �   replace text   � ���    r e p l a c e   t e x t� ��� l     ��������  ��  ��  � ��� i  : =��� I      ������� 0 _replacetext _replaceText� ��� o      ���� 0 thetext theText� ��� o      ���� 0 fortext forText� ���� o      ���� 0 newtext newText��  ��  � k    <�� ��� Z    ������� =    ��� o     ���� 0 fortext forText� m    �� ���  � R    ����
�� .ascrerr ****      � ****� m    �� ��� � I n v a l i d    f o r    p a r a m e t e r   ( t e x t   i s   e m p t y ,   o r   o n l y   c o n t a i n s   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s )� ����
�� 
errn� m    	�����Y� �����
�� 
erob� o   
 ���� 0 fortext forText��  ��  ��  � ��� r    ��� n   ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ��� r    ��� o    ���� 0 fortext forText� n     ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� ��� Z   -������ >    *��� l   (������ I   (����
�� .corecnte****       ****� J    "�� ���� o     ���� 0 newtext newText��  � �����
�� 
kocl� m   # $��
�� 
scpt��  ��  ��  � m   ( )����  � k   -�� ��� r   - N��� J   - 8�� ��� J   - /����  � ��� m   / 0���� � ���� n   0 6��� 1   4 6��
�� 
leng� n   0 4��� 4   1 4���
�� 
citm� m   2 3���� � o   0 1���� 0 thetext theText��  � J      �� ��� o      ���� 0 
resultlist 
resultList� ��� o      ���� 0 
startindex 
startIndex� ���� o      ���� 0 endindex endIndex��  � ��� Z  O g������� B   O R��� o   O P���� 0 
startindex 
startIndex� o   P Q���� 0 endindex endIndex� r   U c��� n   U `��� 7  V `��� 
�� 
ctxt� o   Z \���� 0 
startindex 
startIndex  o   ] _���� 0 endindex endIndex� o   U V���� 0 thetext theText� n        ;   a b o   ` a���� 0 
resultlist 
resultList��  ��  �  Y   h���� k   x 	
	 r   x } [   x { o   x y���� 0 endindex endIndex m   y z����  o      ���� 0 
startindex 
startIndex
  r   ~ � \   ~ � l  ~ ����� n   ~ � 1    ���
�� 
leng o   ~ ���� 0 thetext theText��  ��   l  � ����� n   � � 1   � ���
�� 
leng n   � � 7  � ���
�� 
ctxt l  � ����� 4   � ��� 
�� 
citm  o   � ����� 0 i  ��  ��   l  � �!����! 4   � ���"
�� 
citm" m   � ���������  ��   o   � ����� 0 thetext theText��  ��   o      ���� 0 endindex endIndex #$# Z   � �%&��'% B   � �()( o   � ����� 0 
startindex 
startIndex) o   � ����� 0 endindex endIndex& r   � �*+* n   � �,-, 7  � ���./
�� 
ctxt. o   � ����� 0 
startindex 
startIndex/ o   � ����� 0 endindex endIndex- o   � ����� 0 thetext theText+ o      ���� 0 	foundtext 	foundText��  ' r   � �010 m   � �22 �33  1 o      ���� 0 	foundtext 	foundText$ 454 Q   � �6786 r   � �9:9 c   � �;<; n  � �=>= I   � ���?���� 0 replacetext replaceText? @��@ o   � ����� 0 	foundtext 	foundText��  ��  > o   � ����� 0 newtext newText< m   � ���
�� 
ctxt: n      ABA  ;   � �B o   � ����� 0 
resultlist 
resultList7 R      ��CD
�� .ascrerr ****      � ****C o      ���� 0 etext eTextD ��EF
�� 
errnE o      ���� 0 enumber eNumberF ��GH
�� 
erobG o      ���� 0 efrom eFromH ��I��
�� 
errtI o      ���� 
0 eto eTo��  8 R   � ���JK
�� .ascrerr ****      � ****J b   � �LML m   � �NN �OO H A n   e r r o r   o c c u r r e d   i n    r e p l a c e T e x t  :  M o   � ����� 0 etext eTextK ��PQ
�� 
errnP o   � ����� 0 enumber eNumberQ ��RS
�� 
erobR o   � ����� 0 efrom eFromS ��T��
�� 
errtT o   � ����� 
0 eto eTo��  5 UVU r   � �WXW [   � �YZY o   � ����� 0 endindex endIndexZ m   � ����� X o      ���� 0 
startindex 
startIndexV [\[ r   � �]^] \   � �_`_ [   � �aba o   � ����� 0 
startindex 
startIndexb l  � �c����c n   � �ded 1   � ���
�� 
lenge n   � �fgf 4   � ���h
�� 
citmh o   � ����� 0 i  g o   � ����� 0 thetext theText��  ��  ` m   � ����� ^ o      ���� 0 endindex endIndex\ i��i Z  �jk����j B   � �lml o   � ��� 0 
startindex 
startIndexm o   � ��~�~ 0 endindex endIndexk r   � �non n   � �pqp 7  � ��}rs
�} 
ctxtr o   � ��|�| 0 
startindex 
startIndexs o   � ��{�{ 0 endindex endIndexq o   � ��z�z 0 thetext theTexto n      tut  ;   � �u o   � ��y�y 0 
resultlist 
resultList��  ��  ��  �� 0 i   m   k l�x�x  I  l s�wv�v
�w .corecnte****       ****v n   l owxw 2  m o�u
�u 
citmx o   l m�t�t 0 thetext theText�v  ��   y�sy r  z{z m  || �}}  { n     ~~ 1  �r
�r 
txdl 1  �q
�q 
ascr�s  ��  � l -���� k  -�� ��� l �p���p  �   replace with text   � ��� $   r e p l a c e   w i t h   t e x t� ��� r  !��� n ��� I  �o��n�o "0 astextparameter asTextParameter� ��� o  �m�m 0 newtext newText� ��l� m  �� ���  r e p l a c i n g   w i t h�l  �n  � o  �k�k 0 _support  � o      �j�j 0 newtext newText� ��� l "'���� r  "'��� n "%��� 2 #%�i
�i 
citm� o  "#�h�h 0 thetext theText� o      �g�g 0 
resultlist 
resultList� J D note: TID-based matching uses current considering/ignoring settings   � ��� �   n o t e :   T I D - b a s e d   m a t c h i n g   u s e s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s� ��f� r  (-��� o  ()�e�e 0 newtext newText� n     ��� 1  *,�d
�d 
txdl� 1  )*�c
�c 
ascr�f  � * $ replace with callback-supplied text   � ��� H   r e p l a c e   w i t h   c a l l b a c k - s u p p l i e d   t e x t� ��� r  .3��� c  .1��� o  ./�b�b 0 
resultlist 
resultList� m  /0�a
�a 
ctxt� o      �`�` 0 
resulttext 
resultText� ��� r  49��� o  45�_�_ 0 oldtids oldTIDs� n     ��� 1  68�^
�^ 
txdl� 1  56�]
�] 
ascr� ��\� L  :<�� o  :;�[�[ 0 
resulttext 
resultText�\  � ��� l     �Z�Y�X�Z  �Y  �X  � ��� l     �W�V�U�W  �V  �U  � ��� l     �T���T  �  -----   � ��� 
 - - - - -� ��� l     �S�R�Q�S  �R  �Q  � ��� i  > A��� I     �P��
�P .Txt:Srchnull���     ctxt� o      �O�O 0 thetext theText� �N��
�N 
For_� o      �M�M 0 fortext forText� �L��
�L 
Usin� |�K�J��I��K  �J  � o      �H�H 0 matchformat matchFormat�I  � l 
    ��G�F� l     ��E�D� m      �C
�C SerECmpI�E  �D  �G  �F  � �B��
�B 
Repl� |�A�@��?��A  �@  � o      �>�> 0 newtext newText�?  � l     ��=�<� m      �;
�; 
msng�=  �<  � �:��9
�: 
Retu� |�8�7��6��8  �7  � o      �5�5 0 resultformat resultFormat�6  � l     ��4�3� m      �2
�2 RetEMatT�4  �3  �9  � Q    ����� k   ��� ��� r    ��� n   ��� I    �1��0�1 "0 astextparameter asTextParameter� ��� o    	�/�/ 0 thetext theText� ��.� m   	 
�� ���  �.  �0  � o    �-�- 0 _support  � o      �,�, 0 thetext theText� ��� l   ���� r    ��� n   ��� I    �+��*�+ "0 astextparameter asTextParameter� ��� o    �)�) 0 fortext forText� ��(� m    �� ���  f o r�(  �*  � o    �'�' 0 _support  � o      �&�& 0 fortext forText� TO DO: when matching with TIDs, optionally accept a list of multiple text values to match? (note:TIDs can do that for free, so it'd just be a case of relaxing restriction on 'for' parameter's type when pattern matching is false to accept a list of text as well); also optionally accept a corresponding list of replacement values for doing mapping? (note that map will need to be O(n) associative list in order to support considering/ignoring, although NSDictionary should be usable when matching case-sensitively)   � ���   T O   D O :   w h e n   m a t c h i n g   w i t h   T I D s ,   o p t i o n a l l y   a c c e p t   a   l i s t   o f   m u l t i p l e   t e x t   v a l u e s   t o   m a t c h ?   ( n o t e : T I D s   c a n   d o   t h a t   f o r   f r e e ,   s o   i t ' d   j u s t   b e   a   c a s e   o f   r e l a x i n g   r e s t r i c t i o n   o n   ' f o r '   p a r a m e t e r ' s   t y p e   w h e n   p a t t e r n   m a t c h i n g   i s   f a l s e   t o   a c c e p t   a   l i s t   o f   t e x t   a s   w e l l ) ;   a l s o   o p t i o n a l l y   a c c e p t   a   c o r r e s p o n d i n g   l i s t   o f   r e p l a c e m e n t   v a l u e s   f o r   d o i n g   m a p p i n g ?   ( n o t e   t h a t   m a p   w i l l   n e e d   t o   b e   O ( n )   a s s o c i a t i v e   l i s t   i n   o r d e r   t o   s u p p o r t   c o n s i d e r i n g / i g n o r i n g ,   a l t h o u g h   N S D i c t i o n a r y   s h o u l d   b e   u s a b l e   w h e n   m a t c h i n g   c a s e - s e n s i t i v e l y )� ��� Z   3���%�$� =    $��� n    "��� 1     "�#
�# 
leng� o     �"�" 0 fortext forText� m   " #�!�!  � R   ' /� ��
�  .ascrerr ****      � ****� m   - .�� �   t I n v a l i d    f o r    p a r a m e t e r   ( e x p e c t e d   o n e   o r   m o r e   c h a r a c t e r s ) .� �
� 
errn m   ) *���Y ��
� 
erob o   + ,�� 0 fortext forText�  �%  �$  � � Z   4�� =  4 7	 o   4 5�� 0 newtext newText	 m   5 6�
� 
msng l  :,

 k   :,  Z   : � =  : = o   : ;�� 0 resultformat resultFormat m   ; <�
� RetEMatT r   @ S J   @ D  m   @ A�
� boovfals � m   A B�
� boovtrue�   J        o      �� &0 includenonmatches includeNonMatches � o      ��  0 includematches includeMatches�    !  =  V Y"#" o   V W�� 0 resultformat resultFormat# m   W X�
� RetEUmaT! $%$ r   \ o&'& J   \ `(( )*) m   \ ]�
� boovtrue* +�+ m   ] ^�

�
 boovfals�  ' J      ,, -.- o      �	�	 &0 includenonmatches includeNonMatches. /�/ o      ��  0 includematches includeMatches�  % 010 =  r u232 o   r s�� 0 resultformat resultFormat3 m   s t�
� RetEAllT1 4�4 r   x �565 J   x |77 898 m   x y�
� boovtrue9 :�: m   y z�
� boovtrue�  6 J      ;; <=< o      � �  &0 includenonmatches includeNonMatches= >��> o      ����  0 includematches includeMatches��  �   n  � �?@? I   � ���A���� >0 throwinvalidparameterconstant throwInvalidParameterConstantA BCB o   � ����� 0 resultformat resultFormatC D��D m   � �EE �FF  r e t u r n i n g��  ��  @ o   � ����� 0 _support   G��G Z   �,HIJKH =  � �LML o   � ����� 0 matchformat matchFormatM m   � ���
�� SerECmpII P   � �NOPN L   � �QQ I   � ���R���� 0 	_findtext 	_findTextR STS o   � ����� 0 thetext theTextT UVU o   � ����� 0 fortext forTextV WXW o   � ����� &0 includenonmatches includeNonMatchesX Y��Y o   � �����  0 includematches includeMatches��  ��  O ��Z
�� consdiacZ ��[
�� conshyph[ ��\
�� conspunc\ ��]
�� conswhit] ����
�� consnume��  P ����
�� conscase��  J ^_^ =  � �`a` o   � ����� 0 matchformat matchFormata m   � ���
�� SerECmpP_ bcb L   � �dd I   � ���e���� 0 _findpattern _findPatterne fgf o   � ����� 0 thetext theTextg hih o   � ����� 0 fortext forTexti jkj o   � ����� &0 includenonmatches includeNonMatchesk l��l o   � �����  0 includematches includeMatches��  ��  c mnm =  � �opo o   � ����� 0 matchformat matchFormatp m   � ���
�� SerECmpCn qrq P   � �st��s L   � �uu I   � ���v���� 0 	_findtext 	_findTextv wxw o   � ����� 0 thetext theTextx yzy o   � ����� 0 fortext forTextz {|{ o   � ����� &0 includenonmatches includeNonMatches| }��} o   � �����  0 includematches includeMatches��  ��  t ��~
�� conscase~ ��
�� consdiac ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  ��  r ��� =  � ���� o   � ����� 0 matchformat matchFormat� m   � ���
�� SerECmpE� ��� P   ����� L   ��� I   �������� 0 	_findtext 	_findText� ��� o   � ����� 0 thetext theText� ��� o   � ����� 0 fortext forText� ��� o   � ���� &0 includenonmatches includeNonMatches� ���� o   ����  0 includematches includeMatches��  ��  � ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  � ����
�� consnume��  � ��� = 
��� o  
���� 0 matchformat matchFormat� m  ��
�� SerECmpD� ���� L  �� I  ������� 0 	_findtext 	_findText� ��� o  ���� 0 thetext theText� ��� o  ���� 0 fortext forText� ��� o  ���� &0 includenonmatches includeNonMatches� ���� o  ����  0 includematches includeMatches��  ��  ��  K n ,��� I  $,������� >0 throwinvalidparameterconstant throwInvalidParameterConstant� ��� o  $%���� 0 matchformat matchFormat� ���� m  %(�� ��� 
 u s i n g��  ��  � o  $���� 0 _support  ��     find matches    ���    f i n d   m a t c h e s�   l /����� Z  /������ = /4��� o  /0���� 0 matchformat matchFormat� m  03��
�� SerECmpI� P  7J���� L  @I�� I  @H������� 0 _replacetext _replaceText� ��� o  AB���� 0 thetext theText� ��� o  BC���� 0 fortext forText� ���� o  CD���� 0 newtext newText��  ��  � ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  � ����
�� conscase��  � ��� = MR��� o  MN���� 0 matchformat matchFormat� m  NQ��
�� SerECmpP� ��� L  U^�� I  U]������� "0 _replacepattern _replacePattern� ��� o  VW���� 0 thetext theText� ��� o  WX���� 0 fortext forText� ���� o  XY���� 0 newtext newText��  ��  � ��� = af��� o  ab���� 0 matchformat matchFormat� m  be��
�� SerECmpE� ��� P  i|���� L  r{�� I  rz������� 0 _replacetext _replaceText� ��� o  st���� 0 thetext theText� ��� o  tu���� 0 fortext forText� ���� o  uv���� 0 newtext newText��  ��  � ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  � ����
�� consnume��  � ��� = ���� o  ����� 0 matchformat matchFormat� m  ����
�� SerECmpC� ��� P  ������� L  ���� I  ��������� 0 _replacetext _replaceText� ��� o  ���� 0 thetext theText� ��� o  ���~�~ 0 fortext forText� ��}� o  ���|�| 0 newtext newText�}  ��  � �{�
�{ conscase� �z�
�z consdiac� �y�
�y conshyph� �x�
�x conspunc� �w�
�w conswhit� �v�u
�v consnume�u  ��  � ��� = ����� o  ���t�t 0 matchformat matchFormat� m  ���s
�s SerECmpD�  �r  L  �� I  ���q�p�q 0 _replacetext _replaceText  o  ���o�o 0 thetext theText  o  ���n�n 0 fortext forText �m o  ���l�l 0 newtext newText�m  �p  �r  � n ��	 I  ���k
�j�k >0 throwinvalidparameterconstant throwInvalidParameterConstant
  o  ���i�i 0 matchformat matchFormat �h m  �� � 
 u s i n g�h  �j  	 o  ���g�g 0 _support  �   replace matches   � �     r e p l a c e   m a t c h e s�  � R      �f
�f .ascrerr ****      � **** o      �e�e 0 etext eText �d
�d 
errn o      �c�c 0 enumber eNumber �b
�b 
erob o      �a�a 0 efrom eFrom �`�_
�` 
errt o      �^�^ 
0 eto eTo�_  � I  ���]�\�] 
0 _error    m  �� �  s e a r c h   t e x t  o  ���[�[ 0 etext eText   o  ���Z�Z 0 enumber eNumber  !"! o  ���Y�Y 0 efrom eFrom" #�X# o  ���W�W 
0 eto eTo�X  �\  � $%$ l     �V�U�T�V  �U  �T  % &'& l     �S�R�Q�S  �R  �Q  ' ()( i  B E*+* I     �P,�O
�P .Txt:EPatnull���     ctxt, o      �N�N 0 thetext theText�O  + Q     *-./- L    00 c    121 l   3�M�L3 n   454 I    �K6�J�K 40 escapedpatternforstring_ escapedPatternForString_6 7�I7 l   8�H�G8 n   9:9 I    �F;�E�F "0 astextparameter asTextParameter; <=< o    �D�D 0 thetext theText= >�C> m    ?? �@@  �C  �E  : o    �B�B 0 _support  �H  �G  �I  �J  5 n   ABA o    �A�A *0 nsregularexpression NSRegularExpressionB m    �@
�@ misccura�M  �L  2 m    �?
�? 
ctxt. R      �>CD
�> .ascrerr ****      � ****C o      �=�= 0 etext eTextD �<EF
�< 
errnE o      �;�; 0 enumber eNumberF �:GH
�: 
erobG o      �9�9 0 efrom eFromH �8I�7
�8 
errtI o      �6�6 
0 eto eTo�7  / I     *�5J�4�5 
0 _error  J KLK m   ! "MM �NN  e s c a p e   p a t t e r nL OPO o   " #�3�3 0 etext eTextP QRQ o   # $�2�2 0 enumber eNumberR STS o   $ %�1�1 0 efrom eFromT U�0U o   % &�/�/ 
0 eto eTo�0  �4  ) VWV l     �.�-�,�.  �-  �,  W XYX l     �+�*�)�+  �*  �)  Y Z[Z i  F I\]\ I     �(^�'
�( .Txt:ETemnull���     ctxt^ o      �&�& 0 thetext theText�'  ] Q     *_`a_ L    bb c    cdc l   e�%�$e n   fgf I    �#h�"�# 60 escapedtemplateforstring_ escapedTemplateForString_h i�!i l   j� �j n   klk I    �m�� "0 astextparameter asTextParameterm non o    �� 0 thetext theTexto p�p m    qq �rr  �  �  l o    �� 0 _support  �   �  �!  �"  g n   sts o    �� *0 nsregularexpression NSRegularExpressiont m    �
� misccura�%  �$  d m    �
� 
ctxt` R      �uv
� .ascrerr ****      � ****u o      �� 0 etext eTextv �wx
� 
errnw o      �� 0 enumber eNumberx �yz
� 
eroby o      �� 0 efrom eFromz �{�
� 
errt{ o      �� 
0 eto eTo�  a I     *�|�� 
0 _error  | }~} m   ! " ���  e s c a p e   t e m p l a t e~ ��� o   " #�� 0 etext eText� ��� o   # $�
�
 0 enumber eNumber� ��� o   $ %�	�	 0 efrom eFrom� ��� o   % &�� 
0 eto eTo�  �  [ ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     � ���   � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Conversion Suite   � ��� "   C o n v e r s i o n   S u i t e� ��� l     ��������  ��  ��  � ��� i  J M��� I     ����
�� .Txt:UppTnull���     ctxt� o      ���� 0 thetext theText� �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q     P���� k    >�� ��� r    ��� n   ��� I    ������� 0 
asnsstring 
asNSString� ���� n   ��� I    ������� "0 astextparameter asTextParameter� ��� o    ���� 0 thetext theText� ���� m    �� ���  ��  ��  � o    ���� 0 _support  ��  ��  � o    ���� 0 _support  � o      ���� 0 
asocstring 
asocString� ���� Z    >������ =   ��� o    ���� 0 
localecode 
localeCode� m    ��
�� 
msng� L     (�� c     '��� l    %������ n    %��� I   ! %�������� "0 uppercasestring uppercaseString��  ��  � o     !���� 0 
asocstring 
asocString��  ��  � m   % &��
�� 
ctxt��  � L   + >�� c   + =��� l  + ;������ n  + ;��� I   , ;������� 80 uppercasestringwithlocale_ uppercaseStringWithLocale_� ���� l  , 7������ n  , 7��� I   1 7������� *0 asnslocaleparameter asNSLocaleParameter� ��� o   1 2���� 0 
localecode 
localeCode� ���� m   2 3�� ���  f o r   l o c a l e��  ��  � o   , 1���� 0 _support  ��  ��  ��  ��  � o   + ,���� 0 
asocstring 
asocString��  ��  � m   ; <��
�� 
ctxt��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I   F P������� 
0 _error  � ��� m   G H�� ���  u p p e r c a s e   t e x t� ��� o   H I���� 0 etext eText� ��� o   I J���� 0 enumber eNumber� ��� o   J K���� 0 efrom eFrom� ���� o   K L���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  N Q��� I     ����
�� .Txt:CapTnull���     ctxt� o      ���� 0 thetext theText� �����
�� 
Loca� |����������  ��  � o      ���� 0 
localecode 
localeCode��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q     P���� k    >�� ��� r    ��� n   ��� I    ������� 0 
asnsstring 
asNSString� ���� n      I    ������ "0 astextparameter asTextParameter  o    ���� 0 thetext theText �� m     �  ��  ��   o    ���� 0 _support  ��  ��  � o    ���� 0 _support  � o      ���� 0 
asocstring 
asocString� �� Z    >	
��	 =    o    ���� 0 
localecode 
localeCode m    ��
�� 
msng
 L     ( c     ' l    %���� n    % I   ! %�������� &0 capitalizedstring capitalizedString��  ��   o     !���� 0 
asocstring 
asocString��  ��   m   % &��
�� 
ctxt��   L   + > c   + = l  + ;���� n  + ; I   , ;������ <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_ �� l  , 7���� n  , 7 I   1 7������ *0 asnslocaleparameter asNSLocaleParameter  !  o   1 2���� 0 
localecode 
localeCode! "��" m   2 3## �$$  f o r   l o c a l e��  ��   o   , 1���� 0 _support  ��  ��  ��  ��   o   + ,���� 0 
asocstring 
asocString��  ��   m   ; <��
�� 
ctxt��  � R      ��%&
�� .ascrerr ****      � ****% o      ���� 0 etext eText& ��'(
�� 
errn' o      ���� 0 enumber eNumber( ��)*
�� 
erob) o      ���� 0 efrom eFrom* ��+��
�� 
errt+ o      ���� 
0 eto eTo��  � I   F P��,��� 
0 _error  , -.- m   G H// �00  c a p i t a l i z e   t e x t. 121 o   H I�~�~ 0 etext eText2 343 o   I J�}�} 0 enumber eNumber4 565 o   J K�|�| 0 efrom eFrom6 7�{7 o   K L�z�z 
0 eto eTo�{  �  � 898 l     �y�x�w�y  �x  �w  9 :;: l     �v�u�t�v  �u  �t  ; <=< i  R U>?> I     �s@A
�s .Txt:LowTnull���     ctxt@ o      �r�r 0 thetext theTextA �qB�p
�q 
LocaB |�o�nC�mD�o  �n  C o      �l�l 0 
localecode 
localeCode�m  D l     E�k�jE m      �i
�i 
msng�k  �j  �p  ? Q     PFGHF k    >II JKJ r    LML n   NON I    �hP�g�h 0 
asnsstring 
asNSStringP Q�fQ n   RSR I    �eT�d�e "0 astextparameter asTextParameterT UVU o    �c�c 0 thetext theTextV W�bW m    XX �YY  �b  �d  S o    �a�a 0 _support  �f  �g  O o    �`�` 0 _support  M o      �_�_ 0 
asocstring 
asocStringK Z�^Z Z    >[\�]][ =   ^_^ o    �\�\ 0 
localecode 
localeCode_ m    �[
�[ 
msng\ L     (`` c     'aba l    %c�Z�Yc n    %ded I   ! %�X�W�V�X "0 lowercasestring lowercaseString�W  �V  e o     !�U�U 0 
asocstring 
asocString�Z  �Y  b m   % &�T
�T 
ctxt�]  ] L   + >ff c   + =ghg l  + ;i�S�Ri n  + ;jkj I   , ;�Ql�P�Q 80 lowercasestringwithlocale_ lowercaseStringWithLocale_l m�Om l  , 7n�N�Mn n  , 7opo I   1 7�Lq�K�L *0 asnslocaleparameter asNSLocaleParameterq rsr o   1 2�J�J 0 
localecode 
localeCodes t�It m   2 3uu �vv  f o r   l o c a l e�I  �K  p o   , 1�H�H 0 _support  �N  �M  �O  �P  k o   + ,�G�G 0 
asocstring 
asocString�S  �R  h m   ; <�F
�F 
ctxt�^  G R      �Ewx
�E .ascrerr ****      � ****w o      �D�D 0 etext eTextx �Cyz
�C 
errny o      �B�B 0 enumber eNumberz �A{|
�A 
erob{ o      �@�@ 0 efrom eFrom| �?}�>
�? 
errt} o      �=�= 
0 eto eTo�>  H I   F P�<~�;�< 
0 _error  ~ � m   G H�� ���  l o w e r c a s e   t e x t� ��� o   H I�:�: 0 etext eText� ��� o   I J�9�9 0 enumber eNumber� ��� o   J K�8�8 0 efrom eFrom� ��7� o   K L�6�6 
0 eto eTo�7  �;  = ��� l     �5�4�3�5  �4  �3  � ��� l     �2�1�0�2  �1  �0  � ��� i  V Y��� I     �/��
�/ .Txt:PadTnull���     ctxt� o      �.�. 0 thetext theText� �-��
�- 
toPl� o      �,�, 0 toplaces toPlaces� �+��
�+ 
Char� |�*�)��(��*  �)  � o      �'�' 0 padchar padChar�(  � m      �� ���   � �&��%
�& 
From� |�$�#��"��$  �#  � o      �!�! 0 whichend whichEnd�"  � l     �� �� m      �
� LeTrLCha�   �  �%  � k     ��� ��� l     ����  � � � TO DO: what if pad is multi-char? how best to align on right? e.g. if pad is ". " then ideally the periods should always appear in same columns, e.g. "foo. . ." vs "food . ."   � ���^   T O   D O :   w h a t   i f   p a d   i s   m u l t i - c h a r ?   h o w   b e s t   t o   a l i g n   o n   r i g h t ?   e . g .   i f   p a d   i s   " .   "   t h e n   i d e a l l y   t h e   p e r i o d s   s h o u l d   a l w a y s   a p p e a r   i n   s a m e   c o l u m n s ,   e . g .   " f o o .   .   . "   v s   " f o o d   .   . "� ��� Q     ����� k    ��� ��� r    ��� n   ��� I    ���� "0 astextparameter asTextParameter� ��� o    	�� 0 thetext theText� ��� m   	 
�� ���  �  �  � o    �� 0 _support  � o      �� 0 thetext theText� ��� r    ��� n   ��� I    ���� (0 asintegerparameter asIntegerParameter� ��� o    �� 0 toplaces toPlaces� ��� m    �� ���  t o   p l a c e s�  �  � o    �� 0 _support  � o      �� 0 toplaces toPlaces� ��� r    &��� \    $��� o     �� 0 toplaces toPlaces� l    #���� n    #��� 1   ! #�
� 
leng� o     !�� 0 thetext theText�  �  � o      �
�
 0 	charcount 	charCount� ��� Z  ' 3���	�� B   ' *��� o   ' (�� 0 	charcount 	charCount� m   ( )��  � L   - /�� o   - .�� 0 thetext theText�	  �  � ��� r   4 A��� n  4 ?��� I   9 ?���� "0 astextparameter asTextParameter� ��� o   9 :�� 0 padchar padChar� ��� m   : ;�� ��� 
 u s i n g�  �  � o   4 9� �  0 _support  � o      ���� 0 padtext padText� ��� Z  B V������� =   B G��� n  B E��� 1   C E��
�� 
leng� o   B C���� 0 padtext padText� m   E F����  � R   J R����
�� .ascrerr ****      � ****� m   P Q�� ��� f I n v a l i d    u s i n g    p a r a m e t e r   ( e m p t y   t e x t   n o t   a l l o w e d ) .� ����
�� 
errn� m   L M�����Y� �����
�� 
erob� o   N O���� 0 padchar padChar��  ��  ��  � ��� V   W k��� r   a f��� b   a d��� o   a b���� 0 padtext padText� o   b c���� 0 padtext padText� o      ���� 0 padtext padText� A   [ `��� n  [ ^��� 1   \ ^��
�� 
leng� o   [ \���� 0 padtext padText� o   ^ _���� 0 	charcount 	charCount� ���� Z   l ������ =  l o�	 � o   l m���� 0 whichend whichEnd	  m   m n��
�� LeTrLCha� L   r �		 b   r 			 l  r }	����	 n  r }			 7  s }��		
�� 
ctxt	 m   w y���� 	 o   z |���� 0 	charcount 	charCount	 o   r s���� 0 padtext padText��  ��  	 o   } ~���� 0 thetext theText� 			
		 =  � �			 o   � ����� 0 whichend whichEnd	 m   � ���
�� LeTrTCha	
 			 L   � �		 b   � �			 o   � ����� 0 thetext theText	 l  � �	����	 n  � �			 7  � ���		
�� 
ctxt	 m   � ����� 	 o   � ����� 0 	charcount 	charCount	 o   � ����� 0 padtext padText��  ��  	 			 =  � �			 o   � ����� 0 whichend whichEnd	 m   � ���
�� LeTrBCha	 	��	 Z   � �		��		 =   � �		 	 o   � ����� 0 	charcount 	charCount	  m   � ����� 	 L   � �	!	! b   � �	"	#	" o   � ����� 0 thetext theText	# l  � �	$����	$ n  � �	%	&	% 7  � ���	'	(
�� 
ctxt	' m   � ����� 	( o   � ����� 0 	charcount 	charCount	& o   � ����� 0 padtext padText��  ��  ��  	 L   � �	)	) n  � �	*	+	* 7  � ���	,	-
�� 
ctxt	, m   � ����� 	- o   � ����� 0 toplaces toPlaces	+ l  � �	.����	. b   � �	/	0	/ b   � �	1	2	1 n  � �	3	4	3 7  � ���	5	6
�� 
ctxt	5 m   � ����� 	6 l  � �	7����	7 _   � �	8	9	8 o   � ����� 0 	charcount 	charCount	9 m   � ����� ��  ��  	4 o   � ����� 0 padtext padText	2 o   � ����� 0 thetext theText	0 o   � ����� 0 padtext padText��  ��  ��  � n  � �	:	;	: I   � ���	<���� >0 throwinvalidparameterconstant throwInvalidParameterConstant	< 	=	>	= o   � ����� 0 whichend whichEnd	> 	?��	? m   � �	@	@ �	A	A  a d d i n g��  ��  	; o   � ����� 0 _support  ��  � R      ��	B	C
�� .ascrerr ****      � ****	B o      ���� 0 etext eText	C ��	D	E
�� 
errn	D o      ���� 0 enumber eNumber	E ��	F	G
�� 
erob	F o      ���� 0 efrom eFrom	G ��	H��
�� 
errt	H o      ���� 
0 eto eTo��  � I   � ���	I���� 
0 _error  	I 	J	K	J m   � �	L	L �	M	M  p a d   t e x t	K 	N	O	N o   � ����� 0 etext eText	O 	P	Q	P o   � ����� 0 enumber eNumber	Q 	R	S	R o   � ����� 0 efrom eFrom	S 	T��	T o   � ����� 
0 eto eTo��  ��  �  � 	U	V	U l     ��������  ��  ��  	V 	W	X	W l     ��������  ��  ��  	X 	Y	Z	Y i  Z ]	[	\	[ I     ��	]	^
�� .Txt:SliTnull���     ctxt	] o      ���� 0 thetext theText	^ ��	_	`
�� 
FIdx	_ |����	a��	b��  ��  	a o      ���� 0 
startindex 
startIndex��  	b l     	c����	c m      ��
�� 
msng��  ��  	` ��	d��
�� 
TIdx	d |����	e��	f��  ��  	e o      ���� 0 endindex endIndex��  	f l     	g����	g m      ��
�� 
msng��  ��  ��  	\ Q    �	h	i	j	h k   p	k	k 	l	m	l r    	n	o	n n   	p	q	p I    ��	r���� "0 astextparameter asTextParameter	r 	s	t	s o    	���� 0 thetext theText	t 	u��	u m   	 
	v	v �	w	w  ��  ��  	q o    ���� 0 _support  	o o      ���� 0 thetext theText	m 	x	y	x r    	z	{	z n   	|	}	| 1    ��
�� 
leng	} o    ���� 0 thetext theText	{ o      ���� 0 	thelength 	theLength	y 	~		~ Z    	�	�	���	� >   	�	�	� o    ���� 0 
startindex 
startIndex	� m    ��
�� 
msng	� k    l	�	� 	�	�	� r    *	�	�	� n   (	�	�	� I   " (��	����� (0 asintegerparameter asIntegerParameter	� 	�	�	� o   " #���� 0 
startindex 
startIndex	� 	���	� m   # $	�	� �	�	�  f r o m��  ��  	� o    "���� 0 _support  	� o      ���� 0 
startindex 
startIndex	� 	�	�	� l  + +�	�	��  	� J D note: index 0 is disallowed as it makes behavior confusing to users   	� �	�	� �   n o t e :   i n d e x   0   i s   d i s a l l o w e d   a s   i t   m a k e s   b e h a v i o r   c o n f u s i n g   t o   u s e r s	� 	�	�	� Z  + =	�	��~�}	� =   + .	�	�	� o   + ,�|�| 0 
startindex 
startIndex	� m   , -�{�{  	� R   1 9�z	�	�
�z .ascrerr ****      � ****	� m   7 8	�	� �	�	� Z I n v a l i d   i n d e x   (  f r o m    p a r a m e t e r   c a n n o t   b e   0 ) .	� �y	�	�
�y 
errn	� m   3 4�x�x�Y	� �w	��v
�w 
erob	� o   5 6�u�u 0 
startindex 
startIndex�v  �~  �}  	� 	��t	� Z   > l	�	��s�r	� =  > A	�	�	� o   > ?�q�q 0 endindex endIndex	� m   ? @�p
�p 
msng	� Z   D h	�	�	�	�	� A   D H	�	�	� o   D E�o�o 0 
startindex 
startIndex	� d   E G	�	� o   E F�n�n 0 	thelength 	theLength	� L   K M	�	� o   K L�m�m 0 thetext theText	� 	�	�	� ?   P S	�	�	� o   P Q�l�l 0 
startindex 
startIndex	� o   Q R�k�k 0 	thelength 	theLength	� 	��j	� L   V X	�	� m   V W	�	� �	�	�  �j  	� L   [ h	�	� n  [ g	�	�	� 7  \ f�i	�	�
�i 
ctxt	� o   ` b�h�h 0 
startindex 
startIndex	� m   c e�g�g��	� o   [ \�f�f 0 thetext theText�s  �r  �t  	� 	�	�	� =  o r	�	�	� o   o p�e�e 0 endindex endIndex	� m   p q�d
�d 
msng	� 	��c	� R   u {�b	�	�
�b .ascrerr ****      � ****	� m   y z	�	� �	�	� J M i s s i n g    f r o m    a n d / o r    t o    p a r a m e t e r .	� �a	��`
�a 
errn	� m   w x�_�_�[�`  �c  ��  	 	�	�	� Z   � �	�	��^�]	� >  � �	�	�	� o   � ��\�\ 0 endindex endIndex	� m   � ��[
�[ 
msng	� k   � �	�	� 	�	�	� r   � �	�	�	� n  � �	�	�	� I   � ��Z	��Y�Z (0 asintegerparameter asIntegerParameter	� 	�	�	� o   � ��X�X 0 endindex endIndex	� 	��W	� m   � �	�	� �	�	�  t o�W  �Y  	� o   � ��V�V 0 _support  	� o      �U�U 0 endindex endIndex	� 	�	�	� Z  � �	�	��T�S	� =   � �	�	�	� o   � ��R�R 0 endindex endIndex	� m   � ��Q�Q  	� R   � ��P	�	�
�P .ascrerr ****      � ****	� m   � �	�	� �	�	� V I n v a l i d   i n d e x   (  t o    p a r a m e t e r   c a n n o t   b e   0 ) .	� �O	�	�
�O 
errn	� m   � ��N�N�Y	� �M	��L
�M 
erob	� o   � ��K�K 0 endindex endIndex�L  �T  �S  	� 	��J	� Z   � �	�	��I�H	� =  � �	�	�	� o   � ��G�G 0 
startindex 
startIndex	� m   � ��F
�F 
msng	� Z   � �	�	�	�	�	� A   � �	�	�	� o   � ��E�E 0 endindex endIndex	� d   � �	�	� o   � ��D�D 0 	thelength 	theLength	� L   � �	�	� m   � �	�	� �	�	�  	� 	�	�	� ?   � �	�	�	� o   � ��C�C 0 endindex endIndex	� o   � ��B�B 0 	thelength 	theLength	� 	��A	� L   � �	�	� o   � ��@�@ 0 thetext theText�A  	� L   � �	�	� n  � �	�	�	� 7  � ��?
 

�? 
ctxt
  m   � ��>�> 
 o   � ��=�= 0 endindex endIndex	� o   � ��<�< 0 thetext theText�I  �H  �J  �^  �]  	� 


 l  � ��;

�;  
 + % both start and end indexes are given   
 �

 J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e n
 


 Z  � �
	

�:�9
	 A   � �


 o   � ��8�8 0 
startindex 
startIndex
 m   � ��7�7  

 r   � �


 [   � �


 [   � �


 o   � ��6�6 0 	thelength 	theLength
 m   � ��5�5 
 o   � ��4�4 0 
startindex 
startIndex
 o      �3�3 0 
startindex 
startIndex�:  �9  
 


 Z  �

�2�1
 A   � �


 o   � ��0�0 0 endindex endIndex
 m   � ��/�/  
 r   � �


 [   � �


 [   � �


 o   � ��.�. 0 	thelength 	theLength
 m   � ��-�- 
 o   � ��,�, 0 endindex endIndex
 o      �+�+ 0 endindex endIndex�2  �1  
 

 
 Z .
!
"�*�)
! G  #
#
$
# F  
%
&
% A  
'
(
' o  �(�( 0 
startindex 
startIndex
( m  �'�' 
& A  
)
*
) o  	�&�& 0 endindex endIndex
* l 
	

+�%�$
+ m  	
�#�# �%  �$  
$ F  
,
-
, ?  
.
/
. o  �"�" 0 
startindex 
startIndex
/ o  �!�! 0 	thelength 	theLength
- ?  
0
1
0 o  � �  0 endindex endIndex
1 o  �� 0 	thelength 	theLength
" L  &*
2
2 m  &)
3
3 �
4
4  �*  �)  
  
5
6
5 Z  /H
7
8
9�
7 A  /2
:
;
: o  /0�� 0 
startindex 
startIndex
; m  01�� 
8 r  58
<
=
< m  56�� 
= o      �� 0 
startindex 
startIndex
9 
>
?
> ?  ;>
@
A
@ o  ;<�� 0 
startindex 
startIndex
A o  <=�� 0 	thelength 	theLength
? 
B�
B r  AD
C
D
C o  AB�� 0 	thelength 	theLength
D o      �� 0 
startindex 
startIndex�  �  
6 
E
F
E Z  Ib
G
H
I�
G A  IL
J
K
J o  IJ�� 0 endindex endIndex
K m  JK�� 
H r  OR
L
M
L m  OP�� 
M o      �� 0 endindex endIndex
I 
N
O
N ?  UX
P
Q
P o  UV�� 0 endindex endIndex
Q o  VW�� 0 	thelength 	theLength
O 
R�
R r  [^
S
T
S o  [\�� 0 	thelength 	theLength
T o      �� 0 endindex endIndex�  �  
F 
U�

U L  cp
V
V n  co
W
X
W 7 dn�	
Y
Z
�	 
ctxt
Y o  hj�� 0 
startindex 
startIndex
Z o  km�� 0 endindex endIndex
X o  cd�� 0 thetext theText�
  	i R      �
[
\
� .ascrerr ****      � ****
[ o      �� 0 etext eText
\ �
]
^
� 
errn
] o      �� 0 enumber eNumber
^ �
_
`
� 
erob
_ o      � �  0 efrom eFrom
` ��
a��
�� 
errt
a o      ���� 
0 eto eTo��  	j I  x���
b���� 
0 _error  
b 
c
d
c m  y|
e
e �
f
f  s l i c e   t e x t
d 
g
h
g o  |}���� 0 etext eText
h 
i
j
i o  }~���� 0 enumber eNumber
j 
k
l
k o  ~���� 0 efrom eFrom
l 
m��
m o  ����� 
0 eto eTo��  ��  	Z 
n
o
n l     ��������  ��  ��  
o 
p
q
p l     ��������  ��  ��  
q 
r
s
r i  ^ a
t
u
t I     ��
v
w
�� .Txt:TrmTnull���     ctxt
v o      ���� 0 thetext theText
w ��
x��
�� 
From
x |����
y��
z��  ��  
y o      ���� 0 whichend whichEnd��  
z l     
{����
{ m      ��
�� LeTrBCha��  ��  ��  
u Q     �
|
}
~
| k    �

 
�
�
� r    
�
�
� n   
�
�
� I    ��
����� "0 astextparameter asTextParameter
� 
�
�
� o    	���� 0 thetext theText
� 
���
� m   	 

�
� �
�
�  ��  ��  
� o    ���� 0 _support  
� o      ���� 0 thetext theText
� 
�
�
� Z    -
�
�����
� H    
�
� E   
�
�
� J    
�
� 
�
�
� m    ��
�� LeTrLCha
� 
�
�
� m    ��
�� LeTrTCha
� 
���
� m    ��
�� LeTrBCha��  
� J    
�
� 
���
� o    ���� 0 whichend whichEnd��  
� n   )
�
�
� I   # )��
����� >0 throwinvalidparameterconstant throwInvalidParameterConstant
� 
�
�
� o   # $���� 0 whichend whichEnd
� 
���
� m   $ %
�
� �
�
�  r e m o v i n g��  ��  
� o    #���� 0 _support  ��  ��  
� 
���
� P   . �
�
�
�
� k   3 �
�
� 
�
�
� l  3 ?
�
�
�
� Z  3 ?
�
�����
� =  3 6
�
�
� o   3 4���� 0 thetext theText
� m   4 5
�
� �
�
�  
� L   9 ;
�
� m   9 :
�
� �
�
�  ��  ��  
� H B check if theText is empty or contains white space characters only   
� �
�
� �   c h e c k   i f   t h e T e x t   i s   e m p t y   o r   c o n t a i n s   w h i t e   s p a c e   c h a r a c t e r s   o n l y
� 
�
�
� r   @ S
�
�
� J   @ D
�
� 
�
�
� m   @ A���� 
� 
���
� m   A B��������  
� J      
�
� 
�
�
� o      ���� 0 
startindex 
startIndex
� 
���
� o      ���� 0 endindex endIndex��  
� 
�
�
� Z   T x
�
�����
� E  T \
�
�
� J   T X
�
� 
�
�
� m   T U��
�� LeTrLCha
� 
���
� m   U V��
�� LeTrBCha��  
� J   X [
�
� 
���
� o   X Y���� 0 whichend whichEnd��  
� V   _ t
�
�
� r   j o
�
�
� [   j m
�
�
� o   j k���� 0 
startindex 
startIndex
� m   k l���� 
� o      ���� 0 
startindex 
startIndex
� =  c i
�
�
� n   c g
�
�
� 4   d g��
�
�� 
cha 
� o   e f���� 0 
startindex 
startIndex
� o   c d���� 0 thetext theText
� m   g h
�
� �
�
�  ��  ��  
� 
�
�
� Z   y �
�
�����
� E  y �
�
�
� J   y }
�
� 
�
�
� m   y z��
�� LeTrTCha
� 
���
� m   z {��
�� LeTrBCha��  
� J   } �
�
� 
���
� o   } ~���� 0 whichend whichEnd��  
� V   � �
�
�
� r   � �
�
�
� \   � �
�
�
� o   � ����� 0 endindex endIndex
� m   � ����� 
� o      ���� 0 endindex endIndex
� =  � �
�
�
� n   � �
�
�
� 4   � ���
�
�� 
cha 
� o   � ����� 0 endindex endIndex
� o   � ����� 0 thetext theText
� m   � �
�
� �
�
�  ��  ��  
� 
���
� L   � �
�
� n   � �
�
�
� 7  � ���
�
�
�� 
ctxt
� o   � ����� 0 
startindex 
startIndex
� o   � ����� 0 endindex endIndex
� o   � ����� 0 thetext theText��  
� ��
�
�� conscase
� ��
�
�� consdiac
� ��
�
�� conshyph
� ����
�� conspunc��  
� ��
�
�� consnume
� ����
�� conswhit��  ��  
} R      ��
� 
�� .ascrerr ****      � ****
� o      ���� 0 etext eText  ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  
~ I   � ������� 
0 _error    m   � �		 �

  t r i m   t e x t  o   � ����� 0 etext eText  o   � ����� 0 enumber eNumber  o   � ����� 0 efrom eFrom �� o   � ����� 
0 eto eTo��  ��  
s  l     ��������  ��  ��    l     ��������  ��  ��    l     ����   J D--------------------------------------------------------------------    � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����     Split and Join Suite    � *   S p l i t   a n d   J o i n   S u i t e  !  l     ��������  ��  ��  ! "#" i  b e$%$ I      ��&���� 0 
_splittext 
_splitText& '(' o      ���� 0 thetext theText( )��) o      ���� 0 theseparator theSeparator��  ��  % l    ^*+,* k     ^-- ./. r     010 n    
232 I    
��4��� "0 aslistparameter asListParameter4 5�~5 o    �}�} 0 theseparator theSeparator�~  �  3 o     �|�| 0 _support  1 o      �{�{ 0 delimiterlist delimiterList/ 676 X    C8�z98 Q    >:;<: l    )=>?= r     )@A@ c     %BCB n     #DED 1   ! #�y
�y 
pcntE o     !�x�x 0 aref aRefC m   # $�w
�w 
ctxtA n      FGF 1   & (�v
�v 
pcntG o   % &�u�u 0 aref aRef>�� caution: AS silently ignores invalid TID values, so separator items must be explicitly validated to catch any user errors; for now, just coerce to text and catch errors, but might want to make it more rigorous in future (e.g. if a list of lists is given, should sublist be treated as an error instead of just coercing it to text, which is itself TIDs sensitive); see also existing TODO on TypeSupport's asTextParameter handler   ? �HHV   c a u t i o n :   A S   s i l e n t l y   i g n o r e s   i n v a l i d   T I D   v a l u e s ,   s o   s e p a r a t o r   i t e m s   m u s t   b e   e x p l i c i t l y   v a l i d a t e d   t o   c a t c h   a n y   u s e r   e r r o r s ;   f o r   n o w ,   j u s t   c o e r c e   t o   t e x t   a n d   c a t c h   e r r o r s ,   b u t   m i g h t   w a n t   t o   m a k e   i t   m o r e   r i g o r o u s   i n   f u t u r e   ( e . g .   i f   a   l i s t   o f   l i s t s   i s   g i v e n ,   s h o u l d   s u b l i s t   b e   t r e a t e d   a s   a n   e r r o r   i n s t e a d   o f   j u s t   c o e r c i n g   i t   t o   t e x t ,   w h i c h   i s   i t s e l f   T I D s   s e n s i t i v e ) ;   s e e   a l s o   e x i s t i n g   T O D O   o n   T y p e S u p p o r t ' s   a s T e x t P a r a m e t e r   h a n d l e r; R      �t�sI
�t .ascrerr ****      � ****�s  I �rJ�q
�r 
errnJ d      KK m      �p�p��q  < n  1 >LML I   6 >�oN�n�o 60 throwinvalidparametertype throwInvalidParameterTypeN OPO o   6 7�m�m 0 aref aRefP QRQ m   7 8SS �TT  u s i n g   s e p a r a t o rR UVU m   8 9WW �XX  l i s t   o f   t e x tV Y�lY m   9 :�k
�k 
ctxt�l  �n  M o   1 6�j�j 0 _support  �z 0 aref aRef9 o    �i�i 0 delimiterlist delimiterList7 Z[Z r   D I\]\ n  D G^_^ 1   E G�h
�h 
txdl_ 1   D E�g
�g 
ascr] o      �f�f 0 oldtids oldTIDs[ `a` r   J Obcb o   J K�e�e 0 delimiterlist delimiterListc n     ded 1   L N�d
�d 
txdle 1   K L�c
�c 
ascra fgf r   P Uhih n   P Sjkj 2  Q S�b
�b 
citmk o   P Q�a�a 0 thetext theTexti o      �`�` 0 
resultlist 
resultListg lml r   V [non o   V W�_�_ 0 oldtids oldTIDso n     pqp 1   X Z�^
�^ 
txdlq 1   W X�]
�] 
ascrm r�\r L   \ ^ss o   \ ]�[�[ 0 
resultlist 
resultList�\  + � � used by `split text` to split text using one or more text item delimiters and current or predefined considering/ignoring settings   , �tt   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   o n e   o r   m o r e   t e x t   i t e m   d e l i m i t e r s   a n d   c u r r e n t   o r   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s# uvu l     �Z�Y�X�Z  �Y  �X  v wxw l     �W�V�U�W  �V  �U  x yzy i  f i{|{ I      �T}�S�T 0 _splitpattern _splitPattern} ~~ o      �R�R 0 thetext theText ��Q� o      �P�P 0 patterntext patternText�Q  �S  | l    ����� k     ��� ��� r     ��� n    ��� I    �O��N�O @0 asnsregularexpressionparameter asNSRegularExpressionParameter� ��� o    �M�M 0 patterntext patternText� ��� m    �L�L  � ��K� m    �� ���  a t�K  �N  � o     �J�J 0 _support  � o      �I�I 0 asocpattern asocPattern� ��� r    ��� n   ��� I    �H��G�H ,0 asnormalizednsstring asNormalizedNSString� ��F� o    �E�E 0 thetext theText�F  �G  � o    �D�D 0 _support  � o      �C�C 0 
asocstring 
asocString� ��� l   ���� r    ��� m    �B�B  � o      �A�A &0 asocnonmatchstart asocNonMatchStart� G A used to calculate NSRanges for non-matching portions of NSString   � ��� �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n g� ��� r     $��� J     "�@�@  � o      �?�? 0 
resultlist 
resultList� ��� l  % %�>���>  � @ : iterate over each non-matched + matched range in NSString   � ��� t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g� ��� r   % 6��� n  % 4��� I   & 4�=��<�= @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   & '�;�; 0 
asocstring 
asocString� ��� m   ' (�:�:  � ��9� J   ( 0�� ��� m   ( )�8�8  � ��7� n  ) .��� I   * .�6�5�4�6 
0 length  �5  �4  � o   ) *�3�3 0 
asocstring 
asocString�7  �9  �<  � o   % &�2�2 0 asocpattern asocPattern� o      �1�1  0 asocmatcharray asocMatchArray� ��� Y   7 ~��0���/� k   G y�� ��� r   G T��� l  G R��.�-� n  G R��� I   M R�,��+�, 0 rangeatindex_ rangeAtIndex_� ��*� m   M N�)�)  �*  �+  � l  G M��(�'� n  G M��� I   H M�&��%�&  0 objectatindex_ objectAtIndex_� ��$� o   H I�#�# 0 i  �$  �%  � o   G H�"�"  0 asocmatcharray asocMatchArray�(  �'  �.  �-  � o      �!�!  0 asocmatchrange asocMatchRange� ��� r   U \��� n  U Z��� I   V Z� ���  0 location  �  �  � o   U V��  0 asocmatchrange asocMatchRange� o      ��  0 asocmatchstart asocMatchStart� ��� r   ] o��� c   ] l��� l  ] j���� n  ] j��� I   ^ j���� *0 substringwithrange_ substringWithRange_� ��� K   ^ f�� ���� 0 location  � o   _ `�� &0 asocnonmatchstart asocNonMatchStart� ���� 
0 length  � \   a d��� o   a b��  0 asocmatchstart asocMatchStart� o   b c�� &0 asocnonmatchstart asocNonMatchStart�  �  �  � o   ] ^�� 0 
asocstring 
asocString�  �  � m   j k�
� 
ctxt� n      ���  ;   m n� o   l m�� 0 
resultlist 
resultList� ��� r   p y��� [   p w��� o   p q��  0 asocmatchstart asocMatchStart� l  q v���
� n  q v��� I   r v�	���	 
0 length  �  �  � o   q r��  0 asocmatchrange asocMatchRange�  �
  � o      �� &0 asocnonmatchstart asocNonMatchStart�  �0 0 i  � m   : ;��  � \   ; B��� l  ; @���� n  ; @��� I   < @�� ��� 	0 count  �   ��  � o   ; <����  0 asocmatcharray asocMatchArray�  �  � m   @ A���� �/  � ��� l   ������  � "  add final non-matched range   � ��� 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e� ��� r    �� � c    � l   ����� n   � I   � ������� *0 substringfromindex_ substringFromIndex_ �� o   � ����� &0 asocnonmatchstart asocNonMatchStart��  ��   o    ����� 0 
asocstring 
asocString��  ��   m   � ���
�� 
ctxt  n      	  ;   � �	 o   � ����� 0 
resultlist 
resultList� 
��
 L   � � o   � ����� 0 
resultlist 
resultList��  � Q K used by `split text` to split text using a regular expression as separator   � � �   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   a   r e g u l a r   e x p r e s s i o n   a s   s e p a r a t o rz  l     ��������  ��  ��    l     ��������  ��  ��    i  j m I      ������ 0 	_jointext 	_joinText  o      ���� 0 thelist theList �� o      ���� 0 separatortext separatorText��  ��   k     >  r      n     1    ��
�� 
txdl 1     ��
�� 
ascr o      ���� 0 oldtids oldTIDs  !  r    "#" o    ���� 0 delimiterlist delimiterList# n     $%$ 1    
��
�� 
txdl% 1    ��
�� 
ascr! &'& Q    5()*( r    +,+ c    -.- n   /0/ I    ��1���� "0 aslistparameter asListParameter1 2��2 o    ���� 0 thelist theList��  ��  0 o    ���� 0 _support  . m    ��
�� 
ctxt, o      ���� 0 
resulttext 
resultText) R      ����3
�� .ascrerr ****      � ****��  3 ��4��
�� 
errn4 d      55 m      �������  * k   % 566 787 r   % *9:9 o   % &���� 0 oldtids oldTIDs: n     ;<; 1   ' )��
�� 
txdl< 1   & '��
�� 
ascr8 =��= R   + 5��>?
�� .ascrerr ****      � ****> m   3 4@@ �AA b I n v a l i d   d i r e c t   p a r a m e t e r   ( e x p e c t e d   l i s t   o f   t e x t ) .? ��BC
�� 
errnB m   - .�����YC ��DE
�� 
erobD o   / 0���� 0 thelist theListE ��F��
�� 
errtF m   1 2��
�� 
list��  ��  ' GHG r   6 ;IJI o   6 7���� 0 oldtids oldTIDsJ n     KLK 1   8 :��
�� 
txdlL 1   7 8��
�� 
ascrH M��M L   < >NN o   < =���� 0 
resulttext 
resultText��   OPO l     ��������  ��  ��  P QRQ l     ��������  ��  ��  R STS l     ��UV��  U  -----   V �WW 
 - - - - -T XYX l     ��������  ��  ��  Y Z[Z i  n q\]\ I     ��^_
�� .Txt:SplTnull���     ctxt^ o      ���� 0 thetext theText_ ��`a
�� 
Sepa` |����b��c��  ��  b o      ���� 0 theseparator theSeparator��  c l     d����d m      ��
�� 
msng��  ��  a ��e��
�� 
Usine |����f��g��  ��  f o      ���� 0 matchformat matchFormat��  g l     h����h m      ��
�� SerECmpI��  ��  ��  ] k     �ii jkj l     ��lm��  lrl convenience handler for splitting text using TIDs that can also use a regular expression pattern as separator; note that this is similar to using `search text theText for theSeparator returning non matching text` (except that `search text` returns start and end indexes as well as text), but avoids some of the overhead and is an obvious complement to `join text`   m �nn�   c o n v e n i e n c e   h a n d l e r   f o r   s p l i t t i n g   t e x t   u s i n g   T I D s   t h a t   c a n   a l s o   u s e   a   r e g u l a r   e x p r e s s i o n   p a t t e r n   a s   s e p a r a t o r ;   n o t e   t h a t   t h i s   i s   s i m i l a r   t o   u s i n g   ` s e a r c h   t e x t   t h e T e x t   f o r   t h e S e p a r a t o r   r e t u r n i n g   n o n   m a t c h i n g   t e x t `   ( e x c e p t   t h a t   ` s e a r c h   t e x t `   r e t u r n s   s t a r t   a n d   e n d   i n d e x e s   a s   w e l l   a s   t e x t ) ,   b u t   a v o i d s   s o m e   o f   t h e   o v e r h e a d   a n d   i s   a n   o b v i o u s   c o m p l e m e n t   t o   ` j o i n   t e x t `k o��o Q     �pqrp k    }ss tut r    vwv n   xyx I    ��z���� "0 astextparameter asTextParameterz {|{ o    	���� 0 thetext theText| }��} m   	 
~~ �  ��  ��  y o    ���� 0 _support  w o      ���� 0 thetext theTextu ���� Z    }����� =   ��� o    ���� 0 theseparator theSeparator� m    ��
�� 
msng� l   ���� L    �� I    ������� 0 _splitpattern _splitPattern� ��� o    ���� 0 thetext theText� ���� m    �� ���  \ s +��  ��  � g a if `at` parameter is omitted, splits on whitespace runs by default, ignoring any `using` options   � ��� �   i f   ` a t `   p a r a m e t e r   i s   o m i t t e d ,   s p l i t s   o n   w h i t e s p a c e   r u n s   b y   d e f a u l t ,   i g n o r i n g   a n y   ` u s i n g `   o p t i o n s� ��� =  " %��� o   " #���� 0 matchformat matchFormat� m   # $��
�� SerECmpI� ��� P   ( 6���� L   - 5�� I   - 4������� 0 
_splittext 
_splitText� ��� o   . /���� 0 thetext theText� ���� o   / 0���� 0 theseparator theSeparator��  ��  � ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ���
�� conswhit� ����
�� consnume��  � ����
�� conscase��  � ��� =  9 <��� o   9 :���� 0 matchformat matchFormat� m   : ;��
�� SerECmpP� ��� L   ? G�� I   ? F������� 0 _splitpattern _splitPattern� ��� o   @ A���� 0 thetext theText� ���� o   A B���� 0 theseparator theSeparator��  ��  � ��� =  J M��� o   J K���� 0 matchformat matchFormat� m   K L�
� SerECmpC� ��� P   P ^���~� L   U ]�� I   U \�}��|�} 0 
_splittext 
_splitText� ��� o   V W�{�{ 0 thetext theText� ��z� o   W X�y�y 0 theseparator theSeparator�z  �|  � �x�
�x conscase� �w�
�w consdiac� �v�
�v conshyph� �u�
�u conspunc� �t�
�t conswhit� �s�r
�s consnume�r  �~  � ��� =  a d��� o   a b�q�q 0 matchformat matchFormat� m   b c�p
�p SerECmpD� ��o� L   g o�� I   g n�n��m�n 0 
_splittext 
_splitText� ��� o   h i�l�l 0 thetext theText� ��k� o   i j�j�j 0 theseparator theSeparator�k  �m  �o  � n  r }��� I   w }�i��h�i >0 throwinvalidparameterconstant throwInvalidParameterConstant� ��� o   w x�g�g 0 matchformat matchFormat� ��f� m   x y�� ��� 
 u s i n g�f  �h  � o   r w�e�e 0 _support  ��  q R      �d��
�d .ascrerr ****      � ****� o      �c�c 0 etext eText� �b��
�b 
errn� o      �a�a 0 enumber eNumber� �`��
�` 
erob� o      �_�_ 0 efrom eFrom� �^��]
�^ 
errt� o      �\�\ 
0 eto eTo�]  r I   � ��[��Z�[ 
0 _error  � ��� m   � ��� ���  s p l i t   t e x t� ��� o   � ��Y�Y 0 etext eText� ��� o   � ��X�X 0 enumber eNumber� ��� o   � ��W�W 0 efrom eFrom� ��V� o   � ��U�U 
0 eto eTo�V  �Z  ��  [ ��� l     �T�S�R�T  �S  �R  � ��� l     �Q�P�O�Q  �P  �O  � ��� i  r u��� I     �N��
�N .Txt:JoiTnull���     ****� o      �M�M 0 thelist theList� �L��K
�L 
Sepa� |�J�I��H��J  �I  � o      �G�G 0 separatortext separatorText�H  � m      �� ���  �K  � Q     '���� L    �� I    �F��E�F 0 	_jointext 	_joinText� ��� o    �D�D 0 thelist theList� ��C� n   ��� I   
 �B��A�B "0 astextparameter asTextParameter�    o   
 �@�@ 0 separatortext separatorText �? m     �  u s i n g   s e p a r a t o r�?  �A  � o    
�>�> 0 _support  �C  �E  � R      �=
�= .ascrerr ****      � **** o      �<�< 0 etext eText �;
�; 
errn o      �:�: 0 enumber eNumber �9	

�9 
erob	 o      �8�8 0 efrom eFrom
 �7�6
�7 
errt o      �5�5 
0 eto eTo�6  � I    '�4�3�4 
0 _error    m     �  j o i n   t e x t  o     �2�2 0 etext eText  o     !�1�1 0 enumber eNumber  o   ! "�0�0 0 efrom eFrom �/ o   " #�.�. 
0 eto eTo�/  �3  �  l     �-�,�+�-  �,  �+    l     �*�)�(�*  �)  �(    i  v y I     �' �&
�' .Txt:SplPnull���     ctxt  o      �%�% 0 thetext theText�&   Q     $!"#! L    $$ n    %&% 2   �$
�$ 
cpar& n   '(' I    �#)�"�# "0 astextparameter asTextParameter) *+* o    	�!�! 0 thetext theText+ ,� , m   	 
-- �..  �   �"  ( o    �� 0 _support  " R      �/0
� .ascrerr ****      � ****/ o      �� 0 etext eText0 �12
� 
errn1 o      �� 0 enumber eNumber2 �34
� 
erob3 o      �� 0 efrom eFrom4 �5�
� 
errt5 o      �� 
0 eto eTo�  # I    $�6�� 
0 _error  6 787 m    99 �::   s p l i t   p a r a g r a p h s8 ;<; o    �� 0 etext eText< =>= o    �� 0 enumber eNumber> ?@? o    �� 0 efrom eFrom@ A�A o     �� 
0 eto eTo�  �   BCB l     ����  �  �  C DED l     ��
�	�  �
  �	  E FGF i  z }HIH I     �JK
� .Txt:JoiPnull���     ****J o      �� 0 thelist theListK �L�
� 
LiBrL |��M�N�  �  M o      �� 0 linebreaktype lineBreakType�  N l     O� ��O m      ��
�� LiBrLiOX�   ��  �  I Q     OPQRP k    =SS TUT Z    4VWXYV =   Z[Z o    ���� 0 linebreaktype lineBreakType[ m    ��
�� LiBrLiOXW r   	 \]\ 1   	 
��
�� 
lnfd] o      ���� 0 separatortext separatorTextX ^_^ =   `a` o    ���� 0 linebreaktype lineBreakTypea m    ��
�� LiBrLiCM_ bcb r    ded o    ��
�� 
ret e o      ���� 0 separatortext separatorTextc fgf =   hih o    ���� 0 linebreaktype lineBreakTypei m    ��
�� LiBrLiWig j��j r   ! &klk b   ! $mnm o   ! "��
�� 
ret n 1   " #��
�� 
lnfdl o      ���� 0 separatortext separatorText��  Y n  ) 4opo I   . 4��q���� >0 throwinvalidparameterconstant throwInvalidParameterConstantq rsr o   . /���� 0 linebreaktype lineBreakTypes t��t m   / 0uu �vv 
 u s i n g��  ��  p o   ) .���� 0 _support  U w��w L   5 =xx I   5 <��y���� 0 	_jointext 	_joinTexty z{z o   6 7���� 0 thelist theList{ |��| o   7 8���� 0 separatortext separatorText��  ��  ��  Q R      ��}~
�� .ascrerr ****      � ****} o      ���� 0 etext eText~ ���
�� 
errn o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  R I   E O������� 
0 _error  � ��� m   F G�� ���  j o i n   p a r a g r a p h s� ��� o   G H���� 0 etext eText� ��� o   H I���� 0 enumber eNumber� ��� o   I J���� 0 efrom eFrom� ���� o   J K���� 
0 eto eTo��  ��  G ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   formatting   � ���    f o r m a t t i n g� ��� l     ��������  ��  ��  � ��� i  ~ ���� I      ������� (0 _makevalueiterator _makeValueIterator� ���� o      ���� 0 
objectlist 
objectList��  ��  � h     ����� 0 scpt  � k      �� ��� j     ����� 0 _objects  � c     ��� o     ���� 0 
objectlist 
objectList� m    ��
�� 
list� ��� j   	 ����� 0 i  � m   	 
����  � ���� i    ��� I     ������
�� .aevtoappnull  �   � ****��  ��  � k     7�� ��� r     ��� [     ��� o     ���� 0 i  � m    ���� � o      ���� 0 i  � ��� l   (���� Z   (������� ?    ��� o    ���� 0 i  � n    ��� 1    ��
�� 
leng� o    ���� 0 _objects  � R    $�����
�� .ascrerr ****      � ****��  � �����
�� 
errn� m     !�������  ��  ��  �   stop iteration   � ���    s t o p   i t e r a t i o n� ���� L   ) 7�� n   ) 6��� 4   . 5���
�� 
cobj� o   / 4���� 0 i  � o   ) .���� 0 _objects  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ��������  ��  ��  � ��� i  � ���� I     �����
�� .Txt:FLitnull��� ��� null��  � �����
�� 
For_� o      ���� 0 thevalue theValue��  � k    _�� ��� l      ������  ��� Notes:
	 
	 - Most value types can be rendered using vanilla code; only specifiers and records have to be rendered via OSA APIs; values should be rendered in human-readable form (text isn't quoted, lists are concatentated as comma-separated items, dates and numbers using default AS coercions, etc) - user can use `literal representation`, `format number/date`, etc. to format values differently (avoids need for complex template parsing).
	 
	- Rendering arbitrary AS values requires wrapping the value in a script object (to preserve context info such as an object specifier's target application), converting that script to a typeScript descriptor (e.g. by packing it into an Apple event and sending it to a previously installed AE handler), then loading that script into an AS component instance, executing it, and returning the result's display value. Currently this is done via TextSupport.app agent. The whole thing's ridiculously kludgy, currently isn't smart enough to load up appropriate terminology before rendering app specifiers, and really requires AppleScript to implement a proper `literal text` property on all its datatypes. But at least it should help demonstrate the need for such a feature.
	   � ���	z   N o t e s : 
 	   
 	   -   M o s t   v a l u e   t y p e s   c a n   b e   r e n d e r e d   u s i n g   v a n i l l a   c o d e ;   o n l y   s p e c i f i e r s   a n d   r e c o r d s   h a v e   t o   b e   r e n d e r e d   v i a   O S A   A P I s ;   v a l u e s   s h o u l d   b e   r e n d e r e d   i n   h u m a n - r e a d a b l e   f o r m   ( t e x t   i s n ' t   q u o t e d ,   l i s t s   a r e   c o n c a t e n t a t e d   a s   c o m m a - s e p a r a t e d   i t e m s ,   d a t e s   a n d   n u m b e r s   u s i n g   d e f a u l t   A S   c o e r c i o n s ,   e t c )   -   u s e r   c a n   u s e   ` l i t e r a l   r e p r e s e n t a t i o n ` ,   ` f o r m a t   n u m b e r / d a t e ` ,   e t c .   t o   f o r m a t   v a l u e s   d i f f e r e n t l y   ( a v o i d s   n e e d   f o r   c o m p l e x   t e m p l a t e   p a r s i n g ) . 
 	   
 	 -   R e n d e r i n g   a r b i t r a r y   A S   v a l u e s   r e q u i r e s   w r a p p i n g   t h e   v a l u e   i n   a   s c r i p t   o b j e c t   ( t o   p r e s e r v e   c o n t e x t   i n f o   s u c h   a s   a n   o b j e c t   s p e c i f i e r ' s   t a r g e t   a p p l i c a t i o n ) ,   c o n v e r t i n g   t h a t   s c r i p t   t o   a   t y p e S c r i p t   d e s c r i p t o r   ( e . g .   b y   p a c k i n g   i t   i n t o   a n   A p p l e   e v e n t   a n d   s e n d i n g   i t   t o   a   p r e v i o u s l y   i n s t a l l e d   A E   h a n d l e r ) ,   t h e n   l o a d i n g   t h a t   s c r i p t   i n t o   a n   A S   c o m p o n e n t   i n s t a n c e ,   e x e c u t i n g   i t ,   a n d   r e t u r n i n g   t h e   r e s u l t ' s   d i s p l a y   v a l u e .   C u r r e n t l y   t h i s   i s   d o n e   v i a   T e x t S u p p o r t . a p p   a g e n t .   T h e   w h o l e   t h i n g ' s   r i d i c u l o u s l y   k l u d g y ,   c u r r e n t l y   i s n ' t   s m a r t   e n o u g h   t o   l o a d   u p   a p p r o p r i a t e   t e r m i n o l o g y   b e f o r e   r e n d e r i n g   a p p   s p e c i f i e r s ,   a n d   r e a l l y   r e q u i r e s   A p p l e S c r i p t   t o   i m p l e m e n t   a   p r o p e r   ` l i t e r a l   t e x t `   p r o p e r t y   o n   a l l   i t s   d a t a t y p e s .   B u t   a t   l e a s t   i t   s h o u l d   h e l p   d e m o n s t r a t e   t h e   n e e d   f o r   s u c h   a   f e a t u r e . 
 	� ���� P    _���� Q   ^���� k   H�� ��� l   ������  � � z caution: AS types that can have overridden `class` properties (specifiers, records, etc) must be handled as special cases   � ��� �   c a u t i o n :   A S   t y p e s   t h a t   c a n   h a v e   o v e r r i d d e n   ` c l a s s `   p r o p e r t i e s   ( s p e c i f i e r s ,   r e c o r d s ,   e t c )   m u s t   b e   h a n d l e d   a s   s p e c i a l   c a s e s� ��� Z   �������� F    3��� F    #��� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    	���� 0 thevalue theValue��  � �� ��
�� 
kocl  m    ��
�� 
obj ��  ��  ��  � m    ����  � =    ! l   ���� I   ��
�� .corecnte****       **** J     �� o    ���� 0 thevalue theValue��   ����
�� 
kocl m    ��
�� 
capp��  ��  ��   m     ����  � =   & 1	
	 l  & /���� I  & /��
�� .corecnte****       **** J   & ) �� o   & '���� 0 thevalue theValue��   ��~
� 
kocl m   * +�}
�} 
reco�~  ��  ��  
 m   / 0�|�|  � Z   6� >   6 A l  6 ?�{�z I  6 ?�y
�y .corecnte****       **** J   6 9 �x o   6 7�w�w 0 thevalue theValue�x   �v�u
�v 
kocl m   : ;�t
�t 
scpt�u  �{  �z   m   ? @�s�s   l  D Y Q   D Y !"  L   G O## b   G N$%$ b   G L&'& m   G H(( �))  � s c r i p t  ' l  H K*�r�q* n  H K+,+ 1   I K�p
�p 
pnam, o   H I�o�o 0 thevalue theValue�r  �q  % m   L M-- �..  �! R      �n�m�l
�n .ascrerr ****      � ****�m  �l  " L   W Y// m   W X00 �11  � s c r i p t �GA script objects are currently displayed as "�script[NAME]�" (displaying script objects as source code is a separate task and should be done via OSAKit/osadecompile); TO DO: support informal 'description' protocol, speculatively calling `theValue's objectDescription()` and returning result if it's a non-empty text value?    �22�   s c r i p t   o b j e c t s   a r e   c u r r e n t l y   d i s p l a y e d   a s   " � s c r i p t [ N A M E ] � "   ( d i s p l a y i n g   s c r i p t   o b j e c t s   a s   s o u r c e   c o d e   i s   a   s e p a r a t e   t a s k   a n d   s h o u l d   b e   d o n e   v i a   O S A K i t / o s a d e c o m p i l e ) ;   T O   D O :   s u p p o r t   i n f o r m a l   ' d e s c r i p t i o n '   p r o t o c o l ,   s p e c u l a t i v e l y   c a l l i n g   ` t h e V a l u e ' s   o b j e c t D e s c r i p t i o n ( ) `   a n d   r e t u r n i n g   r e s u l t   i f   i t ' s   a   n o n - e m p t y   t e x t   v a l u e ? 343 =  \ c565 n  \ _787 m   ] _�k
�k 
pcls8 o   \ ]�j�j 0 thevalue theValue6 m   _ b�i
�i 
ctxt4 9:9 k   f �;; <=< r   f o>?> n  f m@A@ 1   i m�h
�h 
txdlA 1   f i�g
�g 
ascr? o      �f�f 0 oldtids oldTIDs= BCB r   p {DED m   p sFF �GG  \E n     HIH 1   v z�e
�e 
txdlI 1   s v�d
�d 
ascrC JKJ r   | �LML n   | �NON 2  } ��c
�c 
citmO o   | }�b�b 0 thevalue theValueM o      �a�a 0 	textitems 	textItemsK PQP r   � �RSR m   � �TT �UU  \ \S n     VWV 1   � ��`
�` 
txdlW 1   � ��_
�_ 
ascrQ XYX r   � �Z[Z c   � �\]\ o   � ��^�^ 0 	textitems 	textItems] m   � ��]
�] 
ctxt[ o      �\�\ 0 thevalue theValueY ^_^ r   � �`a` m   � �bb �cc  "a n     ded 1   � ��[
�[ 
txdle 1   � ��Z
�Z 
ascr_ fgf r   � �hih n   � �jkj 2  � ��Y
�Y 
citmk o   � ��X�X 0 thevalue theValuei o      �W�W 0 	textitems 	textItemsg lml r   � �non m   � �pp �qq  \ "o n     rsr 1   � ��V
�V 
txdls 1   � ��U
�U 
ascrm tut r   � �vwv c   � �xyx o   � ��T�T 0 	textitems 	textItemsy m   � ��S
�S 
ctxtw o      �R�R 0 thevalue theValueu z{z r   � �|}| o   � ��Q�Q 0 oldtids oldTIDs} n     ~~ 1   � ��P
�P 
txdl 1   � ��O
�O 
ascr{ ��N� L   � ��� b   � ���� b   � ���� m   � ��� ���  "� o   � ��M�M 0 thevalue theValue� m   � ��� ���  "�N  : ��� =  � ���� n  � ���� m   � ��L
�L 
pcls� o   � ��K�K 0 thevalue theValue� m   � ��J
�J 
optr� ��I� l  �v���� k   �v�� ��� l  � ��H���H  � f ` TO DO: this is kludgy; ought to be possible to load AEDesc into an OSAValueID then display that   � ��� �   T O   D O :   t h i s   i s   k l u d g y ;   o u g h t   t o   b e   p o s s i b l e   t o   l o a d   A E D e s c   i n t o   a n   O S A V a l u e I D   t h e n   d i s p l a y   t h a t� ��� Q   �k���� k   �^�� ��� r   � ���� n  � ���� I   � ��G��F�G  0 objectatindex_ objectAtIndex_� ��E� m   � ��D�D  �E  �F  � l  � ���C�B� n  � ���� I   � ��A��@�A $0 arraywithobject_ arrayWithObject_� ��?� o   � ��>�> 0 thevalue theValue�?  �@  � n  � ���� o   � ��=�= 0 nsarray NSArray� m   � ��<
�< misccura�C  �B  � o      �;�;  0 asocdescriptor asocDescriptor� ��� r   ���� c   ���� l  ���:�9� n  ���� I   ��8��7�8 ,0 asnormalizednsstring asNormalizedNSString� ��6� n  �
��� I  
�5�4�3�5 "0 uppercasestring uppercaseString�4  �3  � l  ���2�1� n  ���� I  �0�/�.�0 0 description  �/  �.  � n  ���� I   ��-�,�+�- 0 data  �,  �+  � o   � ��*�*  0 asocdescriptor asocDescriptor�2  �1  �6  �7  � o   � ��)�) 0 _support  �:  �9  � m  �(
�( 
ctxt� o      �'�' 0 hextext hexText� ��� r  ��� n ��� 1  �&
�& 
txdl� 1  �%
�% 
ascr� o      �$�$ 0 oldtids oldTIDs� ��� r  *��� 1  "�#
�# 
spac� n     ��� 1  %)�"
�" 
txdl� 1  "%�!
�! 
ascr� ��� r  +2��� n  +0��� 2 ,0� 
�  
citm� o  +,�� 0 hextext hexText� o      �� 0 	textitems 	textItems� ��� r  3>��� m  36�� ���  � n     ��� 1  9=�
� 
txdl� 1  69�
� 
ascr� ��� r  ?T��� n ?R��� 7 DR���
� 
ctxt� m  JL�� � m  MQ����� l ?D���� c  ?D��� o  ?@�� 0 	textitems 	textItems� m  @C�
� 
ctxt�  �  � o      �� 0 hextext hexText� ��� r  U^��� o  UV�� 0 oldtids oldTIDs� n     ��� 1  Y]�
� 
txdl� 1  VY�
� 
ascr�  � R      ���
� .ascrerr ****      � ****�  �  � r  fk��� m  fi�� ���  &� o      �� 0 hextext hexText� ��� L  lv�� b  lu��� b  lq��� m  lo�� ���  � d a t a   o p t r� o  op�
�
 0 hextext hexText� m  qt�� ���  ��  �   format "�data optr...�"   � ��� 0   f o r m a t   " � d a t a   o p t r . . . � "�I   Q  y����� L  |��� c  |���� o  |}�	�	 0 thevalue theValue� m  }��
� 
ctxt� R      �� 
� .ascrerr ****      � ****�    ��
� 
errn d       m      ����  � l ����     fall through    �    f a l l   t h r o u g h��  ��  �  l ���	�   � � if it's an ASOC object specifier, use object's description if available otherwise create raw syntax representation of ocid specifier   	 �


   i f   i t ' s   a n   A S O C   o b j e c t   s p e c i f i e r ,   u s e   o b j e c t ' s   d e s c r i p t i o n   i f   a v a i l a b l e   o t h e r w i s e   c r e a t e   r a w   s y n t a x   r e p r e s e n t a t i o n   o f   o c i d   s p e c i f i e r  Z  �� �� F  �� >  �� l ������ I ����
�� .corecnte****       **** J  �� �� o  ������ 0 thevalue theValue��   ����
�� 
kocl m  ����
�� 
obj ��  ��  ��   m  ������   = �� n �� m  ����
�� 
want l ������ c  �� o  ������ 0 thevalue theValue m  ����
�� 
reco��  ��   m  ����
�� 
ocid l � !"  Q  �#$%# k  ��&& '(' r  ��)*) l ��+����+ c  ��,-, n ��./. I  ���������� 0 description  ��  ��  / o  ������ 0 thevalue theValue- m  ����
�� 
ctxt��  ��  * o      ���� "0 descriptiontext descriptionText( 010 Z ��23����2 F  ��454 C  ��676 o  ������ "0 descriptiontext descriptionText7 m  ��88 �99  <5 D  ��:;: o  ������ "0 descriptiontext descriptionText; m  ��<< �==  >3 r  ��>?> n  ��@A@ 7 ����BC
�� 
ctxtB m  ������ C m  ��������A o  ������ "0 descriptiontext descriptionText? o      ���� "0 descriptiontext descriptionText��  ��  1 D��D L  ��EE b  ��FGF b  ��HIH m  ��JJ �KK  �I o  ������ "0 descriptiontext descriptionTextG m  ��LL �MM  ���  $ R      ������
�� .ascrerr ****      � ****��  ��  % l �NOPN l �QRSQ L  �TT b  �
UVU m  ��WW �XX   � c l a s s   o c i d �   i d  V l �	Y����Y I �	����Z
�� .Txt:FLitnull��� ��� null��  Z ��[��
�� 
For_[ l �\����\ n �]^] m  ��
�� 
seld^ l �_����_ c  �`a` o  ������ 0 thevalue theValuea m  � ��
�� 
reco��  ��  ��  ��  ��  ��  ��  R � � would be better to get correct representation generated by OSAKit, but AS doesn't allow ASOC specifiers to travel so string-munging it is   S �bb   w o u l d   b e   b e t t e r   t o   g e t   c o r r e c t   r e p r e s e n t a t i o n   g e n e r a t e d   b y   O S A K i t ,   b u t   A S   d o e s n ' t   a l l o w   A S O C   s p e c i f i e r s   t o   t r a v e l   s o   s t r i n g - m u n g i n g   i t   i sO V P otherwise use raw ASOC object specifier syntax (not ideal, but will have to do)   P �cc �   o t h e r w i s e   u s e   r a w   A S O C   o b j e c t   s p e c i f i e r   s y n t a x   ( n o t   i d e a l ,   b u t   w i l l   h a v e   t o   d o )! � �  (see Objects library's `check type` handler for notes)		-- TO DO: need to check this hack (it's also used in Objects) as it's possible it will error on some reference objects (e.g. app specifiers)   " �dd�     ( s e e   O b j e c t s   l i b r a r y ' s   ` c h e c k   t y p e `   h a n d l e r   f o r   n o t e s ) 	 	 - -   T O   D O :   n e e d   t o   c h e c k   t h i s   h a c k   ( i t ' s   a l s o   u s e d   i n   O b j e c t s )   a s   i t ' s   p o s s i b l e   i t   w i l l   e r r o r   o n   s o m e   r e f e r e n c e   o b j e c t s   ( e . g .   a p p   s p e c i f i e r s )�   ��   efe l ��gh��  ghb TO DO: there's a problem here if value is a record containing ASOC specifiers, as there's no practical way to examine the record's properties without sending it to an AE handler, and AS will throw an error; suspect the only practical option is to throw another error that describes the problem, or return "�record�" to indicate object is unrepresentable   h �ii�   T O   D O :   t h e r e ' s   a   p r o b l e m   h e r e   i f   v a l u e   i s   a   r e c o r d   c o n t a i n i n g   A S O C   s p e c i f i e r s ,   a s   t h e r e ' s   n o   p r a c t i c a l   w a y   t o   e x a m i n e   t h e   r e c o r d ' s   p r o p e r t i e s   w i t h o u t   s e n d i n g   i t   t o   a n   A E   h a n d l e r ,   a n d   A S   w i l l   t h r o w   a n   e r r o r ;   s u s p e c t   t h e   o n l y   p r a c t i c a l   o p t i o n   i s   t o   t h r o w   a n o t h e r   e r r o r   t h a t   d e s c r i b e s   t h e   p r o b l e m ,   o r   r e t u r n   " � r e c o r d � "   t o   i n d i c a t e   o b j e c t   i s   u n r e p r e s e n t a b l ef j��j Q  Hklmk k  <nn opo r  qrq I  ��s���� (0 _makevalueiterator _makeValueIterators t��t J  uu v��v o  ���� 0 thevalue theValue��  ��  ��  r o      ���� 0 scpt  p w��w O  <xyx I ,;����z
�� .Txt:LitR****      � ****��  z ��{|
�� 
Scpt{ o  01���� 0 scpt  | ��}��
�� 
Deco} l 45~����~ m  45��
�� boovfals��  ��  ��  y 5  )����
�� 
capp o   %���� 60 _textsupportagentbundleid _TextSupportAgentBundleID
�� kfrmID  ��  l R      ������
�� .ascrerr ****      � ****��  ��  m L  DH�� m  DG�� ��� 0 � u n r e p r e s e n t a b l e   o b j e c t ���  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � l P^���� I  P^������� 
0 _error  � ��� m  QT�� ��� , l i t e r a l   r e p r e s e n t a t i o n� ��� o  TU���� 0 etext eText� ��� o  UV���� 0 enumber eNumber� ��� o  VW���� 0 efrom eFrom� ���� o  WX���� 
0 eto eTo��  ��  � 8 2 note: this handler should never fail, caveat bugs   � ��� d   n o t e :   t h i s   h a n d l e r   s h o u l d   n e v e r   f a i l ,   c a v e a t   b u g s� ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  � ����
�� consnume��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     ����
�� .Txt:FTxtnull���     ctxt� o      ���� 0 templatetext templateText� �����
�� 
Usin� o      ���� 0 	thevalues 	theValues��  � k    3�� ��� l     ������  � � � note: templateText uses same `$n` (where n=1-9) notation as `search text`'s replacement templates, with `\$` to escape as necessary ($ not followed by a digit will appear as-is)   � ���d   n o t e :   t e m p l a t e T e x t   u s e s   s a m e   ` $ n `   ( w h e r e   n = 1 - 9 )   n o t a t i o n   a s   ` s e a r c h   t e x t ` ' s   r e p l a c e m e n t   t e m p l a t e s ,   w i t h   ` \ $ `   t o   e s c a p e   a s   n e c e s s a r y   ( $   n o t   f o l l o w e d   b y   a   d i g i t   w i l l   a p p e a r   a s - i s )� ���� Q    3���� k   �� ��� r    ��� n   ��� I    ������� "0 aslistparameter asListParameter� ���� o    	���� 0 	thevalues 	theValues��  ��  � o    ���� 0 _support  � o      ���� 0 	thevalues 	theValues� ��� r    ��� n   ��� I    ������� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_� ��� m    �� ���  \ \ . | \ $ [ 1 - 9 ]� ��� m    ����  � ���� l   ������ m    ��
�� 
msng��  ��  ��  ��  � n   ��� o    ���� *0 nsregularexpression NSRegularExpression� m    ��
�� misccura� o      ���� 0 asocpattern asocPattern� ��� r    )��� n   '��� I   " '���~� 0 
asnsstring 
asNSString� ��}� o   " #�|�| 0 templatetext templateText�}  �~  � o    "�{�{ 0 _support  � o      �z�z 0 
asocstring 
asocString� ��� r   * ;��� l  * 9��y�x� n  * 9��� I   + 9�w��v�w @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   + ,�u�u 0 
asocstring 
asocString� ��� m   , -�t�t  � ��s� J   - 5�� ��� m   - .�r�r  � ��q� n  . 3��� I   / 3�p�o�n�p 
0 length  �o  �n  � o   . /�m�m 0 
asocstring 
asocString�q  �s  �v  � o   * +�l�l 0 asocpattern asocPattern�y  �x  � o      �k�k  0 asocmatcharray asocMatchArray� ��� r   < @��� J   < >�j�j  � o      �i�i 0 resulttexts resultTexts� ��� r   A D��� m   A B�h�h  � o      �g�g 0 
startindex 
startIndex� ��f� P   E���� k   J�� ��� Y   J ���e���d� k   Z ��� ��� r   Z g��� l  Z e��c�b� n  Z e   I   ` e�a�`�a 0 rangeatindex_ rangeAtIndex_ �_ m   ` a�^�^  �_  �`   l  Z `�]�\ n  Z ` I   [ `�[�Z�[  0 objectatindex_ objectAtIndex_ �Y o   [ \�X�X 0 i  �Y  �Z   o   Z [�W�W  0 asocmatcharray asocMatchArray�]  �\  �c  �b  � o      �V�V 0 
matchrange 
matchRange� 	
	 r   h � c   h } l  h y�U�T n  h y I   i y�S�R�S *0 substringwithrange_ substringWithRange_ �Q K   i u �P�P 0 location   o   j k�O�O 0 
startindex 
startIndex �N�M�N 
0 length   l  l s�L�K \   l s l  l q�J�I n  l q I   m q�H�G�F�H 0 location  �G  �F   o   l m�E�E 0 
matchrange 
matchRange�J  �I   o   q r�D�D 0 
startindex 
startIndex�L  �K  �M  �Q  �R   o   h i�C�C 0 
asocstring 
asocString�U  �T   m   y |�B
�B 
ctxt n        ;   ~  o   } ~�A�A 0 resulttexts resultTexts
  !  r   � �"#" c   � �$%$ l  � �&�@�?& n  � �'(' I   � ��>)�=�> *0 substringwithrange_ substringWithRange_) *�<* o   � ��;�; 0 
matchrange 
matchRange�<  �=  ( o   � ��:�: 0 
asocstring 
asocString�@  �?  % m   � ��9
�9 
ctxt# o      �8�8 0 thetoken theToken! +,+ Z   � �-.�7/- =  � �010 o   � ��6�6 0 thetoken theToken1 m   � �22 �33  \ \. l  � �4564 r   � �787 o   � ��5�5 0 thetoken theToken8 n      9:9  ;   � �: o   � ��4�4 0 resulttexts resultTexts5 ( " found backslash-escaped character   6 �;; D   f o u n d   b a c k s l a s h - e s c a p e d   c h a r a c t e r�7  / l  � �<=>< k   � �?? @A@ l  � �BCDB r   � �EFE n   � �GHG 4   � ��3I
�3 
cobjI l  � �J�2�1J c   � �KLK n  � �MNM 4  � ��0O
�0 
cha O m   � ��/�/��N o   � ��.�. 0 thetoken theTokenL m   � ��-
�- 
long�2  �1  H o   � ��,�, 0 	thevalues 	theValuesF o      �+�+ 0 theitem theItemC 2 , this will raise error -1728 if out of range   D �PP X   t h i s   w i l l   r a i s e   e r r o r   - 1 7 2 8   i f   o u t   o f   r a n g eA Q�*Q Q   � �RSTR r   � �UVU c   � �WXW o   � ��)�) 0 theitem theItemX m   � ��(
�( 
ctxtV n      YZY  ;   � �Z o   � ��'�' 0 resulttexts resultTextsS R      �&�%[
�& .ascrerr ****      � ****�%  [ �$\�#
�$ 
errn\ d      ]] m      �"�"��#  T l  � �^_`^ r   � �aba I  � ��!� c
�! .Txt:FLitnull��� ��� null�   c �d�
� 
For_d o   � ��� 0 theitem theItem�  b n      efe  ;   � �f o   � ��� 0 resulttexts resultTexts_ � � TO DO: or just throw 'unsupported object type' error, requiring user to get value's literal representation before passing it to `format text`   ` �gg   T O   D O :   o r   j u s t   t h r o w   ' u n s u p p o r t e d   o b j e c t   t y p e '   e r r o r ,   r e q u i r i n g   u s e r   t o   g e t   v a l u e ' s   l i t e r a l   r e p r e s e n t a t i o n   b e f o r e   p a s s i n g   i t   t o   ` f o r m a t   t e x t `�*  =  	 found $n   > �hh    f o u n d   $ n, i�i r   � �jkj [   � �lml l  � �n��n n  � �opo I   � ����� 0 location  �  �  p o   � ��� 0 
matchrange 
matchRange�  �  m l  � �q��q n  � �rsr I   � ����� 
0 length  �  �  s o   � ��� 0 
matchrange 
matchRange�  �  k o      �� 0 
startindex 
startIndex�  �e 0 i  � m   M N��  � l  N Ut��t \   N Uuvu l  N Sw�
�	w n  N Sxyx I   O S���� 	0 count  �  �  y o   N O��  0 asocmatcharray asocMatchArray�
  �	  v m   S T�� �  �  �d  � z{z r   � �|}| c   � �~~ l  � ����� n  � ���� I   � ���� � *0 substringfromindex_ substringFromIndex_� ���� o   � ����� 0 
startindex 
startIndex��  �   � o   � ����� 0 
asocstring 
asocString�  �   m   � ���
�� 
ctxt} n      ���  ;   � �� o   � ����� 0 resulttexts resultTexts{ ��� r   � ���� n  � ���� 1   � ���
�� 
txdl� 1   � ���
�� 
ascr� o      ���� 0 oldtids oldTIDs� ��� r   ���� m   � ��� ���  � n     ��� 1   ��
�� 
txdl� 1   � ��
�� 
ascr� ��� r  ��� c  ��� o  ���� 0 resulttexts resultTexts� m  
��
�� 
ctxt� o      ���� 0 
resulttext 
resultText� ��� r  ��� o  ���� 0 oldtids oldTIDs� n     ��� 1  ��
�� 
txdl� 1  ��
�� 
ascr� ���� L  �� o  ���� 0 
resulttext 
resultText��  � ���
�� conscase� ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  � ����
�� consnume��  �f  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I  #3������� 
0 _error  � ��� m  $'�� ���  f o r m a t   t e x t� ��� o  '(���� 0 etext eText� ��� o  ()���� 0 enumber eNumber� ��� o  )*���� 0 efrom eFrom� ���� o  *-���� 
0 eto eTo��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  ��� locale support -- TO DO: what other functionality should be exposed to user? if there's much more, consider moving to its own Localization library; bear in mind that NSLocale instances and other Cocoa objects generally shouldn't be returned to user as ASOC objects cause problems for autosave, script persistence, etc; instead, use localeIdentifier strings and convert to/from NSLocale at point of use   � ���$   l o c a l e   s u p p o r t   - -   T O   D O :   w h a t   o t h e r   f u n c t i o n a l i t y   s h o u l d   b e   e x p o s e d   t o   u s e r ?   i f   t h e r e ' s   m u c h   m o r e ,   c o n s i d e r   m o v i n g   t o   i t s   o w n   L o c a l i z a t i o n   l i b r a r y ;   b e a r   i n   m i n d   t h a t   N S L o c a l e   i n s t a n c e s   a n d   o t h e r   C o c o a   o b j e c t s   g e n e r a l l y   s h o u l d n ' t   b e   r e t u r n e d   t o   u s e r   a s   A S O C   o b j e c t s   c a u s e   p r o b l e m s   f o r   a u t o s a v e ,   s c r i p t   p e r s i s t e n c e ,   e t c ;   i n s t e a d ,   u s e   l o c a l e I d e n t i f i e r   s t r i n g s   a n d   c o n v e r t   t o / f r o m   N S L o c a l e   a t   p o i n t   o f   u s e� ��� l     ��������  ��  ��  � ��� i  � ���� I     ������
�� .Txt:LLocnull��� ��� null��  ��  � l    ���� L     �� c     ��� l    ������ n    ��� I    ������� 60 sortedarrayusingselector_ sortedArrayUsingSelector_� ���� m    �� ���  c o m p a r e :��  ��  � n    ��� I    �������� 80 availablelocaleidentifiers availableLocaleIdentifiers��  ��  � n    ��� o    ���� 0 nslocale NSLocale� m     ��
�� misccura��  ��  � m    ��
�� 
list� , &> {"af", "af_NA", "af_ZA", "agq", ...}   � ��� L >   { " a f " ,   " a f _ N A " ,   " a f _ Z A " ,   " a g q " ,   . . . }� ��� l     ��������  ��  ��  � ��� i  � ���� I     ������
�� .Txt:CLocnull��� ��� null��  ��  � L     �� c     ��� l    ������ n    ��� I    �������� $0 localeidentifier localeIdentifier��  ��  � n    ��� I    �������� 0 currentlocale currentLocale��  ��  � n    ��� o    ���� 0 nslocale NSLocale� m     ��
�� misccura��  ��  � m    ��
�� 
ctxt� ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       %���� ��������������� 	
��  � #����������������������������������������������~�}�|�{
�� 
pimr�� 60 _textsupportagentbundleid _TextSupportAgentBundleID�� (0 _unmatchedtexttype _UnmatchedTextType�� $0 _matchedtexttype _MatchedTextType�� &0 _matchedgrouptype _MatchedGroupType�� 0 _support  �� 
0 _error  �� $0 _matchinforecord _matchInfoRecord�� 0 _matchrecords _matchRecords�� &0 _matchedgrouplist _matchedGroupList�� 0 _findpattern _findPattern�� "0 _replacepattern _replacePattern�� 0 	_findtext 	_findText�� 0 _replacetext _replaceText
� .Txt:Srchnull���     ctxt
� .Txt:EPatnull���     ctxt
� .Txt:ETemnull���     ctxt
� .Txt:UppTnull���     ctxt
� .Txt:CapTnull���     ctxt
� .Txt:LowTnull���     ctxt
� .Txt:PadTnull���     ctxt
� .Txt:SliTnull���     ctxt
� .Txt:TrmTnull���     ctxt� 0 
_splittext 
_splitText� 0 _splitpattern _splitPattern� 0 	_jointext 	_joinText
� .Txt:SplTnull���     ctxt
� .Txt:JoiTnull���     ****
� .Txt:SplPnull���     ctxt
� .Txt:JoiPnull���     ****� (0 _makevalueiterator _makeValueIterator
�~ .Txt:FLitnull��� ��� null
�} .Txt:FTxtnull���     ctxt
�| .Txt:LLocnull��� ��� null
�{ .Txt:CLocnull��� ��� null� �z�z    �y�x
�y 
cobj    �w 
�w 
frmk�x  
�� 
TxtU
�� 
TxtM
�� 
TxtG�    �v L
�v 
scpt� �u V�t�s�r�u 
0 _error  �t �q�q   �p�o�n�m�l�p 0 handlername handlerName�o 0 etext eText�n 0 enumber eNumber�m 0 efrom eFrom�l 
0 eto eTo�s   �k�j�i�h�g�k 0 handlername handlerName�j 0 etext eText�i 0 enumber eNumber�h 0 efrom eFrom�g 
0 eto eTo  f�f�e�f �e &0 throwcommanderror throwCommandError�r b  ࠡ����+ � �d ��c�b�a�d $0 _matchinforecord _matchInfoRecord�c �`�`   �_�^�]�\�_ 0 
asocstring 
asocString�^  0 asocmatchrange asocMatchRange�] 0 
textoffset 
textOffset�\ 0 
recordtype 
recordType�b   �[�Z�Y�X�W�V�[ 0 
asocstring 
asocString�Z  0 asocmatchrange asocMatchRange�Y 0 
textoffset 
textOffset�X 0 
recordtype 
recordType�W 0 	foundtext 	foundText�V  0 nexttextoffset nextTextOffset �U�T�S�R�Q�P�O�N�U *0 substringwithrange_ substringWithRange_
�T 
ctxt
�S 
leng
�R 
pcls�Q 0 
startindex 
startIndex�P 0 endindex endIndex�O 0 	foundtext 	foundText�N �a $��k+  �&E�O���,E�O���k���lv� �M ��L�K !�J�M 0 _matchrecords _matchRecords�L �I"�I "  �H�G�F�E�D�C�H 0 
asocstring 
asocString�G  0 asocmatchrange asocMatchRange�F  0 asocstartindex asocStartIndex�E 0 
textoffset 
textOffset�D (0 nonmatchrecordtype nonMatchRecordType�C "0 matchrecordtype matchRecordType�K    �B�A�@�?�>�=�<�;�:�9�8�B 0 
asocstring 
asocString�A  0 asocmatchrange asocMatchRange�@  0 asocstartindex asocStartIndex�? 0 
textoffset 
textOffset�> (0 nonmatchrecordtype nonMatchRecordType�= "0 matchrecordtype matchRecordType�<  0 asocmatchstart asocMatchStart�; 0 asocmatchend asocMatchEnd�: &0 asocnonmatchrange asocNonMatchRange�9 0 nonmatchinfo nonMatchInfo�8 0 	matchinfo 	matchInfo! �7�6�5�4�3�7 0 location  �6 
0 length  �5 �4 $0 _matchinforecord _matchInfoRecord
�3 
cobj�J W�j+  E�O��j+ E�O�ᦢ�E�O*�����+ E[�k/E�Z[�l/E�ZO*�����+ E[�k/E�Z[�l/E�ZO�����v� �2(�1�0#$�/�2 &0 _matchedgrouplist _matchedGroupList�1 �.%�. %  �-�,�+�*�- 0 
asocstring 
asocString�, 0 	asocmatch 	asocMatch�+ 0 
textoffset 
textOffset�* &0 includenonmatches includeNonMatches�0  # �)�(�'�&�%�$�#�"�!� ����) 0 
asocstring 
asocString�( 0 	asocmatch 	asocMatch�' 0 
textoffset 
textOffset�& &0 includenonmatches includeNonMatches�% "0 submatchresults subMatchResults�$ 0 groupindexes groupIndexes�# (0 asocfullmatchrange asocFullMatchRange�" &0 asocnonmatchstart asocNonMatchStart�! $0 asocfullmatchend asocFullMatchEnd�  0 i  � 0 nonmatchinfo nonMatchInfo� 0 	matchinfo 	matchInfo� &0 asocnonmatchrange asocNonMatchRange$ 	����������  0 numberofranges numberOfRanges� 0 rangeatindex_ rangeAtIndex_� 0 location  � 
0 length  � � 0 _matchrecords _matchRecords
� 
cobj� � $0 _matchinforecord _matchInfoRecord�/ �jvE�O�j+  kE�O�j ��jk+ E�O�j+ E�O��j+ E�O Uk�kh 	*���k+ ��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO��6F[OY��O� #�㨧�E�O*���b  �+ �k/�6FY hY hO�� ����&'�� 0 _findpattern _findPattern� �(� (  ����� 0 thetext theText� 0 patterntext patternText� &0 includenonmatches includeNonMatches�  0 includematches includeMatches�  & �
�	��������� ���������
 0 thetext theText�	 0 patterntext patternText� &0 includenonmatches includeNonMatches�  0 includematches includeMatches� 0 asocpattern asocPattern� 0 
asocstring 
asocString� &0 asocnonmatchstart asocNonMatchStart� 0 
textoffset 
textOffset� 0 
resultlist 
resultList�  0 asocmatcharray asocMatchArray�  0 i  �� 0 	asocmatch 	asocMatch�� 0 nonmatchinfo nonMatchInfo�� 0 	matchinfo 	matchInfo�� 0 	foundtext 	foundText' ������������������������������������������������� (0 asbooleanparameter asBooleanParameter�� @0 asnsregularexpressionparameter asNSRegularExpressionParameter�� ,0 asnormalizednsstring asNormalizedNSString�� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 rangeatindex_ rangeAtIndex_�� �� 0 _matchrecords _matchRecords
�� 
cobj�� �� 0 foundgroups foundGroups�� 0 
startindex 
startIndex�� &0 _matchedgrouplist _matchedGroupList�� *0 substringfromindex_ substringFromIndex_
�� 
ctxt
�� 
pcls�� 0 endindex endIndex
�� 
leng�� 0 	foundtext 	foundText�� �b  ��l+ E�Ob  ��l+ E�Ob  �j�m+ E�Ob  �k+ E�OjE�OkE�OjvE�O��jj�j+ lvm+ E�O }j�j+ kkh 
��k+ 	E�O*��jk+ 
��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO� ��*���a ,��+ l%�6FY h[OY��O� 1��k+ a &E�Oa b  a �a �a ,a �a �6FY hO�� �������)*���� "0 _replacepattern _replacePattern�� ��+�� +  �������� 0 thetext theText�� 0 patterntext patternText�� 0 templatetext templateText��  ) ������������������������������������������ 0 thetext theText�� 0 patterntext patternText�� 0 templatetext templateText�� 0 
asocstring 
asocString�� 0 asocpattern asocPattern�� 0 
resultlist 
resultList�� &0 asocnonmatchstart asocNonMatchStart�� 0 
textoffset 
textOffset��  0 asocmatcharray asocMatchArray�� 0 i  �� 0 	asocmatch 	asocMatch�� 0 nonmatchinfo nonMatchInfo�� 0 	matchinfo 	matchInfo�� 0 matchedgroups matchedGroups�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 oldtids oldTIDs�� 0 
resulttext 
resultText* �������������������������������,���U���}��� ,0 asnormalizednsstring asNormalizedNSString�� @0 asnsregularexpressionparameter asNSRegularExpressionParameter
�� 
kocl
�� 
scpt
�� .corecnte****       ****
�� 
cobj�� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_� 0 rangeatindex_ rangeAtIndex_� � 0 _matchrecords _matchRecords� � 0 	foundtext 	foundText� 0 
startindex 
startIndex� &0 _matchedgrouplist _matchedGroupList�  0 replacepattern replacePattern
� 
ctxt� 0 etext eText, ��-
� 
errn� 0 enumber eNumber- ��.
� 
erob� 0 efrom eFrom. ���
� 
errt� 
0 eto eTo�  
� 
errn
� 
erob
� 
errt� *0 substringfromindex_ substringFromIndex_
� 
ascr
� 
txdl� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_��Mb  �k+  E�Ob  �j�m+ E�O�kv��l jjvjkmvE[�k/E�Z[�l/E�Z[�m/E�ZO��jj�j+ lvm+ E�O �j�j+ 	kkh 	��k+ 
E�O*��jk+ ��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO��,�6FO*���a ,e�+ E�O ���,�l+ a &�6FW X  )a �a ] a ] �a �%[OY�qO��k+ a &�6FO_ a ,E^ Oa _ a ,FO�a &E^ O] _ a ,FO] Y ��jj�j+ lv��+ � ����/0�� 0 	_findtext 	_findText� �1� 1  ����� 0 thetext theText� 0 fortext forText� &0 includenonmatches includeNonMatches�  0 includematches includeMatches�  / 
����������� 0 thetext theText� 0 fortext forText� &0 includenonmatches includeNonMatches�  0 includematches includeMatches� 0 
resultlist 
resultList� 0 oldtids oldTIDs� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	foundtext 	foundText� 0 i  0 �����������������J���
� 
errn��Y
� 
erob� 
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
�)��  )�����Y hOjvE�O��,E�O���,FOkE�O��k/�,E�O� 2�� �[�\[Z�\Z�2E�Y �E�O�b  ����a �6FY hO �l��-j kh 	�kE�O��,�[�\[�/\�i/2�,E�O� 9�� �[�\[Z�\Z�2E�Y a E�O�b  ����a jva �6FY hO�kE�O���/�,kE�O� 4�� �[�\[Z�\Z�2E�Y a E�O�b  ����a �6FY h[OY�WO���,FO�� ����23�� 0 _replacetext _replaceText� �4� 4  �~�}�|�~ 0 thetext theText�} 0 fortext forText�| 0 newtext newText�  2 �{�z�y�x�w�v�u�t�s�r�q�p�o�n�{ 0 thetext theText�z 0 fortext forText�y 0 newtext newText�x 0 oldtids oldTIDs�w 0 
resultlist 
resultList�v 0 
startindex 
startIndex�u 0 endindex endIndex�t 0 i  �s 0 	foundtext 	foundText�r 0 etext eText�q 0 enumber eNumber�p 0 efrom eFrom�o 
0 eto eTo�n 0 
resulttext 
resultText3 ��m�l�k�j��i�h�g�f�e�d�c�b�a2�`�_5�^�]N|��\
�m 
errn�l�Y
�k 
erob�j 
�i 
ascr
�h 
txdl
�g 
kocl
�f 
scpt
�e .corecnte****       ****
�d 
citm
�c 
leng
�b 
cobj
�a 
ctxt�` 0 replacetext replaceText�_ 0 etext eText5 �[�Z6
�[ 
errn�Z 0 enumber eNumber6 �Y�X7
�Y 
erob�X 0 efrom eFrom7 �W�V�U
�W 
errt�V 
0 eto eTo�U  
�^ 
errt�] �\ "0 astextparameter asTextParameter�=��  )�����Y hO��,E�O���,FO�kv��l 
j �jvk��k/�,mvE[�k/E�Z[�l/E�Z[�m/E�ZO�� �[�\[Z�\Z�2�6FY hO �l��-j 
kh �kE�O��,�[�\[�/\�i/2�,E�O�� �[�\[Z�\Z�2E�Y �E�O ��k+ �&�6FW X  )��a �a a �%O�kE�O���/�,kE�O�� �[�\[Z�\Z�2�6FY h[OY�pOa ��,FY b  �a l+ E�O��-E�O���,FO��&E�O���,FO�  �T��S�R89�Q
�T .Txt:Srchnull���     ctxt�S 0 thetext theText�R �P�O:
�P 
For_�O 0 fortext forText: �N;<
�N 
Usin; {�M�L�K�M 0 matchformat matchFormat�L  
�K SerECmpI< �J=>
�J 
Repl= {�I�H�G�I 0 newtext newText�H  
�G 
msng> �F?�E
�F 
Retu? {�D�C�B�D 0 resultformat resultFormat�C  
�B RetEMatT�E  8 �A�@�?�>�=�<�;�:�9�8�7�A 0 thetext theText�@ 0 fortext forText�? 0 matchformat matchFormat�> 0 newtext newText�= 0 resultformat resultFormat�< &0 includenonmatches includeNonMatches�;  0 includematches includeMatches�: 0 etext eText�9 0 enumber eNumber�8 0 efrom eFrom�7 
0 eto eTo9 %��6��5�4�3�2�1��0�/�.�-�,E�+�*OP�)�(�'�&t�%���$��#�"�!@� ��6 "0 astextparameter asTextParameter
�5 
leng
�4 
errn�3�Y
�2 
erob�1 
�0 
msng
�/ RetEMatT
�. 
cobj
�- RetEUmaT
�, RetEAllT�+ >0 throwinvalidparameterconstant throwInvalidParameterConstant
�* SerECmpI�) 0 	_findtext 	_findText
�( SerECmpP�' 0 _findpattern _findPattern
�& SerECmpC
�% SerECmpE
�$ SerECmpD�# 0 _replacetext _replaceText�" "0 _replacepattern _replacePattern�! 0 etext eText@ ��A
� 
errn� 0 enumber eNumberA ��B
� 
erob� 0 efrom eFromB ���
� 
errt� 
0 eto eTo�  �  � 
0 _error  �Q��b  ��l+ E�Ob  ��l+ E�O��,j  )�����Y hO��  ���  felvE[�k/E�Z[�l/E�ZY E��  eflvE[�k/E�Z[�l/E�ZY )��  eelvE[�k/E�Z[�l/E�ZY b  ��l+ O�a   a a  *�����+ VY u�a   *�����+ Y `�a   a g *�����+ VY C�a   a a  *�����+ VY $�a   *�����+ Y b  �a l+ Y ��a   a a  *���m+ VY q�a   *���m+ Y ]�a   a a  *���m+ VY ?�a   a g *���m+ VY #�a   *���m+ Y b  �a l+ W X   !*a "����a #+ $ �+��CD�
� .Txt:EPatnull���     ctxt� 0 thetext theText�  C ������ 0 thetext theText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToD ��?���
�	EM��
� misccura� *0 nsregularexpression NSRegularExpression� "0 astextparameter asTextParameter� 40 escapedpatternforstring_ escapedPatternForString_
�
 
ctxt�	 0 etext eTextE ��F
� 
errn� 0 enumber eNumberF ��G
� 
erob� 0 efrom eFromG ��� 
� 
errt� 
0 eto eTo�   � � 
0 _error  � + ��,b  ��l+ k+ �&W X  *衢���+ 
 ��]����HI��
�� .Txt:ETemnull���     ctxt�� 0 thetext theText��  H ������������ 0 thetext theText�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToI ����q��������J����
�� misccura�� *0 nsregularexpression NSRegularExpression�� "0 astextparameter asTextParameter�� 60 escapedtemplateforstring_ escapedTemplateForString_
�� 
ctxt�� 0 etext eTextJ ����K
�� 
errn�� 0 enumber eNumberK ����L
�� 
erob�� 0 efrom eFromL ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� + ��,b  ��l+ k+ �&W X  *衢���+ 
 �������MN��
�� .Txt:UppTnull���     ctxt�� 0 thetext theText�� ��O��
�� 
LocaO {�������� 0 
localecode 
localeCode��  
�� 
msng��  M ���������������� 0 thetext theText�� 0 
localecode 
localeCode�� 0 
asocstring 
asocString�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToN ������������������P������� "0 astextparameter asTextParameter�� 0 
asnsstring 
asNSString
�� 
msng�� "0 uppercasestring uppercaseString
�� 
ctxt�� *0 asnslocaleparameter asNSLocaleParameter�� 80 uppercasestringwithlocale_ uppercaseStringWithLocale_�� 0 etext eTextP ����Q
�� 
errn�� 0 enumber eNumberQ ����R
�� 
erob�� 0 efrom eFromR ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+  �������ST��
�� .Txt:CapTnull���     ctxt�� 0 thetext theText�� ��U��
�� 
LocaU {������ 0 
localecode 
localeCode�  
� 
msng��  S �������� 0 thetext theText� 0 
localecode 
localeCode� 0 
asocstring 
asocString� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToT �����#���V/��� "0 astextparameter asTextParameter� 0 
asnsstring 
asNSString
� 
msng� &0 capitalizedstring capitalizedString
� 
ctxt� *0 asnslocaleparameter asNSLocaleParameter� <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_� 0 etext eTextV ��W
� 
errn� 0 enumber eNumberW ��X
� 
erob� 0 efrom eFromX ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �� Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+  �?��YZ�
� .Txt:LowTnull���     ctxt� 0 thetext theText� �[�
� 
Loca[ {���� 0 
localecode 
localeCode�  
� 
msng�  Y �������� 0 thetext theText� 0 
localecode 
localeCode� 0 
asocstring 
asocString� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToZ X�����u���\���� "0 astextparameter asTextParameter� 0 
asnsstring 
asNSString
� 
msng� "0 lowercasestring lowercaseString
� 
ctxt� *0 asnslocaleparameter asNSLocaleParameter� 80 lowercasestringwithlocale_ lowercaseStringWithLocale_� 0 etext eText\ ��]
� 
errn� 0 enumber eNumber] ��^
� 
erob� 0 efrom eFrom^ ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+  ����_`�
� .Txt:PadTnull���     ctxt� 0 thetext theText� ��a
� 
toPl� 0 toplaces toPlacesa �~bc
�~ 
Charb {�}�|��} 0 padchar padChar�|  c �{d�z
�{ 
Fromd {�y�x�w�y 0 whichend whichEnd�x  
�w LeTrLCha�z  _ 
�v�u�t�s�r�q�p�o�n�m�v 0 thetext theText�u 0 toplaces toPlaces�t 0 padchar padChar�s 0 whichend whichEnd�r 0 	charcount 	charCount�q 0 padtext padText�p 0 etext eText�o 0 enumber eNumber�n 0 efrom eFrom�m 
0 eto eTo` ��l��k�j��i�h�g�f��e�d�c�b	@�a�`e	L�_�^�l "0 astextparameter asTextParameter�k (0 asintegerparameter asIntegerParameter
�j 
leng
�i 
errn�h�Y
�g 
erob�f 
�e LeTrLCha
�d 
ctxt
�c LeTrTCha
�b LeTrBCha�a >0 throwinvalidparameterconstant throwInvalidParameterConstant�` 0 etext eTexte �]�\f
�] 
errn�\ 0 enumber eNumberf �[�Zg
�[ 
erob�Z 0 efrom eFromg �Y�X�W
�Y 
errt�X 
0 eto eTo�W  �_ �^ 
0 _error  � � �b  ��l+ E�Ob  ��l+ E�O���,E�O�j �Y hOb  ��l+ E�O��,j  )�����Y hO h��,���%E�[OY��O��  �[�\[Zk\Z�2�%Y a��  ��[�\[Zk\Z�2%Y J��  9�k  ��[�\[Zk\Z�2%Y �[�\[Zk\Z�l"2�%�%[�\[Zk\Z�2EY b  ��l+ W X  *a ����a +  �V	\�U�Thi�S
�V .Txt:SliTnull���     ctxt�U 0 thetext theText�T �Rjk
�R 
FIdxj {�Q�P�O�Q 0 
startindex 
startIndex�P  
�O 
msngk �Nl�M
�N 
TIdxl {�L�K�J�L 0 endindex endIndex�K  
�J 
msng�M  h �I�H�G�F�E�D�C�B�I 0 thetext theText�H 0 
startindex 
startIndex�G 0 endindex endIndex�F 0 	thelength 	theLength�E 0 etext eText�D 0 enumber eNumber�C 0 efrom eFrom�B 
0 eto eToi 	v�A�@�?	��>�=�<�;�:	�	��9�8	�	�	�	��7
3�6m
e�5�4�A "0 astextparameter asTextParameter
�@ 
leng
�? 
msng�> (0 asintegerparameter asIntegerParameter
�= 
errn�<�Y
�; 
erob�: 
�9 
ctxt�8�[
�7 
bool�6 0 etext eTextm �3�2n
�3 
errn�2 0 enumber eNumbern �1�0o
�1 
erob�0 0 efrom eFromo �/�.�-
�/ 
errt�. 
0 eto eTo�-  �5 �4 
0 _error  �S�rb  ��l+ E�O��,E�O�� Tb  ��l+ E�O�j  )�����Y hO��  )��' �Y �� �Y �[�\[Z�\Zi2EY hY ��  )��l�Y hO�� Xb  ��l+ E�O�j  )����a Y hO��  +��' 	a Y �� �Y �[�\[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO�k	 	�ka &
 ��	 	��a &a & 	a Y hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[�\[Z�\Z�2EW X  *a ����a +  �,
u�+�*pq�)
�, .Txt:TrmTnull���     ctxt�+ 0 thetext theText�* �(r�'
�( 
Fromr {�&�%�$�& 0 whichend whichEnd�%  
�$ LeTrBCha�'  p �#�"�!� �����# 0 thetext theText�" 0 whichend whichEnd�! 0 
startindex 
startIndex�  0 endindex endIndex� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToq 
�����
��
�
�
�
���
�
���s	��� "0 astextparameter asTextParameter
� LeTrLCha
� LeTrTCha
� LeTrBCha� >0 throwinvalidparameterconstant throwInvalidParameterConstant
� 
cobj
� 
cha 
� 
ctxt� 0 etext eTexts ��t
� 
errn� 0 enumber eNumbert ��u
� 
erob� 0 efrom eFromu ���

� 
errt� 
0 eto eTo�
  � � 
0 _error  �) � �b  ��l+ E�O���mv�kv b  ��l+ Y hO�� {��  �Y hOkilvE[�k/E�Z[�l/E�ZO��lv�kv  h��/� �kE�[OY��Y hO��lv�kv  h��/� �kE�[OY��Y hO�[�\[Z�\Z�2EVW X  *a ����a + 	 �	%��vw��	 0 
_splittext 
_splitText� �x� x  ��� 0 thetext theText� 0 theseparator theSeparator�  v ��� ������� 0 thetext theText� 0 theseparator theSeparator�  0 delimiterlist delimiterList�� 0 aref aRef�� 0 oldtids oldTIDs�� 0 
resultlist 
resultListw ��������������ySW������������ "0 aslistparameter asListParameter
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
�� 
ctxt��  y ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType
�� 
ascr
�� 
txdl
�� 
citm� _b  �k+  E�O 5�[��l kh  ��,�&��,FW X  b  �����+ [OY��O��,E�O���,FO��-E�O���,FO�
 ��|����z{���� 0 _splitpattern _splitPattern�� ��|�� |  ������ 0 thetext theText�� 0 patterntext patternText��  z 
���������������������� 0 thetext theText�� 0 patterntext patternText�� 0 asocpattern asocPattern�� 0 
asocstring 
asocString�� &0 asocnonmatchstart asocNonMatchStart�� 0 
resultlist 
resultList��  0 asocmatcharray asocMatchArray�� 0 i  ��  0 asocmatchrange asocMatchRange��  0 asocmatchstart asocMatchStart{ ��������������������������� @0 asnsregularexpressionparameter asNSRegularExpressionParameter�� ,0 asnormalizednsstring asNormalizedNSString�� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 rangeatindex_ rangeAtIndex_�� 0 location  �� �� *0 substringwithrange_ substringWithRange_
�� 
ctxt�� *0 substringfromindex_ substringFromIndex_�� �b  �j�m+ E�Ob  �k+ E�OjE�OjvE�O��jj�j+ lvm+ E�O Fj�j+ kkh ��k+ jk+ E�O�j+ E�O��㩤�k+ 
�&�6FO��j+ E�[OY��O��k+ �&�6FO� ������}~���� 0 	_jointext 	_joinText�� ����   ������ 0 thelist theList�� 0 separatortext separatorText��  } ������������ 0 thelist theList�� 0 separatortext separatorText�� 0 oldtids oldTIDs�� 0 delimiterlist delimiterList�� 0 
resulttext 
resultText~ �����������������@
�� 
ascr
�� 
txdl�� "0 aslistparameter asListParameter
�� 
ctxt��  � ���
� 
errn��\�  
� 
errn��Y
� 
erob
� 
errt
� 
list� �� ?��,E�O���,FO b  �k+ �&E�W X  ���,FO)�������O���,FO� �]�����
� .Txt:SplTnull���     ctxt� 0 thetext theText� ���
� 
Sepa� {���� 0 theseparator theSeparator�  
� 
msng� ���
� 
Usin� {���� 0 matchformat matchFormat�  
� SerECmpI�  � �������� 0 thetext theText� 0 theseparator theSeparator� 0 matchformat matchFormat� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ~�������������������� "0 astextparameter asTextParameter
� 
msng� 0 _splitpattern _splitPattern
� SerECmpI� 0 
_splittext 
_splitText
� SerECmpP
� SerECmpC
� SerECmpD� >0 throwinvalidparameterconstant throwInvalidParameterConstant� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  � � b  ��l+ E�O��  *��l+ Y ]��  �� *��l+ VY F��  *��l+ Y 5��  �g *��l+ VY ��  *��l+ Y b  ��l+ W X  *a ����a +  �������
� .Txt:JoiTnull���     ****� 0 thelist theList� ���
� 
Sepa� {���� 0 separatortext separatorText�  �  � ������� 0 thelist theList� 0 separatortext separatorText� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� �����~�}� "0 astextparameter asTextParameter� 0 	_jointext 	_joinText� 0 etext eText� �|�{�
�| 
errn�{ 0 enumber eNumber� �z�y�
�z 
erob�y 0 efrom eFrom� �x�w�v
�x 
errt�w 
0 eto eTo�v  �~ �} 
0 _error  � ( *�b  ��l+ l+ W X  *墣���+  �u�t�s���r
�u .Txt:SplPnull���     ctxt�t 0 thetext theText�s  � �q�p�o�n�m�q 0 thetext theText�p 0 etext eText�o 0 enumber eNumber�n 0 efrom eFrom�m 
0 eto eTo� -�l�k�j�9�i�h�l "0 astextparameter asTextParameter
�k 
cpar�j 0 etext eText� �g�f�
�g 
errn�f 0 enumber eNumber� �e�d�
�e 
erob�d 0 efrom eFrom� �c�b�a
�c 
errt�b 
0 eto eTo�a  �i �h 
0 _error  �r % b  ��l+ �-EW X  *塢���+  �`I�_�^���]
�` .Txt:JoiPnull���     ****�_ 0 thelist theList�^ �\��[
�\ 
LiBr� {�Z�Y�X�Z 0 linebreaktype lineBreakType�Y  
�X LiBrLiOX�[  � �W�V�U�T�S�R�Q�W 0 thelist theList�V 0 linebreaktype lineBreakType�U 0 separatortext separatorText�T 0 etext eText�S 0 enumber eNumber�R 0 efrom eFrom�Q 
0 eto eTo� �P�O�N�M�Lu�K�J�I���H�G
�P LiBrLiOX
�O 
lnfd
�N LiBrLiCM
�M 
ret 
�L LiBrLiWi�K >0 throwinvalidparameterconstant throwInvalidParameterConstant�J 0 	_jointext 	_joinText�I 0 etext eText� �F�E�
�F 
errn�E 0 enumber eNumber� �D�C�
�D 
erob�C 0 efrom eFrom� �B�A�@
�B 
errt�A 
0 eto eTo�@  �H �G 
0 _error  �] P ?��  �E�Y '��  �E�Y ��  
��%E�Y b  ��l+ O*��l+ W X  	*꣤���+  �?��>�=���<�? (0 _makevalueiterator _makeValueIterator�> �;��; �  �:�: 0 
objectlist 
objectList�=  � �9�8�9 0 
objectlist 
objectList�8 0 scpt  � �7���7 0 scpt  � �6��5�4���3
�6 .ascrinit****      � ****� k     �� ��� ��� ��2�2  �5  �4  � �1�0�/�1 0 _objects  �0 0 i  
�/ .aevtoappnull  �   � ****� �.�-�,�
�. 
list�- 0 _objects  �, 0 i  � �+��*�)���(
�+ .aevtoappnull  �   � ****�*  �)  �  � �'�&�%�$
�' 
leng
�& 
errn�%�
�$ 
cobj�( 8b  kEc  Ob  b   �, )��lhY hOb   �b  /E�3 b   �&�Oj�OL �< ��K S� �#��"�!��� 
�# .Txt:FLitnull��� ��� null�"  �! ���
� 
For_� 0 thevalue theValue�  � ������������ 0 thevalue theValue� 0 oldtids oldTIDs� 0 	textitems 	textItems�  0 asocdescriptor asocDescriptor� 0 hextext hexText� "0 descriptiontext descriptionText� 0 scpt  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� @���������(�
-�	�0����F�Tbp����� �������������������������8<JLW���������������������������
� 
kocl
� 
obj 
� .corecnte****       ****
� 
capp
� 
bool
� 
reco
� 
scpt
�
 
pnam�	  �  
� 
pcls
� 
ctxt
� 
ascr
� 
txdl
� 
citm
� 
optr
� misccura�  0 nsarray NSArray�� $0 arraywithobject_ arrayWithObject_��  0 objectatindex_ objectAtIndex_�� 0 data  �� 0 description  �� "0 uppercasestring uppercaseString�� ,0 asnormalizednsstring asNormalizedNSString
�� 
spac����� ������
�� 
errn���\��  
�� 
want
�� 
ocid
�� 
For_
�� 
seld
�� .Txt:FLitnull��� ��� null�� (0 _makevalueiterator _makeValueIterator
�� kfrmID  
�� 
Scpt
�� 
Deco�� 
�� .Txt:LitR****      � ****�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  � `��\E�kv��l j 	 �kv��l j �&	 �kv��l j �&Z�kv��l j  ��,%�%W 	X  �Y1��,a   s_ a ,E�Oa _ a ,FO�a -E�Oa _ a ,FO�a &E�Oa _ a ,FO�a -E�Oa _ a ,FO�a &E�O�_ a ,FOa �%a %Y ���,a   � a a ,�k+ jk+ E�Ob  �j+ j+  j+ !k+ "a &E�O_ a ,E�O_ #_ a ,FO�a -E�Oa $_ a ,FO�a &[a \[Zl\Za %2E�O�_ a ,FW X  a &E�Oa '�%a (%Y  �a &W X  )hY hO�kv��l j	 ��&a *,a + �& b C�j+  a &E�O�a ,	 	�a -�& �[a \[Zl\Za %2E�Y hOa .�%a /%W X  a 0*a 1��&a 2,l 3%Y hO .*�kvk+ 4E�O*�b  a 50 *a 6�a 7fa 8 9UW X  a :W X ; <*a =����a >+ ?V �����������
�� .Txt:FTxtnull���     ctxt�� 0 templatetext templateText�� ������
�� 
Usin�� 0 	thevalues 	theValues��  � ������������������������������������ 0 templatetext templateText�� 0 	thevalues 	theValues�� 0 asocpattern asocPattern�� 0 
asocstring 
asocString��  0 asocmatcharray asocMatchArray�� 0 resulttexts resultTexts�� 0 
startindex 
startIndex�� 0 i  �� 0 
matchrange 
matchRange�� 0 thetoken theToken�� 0 theitem theItem�� 0 oldtids oldTIDs�� 0 
resulttext 
resultText�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� #��������������������������2������������������ "0 aslistparameter asListParameter
�� misccura�� *0 nsregularexpression NSRegularExpression
�� 
msng�� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_�� 0 
asnsstring 
asNSString�� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_� 	0 count  �  0 objectatindex_ objectAtIndex_� 0 rangeatindex_ rangeAtIndex_� 0 location  � � *0 substringwithrange_ substringWithRange_
� 
ctxt
� 
cobj
� 
cha 
� 
long�  � ���
� 
errn��\�  
� 
For_
� .Txt:FLitnull��� ��� null� *0 substringfromindex_ substringFromIndex_
� 
ascr
� 
txdl� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  ��4b  �k+  E�O��,�j�m+ E�Ob  �k+ E�O��jj�j+ lvm+ E�OjvE�OjE�O�� � �j�j+ kkh ��k+ jk+ E�O���j+ ��k+ a &�6FO��k+ a &E�O�a   	��6FY 3�a �a i/a &/E�O �a &�6FW X  *a �l �6FO�j+ �j+ E�[OY�xO��k+ a &�6FO_ a ,E�Oa _ a ,FO�a &E�O�_ a ,FO�VW X  *a  ���] a !+ " �������
� .Txt:LLocnull��� ��� null�  �  �  � ������
� misccura� 0 nslocale NSLocale� 80 availablelocaleidentifiers availableLocaleIdentifiers� 60 sortedarrayusingselector_ sortedArrayUsingSelector_
� 
list� ��,j+ �k+ �& �������
� .Txt:CLocnull��� ��� null�  �  �  � �����
� misccura� 0 nslocale NSLocale� 0 currentlocale currentLocale� $0 localeidentifier localeIdentifier
� 
ctxt� ��,j+ j+ �& ascr  ��ޭ