FasdUAS 1.101.10   ��   ��    k             l      ��  ��   "�"� TypeSupport -- various standardized handlers for coercing and checking parameters and throwing errors

Notes:

- Because AS errors don't include stack traces, a library's public handlers must trap and rethrow all errors, prefixing error string with library and handler name (and, in script object methods, the object's display/documentation name) so that user can identify the handler in which an error occurred. Special attention should also be paid to coercing and/or validating public handlers' parameters, and throwing descriptive errors if an inappropriate value is given.

- This library wouldn't be necessary if AppleScript had decent parameter type annotations and proper exception objects (with full stack trace support). But as it doesn't these handlers at least take some of the endless pain out of sanitizing user-supplied inputs and generating consistent error messages when those inputs are inappropriate, or anything else in the handler needs to throw an error (or just goes plain old wrong).

- When coercing a text value to integer/real/number, or an integer or real value to text, the text is parsed/formatted using the current user's localization settings.

- When coercing a list to text, AppleScript's current text item delimiters are used. (This may change in future.)

- Library handlers that work with the file system should use asPOSIXPathParameter(...) to check and normalize user-supplied alias/file/�class furl�/POSIX path string parameters as POSIX path strings. (If a file object is specifically required, just coerce the returned POSIX path to `POSIX file`.) This should insulate library handlers from the worst of the mess that is AS's file identifier types.

- Be aware that AS follows special dispatch rules for terminology-based commands where the command is dispatched to its own direct parameter if that parameter is a script object, application object specifier, or other type that 'responds' directly to commands. Therefore, library handlers that use SDEF terminology must not use those types as direct parameters, only keyword parameters, otherwise error -1708 or unexpected behavior will occur when AS sends the command to that object instead of the library. (Basic data types that do not respond to commands themselves - numbers, text, dates, lists, etc - are safe to use as direct parameters.)


Caution:

- When checking if a string is empty in a library handler, it is *essential* either to check its length=0 or else wrap the string comparison (e.g. `aString is ""`) in a `considering hyphens, punctuation and white space block` to ensure that it really is empty and not a non-empty text value that contains only characters being ignored by the caller's current considering/ignoring settings. Similarly, when comparing for a non-empty string, the considering block *must* be used.

- When performing comparisons using <,�,>,� operators or concatenating values with & operator, it is *essential* to ensure the left operand is of the correct type (number/text/date/list) as AS will coerce the RH operand to the same type as the LH operand, and in some cases even casts *both* (e.g. `1&2`->`{1}&{2}`->`{1,2}`). Conversely, when using =/� operators, if the two operands are not the same type then this will almost always result in `false` (the obvious exception being integer/real comparisons, e.g. `1=1.0`->true), even though type-only differences are often ignored by other operators/commands (e.g. `1<"1"->false, `1<{1}`->false). Fully sanitizing all handler parameters before using them should generally avoid such problems subsequently manifesting in the handler, but eternal vigilance is still required to ensure extremely obscure/nasty/unpredictable/almost-impossible-to-troubleshoot bugs don't sneak in.


TO DO:

- should asPOSIXPath[Parameter] include options for expanding/normalizing path when given value is text? given that AS isn't too clever when passed relative paths, this might be wise (although there is the question of what to do about tildes, as those should only be expanded automatically when processing shell script arguments; Cocoa's stringByStandardizingPaths is excessively aggressive here)

- coercing a record to `any[thing]` throws error -1700(!); need to go through handlers below and check they coerce to `any` where appropriate (i.e. to ensure ASOC objects are converted to their AS equivalents before use), with workarounds as necessary (e.g. in `asList`, to handle the case where the item is a record or specifier)


- eliminate SDEF terminology for `native type`, `check type`, and `convert to Cocoa` commands and use identifier-based names instead? This would be consistent with rest of library's handlers, and avoid the obvious gotcha where user forgets to include parameter name in command and passes value as direct parameter instead command (which is disallowed here since the value can be anything, including script objects which aren't suitable as direct parameters to keyword-based commands due to AS's eccentric dispatch rules). Alternatively, could define `convert to TYPE` terminology for all `asTYPEParameter` commands, which is handy for optional params (e.g. parameter name could be optional; if omitted, generates different error message). e.g. `convert to text from theValue for parameter "using"`


- in `check type`, how to provide option for checking if value is a *list* of the specified type? one option would be to provide both `is` and `is list of` parameters on `check type`; another would be to provide a separate `check item type for LIST is TYPE` command. 

	(Note that checking if value is a record of specific form, e.g. `{name:text, isDone:boolean}`, is impractical due to the lack of AS introspection and the inability of ASOC's record-to-NSDictionary conversion to preserve keyword based names, therefore it's not worth trying to implement that.)
	
	(Be aware that while the `count` command's `each` parameter claims to accept a list of type classes, this is no good for actually determining if all list items are one of those types. It looks like when a list is given it actually counts all the values that can be _coerced_ one of specified types (as per `as` operator enhancement in 10.10), not whether the value is actually one of those types. Thus when checking a list for multiple types, it's necessary to check each item against each type O(nm), as it's possible for two type names to match the same item (e.g. counting each `integer`, then each `real`, then each `text` and summing the result should be ok, but counting each `integer`, then each `number`, then each `real` would result in all integer and real items being counted twice), resulting in an incorrect count when the subtotals for each time are finally added up. While AS's collection type names is quite stable, making it tempting to hack in special-case checks to prevent such overcounts, it's impossible to guarantee new names won't be added in future, so that isn't a safe solution.)


- add `check coercion` handler that checks if value can [safely?] be coerced to the specified type (Q. does `count {theValue} each {theType}` work same as `theValue as {theType}` by first testing for exact type then testing for coercibility?)

- add `check AppleScriptObjC class` handler that checks if value is ocid specifier and its class name is specified string? (note: it'd be better to use standard Cocoa methods to check it's a [sub]class of a specific class - checking string-based class names is hardly robust)


- note: make sure `asTYPEParameter` handlers will always accept ASOC objects, coercing to corresponding AS type (i.e. don't add any checks that'd cause them to reject 'ocid' specifiers), e.g. `asNumberParameter` will probably currently fail on ASOC object as it doesn't first coerce to `any`; might be best if all `asTYPEParameter` handlers first coerce to `any` before coercing to actual required type (the only exception would be an `asReferenceParameter` handler, as that needs to typecheck only, as coercing a specifier dereferences it) -- OTOH, coercing a specifier to list is semantically ambiguous (should it dereference in hope of receiving a list?), while AS fails when coercing a record to any

- should asTextParameter() always throw an error if value is a list? (i.e. avoids inconsistent concatenation results due to TIDs); another option would be to whitelist some or all known 'safe' types (integer/real, text, date, alias/file/furl, etc) and reject everything else; this should ensure stable predictable behavior - even where additional custom coercion handlers are installed (users can still use other types of values, of course; they just have to explicitly coerce them first using `as` operator)

 - `missing value` and other type/constant symbols are currently accepted by asTextParameter, though may coerce to either keyword name text or raw chevron text, which may be a reason for `asTextParameter` to disallow them

     � 	 	E�   T y p e S u p p o r t   - -   v a r i o u s   s t a n d a r d i z e d   h a n d l e r s   f o r   c o e r c i n g   a n d   c h e c k i n g   p a r a m e t e r s   a n d   t h r o w i n g   e r r o r s 
 
 N o t e s : 
 
 -   B e c a u s e   A S   e r r o r s   d o n ' t   i n c l u d e   s t a c k   t r a c e s ,   a   l i b r a r y ' s   p u b l i c   h a n d l e r s   m u s t   t r a p   a n d   r e t h r o w   a l l   e r r o r s ,   p r e f i x i n g   e r r o r   s t r i n g   w i t h   l i b r a r y   a n d   h a n d l e r   n a m e   ( a n d ,   i n   s c r i p t   o b j e c t   m e t h o d s ,   t h e   o b j e c t ' s   d i s p l a y / d o c u m e n t a t i o n   n a m e )   s o   t h a t   u s e r   c a n   i d e n t i f y   t h e   h a n d l e r   i n   w h i c h   a n   e r r o r   o c c u r r e d .   S p e c i a l   a t t e n t i o n   s h o u l d   a l s o   b e   p a i d   t o   c o e r c i n g   a n d / o r   v a l i d a t i n g   p u b l i c   h a n d l e r s '   p a r a m e t e r s ,   a n d   t h r o w i n g   d e s c r i p t i v e   e r r o r s   i f   a n   i n a p p r o p r i a t e   v a l u e   i s   g i v e n . 
 
 -   T h i s   l i b r a r y   w o u l d n ' t   b e   n e c e s s a r y   i f   A p p l e S c r i p t   h a d   d e c e n t   p a r a m e t e r   t y p e   a n n o t a t i o n s   a n d   p r o p e r   e x c e p t i o n   o b j e c t s   ( w i t h   f u l l   s t a c k   t r a c e   s u p p o r t ) .   B u t   a s   i t   d o e s n ' t   t h e s e   h a n d l e r s   a t   l e a s t   t a k e   s o m e   o f   t h e   e n d l e s s   p a i n   o u t   o f   s a n i t i z i n g   u s e r - s u p p l i e d   i n p u t s   a n d   g e n e r a t i n g   c o n s i s t e n t   e r r o r   m e s s a g e s   w h e n   t h o s e   i n p u t s   a r e   i n a p p r o p r i a t e ,   o r   a n y t h i n g   e l s e   i n   t h e   h a n d l e r   n e e d s   t o   t h r o w   a n   e r r o r   ( o r   j u s t   g o e s   p l a i n   o l d   w r o n g ) . 
 
 -   W h e n   c o e r c i n g   a   t e x t   v a l u e   t o   i n t e g e r / r e a l / n u m b e r ,   o r   a n   i n t e g e r   o r   r e a l   v a l u e   t o   t e x t ,   t h e   t e x t   i s   p a r s e d / f o r m a t t e d   u s i n g   t h e   c u r r e n t   u s e r ' s   l o c a l i z a t i o n   s e t t i n g s . 
 
 -   W h e n   c o e r c i n g   a   l i s t   t o   t e x t ,   A p p l e S c r i p t ' s   c u r r e n t   t e x t   i t e m   d e l i m i t e r s   a r e   u s e d .   ( T h i s   m a y   c h a n g e   i n   f u t u r e . ) 
 
 -   L i b r a r y   h a n d l e r s   t h a t   w o r k   w i t h   t h e   f i l e   s y s t e m   s h o u l d   u s e   a s P O S I X P a t h P a r a m e t e r ( . . . )   t o   c h e c k   a n d   n o r m a l i z e   u s e r - s u p p l i e d   a l i a s / f i l e / � c l a s s   f u r l � / P O S I X   p a t h   s t r i n g   p a r a m e t e r s   a s   P O S I X   p a t h   s t r i n g s .   ( I f   a   f i l e   o b j e c t   i s   s p e c i f i c a l l y   r e q u i r e d ,   j u s t   c o e r c e   t h e   r e t u r n e d   P O S I X   p a t h   t o   ` P O S I X   f i l e ` . )   T h i s   s h o u l d   i n s u l a t e   l i b r a r y   h a n d l e r s   f r o m   t h e   w o r s t   o f   t h e   m e s s   t h a t   i s   A S ' s   f i l e   i d e n t i f i e r   t y p e s . 
 
 -   B e   a w a r e   t h a t   A S   f o l l o w s   s p e c i a l   d i s p a t c h   r u l e s   f o r   t e r m i n o l o g y - b a s e d   c o m m a n d s   w h e r e   t h e   c o m m a n d   i s   d i s p a t c h e d   t o   i t s   o w n   d i r e c t   p a r a m e t e r   i f   t h a t   p a r a m e t e r   i s   a   s c r i p t   o b j e c t ,   a p p l i c a t i o n   o b j e c t   s p e c i f i e r ,   o r   o t h e r   t y p e   t h a t   ' r e s p o n d s '   d i r e c t l y   t o   c o m m a n d s .   T h e r e f o r e ,   l i b r a r y   h a n d l e r s   t h a t   u s e   S D E F   t e r m i n o l o g y   m u s t   n o t   u s e   t h o s e   t y p e s   a s   d i r e c t   p a r a m e t e r s ,   o n l y   k e y w o r d   p a r a m e t e r s ,   o t h e r w i s e   e r r o r   - 1 7 0 8   o r   u n e x p e c t e d   b e h a v i o r   w i l l   o c c u r   w h e n   A S   s e n d s   t h e   c o m m a n d   t o   t h a t   o b j e c t   i n s t e a d   o f   t h e   l i b r a r y .   ( B a s i c   d a t a   t y p e s   t h a t   d o   n o t   r e s p o n d   t o   c o m m a n d s   t h e m s e l v e s   -   n u m b e r s ,   t e x t ,   d a t e s ,   l i s t s ,   e t c   -   a r e   s a f e   t o   u s e   a s   d i r e c t   p a r a m e t e r s . ) 
 
 
 C a u t i o n : 
 
 -   W h e n   c h e c k i n g   i f   a   s t r i n g   i s   e m p t y   i n   a   l i b r a r y   h a n d l e r ,   i t   i s   * e s s e n t i a l *   e i t h e r   t o   c h e c k   i t s   l e n g t h = 0   o r   e l s e   w r a p   t h e   s t r i n g   c o m p a r i s o n   ( e . g .   ` a S t r i n g   i s   " " ` )   i n   a   ` c o n s i d e r i n g   h y p h e n s ,   p u n c t u a t i o n   a n d   w h i t e   s p a c e   b l o c k `   t o   e n s u r e   t h a t   i t   r e a l l y   i s   e m p t y   a n d   n o t   a   n o n - e m p t y   t e x t   v a l u e   t h a t   c o n t a i n s   o n l y   c h a r a c t e r s   b e i n g   i g n o r e d   b y   t h e   c a l l e r ' s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s .   S i m i l a r l y ,   w h e n   c o m p a r i n g   f o r   a   n o n - e m p t y   s t r i n g ,   t h e   c o n s i d e r i n g   b l o c k   * m u s t *   b e   u s e d . 
 
 -   W h e n   p e r f o r m i n g   c o m p a r i s o n s   u s i n g   < ,"d , > ,"e   o p e r a t o r s   o r   c o n c a t e n a t i n g   v a l u e s   w i t h   &   o p e r a t o r ,   i t   i s   * e s s e n t i a l *   t o   e n s u r e   t h e   l e f t   o p e r a n d   i s   o f   t h e   c o r r e c t   t y p e   ( n u m b e r / t e x t / d a t e / l i s t )   a s   A S   w i l l   c o e r c e   t h e   R H   o p e r a n d   t o   t h e   s a m e   t y p e   a s   t h e   L H   o p e r a n d ,   a n d   i n   s o m e   c a s e s   e v e n   c a s t s   * b o t h *   ( e . g .   ` 1 & 2 ` - > ` { 1 } & { 2 } ` - > ` { 1 , 2 } ` ) .   C o n v e r s e l y ,   w h e n   u s i n g   = /"`   o p e r a t o r s ,   i f   t h e   t w o   o p e r a n d s   a r e   n o t   t h e   s a m e   t y p e   t h e n   t h i s   w i l l   a l m o s t   a l w a y s   r e s u l t   i n   ` f a l s e `   ( t h e   o b v i o u s   e x c e p t i o n   b e i n g   i n t e g e r / r e a l   c o m p a r i s o n s ,   e . g .   ` 1 = 1 . 0 ` - > t r u e ) ,   e v e n   t h o u g h   t y p e - o n l y   d i f f e r e n c e s   a r e   o f t e n   i g n o r e d   b y   o t h e r   o p e r a t o r s / c o m m a n d s   ( e . g .   ` 1 < " 1 " - > f a l s e ,   ` 1 < { 1 } ` - > f a l s e ) .   F u l l y   s a n i t i z i n g   a l l   h a n d l e r   p a r a m e t e r s   b e f o r e   u s i n g   t h e m   s h o u l d   g e n e r a l l y   a v o i d   s u c h   p r o b l e m s   s u b s e q u e n t l y   m a n i f e s t i n g   i n   t h e   h a n d l e r ,   b u t   e t e r n a l   v i g i l a n c e   i s   s t i l l   r e q u i r e d   t o   e n s u r e   e x t r e m e l y   o b s c u r e / n a s t y / u n p r e d i c t a b l e / a l m o s t - i m p o s s i b l e - t o - t r o u b l e s h o o t   b u g s   d o n ' t   s n e a k   i n . 
 
 
 T O   D O : 
 
 -   s h o u l d   a s P O S I X P a t h [ P a r a m e t e r ]   i n c l u d e   o p t i o n s   f o r   e x p a n d i n g / n o r m a l i z i n g   p a t h   w h e n   g i v e n   v a l u e   i s   t e x t ?   g i v e n   t h a t   A S   i s n ' t   t o o   c l e v e r   w h e n   p a s s e d   r e l a t i v e   p a t h s ,   t h i s   m i g h t   b e   w i s e   ( a l t h o u g h   t h e r e   i s   t h e   q u e s t i o n   o f   w h a t   t o   d o   a b o u t   t i l d e s ,   a s   t h o s e   s h o u l d   o n l y   b e   e x p a n d e d   a u t o m a t i c a l l y   w h e n   p r o c e s s i n g   s h e l l   s c r i p t   a r g u m e n t s ;   C o c o a ' s   s t r i n g B y S t a n d a r d i z i n g P a t h s   i s   e x c e s s i v e l y   a g g r e s s i v e   h e r e ) 
 
 -   c o e r c i n g   a   r e c o r d   t o   ` a n y [ t h i n g ] `   t h r o w s   e r r o r   - 1 7 0 0 ( ! ) ;   n e e d   t o   g o   t h r o u g h   h a n d l e r s   b e l o w   a n d   c h e c k   t h e y   c o e r c e   t o   ` a n y `   w h e r e   a p p r o p r i a t e   ( i . e .   t o   e n s u r e   A S O C   o b j e c t s   a r e   c o n v e r t e d   t o   t h e i r   A S   e q u i v a l e n t s   b e f o r e   u s e ) ,   w i t h   w o r k a r o u n d s   a s   n e c e s s a r y   ( e . g .   i n   ` a s L i s t ` ,   t o   h a n d l e   t h e   c a s e   w h e r e   t h e   i t e m   i s   a   r e c o r d   o r   s p e c i f i e r ) 
 
 
 -   e l i m i n a t e   S D E F   t e r m i n o l o g y   f o r   ` n a t i v e   t y p e ` ,   ` c h e c k   t y p e ` ,   a n d   ` c o n v e r t   t o   C o c o a `   c o m m a n d s   a n d   u s e   i d e n t i f i e r - b a s e d   n a m e s   i n s t e a d ?   T h i s   w o u l d   b e   c o n s i s t e n t   w i t h   r e s t   o f   l i b r a r y ' s   h a n d l e r s ,   a n d   a v o i d   t h e   o b v i o u s   g o t c h a   w h e r e   u s e r   f o r g e t s   t o   i n c l u d e   p a r a m e t e r   n a m e   i n   c o m m a n d   a n d   p a s s e s   v a l u e   a s   d i r e c t   p a r a m e t e r   i n s t e a d   c o m m a n d   ( w h i c h   i s   d i s a l l o w e d   h e r e   s i n c e   t h e   v a l u e   c a n   b e   a n y t h i n g ,   i n c l u d i n g   s c r i p t   o b j e c t s   w h i c h   a r e n ' t   s u i t a b l e   a s   d i r e c t   p a r a m e t e r s   t o   k e y w o r d - b a s e d   c o m m a n d s   d u e   t o   A S ' s   e c c e n t r i c   d i s p a t c h   r u l e s ) .   A l t e r n a t i v e l y ,   c o u l d   d e f i n e   ` c o n v e r t   t o   T Y P E `   t e r m i n o l o g y   f o r   a l l   ` a s T Y P E P a r a m e t e r `   c o m m a n d s ,   w h i c h   i s   h a n d y   f o r   o p t i o n a l   p a r a m s   ( e . g .   p a r a m e t e r   n a m e   c o u l d   b e   o p t i o n a l ;   i f   o m i t t e d ,   g e n e r a t e s   d i f f e r e n t   e r r o r   m e s s a g e ) .   e . g .   ` c o n v e r t   t o   t e x t   f r o m   t h e V a l u e   f o r   p a r a m e t e r   " u s i n g " ` 
 
 
 -   i n   ` c h e c k   t y p e ` ,   h o w   t o   p r o v i d e   o p t i o n   f o r   c h e c k i n g   i f   v a l u e   i s   a   * l i s t *   o f   t h e   s p e c i f i e d   t y p e ?   o n e   o p t i o n   w o u l d   b e   t o   p r o v i d e   b o t h   ` i s `   a n d   ` i s   l i s t   o f `   p a r a m e t e r s   o n   ` c h e c k   t y p e ` ;   a n o t h e r   w o u l d   b e   t o   p r o v i d e   a   s e p a r a t e   ` c h e c k   i t e m   t y p e   f o r   L I S T   i s   T Y P E `   c o m m a n d .   
 
 	 ( N o t e   t h a t   c h e c k i n g   i f   v a l u e   i s   a   r e c o r d   o f   s p e c i f i c   f o r m ,   e . g .   ` { n a m e : t e x t ,   i s D o n e : b o o l e a n } ` ,   i s   i m p r a c t i c a l   d u e   t o   t h e   l a c k   o f   A S   i n t r o s p e c t i o n   a n d   t h e   i n a b i l i t y   o f   A S O C ' s   r e c o r d - t o - N S D i c t i o n a r y   c o n v e r s i o n   t o   p r e s e r v e   k e y w o r d   b a s e d   n a m e s ,   t h e r e f o r e   i t ' s   n o t   w o r t h   t r y i n g   t o   i m p l e m e n t   t h a t . ) 
 	 
 	 ( B e   a w a r e   t h a t   w h i l e   t h e   ` c o u n t `   c o m m a n d ' s   ` e a c h `   p a r a m e t e r   c l a i m s   t o   a c c e p t   a   l i s t   o f   t y p e   c l a s s e s ,   t h i s   i s   n o   g o o d   f o r   a c t u a l l y   d e t e r m i n i n g   i f   a l l   l i s t   i t e m s   a r e   o n e   o f   t h o s e   t y p e s .   I t   l o o k s   l i k e   w h e n   a   l i s t   i s   g i v e n   i t   a c t u a l l y   c o u n t s   a l l   t h e   v a l u e s   t h a t   c a n   b e   _ c o e r c e d _   o n e   o f   s p e c i f i e d   t y p e s   ( a s   p e r   ` a s `   o p e r a t o r   e n h a n c e m e n t   i n   1 0 . 1 0 ) ,   n o t   w h e t h e r   t h e   v a l u e   i s   a c t u a l l y   o n e   o f   t h o s e   t y p e s .   T h u s   w h e n   c h e c k i n g   a   l i s t   f o r   m u l t i p l e   t y p e s ,   i t ' s   n e c e s s a r y   t o   c h e c k   e a c h   i t e m   a g a i n s t   e a c h   t y p e   O ( n m ) ,   a s   i t ' s   p o s s i b l e   f o r   t w o   t y p e   n a m e s   t o   m a t c h   t h e   s a m e   i t e m   ( e . g .   c o u n t i n g   e a c h   ` i n t e g e r ` ,   t h e n   e a c h   ` r e a l ` ,   t h e n   e a c h   ` t e x t `   a n d   s u m m i n g   t h e   r e s u l t   s h o u l d   b e   o k ,   b u t   c o u n t i n g   e a c h   ` i n t e g e r ` ,   t h e n   e a c h   ` n u m b e r ` ,   t h e n   e a c h   ` r e a l `   w o u l d   r e s u l t   i n   a l l   i n t e g e r   a n d   r e a l   i t e m s   b e i n g   c o u n t e d   t w i c e ) ,   r e s u l t i n g   i n   a n   i n c o r r e c t   c o u n t   w h e n   t h e   s u b t o t a l s   f o r   e a c h   t i m e   a r e   f i n a l l y   a d d e d   u p .   W h i l e   A S ' s   c o l l e c t i o n   t y p e   n a m e s   i s   q u i t e   s t a b l e ,   m a k i n g   i t   t e m p t i n g   t o   h a c k   i n   s p e c i a l - c a s e   c h e c k s   t o   p r e v e n t   s u c h   o v e r c o u n t s ,   i t ' s   i m p o s s i b l e   t o   g u a r a n t e e   n e w   n a m e s   w o n ' t   b e   a d d e d   i n   f u t u r e ,   s o   t h a t   i s n ' t   a   s a f e   s o l u t i o n . ) 
 
 
 -   a d d   ` c h e c k   c o e r c i o n `   h a n d l e r   t h a t   c h e c k s   i f   v a l u e   c a n   [ s a f e l y ? ]   b e   c o e r c e d   t o   t h e   s p e c i f i e d   t y p e   ( Q .   d o e s   ` c o u n t   { t h e V a l u e }   e a c h   { t h e T y p e } `   w o r k   s a m e   a s   ` t h e V a l u e   a s   { t h e T y p e } `   b y   f i r s t   t e s t i n g   f o r   e x a c t   t y p e   t h e n   t e s t i n g   f o r   c o e r c i b i l i t y ? ) 
 
 -   a d d   ` c h e c k   A p p l e S c r i p t O b j C   c l a s s `   h a n d l e r   t h a t   c h e c k s   i f   v a l u e   i s   o c i d   s p e c i f i e r   a n d   i t s   c l a s s   n a m e   i s   s p e c i f i e d   s t r i n g ?   ( n o t e :   i t ' d   b e   b e t t e r   t o   u s e   s t a n d a r d   C o c o a   m e t h o d s   t o   c h e c k   i t ' s   a   [ s u b ] c l a s s   o f   a   s p e c i f i c   c l a s s   -   c h e c k i n g   s t r i n g - b a s e d   c l a s s   n a m e s   i s   h a r d l y   r o b u s t ) 
 
 
 -   n o t e :   m a k e   s u r e   ` a s T Y P E P a r a m e t e r `   h a n d l e r s   w i l l   a l w a y s   a c c e p t   A S O C   o b j e c t s ,   c o e r c i n g   t o   c o r r e s p o n d i n g   A S   t y p e   ( i . e .   d o n ' t   a d d   a n y   c h e c k s   t h a t ' d   c a u s e   t h e m   t o   r e j e c t   ' o c i d '   s p e c i f i e r s ) ,   e . g .   ` a s N u m b e r P a r a m e t e r `   w i l l   p r o b a b l y   c u r r e n t l y   f a i l   o n   A S O C   o b j e c t   a s   i t   d o e s n ' t   f i r s t   c o e r c e   t o   ` a n y ` ;   m i g h t   b e   b e s t   i f   a l l   ` a s T Y P E P a r a m e t e r `   h a n d l e r s   f i r s t   c o e r c e   t o   ` a n y `   b e f o r e   c o e r c i n g   t o   a c t u a l   r e q u i r e d   t y p e   ( t h e   o n l y   e x c e p t i o n   w o u l d   b e   a n   ` a s R e f e r e n c e P a r a m e t e r `   h a n d l e r ,   a s   t h a t   n e e d s   t o   t y p e c h e c k   o n l y ,   a s   c o e r c i n g   a   s p e c i f i e r   d e r e f e r e n c e s   i t )   - -   O T O H ,   c o e r c i n g   a   s p e c i f i e r   t o   l i s t   i s   s e m a n t i c a l l y   a m b i g u o u s   ( s h o u l d   i t   d e r e f e r e n c e   i n   h o p e   o f   r e c e i v i n g   a   l i s t ? ) ,   w h i l e   A S   f a i l s   w h e n   c o e r c i n g   a   r e c o r d   t o   a n y 
 
 -   s h o u l d   a s T e x t P a r a m e t e r ( )   a l w a y s   t h r o w   a n   e r r o r   i f   v a l u e   i s   a   l i s t ?   ( i . e .   a v o i d s   i n c o n s i s t e n t   c o n c a t e n a t i o n   r e s u l t s   d u e   t o   T I D s ) ;   a n o t h e r   o p t i o n   w o u l d   b e   t o   w h i t e l i s t   s o m e   o r   a l l   k n o w n   ' s a f e '   t y p e s   ( i n t e g e r / r e a l ,   t e x t ,   d a t e ,   a l i a s / f i l e / f u r l ,   e t c )   a n d   r e j e c t   e v e r y t h i n g   e l s e ;   t h i s   s h o u l d   e n s u r e   s t a b l e   p r e d i c t a b l e   b e h a v i o r   -   e v e n   w h e r e   a d d i t i o n a l   c u s t o m   c o e r c i o n   h a n d l e r s   a r e   i n s t a l l e d   ( u s e r s   c a n   s t i l l   u s e   o t h e r   t y p e s   o f   v a l u e s ,   o f   c o u r s e ;   t h e y   j u s t   h a v e   t o   e x p l i c i t l y   c o e r c e   t h e m   f i r s t   u s i n g   ` a s `   o p e r a t o r )  
 
   -   ` m i s s i n g   v a l u e `   a n d   o t h e r   t y p e / c o n s t a n t   s y m b o l s   a r e   c u r r e n t l y   a c c e p t e d   b y   a s T e x t P a r a m e t e r ,   t h o u g h   m a y   c o e r c e   t o   e i t h e r   k e y w o r d   n a m e   t e x t   o r   r a w   c h e v r o n   t e x t ,   w h i c h   m a y   b e   a   r e a s o n   f o r   ` a s T e x t P a r a m e t e r `   t o   d i s a l l o w   t h e m 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��    9 3 check if a handler exists before trying to call it     �   f   c h e c k   i f   a   h a n d l e r   e x i s t s   b e f o r e   t r y i n g   t o   c a l l   i t      l     ��������  ��  ��       !   l     �� " #��   "VP used to check for the existence of an optional 'callback' handler before calling it, as AS doesn't distinguish between an error -1708 that occurs because handler wasn't defined (in which case don't call it) and an error -1708 that occurs because the handler was found but went on to call another handler that doesn't exist (i.e. a bug)    # � $ $�   u s e d   t o   c h e c k   f o r   t h e   e x i s t e n c e   o f   a n   o p t i o n a l   ' c a l l b a c k '   h a n d l e r   b e f o r e   c a l l i n g   i t ,   a s   A S   d o e s n ' t   d i s t i n g u i s h   b e t w e e n   a n   e r r o r   - 1 7 0 8   t h a t   o c c u r s   b e c a u s e   h a n d l e r   w a s n ' t   d e f i n e d   ( i n   w h i c h   c a s e   d o n ' t   c a l l   i t )   a n d   a n   e r r o r   - 1 7 0 8   t h a t   o c c u r s   b e c a u s e   t h e   h a n d l e r   w a s   f o u n d   b u t   w e n t   o n   t o   c a l l   a n o t h e r   h a n d l e r   t h a t   d o e s n ' t   e x i s t   ( i . e .   a   b u g ) !  % & % l     ��������  ��  ��   &  ' ( ' l     �� ) *��   )93 CAUTION: `hasHander` relies on AS handlers' partial ability to behave as AS objects in that they can be retrieved by name, assigned to variables, and coerced to `handler` type. Be aware, however, this object-like behavior is undocumented and essentially undefined: AS handlers are not closures, so moving them around will completely break their lexical and dynamic bindings, causing seriously bizarre and incorrect behavior if subsequently called. The only reason `hasHandler` resorts to such hackery because AS lacks the introspection/stack trace capabilites to do the job right (either by asking the containing script object to describe its contents, or by calling the handler speculatively then examining the stack trace to determine if error -1708 was due to the handler not existing or a bug occurring within it).    * � + +f   C A U T I O N :   ` h a s H a n d e r `   r e l i e s   o n   A S   h a n d l e r s '   p a r t i a l   a b i l i t y   t o   b e h a v e   a s   A S   o b j e c t s   i n   t h a t   t h e y   c a n   b e   r e t r i e v e d   b y   n a m e ,   a s s i g n e d   t o   v a r i a b l e s ,   a n d   c o e r c e d   t o   ` h a n d l e r `   t y p e .   B e   a w a r e ,   h o w e v e r ,   t h i s   o b j e c t - l i k e   b e h a v i o r   i s   u n d o c u m e n t e d   a n d   e s s e n t i a l l y   u n d e f i n e d :   A S   h a n d l e r s   a r e   n o t   c l o s u r e s ,   s o   m o v i n g   t h e m   a r o u n d   w i l l   c o m p l e t e l y   b r e a k   t h e i r   l e x i c a l   a n d   d y n a m i c   b i n d i n g s ,   c a u s i n g   s e r i o u s l y   b i z a r r e   a n d   i n c o r r e c t   b e h a v i o r   i f   s u b s e q u e n t l y   c a l l e d .   T h e   o n l y   r e a s o n   ` h a s H a n d l e r `   r e s o r t s   t o   s u c h   h a c k e r y   b e c a u s e   A S   l a c k s   t h e   i n t r o s p e c t i o n / s t a c k   t r a c e   c a p a b i l i t e s   t o   d o   t h e   j o b   r i g h t   ( e i t h e r   b y   a s k i n g   t h e   c o n t a i n i n g   s c r i p t   o b j e c t   t o   d e s c r i b e   i t s   c o n t e n t s ,   o r   b y   c a l l i n g   t h e   h a n d l e r   s p e c u l a t i v e l y   t h e n   e x a m i n i n g   t h e   s t a c k   t r a c e   t o   d e t e r m i n e   i f   e r r o r   - 1 7 0 8   w a s   d u e   t o   t h e   h a n d l e r   n o t   e x i s t i n g   o r   a   b u g   o c c u r r i n g   w i t h i n   i t ) . (  , - , l     ��������  ��  ��   -  . / . l     �� 0 1��   0 � � CAUTION: `hasHandler` only works for handlers with identifier-based names; do not use to check for existence of handlers with keyword-based names as that will result in incorrect behavior.    1 � 2 2z   C A U T I O N :   ` h a s H a n d l e r `   o n l y   w o r k s   f o r   h a n d l e r s   w i t h   i d e n t i f i e r - b a s e d   n a m e s ;   d o   n o t   u s e   t o   c h e c k   f o r   e x i s t e n c e   o f   h a n d l e r s   w i t h   k e y w o r d - b a s e d   n a m e s   a s   t h a t   w i l l   r e s u l t   i n   i n c o r r e c t   b e h a v i o r . /  3 4 3 l     ��������  ��  ��   4  5 6 5 i    7 8 7 I      �� 9���� 0 
hashandler 
hasHandler 9  :�� : o      ���� 0 
handlerref 
handlerRef��  ��   8 l     ; < = ; Q      > ? @ > l   	 A B C A k    	 D D  E F E l    G H I G c     J K J o    ���� 0 
handlerref 
handlerRef K m    ��
�� 
hand H ? 9 dereference and type check; this raises -1700 on failure    I � L L r   d e r e f e r e n c e   a n d   t y p e   c h e c k ;   t h i s   r a i s e s   - 1 7 0 0   o n   f a i l u r e F  M�� M L    	 N N m    ��
�� boovtrue��   B G A horrible hack to check if a script object has a specific handler    C � O O �   h o r r i b l e   h a c k   t o   c h e c k   i f   a   s c r i p t   o b j e c t   h a s   a   s p e c i f i c   h a n d l e r ? R      ���� P
�� .ascrerr ****      � ****��   P �� Q��
�� 
errn Q d       R R m      �������   @ l    S T U S L     V V m    ��
�� boovfals T K E the referred-to script object slot doesn't exist, or isn't a handler    U � W W �   t h e   r e f e r r e d - t o   s c r i p t   o b j e c t   s l o t   d o e s n ' t   e x i s t ,   o r   i s n ' t   a   h a n d l e r < < 6 handlerRef must be `a reference to HANDLER of SCRIPT`    = � X X l   h a n d l e r R e f   m u s t   b e   ` a   r e f e r e n c e   t o   H A N D L E R   o f   S C R I P T ` 6  Y Z Y l     ��������  ��  ��   Z  [ \ [ l     ��������  ��  ��   \  ] ^ ] l     �� _ `��   _ J D--------------------------------------------------------------------    ` � a a � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ^  b c b l     �� d e��   d � � convenience handlers for raising common errors; using these improves consistency, ensuring all error messages and parameters follow same general structure, and that all library handlers automatically benefit from any future improvements made here    e � f f�   c o n v e n i e n c e   h a n d l e r s   f o r   r a i s i n g   c o m m o n   e r r o r s ;   u s i n g   t h e s e   i m p r o v e s   c o n s i s t e n c y ,   e n s u r i n g   a l l   e r r o r   m e s s a g e s   a n d   p a r a m e t e r s   f o l l o w   s a m e   g e n e r a l   s t r u c t u r e ,   a n d   t h a t   a l l   l i b r a r y   h a n d l e r s   a u t o m a t i c a l l y   b e n e f i t   f r o m   a n y   f u t u r e   i m p r o v e m e n t s   m a d e   h e r e c  g h g l     ��������  ��  ��   h  i j i i    k l k I      �� m���� 00 _throwinvalidparameter _throwInvalidParameter m  n o n o      ���� 0 thevalue theValue o  p q p o      ���� 0 parametername parameterName q  r s r o      ���� 0 expectedtype expectedType s  t u t o      ���� $0 errordescription errorDescription u  v�� v o      ���� 0 errornumber errorNumber��  ��   l k     & w w  x y x Z      z {�� | z =      } ~ } n      �  1    ��
�� 
leng � o     ���� 0 parametername parameterName ~ m    ����   { r     � � � m    	 � � � � �  d i r e c t � o      ���� 0 parametername parameterName��   | r     � � � b     � � � b     � � � m     � � � � �   � o    ���� 0 parametername parameterName � m     � � � � �   � o      ���� 0 parametername parameterName y  ��� � R    &�� � �
�� .ascrerr ****      � **** � b    % � � � b    # � � � b    ! � � � m     � � � � �  I n v a l i d   � o     ���� 0 parametername parameterName � m   ! " � � � � �    p a r a m e t e r :   � o   # $���� $0 errordescription errorDescription � �� � �
�� 
errn � o    ���� 0 errornumber errorNumber � �� � �
�� 
erob � o    ���� 0 thevalue theValue � �� ���
�� 
errt � o    ���� 0 expectedtype expectedType��  ��   j  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� .0 throwinvalidparameter throwInvalidParameter �  � � � o      ���� 0 thevalue theValue �  � � � o      ���� 0 parametername parameterName �  � � � o      ���� 0 expectedtype expectedType �  ��� � o      ���� $0 errordescription errorDescription��  ��   � I     
�� ����� 00 _throwinvalidparameter _throwInvalidParameter �  � � � o    ���� 0 thevalue theValue �  � � � o    ���� 0 parametername parameterName �  � � � o    ���� 0 expectedtype expectedType �  � � � o    ���� $0 errordescription errorDescription �  ��� � m    �����Y��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� 80 throwinvalidparameterindex throwInvalidParameterIndex �  � � � o      ���� 0 thevalue theValue �  ��� � o      ���� 0 parametername parameterName��  ��   � l    
 � � � � I     
�� ����� 00 _throwinvalidparameter _throwInvalidParameter �  � � � o    ���� 0 thevalue theValue �  � � � o    ���� 0 parametername parameterName �  � � � m    ��
�� 
long �  � � � m     � � � � � , I n d e x   i s   o u t   o f   r a n g e . �  ��� � m    �����@��  ��   �   can't get list item    � � � � (   c a n ' t   g e t   l i s t   i t e m �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� 60 throwinvalidparametertype throwInvalidParameterType �  � � � o      ���� 0 thevalue theValue �  � � � o      ���� 0 parametername parameterName �  � � � o      �� 0 expectedtype expectedType �  ��~ � o      �}�} $0 expectedtypename expectedTypeName�~  ��   � k     9 � �  � � � Q     ) � � � � Z     � ��| � � >     � � � l    ��{�z � I   �y � �
�y .corecnte****       **** � J     � �  ��x � o    �w�w 0 thevalue theValue�x   � �v ��u
�v 
kocl � m    �t
�t 
obj �u  �{  �z   � m    �s�s   � r     � � � m     � � � � � .   b u t   r e c e i v e d   s p e c i f i e r � o      �r�r  0 actualtypename actualTypeName�|   � l    � � � � r     �  � b     m     �    b u t   r e c e i v e d   l   �q�p n    m    �o
�o 
pcls o    �n�n 0 thevalue theValue�q  �p    o      �m�m  0 actualtypename actualTypeName � include the value's type name in error message; note: this will display as raw four-char code when terminology isn't available, or may be a custom value in the case of records and scripts, but this can't be helped as it's a limitation of AppleScript itself    � �   i n c l u d e   t h e   v a l u e ' s   t y p e   n a m e   i n   e r r o r   m e s s a g e ;   n o t e :   t h i s   w i l l   d i s p l a y   a s   r a w   f o u r - c h a r   c o d e   w h e n   t e r m i n o l o g y   i s n ' t   a v a i l a b l e ,   o r   m a y   b e   a   c u s t o m   v a l u e   i n   t h e   c a s e   o f   r e c o r d s   a n d   s c r i p t s ,   b u t   t h i s   c a n ' t   b e   h e l p e d   a s   i t ' s   a   l i m i t a t i o n   o f   A p p l e S c r i p t   i t s e l f � R      �l�k�j
�l .ascrerr ****      � ****�k  �j   � r   & )	
	 m   & ' �  
 o      �i�i  0 actualtypename actualTypeName � �h I   * 9�g�f�g .0 throwinvalidparameter throwInvalidParameter  o   + ,�e�e 0 thevalue theValue  o   , -�d�d 0 parametername parameterName  o   - .�c�c 0 expectedtype expectedType �b b   . 5 b   . 3 b   . 1 m   . / �  E x p e c t e d   o   / 0�a�a $0 expectedtypename expectedTypeName o   1 2�`�`  0 actualtypename actualTypeName m   3 4 �  .�b  �f  �h   �  !  l     �_�^�]�_  �^  �]  ! "#" l     �\�[�Z�\  �[  �Z  # $%$ i   "&'& I      �Y(�X�Y >0 throwinvalidconstantparameter throwInvalidConstantParameter( )*) o      �W�W 0 thevalue theValue* +�V+ o      �U�U 0 parametername parameterName�V  �X  ' I     	�T,�S�T .0 throwinvalidparameter throwInvalidParameter, -.- o    �R�R 0 thevalue theValue. /0/ o    �Q�Q 0 parametername parameterName0 121 m    �P
�P 
enum2 3�O3 m    44 �55 0 N o t   a n   a l l o w e d   c o n s t a n t .�O  �S  % 676 l     �N�M�L�N  �M  �L  7 898 l     �K�J�I�K  �J  �I  9 :;: l     �H�G�F�H  �G  �F  ; <=< l     �E�D�C�E  �D  �C  = >?> l     �B�A�@�B  �A  �@  ? @A@ i  # &BCB I      �?D�>�? 0 rethrowerror rethrowErrorD EFE o      �=�= 0 libraryname libraryNameF GHG o      �<�< 0 handlername handlerNameH IJI o      �;�; 0 etext eTextJ KLK o      �:�: 0 enumber eNumberL MNM o      �9�9 0 efrom eFromN OPO o      �8�8 
0 eto eToP QRQ o      �7�7 $0 targetobjectname targetObjectNameR S�6S o      �5�5 0 partialresult partialResult�6  �>  C l    CTUVT k     CWW XYX Z     #Z[�4\Z =    ]^] o     �3�3 $0 targetobjectname targetObjectName^ m    �2
�2 
msng[ r    _`_ b    aba b    cdc b    efe b    	ghg o    �1�1 0 libraryname libraryNameh m    ii �jj    l i b r a r y   c a n  t  f o   	 
�0�0 0 handlername handlerNamed m    kk �ll  :  b o    �/�/ 0 etext eText` o      �.�. 0 etext eText�4  \ r    #mnm b    !opo b    qrq b    sts b    uvu b    wxw b    yzy o    �-�- 0 libraryname libraryNamez m    {{ �||    l i b r a r y  s  x o    �,�, $0 targetobjectname targetObjectNamev m    }} �~~    c a n  t  t o    �+�+ 0 handlername handlerNamer m     ���  :  p o     �*�* 0 etext eTextn o      �)�) 0 etext eTextY ��(� Z   $ C���'�� =  $ '��� o   $ %�&�& 0 partialresult partialResult� m   % &�%
�% 
msng� R   * 4�$��
�$ .ascrerr ****      � ****� o   2 3�#�# 0 etext eText� �"��
�" 
errn� o   , -�!�! 0 enumber eNumber� � ��
�  
erob� o   . /�� 0 efrom eFrom� ���
� 
errt� o   0 1�� 
0 eto eTo�  �'  � R   7 C���
� .ascrerr ****      � ****� o   A B�� 0 etext eText� ���
� 
errn� o   9 :�� 0 enumber eNumber� ���
� 
erob� o   ; <�� 0 efrom eFrom� ���
� 
errt� o   = >�� 
0 eto eTo� ���
� 
ptlr� o   ? @�� 0 partialresult partialResult�  �(  U ~ x targetObjectName and partialResult should be `missing value` if unused; if eTo is unused, AS seems to be to pass `item`   V ��� �   t a r g e t O b j e c t N a m e   a n d   p a r t i a l R e s u l t   s h o u l d   b e   ` m i s s i n g   v a l u e `   i f   u n u s e d ;   i f   e T o   i s   u n u s e d ,   A S   s e e m s   t o   b e   t o   p a s s   ` i t e m `A ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     �
���
  � � � convenience shortcuts for rethrowError() when targetObjectName and/or partialResult parameters aren't used (since AS handlers don't support optional parameters unless SDEFs are used, which only creates more complexity and challenges)   � ����   c o n v e n i e n c e   s h o r t c u t s   f o r   r e t h r o w E r r o r ( )   w h e n   t a r g e t O b j e c t N a m e   a n d / o r   p a r t i a l R e s u l t   p a r a m e t e r s   a r e n ' t   u s e d   ( s i n c e   A S   h a n d l e r s   d o n ' t   s u p p o r t   o p t i o n a l   p a r a m e t e r s   u n l e s s   S D E F s   a r e   u s e d ,   w h i c h   o n l y   c r e a t e s   m o r e   c o m p l e x i t y   a n d   c h a l l e n g e s )� ��� l     �	���	  �  �  � ��� i  ' *��� I      ���� &0 throwcommanderror throwCommandError� ��� o      �� 0 libraryname libraryName� ��� o      �� 0 handlername handlerName� ��� o      �� 0 etext eText� ��� o      �� 0 enumber eNumber� ��� o      � �  0 efrom eFrom� ���� o      ���� 
0 eto eTo��  �  � R     �����
�� .ascrerr ****      � ****� I    ������� 0 rethrowerror rethrowError� ��� o    ���� 0 libraryname libraryName� ��� o    ���� 0 handlername handlerName� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ��� o    	���� 
0 eto eTo� ��� m   	 
��
�� 
msng� ���� m   
 ��
�� 
msng��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  + .��� I      ������� $0 throwmethoderror throwMethodError� ��� o      ���� 0 libraryname libraryName� ��� o      ���� $0 targetobjectname targetObjectName� ��� o      ���� 0 handlername handlerName� ��� o      ���� 0 etext eText� ��� o      ���� 0 enumber eNumber� ��� o      ���� 0 efrom eFrom� ���� o      ���� 
0 eto eTo��  ��  � R     �����
�� .ascrerr ****      � ****� I    ������� 0 rethrowerror rethrowError� ��� o    ���� 0 libraryname libraryName� ��� o    ���� 0 handlername handlerName� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ��� o    	���� 
0 eto eTo� ��� o   	 
���� $0 targetobjectname targetObjectName� ���� m   
 ��
�� 
msng��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � convenience handlers for coercing values to commonly-used AppleScript types; these are more strict than AppleScript�s basic �VALUE as TYPE� coercions as they also reject ambiguous or problematic values, e.g. `asNumber(Wednesday)` or `asText({"foo", "bar"})`   � ���   c o n v e n i e n c e   h a n d l e r s   f o r   c o e r c i n g   v a l u e s   t o   c o m m o n l y - u s e d   A p p l e S c r i p t   t y p e s ;   t h e s e   a r e   m o r e   s t r i c t   t h a n   A p p l e S c r i p t  s   b a s i c    V A L U E   a s   T Y P E    c o e r c i o n s   a s   t h e y   a l s o   r e j e c t   a m b i g u o u s   o r   p r o b l e m a t i c   v a l u e s ,   e . g .   ` a s N u m b e r ( W e d n e s d a y ) `   o r   ` a s T e x t ( { " f o o " ,   " b a r " } ) `� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  / 2� � I      ������ 0 asnumber asNumber �� o      ���� 0 thevalue theValue��  ��    k     d  l      ����   � �
	This is more strict than AS's `NUMBER as number` coercion as it prevents booleans, month/weekday constants, empty text, or other possibly unintended values coercing to numbers.
	    �h 
 	 T h i s   i s   m o r e   s t r i c t   t h a n   A S ' s   ` N U M B E R   a s   n u m b e r `   c o e r c i o n   a s   i t   p r e v e n t s   b o o l e a n s ,   m o n t h / w e e k d a y   c o n s t a n t s ,   e m p t y   t e x t ,   o r   o t h e r   p o s s i b l y   u n i n t e n d e d   v a l u e s   c o e r c i n g   t o   n u m b e r s . 
 	 	
	 l     r      c      o     ���� 0 thevalue theValue m    ��
�� 
**** o      ���� 0 thevalue theValue ; 5 make sure ASOC objects are coerced to AS equivalents    � j   m a k e   s u r e   A S O C   o b j e c t s   a r e   c o e r c e d   t o   A S   e q u i v a l e n t s
  Z    (���� F     =     l   ���� I   ��
�� .corecnte****       **** J    	 �� o    ���� 0 thevalue theValue��   �� ��
�� 
kocl  m   
 ��
�� 
list��  ��  ��   m    ����  =    !"! n   #$# 1    ��
�� 
leng$ o    ���� 0 thevalue theValue" m    ����  l   $%&'% r    $()( n   "*+* 4    "��,
�� 
cobj, m     !���� + o    ���� 0 thevalue theValue) o      ���� 0 thevalue theValue&   unwrap single-item list   ' �-- 0   u n w r a p   s i n g l e - i t e m   l i s t��  ��   ./. l  ) )��01��  0 � � (note that `count {theValue} each type/constant` doesn't work as `count` command *always* returns 0 for these types, therefore it's necessary to use a whitelist rather than blacklist check)   1 �22|   ( n o t e   t h a t   ` c o u n t   { t h e V a l u e }   e a c h   t y p e / c o n s t a n t `   d o e s n ' t   w o r k   a s   ` c o u n t `   c o m m a n d   * a l w a y s *   r e t u r n s   0   f o r   t h e s e   t y p e s ,   t h e r e f o r e   i t ' s   n e c e s s a r y   t o   u s e   a   w h i t e l i s t   r a t h e r   t h a n   b l a c k l i s t   c h e c k )/ 343 Z   ) Y56����5 l  ) N7����7 G   ) N898 =   ) 4:;: l  ) 2<����< I  ) 2��=>
�� .corecnte****       ****= J   ) ,?? @��@ o   ) *���� 0 thevalue theValue��  > ��A��
�� 
koclA m   - .��
�� 
nmbr��  ��  ��  ; m   2 3���� 9 F   7 LBCB =   7 BDED l  7 @F����F I  7 @��GH
�� .corecnte****       ****G J   7 :II J��J o   7 8���� 0 thevalue theValue��  H ��K��
�� 
koclK m   ; <��
�� 
ctxt��  ��  ��  E m   @ A���� C ?   E JLML n  E HNON 1   F H��
�� 
lengO o   E F���� 0 thevalue theValueM m   H I����  ��  ��  6 L   Q UPP c   Q TQRQ o   Q R���� 0 thevalue theValueR m   R S��
�� 
nmbr��  ��  4 S��S R   Z d��TU
�� .ascrerr ****      � ****T m   b cVV �WW X C a n  t   c o e r c e   t o   n u m b e r   ( n o t   a   v a l i d   n u m b e r ) .U ��XY
�� 
errnX m   \ ]�����\Y ��Z[
�� 
erobZ o   ^ _���� 0 thevalue theValue[ ��\��
�� 
errt\ l  ` a]����] m   ` a��
�� 
nmbr��  ��  ��  ��  � ^_^ l     ��������  ��  ��  _ `a` l     �������  ��  �  a bcb i  3 6ded I      �~f�}�~ 0 aswholenumber asWholeNumberf g�|g o      �{�{ 0 thevalue theValue�|  �}  e k     "hh iji l      �zkl�z  k%
		Like `asNumber`, this prevents potentially inappropriate or unintended values coercing to numbers; conversely, it accepts non-fractional real numbers, allowing whole numbers outside the range supported by AppleScript's native 30-bit integer type (which is limited to approx. �500M).
	   l �mm> 
 	 	 L i k e   ` a s N u m b e r ` ,   t h i s   p r e v e n t s   p o t e n t i a l l y   i n a p p r o p r i a t e   o r   u n i n t e n d e d   v a l u e s   c o e r c i n g   t o   n u m b e r s ;   c o n v e r s e l y ,   i t   a c c e p t s   n o n - f r a c t i o n a l   r e a l   n u m b e r s ,   a l l o w i n g   w h o l e   n u m b e r s   o u t s i d e   t h e   r a n g e   s u p p o r t e d   b y   A p p l e S c r i p t ' s   n a t i v e   3 0 - b i t   i n t e g e r   t y p e   ( w h i c h   i s   l i m i t e d   t o   a p p r o x .   � 5 0 0 M ) . 
 	j non r     pqp I     �yr�x�y 0 asnumber asNumberr s�ws o    �v�v 0 thevalue theValue�w  �x  q o      �u�u 0 	thenumber 	theNumbero tut Z  	 vw�t�sv >   	 xyx `   	 z{z o   	 
�r�r 0 	thenumber 	theNumber{ m   
 �q�q y m    �p�p  w R    �o|}
�o .ascrerr ****      � ****| m    ~~ � � C a n  t   c o e r c e   t o   w h o l e   n u m b e r   ( n o t   a n   i n t e g e r   o r   n o n - f r a c t i o n a l   r e a l ) .} �n��
�n 
errn� m    �m�m�\� �l��
�l 
erob� o    �k�k 0 thevalue theValue� �j��i
�j 
errt� l   ��h�g� m    �f
�f 
nmbr�h  �g  �i  �t  �s  u ��� l     �e���e  � L F TO DO: error if number cannot be represented non-lossily as 64-bit FP   � ��� �   T O   D O :   e r r o r   i f   n u m b e r   c a n n o t   b e   r e p r e s e n t e d   n o n - l o s s i l y   a s   6 4 - b i t   F P� ��d� L     "�� o     !�c�c 0 	thenumber 	theNumber�d  c ��� l     �b�a�`�b  �a  �`  � ��� l     �_�^�]�_  �^  �]  � ��� i  7 :��� I      �\��[�\ 0 	asinteger 	asInteger� ��Z� o      �Y�Y 0 thevalue theValue�Z  �[  � k     $�� ��� l      �X���X  � � �
		Like `asNumber`, this prevents potentially inappropriate or unintended values coercing to integers; in addition, it raises a coercion error if the number cannot be represented .
	   � ���l 
 	 	 L i k e   ` a s N u m b e r ` ,   t h i s   p r e v e n t s   p o t e n t i a l l y   i n a p p r o p r i a t e   o r   u n i n t e n d e d   v a l u e s   c o e r c i n g   t o   i n t e g e r s ;   i n   a d d i t i o n ,   i t   r a i s e s   a   c o e r c i o n   e r r o r   i f   t h e   n u m b e r   c a n n o t   b e   r e p r e s e n t e d   . 
 	� ��� r     ��� I     �W��V�W 0 asnumber asNumber� ��U� o    �T�T 0 thevalue theValue�U  �V  � o      �S�S 0 	thenumber 	theNumber� ��� Z  	 ���R�Q� >   	 ��� `   	 ��� o   	 
�P�P 0 	thenumber 	theNumber� m   
 �O�O � m    �N�N  � R    �M��
�M .ascrerr ****      � ****� m    �� ��� 0 C a n  t   c o e r c e   t o   i n t e g e r .� �L��
�L 
errn� m    �K�K�\� �J��
�J 
erob� o    �I�I 0 thevalue theValue� �H��G
�H 
errt� l   ��F�E� m    �D
�D 
long�F  �E  �G  �R  �Q  � ��C� L     $�� c     #��� o     !�B�B 0 	thenumber 	theNumber� m   ! "�A
�A 
long�C  � ��� l     �@�?�>�@  �?  �>  � ��� l     �=�<�;�=  �<  �;  � ��� i  ; >��� I      �:��9�: 0 astext asText� ��8� o      �7�7 0 thevalue theValue�8  �9  � k     X�� ��� l      �6���6  � � �
		Unlike AppleScript�s �VALUE as text� coercion, this disallows multi-item lists as the result of coercing a multi-item list to text is highly dependent on the user�s current TIDs setting and therefore unpredictable.
	   � ���� 
 	 	 U n l i k e   A p p l e S c r i p t  s    V A L U E   a s   t e x t    c o e r c i o n ,   t h i s   d i s a l l o w s   m u l t i - i t e m   l i s t s   a s   t h e   r e s u l t   o f   c o e r c i n g   a   m u l t i - i t e m   l i s t   t o   t e x t   i s   h i g h l y   d e p e n d e n t   o n   t h e   u s e r  s   c u r r e n t   T I D s   s e t t i n g   a n d   t h e r e f o r e   u n p r e d i c t a b l e . 
 	� ��� Z     S���5�4� =     ��� l    	��3�2� I    	�1��
�1 .corecnte****       ****� J     �� ��0� o     �/�/ 0 thevalue theValue�0  � �.��-
�. 
kocl� m    �,
�, 
list�-  �3  �2  � m   	 
�+�+ � k    O�� ��� Z    D����*� =    ��� n   ��� 1    �)
�) 
leng� o    �(�( 0 thevalue theValue� m    �'�' � k    3�� ��� l   ���� r    ��� n   ��� 4    �&�
�& 
cobj� m    �%�% � o    �$�$ 0 thevalue theValue� o      �#�# 0 thevalue theValue� K E unwrap single-item list (note that nested lists are also disallowed)   � ��� �   u n w r a p   s i n g l e - i t e m   l i s t   ( n o t e   t h a t   n e s t e d   l i s t s   a r e   a l s o   d i s a l l o w e d )� ��"� Z   3���!� � =    (��� l   &���� I   &���
� .corecnte****       ****� J     �� ��� o    �� 0 thevalue theValue�  � ���
� 
kocl� m   ! "�
� 
list�  �  �  � m   & '��  � L   + /�� c   + .��� o   + ,�� 0 thevalue theValue� m   , -�
� 
ctxt�!  �   �"  � ��� =   6 ;��� n  6 9��� 1   7 9�
� 
leng� o   6 7�� 0 thevalue theValue� m   9 :��  � ��� L   > @   m   > ? �  �  �*  � � R   E O�
� .ascrerr ****      � **** m   M N � * C a n  t   c o e r c e   t o   t e x t . �	
� 
errn m   G H���\	 �

� 
erob
 o   I J�� 0 thevalue theValue �
�	
�
 
errt l  K L�� m   K L�
� 
ctxt�  �  �	  �  �5  �4  � � L   T X c   T W o   T U�� 0 thevalue theValue m   U V�
� 
ctxt�  �  l     ��� �  �  �     l     ��������  ��  ��    i  ? B I      ������ 0 aslist asList �� o      ���� 0 thevalue theValue��  ��   k       l      �� ��  rl 
	A more robust alternative to `theValue as list` that handles records correctly, e.g. `asList({a:1,b:2})` returns `{{a:1,b:2}}` instead of `{1,2}` (AS's record-to-list coercion handler stupidly strips the record's keys, returning just its values, whereas its other TYPE-to-list coercion handlers simply wrap non-list values as a single-item list)	
	Caution: if the value is a list, it is returned as-is; handlers should not modify user-supplied lists in-place (unless that is an explicitly documented feature), but instead shallow copy it when needed, e.g. `set theListCopy to ITEMS OF asListParameter(theList,"")`.
	     �!!�   
 	 A   m o r e   r o b u s t   a l t e r n a t i v e   t o   ` t h e V a l u e   a s   l i s t `   t h a t   h a n d l e s   r e c o r d s   c o r r e c t l y ,   e . g .   ` a s L i s t ( { a : 1 , b : 2 } ) `   r e t u r n s   ` { { a : 1 , b : 2 } } `   i n s t e a d   o f   ` { 1 , 2 } `   ( A S ' s   r e c o r d - t o - l i s t   c o e r c i o n   h a n d l e r   s t u p i d l y   s t r i p s   t h e   r e c o r d ' s   k e y s ,   r e t u r n i n g   j u s t   i t s   v a l u e s ,   w h e r e a s   i t s   o t h e r   T Y P E - t o - l i s t   c o e r c i o n   h a n d l e r s   s i m p l y   w r a p   n o n - l i s t   v a l u e s   a s   a   s i n g l e - i t e m   l i s t )  	 
 	 C a u t i o n :   i f   t h e   v a l u e   i s   a   l i s t ,   i t   i s   r e t u r n e d   a s - i s ;   h a n d l e r s   s h o u l d   n o t   m o d i f y   u s e r - s u p p l i e d   l i s t s   i n - p l a c e   ( u n l e s s   t h a t   i s   a n   e x p l i c i t l y   d o c u m e n t e d   f e a t u r e ) ,   b u t   i n s t e a d   s h a l l o w   c o p y   i t   w h e n   n e e d e d ,   e . g .   ` s e t   t h e L i s t C o p y   t o   I T E M S   O F   a s L i s t P a r a m e t e r ( t h e L i s t , " " ) ` . 
 	 "#" l     ��$%��  $ � � set theValue to theValue as any  -- TO DO: this is debatable (e.g. what if value is specifier?); also AS can't coerce records to `any`   % �&&   s e t   t h e V a l u e   t o   t h e V a l u e   a s   a n y     - -   T O   D O :   t h i s   i s   d e b a t a b l e   ( e . g .   w h a t   i f   v a l u e   i s   s p e c i f i e r ? ) ;   a l s o   A S   c a n ' t   c o e r c e   r e c o r d s   t o   ` a n y `# '(' l     ��)*��  ) 7 1 TO DO: if value is NSArray, coerce it to AS list   * �++ b   T O   D O :   i f   v a l u e   i s   N S A r r a y ,   c o e r c e   i t   t o   A S   l i s t( ,-, Z    ./����. =     010 l    	2����2 I    	��34
�� .corecnte****       ****3 J     55 6��6 o     ���� 0 thevalue theValue��  4 ��7��
�� 
kocl7 m    ��
�� 
list��  ��  ��  1 m   	 
���� / L    88 o    ���� 0 thevalue theValue��  ��  - 9��9 L    :: J    ;; <��< o    ���� 0 thevalue theValue��  ��   =>= l     ��������  ��  ��  > ?@? l     ��������  ��  ��  @ ABA l     ��CD��  C J D--------------------------------------------------------------------   D �EE � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -B FGF l     ��HI��  Hrl convenience handlers for coercing parameters to commonly-used AppleScript types, throwing a descriptive error if the coercion fails; use these to ensure parameters to library handlers are of the correct type (while AS handlers allow parameters to be directly annotated with `as TYPE` clauses, these are limited in capability and do not produce descriptive errors)   I �JJ�   c o n v e n i e n c e   h a n d l e r s   f o r   c o e r c i n g   p a r a m e t e r s   t o   c o m m o n l y - u s e d   A p p l e S c r i p t   t y p e s ,   t h r o w i n g   a   d e s c r i p t i v e   e r r o r   i f   t h e   c o e r c i o n   f a i l s ;   u s e   t h e s e   t o   e n s u r e   p a r a m e t e r s   t o   l i b r a r y   h a n d l e r s   a r e   o f   t h e   c o r r e c t   t y p e   ( w h i l e   A S   h a n d l e r s   a l l o w   p a r a m e t e r s   t o   b e   d i r e c t l y   a n n o t a t e d   w i t h   ` a s   T Y P E `   c l a u s e s ,   t h e s e   a r e   l i m i t e d   i n   c a p a b i l i t y   a n d   d o   n o t   p r o d u c e   d e s c r i p t i v e   e r r o r s )G KLK l     ��������  ��  ��  L MNM l     ��������  ��  ��  N OPO i  C FQRQ I      ��S���� (0 asbooleanparameter asBooleanParameterS TUT o      ���� 0 thevalue theValueU V��V o      ���� 0 parametername parameterName��  ��  R Q     WXYW L    ZZ c    [\[ o    ���� 0 thevalue theValue\ m    ��
�� 
boolX R      ����]
�� .ascrerr ****      � ****��  ] ��^��
�� 
errn^ d      __ m      �������  Y I    ��`���� 60 throwinvalidparametertype throwInvalidParameterType` aba o    ���� 0 thevalue theValueb cdc o    ���� 0 parametername parameterNamed efe m    ��
�� 
boolf g��g m    hh �ii  b o o l e a n��  ��  P jkj l     ��������  ��  ��  k lml l     ��������  ��  ��  m non i  G Jpqp I      ��r���� (0 asintegerparameter asIntegerParameterr sts o      ���� 0 thevalue theValuet u��u o      ���� 0 parametername parameterName��  ��  q Q     vwxv L    yy c    z{z I    	��|���� 0 aswholenumber asWholeNumber| }��} o    ���� 0 thevalue theValue��  ��  { m   	 
��
�� 
longw R      ����~
�� .ascrerr ****      � ****��  ~ ����
�� 
errn d      �� m      �������  x I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thevalue theValue� ��� o    ���� 0 parametername parameterName� ��� m    ��
�� 
long� ���� m    �� ���  i n t e g e r��  ��  o ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  K N��� I      ������� 00 aswholenumberparameter asWholeNumberParameter� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 parametername parameterName��  ��  � l    ���� Q     ���� L    
�� I    	������� 0 aswholenumber asWholeNumber� ���� o    ���� 0 thevalue theValue��  ��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thevalue theValue� ��� o    ���� 0 parametername parameterName� ��� m    ��
�� 
nmbr� ���� m    �� ��� < i n t e g e r   o r   n o n - f r a c t i o n a l   r e a l��  ��  � � � this should be used instead of asIntegerParameter when non-fractional numbers are required but do not have to be specifically of integer type (which is limited in range to �2^30)   � ���f   t h i s   s h o u l d   b e   u s e d   i n s t e a d   o f   a s I n t e g e r P a r a m e t e r   w h e n   n o n - f r a c t i o n a l   n u m b e r s   a r e   r e q u i r e d   b u t   d o   n o t   h a v e   t o   b e   s p e c i f i c a l l y   o f   i n t e g e r   t y p e   ( w h i c h   i s   l i m i t e d   i n   r a n g e   t o   � 2 ^ 3 0 )� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  O R��� I      ������� &0 asnumberparameter asNumberParameter� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 parametername parameterName��  ��  � Q     ���� L    
�� I    	������� 0 asnumber asNumber� ���� o    ���� 0 thevalue theValue��  ��  � R      �����
�� .ascrerr ****      � ****��  � ����
�� 
errn� d      �� m      �~�~��  � I    �}��|�} 60 throwinvalidparametertype throwInvalidParameterType� ��� o    �{�{ 0 thevalue theValue� ��� o    �z�z 0 parametername parameterName� ��� m    �y
�y 
nmbr� ��x� m    �� ���  n u m b e r�x  �|  � ��� l     �w�v�u�w  �v  �u  � ��� l     �t�s�r�t  �s  �r  � ��� i  S V��� I      �q��p�q "0 asrealparameter asRealParameter� ��� o      �o�o 0 thevalue theValue� ��n� o      �m�m 0 parametername parameterName�n  �p  � Q     ���� L    �� c    ��� I    	�l��k�l 0 asnumber asNumber� ��j� o    �i�i 0 thevalue theValue�j  �k  � m   	 
�h
�h 
doub� R      �g�f�
�g .ascrerr ****      � ****�f  � �e��d
�e 
errn� d      �� m      �c�c��d  � I    �b��a�b 60 throwinvalidparametertype throwInvalidParameterType� ��� o    �`�` 0 thevalue theValue� ��� o    �_�_ 0 parametername parameterName� ��� m    �^
�^ 
doub� ��]� m    �� ���  r e a l�]  �a  � ��� l     �\�[�Z�\  �[  �Z  � ��� l     �Y�X�W�Y  �X  �W  � ��� l     �V�U�T�V  �U  �T  � ��� l     �S�R�Q�S  �R  �Q  � ��� l     �P�O�N�P  �O  �N  � ��� i  W Z��� I      �M��L�M "0 astextparameter asTextParameter� ��� o      �K�K 0 thevalue theValue� ��J� o      �I�I 0 parametername parameterName�J  �L  � l       Q      L    
 I    	�H�G�H 0 astext asText �F o    �E�E 0 thevalue theValue�F  �G   R      �D�C	
�D .ascrerr ****      � ****�C  	 �B
�A
�B 
errn
 d       m      �@�@��A   I    �?�>�? 60 throwinvalidparametertype throwInvalidParameterType  o    �=�= 0 thevalue theValue  o    �<�< 0 parametername parameterName  m    �;
�; 
ctxt �: m     �  t e x t�:  �>   � TO DO: should lists be rejected for safety? (while coercing numbers and dates to text is at least predictable within a process's lifetime, coercing list to text is dependent on whatever TIDs are set at the time so can't be guaranteed even to do that)    ��   T O   D O :   s h o u l d   l i s t s   b e   r e j e c t e d   f o r   s a f e t y ?   ( w h i l e   c o e r c i n g   n u m b e r s   a n d   d a t e s   t o   t e x t   i s   a t   l e a s t   p r e d i c t a b l e   w i t h i n   a   p r o c e s s ' s   l i f e t i m e ,   c o e r c i n g   l i s t   t o   t e x t   i s   d e p e n d e n t   o n   w h a t e v e r   T I D s   a r e   s e t   a t   t h e   t i m e   s o   c a n ' t   b e   g u a r a n t e e d   e v e n   t o   d o   t h a t )�  l     �9�8�7�9  �8  �7    l     �6�5�4�6  �5  �4    i  [ ^ I      �3�2�3 "0 asdateparameter asDateParameter  !  o      �1�1 0 thevalue theValue! "�0" o      �/�/ 0 parametername parameterName�0  �2   Q     #$%# l   &'(& L    )) c    *+* o    �.�. 0 thevalue theValue+ m    �-
�- 
ldt '71 note that this fails for anything except date or NSDate (while it would be possible to try `date theValue` as well, it's probably best not to as AS's text-to-date conversion is locale-sensitive, so an ambiguous date string such as "12/11/10" would produce unpredictable results rather than fail outright)   ( �,,b   n o t e   t h a t   t h i s   f a i l s   f o r   a n y t h i n g   e x c e p t   d a t e   o r   N S D a t e   ( w h i l e   i t   w o u l d   b e   p o s s i b l e   t o   t r y   ` d a t e   t h e V a l u e `   a s   w e l l ,   i t ' s   p r o b a b l y   b e s t   n o t   t o   a s   A S ' s   t e x t - t o - d a t e   c o n v e r s i o n   i s   l o c a l e - s e n s i t i v e ,   s o   a n   a m b i g u o u s   d a t e   s t r i n g   s u c h   a s   " 1 2 / 1 1 / 1 0 "   w o u l d   p r o d u c e   u n p r e d i c t a b l e   r e s u l t s   r a t h e r   t h a n   f a i l   o u t r i g h t )$ R      �,�+-
�, .ascrerr ****      � ****�+  - �*.�)
�* 
errn. d      // m      �(�(��)  % I    �'0�&�' 60 throwinvalidparametertype throwInvalidParameterType0 121 o    �%�% 0 thevalue theValue2 343 o    �$�$ 0 parametername parameterName4 565 m    �#
�# 
ldt 6 7�"7 m    88 �99  d a t e�"  �&   :;: l     �!� ��!  �   �  ; <=< l     ����  �  �  = >?> i  _ b@A@ I      �B�� "0 aslistparameter asListParameterB CDC o      �� 0 thevalue theValueD E�E o      �� 0 parametername parameterName�  �  A l    FGHF L     II I     �J�� 0 aslist asListJ K�K o    �� 0 thevalue theValue�  �  G � | takes parameterName, even though it's unused, for consistency with other `asTYPEParameter` handlers, reducing risk of typos   H �LL �   t a k e s   p a r a m e t e r N a m e ,   e v e n   t h o u g h   i t ' s   u n u s e d ,   f o r   c o n s i s t e n c y   w i t h   o t h e r   ` a s T Y P E P a r a m e t e r `   h a n d l e r s ,   r e d u c i n g   r i s k   o f   t y p o s? MNM l     ����  �  �  N OPO l     ����  �  �  P QRQ i  c fSTS I      �U�� &0 asrecordparameter asRecordParameterU VWV o      �
�
 0 thevalue theValueW X�	X o      �� 0 parametername parameterName�	  �  T k     YY Z[Z l      �\]�  \��
TO DO: variant of this that also accepts defaultRecord parameter, merging the two and checking for any missing properties; simplest way to do that is for defaultRecord to use RequiredValue placeholder, coerce to list, and look for that)

e.g. from TestTool's TestSupport sub-library (although this makes some case-specific assumptions that won't work for a general-purpose solution):

to normalizeExpectedErrorRecord(errorRecord) -- ensure error info record has all the correct properties and that at least one of them is populated	-- make sure errorRecord contains at least one valid property and no invalid ones (note: this uses NoValue placeholders so isn't suitable for sending out of current AS instance)	if errorRecord's length = 0 then error "Invalid �is� parameter (error record contained no properties)." number -1703 from errorRecord to record	set normalizedRecord to errorRecord & _defaultErrorRecord	if normalizedRecord's length � _defaultErrorRecord's length then error "Invalid �is� parameter (error record contained unrecognized properties)." number -1703 from errorRecord to record	return normalizedRecordend normalizeExpectedErrorRecord
   ] �^^	 
 T O   D O :   v a r i a n t   o f   t h i s   t h a t   a l s o   a c c e p t s   d e f a u l t R e c o r d   p a r a m e t e r ,   m e r g i n g   t h e   t w o   a n d   c h e c k i n g   f o r   a n y   m i s s i n g   p r o p e r t i e s ;   s i m p l e s t   w a y   t o   d o   t h a t   i s   f o r   d e f a u l t R e c o r d   t o   u s e   R e q u i r e d V a l u e   p l a c e h o l d e r ,   c o e r c e   t o   l i s t ,   a n d   l o o k   f o r   t h a t ) 
 
 e . g .   f r o m   T e s t T o o l ' s   T e s t S u p p o r t   s u b - l i b r a r y   ( a l t h o u g h   t h i s   m a k e s   s o m e   c a s e - s p e c i f i c   a s s u m p t i o n s   t h a t   w o n ' t   w o r k   f o r   a   g e n e r a l - p u r p o s e   s o l u t i o n ) : 
 
 t o   n o r m a l i z e E x p e c t e d E r r o r R e c o r d ( e r r o r R e c o r d )   - -   e n s u r e   e r r o r   i n f o   r e c o r d   h a s   a l l   t h e   c o r r e c t   p r o p e r t i e s   a n d   t h a t   a t   l e a s t   o n e   o f   t h e m   i s   p o p u l a t e d  	 - -   m a k e   s u r e   e r r o r R e c o r d   c o n t a i n s   a t   l e a s t   o n e   v a l i d   p r o p e r t y   a n d   n o   i n v a l i d   o n e s   ( n o t e :   t h i s   u s e s   N o V a l u e   p l a c e h o l d e r s   s o   i s n ' t   s u i t a b l e   f o r   s e n d i n g   o u t   o f   c u r r e n t   A S   i n s t a n c e )  	 i f   e r r o r R e c o r d ' s   l e n g t h   =   0   t h e n   e r r o r   " I n v a l i d    i s    p a r a m e t e r   ( e r r o r   r e c o r d   c o n t a i n e d   n o   p r o p e r t i e s ) . "   n u m b e r   - 1 7 0 3   f r o m   e r r o r R e c o r d   t o   r e c o r d  	 s e t   n o r m a l i z e d R e c o r d   t o   e r r o r R e c o r d   &   _ d e f a u l t E r r o r R e c o r d  	 i f   n o r m a l i z e d R e c o r d ' s   l e n g t h  "`   _ d e f a u l t E r r o r R e c o r d ' s   l e n g t h   t h e n   e r r o r   " I n v a l i d    i s    p a r a m e t e r   ( e r r o r   r e c o r d   c o n t a i n e d   u n r e c o g n i z e d   p r o p e r t i e s ) . "   n u m b e r   - 1 7 0 3   f r o m   e r r o r R e c o r d   t o   r e c o r d  	 r e t u r n   n o r m a l i z e d R e c o r d  e n d   n o r m a l i z e E x p e c t e d E r r o r R e c o r d  
[ _�_ Q     `ab` L    cc c    ded o    �� 0 thevalue theValuee m    �
� 
recoa R      ��f
� .ascrerr ****      � ****�  f �g� 
� 
errng d      hh m      ������   b I    ��i���� 60 throwinvalidparametertype throwInvalidParameterTypei jkj o    ���� 0 thevalue theValuek lml o    ���� 0 parametername parameterNamem non m    ��
�� 
recoo p��p m    qq �rr  r e c o r d��  ��  �  R sts l     ��������  ��  ��  t uvu l     ��������  ��  ��  v wxw h   g t��y�� 0 requiredvalue RequiredValuey l     ��z{��  z e.g. if asOptionalRecordParameter's `defaultRecord` parameter is {foo:RequiredValue, bar:missing value}`, the `foo` property is required but the `bar` property is optional (default: `missing value`); any other properties will raise an "unrecognized properties" error   { �||   e . g .   i f   a s O p t i o n a l R e c o r d P a r a m e t e r ' s   ` d e f a u l t R e c o r d `   p a r a m e t e r   i s   { f o o : R e q u i r e d V a l u e ,   b a r : m i s s i n g   v a l u e } ` ,   t h e   ` f o o `   p r o p e r t y   i s   r e q u i r e d   b u t   t h e   ` b a r `   p r o p e r t y   i s   o p t i o n a l   ( d e f a u l t :   ` m i s s i n g   v a l u e ` ) ;   a n y   o t h e r   p r o p e r t i e s   w i l l   r a i s e   a n   " u n r e c o g n i z e d   p r o p e r t i e s "   e r r o rx }~} l     ��������  ��  ��  ~ � l     ��������  ��  ��  � ��� i  u x��� I      ������� 60 asoptionalrecordparameter asOptionalRecordParameter� ��� o      ���� 0 thevalue theValue� ��� o      ���� 0 defaultrecord defaultRecord� ���� o      ���� 0 parametername parameterName��  ��  � k     ��� ��� Q     ���� r    ��� c    ��� o    ���� 0 thevalue theValue� m    ��
�� 
reco� o      ���� 0 	therecord 	theRecord� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thevalue theValue� ��� o    ���� 0 parametername parameterName� ��� m    ��
�� 
reco� ���� m    �� ���  r e c o r d��  ��  � ��� r    "��� b     ��� o    ���� 0 defaultrecord defaultRecord� K    �� �����
�� 
pcls� m    ��
�� 
reco��  � o      ���� 0 defaultrecord defaultRecord� ��� r   # (��� b   # &��� o   # $���� 0 	therecord 	theRecord� o   $ %���� 0 defaultrecord defaultRecord� o      ���� 0 
fullrecord 
fullRecord� ��� Z  ) @������� ?   ) 0��� n  ) ,��� 1   * ,��
�� 
leng� o   ) *���� 0 
fullrecord 
fullRecord� n  , /��� 1   - /��
�� 
leng� o   , -���� 0 defaultrecord defaultRecord� I   3 <������� .0 throwinvalidparameter throwInvalidParameter� ��� o   4 5���� 0 thevalue theValue� ��� o   5 6���� 0 parametername parameterName� ��� m   6 7��
�� 
reco� ���� m   7 8�� ��� h R e c o r d   c o n t a i n s   o n e   o r   m o r e   u n r e c o g n i z e d   p r o p e r t i e s .��  ��  ��  ��  � ��� Z  A \������� E   A L��� l  A D������ c   A D��� o   A B���� 0 
fullrecord 
fullRecord� m   B C��
�� 
list��  ��  � J   D K�� ���� o   D I���� 0 requiredvalue RequiredValue��  � I   O X������� .0 throwinvalidparameter throwInvalidParameter� ��� o   P Q���� 0 thevalue theValue� ��� o   Q R���� 0 parametername parameterName� ��� m   R S��
�� 
reco� ���� m   S T�� ��� d R e c o r d   i s   m i s s i n g   o n e   o r   m o r e   r e q u i r e d   p r o p e r t i e s .��  ��  ��  ��  � ��� l  ] ����� Z  ] �������� H   ] j�� E  ] i��� J   ] c�� ��� m   ] ^��
�� 
reco� ���� n  ^ a��� m   _ a��
�� 
pcls� o   ^ _���� 0 defaultrecord defaultRecord��  � J   c h�� ���� n  c f��� m   d f��
�� 
pcls� o   c d���� 0 
fullrecord 
fullRecord��  � I   m |������� .0 throwinvalidparameter throwInvalidParameter� ��� o   n o���� 0 thevalue theValue� ��� o   o p���� 0 parametername parameterName� ��� m   p q��
�� 
reco� ���� b   q x��� b   q v��� m   q r�� ��� , N o t   a   r e c o r d   o f   c l a s s  � n  r u��� m   s u��
�� 
pcls� o   r s���� 0 defaultrecord defaultRecord� m   v w�� ���  .��  ��  ��  ��  � } w TO DO: record class needs to be passed as text as coercing type class symbol to text will give raw chevron syntax only   � ��� �   T O   D O :   r e c o r d   c l a s s   n e e d s   t o   b e   p a s s e d   a s   t e x t   a s   c o e r c i n g   t y p e   c l a s s   s y m b o l   t o   t e x t   w i l l   g i v e   r a w   c h e v r o n   s y n t a x   o n l y�  ��  L   � � o   � ����� 0 
fullrecord 
fullRecord��  �  l     ��������  ��  ��    l     ��������  ��  ��    i  y |	 I      ��
���� &0 asscriptparameter asScriptParameter
  o      ���� 0 thevalue theValue �� o      ���� 0 parametername parameterName��  ��  	 l     Q      L     c     o    ���� 0 thevalue theValue m    ��
�� 
scpt R      ����
�� .ascrerr ****      � ****��   ����
�� 
errn d       m      �������   I    ������ 60 throwinvalidparametertype throwInvalidParameterType  o    ���� 0 thevalue theValue  o    ���� 0 parametername parameterName   m    ��
�� 
scpt  !��! m    "" �##  s c r i p t��  ��   | v TO DO: should take scriptName parameter that describes script object's purpose (e.g. "sort comparator script object")    �$$ �   T O   D O :   s h o u l d   t a k e   s c r i p t N a m e   p a r a m e t e r   t h a t   d e s c r i b e s   s c r i p t   o b j e c t ' s   p u r p o s e   ( e . g .   " s o r t   c o m p a r a t o r   s c r i p t   o b j e c t " ) %&% l     ��������  ��  ��  & '(' l     ��������  ��  ��  ( )*) i  } �+,+ I      ��-���� "0 astypeparameter asTypeParameter- ./. o      ���� 0 thevalue theValue/ 0��0 o      �� 0 parametername parameterName��  ��  , Q     1231 L    44 c    565 o    �~�~ 0 thevalue theValue6 m    �}
�} 
type2 R      �|�{7
�| .ascrerr ****      � ****�{  7 �z8�y
�z 
errn8 d      99 m      �x�x��y  3 I    �w:�v�w 60 throwinvalidparametertype throwInvalidParameterType: ;<; o    �u�u 0 thevalue theValue< =>= o    �t�t 0 parametername parameterName> ?@? m    �s
�s 
type@ A�rA m    BB �CC  t y p e�r  �v  * DED l     �q�p�o�q  �p  �o  E FGF l     �n�m�l�n  �m  �l  G HIH i  � �JKJ I      �kL�j�k ,0 asposixpathparameter asPOSIXPathParameterL MNM o      �i�i 0 thevalue theValueN O�hO o      �g�g 0 parametername parameterName�h  �j  K l    .PQRP Z     .ST�fUS =     VWV l    	X�e�dX I    	�cYZ
�c .corecnte****       ****Y J     [[ \�b\ o     �a�a 0 thevalue theValue�b  Z �`]�_
�` 
kocl] m    �^
�^ 
ctxt�_  �e  �d  W m   	 
�]�] T l   ^_`^ L    aa o    �\�\ 0 thevalue theValue_jd TO DO: what if any validation should be done here? (e.g. might want to check for leading slash, and/or absence of illegal chars; would running it through NSURL help?); might be best to have separate versions of this for absolute vs relative paths (e.g. `join path` accepts either, whereas `read file` probably wants absolute path) - need to think about it   ` �bb�   T O   D O :   w h a t   i f   a n y   v a l i d a t i o n   s h o u l d   b e   d o n e   h e r e ?   ( e . g .   m i g h t   w a n t   t o   c h e c k   f o r   l e a d i n g   s l a s h ,   a n d / o r   a b s e n c e   o f   i l l e g a l   c h a r s ;   w o u l d   r u n n i n g   i t   t h r o u g h   N S U R L   h e l p ? ) ;   m i g h t   b e   b e s t   t o   h a v e   s e p a r a t e   v e r s i o n s   o f   t h i s   f o r   a b s o l u t e   v s   r e l a t i v e   p a t h s   ( e . g .   ` j o i n   p a t h `   a c c e p t s   e i t h e r ,   w h e r e a s   ` r e a d   f i l e `   p r o b a b l y   w a n t s   a b s o l u t e   p a t h )   -   n e e d   t o   t h i n k   a b o u t   i t�f  U Q    .cdec L    ff n    ghg 1    �[
�[ 
psxph l   i�Z�Yi c    jkj o    �X�X 0 thevalue theValuek m    �W
�W 
furl�Z  �Y  d R      �V�Ul
�V .ascrerr ****      � ****�U  l �Tm�S
�T 
errnm d      nn m      �R�R��S  e I   % .�Qo�P�Q 60 throwinvalidparametertype throwInvalidParameterTypeo pqp o   & '�O�O 0 thevalue theValueq rsr o   ' (�N�N 0 parametername parameterNames tut m   ( )�M
�M 
ctxtu v�Lv m   ) *ww �xx  P O S I X   p a t h�L  �P  Q given any of AS's various file identifier objects (alias, �class furl�, etc) or [presumably] POSIX path text, returns path text; caution: if theValue is text, it is assumed already to be a relative/absolute POSIX path; any validation and/or path expansion should be done by caller   R �yy2   g i v e n   a n y   o f   A S ' s   v a r i o u s   f i l e   i d e n t i f i e r   o b j e c t s   ( a l i a s ,   � c l a s s   f u r l � ,   e t c )   o r   [ p r e s u m a b l y ]   P O S I X   p a t h   t e x t ,   r e t u r n s   p a t h   t e x t ;   c a u t i o n :   i f   t h e V a l u e   i s   t e x t ,   i t   i s   a s s u m e d   a l r e a d y   t o   b e   a   r e l a t i v e / a b s o l u t e   P O S I X   p a t h ;   a n y   v a l i d a t i o n   a n d / o r   p a t h   e x p a n s i o n   s h o u l d   b e   d o n e   b y   c a l l e rI z{z l     �K�J�I�K  �J  �I  { |}| l     �H�G�F�H  �G  �F  } ~~ l     �E���E  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ��� l     �D���D  � � � convenience handlers for coercing parameters to commonly-used AppleScript-ObjC types -- TO DO: add more AS-to-ASOC handlers? also include error checking, and provide both `asNSCLASS` and `asNSCLASSParameter` variants   � ����   c o n v e n i e n c e   h a n d l e r s   f o r   c o e r c i n g   p a r a m e t e r s   t o   c o m m o n l y - u s e d   A p p l e S c r i p t - O b j C   t y p e s   - -   T O   D O :   a d d   m o r e   A S - t o - A S O C   h a n d l e r s ?   a l s o   i n c l u d e   e r r o r   c h e c k i n g ,   a n d   p r o v i d e   b o t h   ` a s N S C L A S S `   a n d   ` a s N S C L A S S P a r a m e t e r `   v a r i a n t s� ��� l     �C�B�A�C  �B  �A  � ��� l     �@���@  �  -----   � ��� 
 - - - - -� ��� l     �?���?  � � � NSString constructors (caution: unlike AppleScript text values, NSString does not ignore differences between composed and decomposed characters so must be explicitly normalized before searching/comparing)   � ����   N S S t r i n g   c o n s t r u c t o r s   ( c a u t i o n :   u n l i k e   A p p l e S c r i p t   t e x t   v a l u e s ,   N S S t r i n g   d o e s   n o t   i g n o r e   d i f f e r e n c e s   b e t w e e n   c o m p o s e d   a n d   d e c o m p o s e d   c h a r a c t e r s   s o   m u s t   b e   e x p l i c i t l y   n o r m a l i z e d   b e f o r e   s e a r c h i n g / c o m p a r i n g )� ��� l     �>�=�<�>  �=  �<  � ��� i  � ���� I      �;��:�; 0 
asnsstring 
asNSString� ��9� o      �8�8 0 thetext theText�9  �:  � l    	���� L     	�� l    ��7�6� n    ��� I    �5��4�5 &0 stringwithstring_ stringWithString_� ��3� o    �2�2 0 thetext theText�3  �4  � n    ��� o    �1�1 0 nsstring NSString� m     �0
�0 misccura�7  �6  �   parameter must be text   � ��� .   p a r a m e t e r   m u s t   b e   t e x t� ��� l     �/�.�-�/  �.  �-  � ��� l     �,�+�*�,  �+  �*  � ��� i  � ���� I      �)��(�) &0 asnsmutablestring asNSMutableString� ��'� o      �&�& 0 thetext theText�'  �(  � l    	���� L     	�� l    ��%�$� n    ��� I    �#��"�# &0 stringwithstring_ stringWithString_� ��!� o    � �  0 thetext theText�!  �"  � n    ��� o    �� "0 nsmutablestring NSMutableString� m     �
� misccura�%  �$  �   parameter must be text   � ��� .   p a r a m e t e r   m u s t   b e   t e x t� ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I      ���� ,0 asnormalizednsstring asNormalizedNSString� ��� o      �� 0 thetext theText�  �  � l    ���� l    ���� L     �� n    ��� I    ���� L0 $decomposedstringwithcanonicalmapping $decomposedStringWithCanonicalMapping�  �  � l    ���� n    ��� I    ���� &0 stringwithstring_ stringWithString_� ��� o    �� 0 thetext theText�  �  � n    ��� o    �
�
 0 nsstring NSString� m     �	
�	 misccura�  �  �y TO DO: for matching purposes, compatibility mapping might be preferable (e.g. so "?" ligature is treated as equal to "ff"); however, that would require much more complex substitution code as it would need to convert the NSString being searched to KD but insert replacement text into the original; e.g. for general discussion, see: https://www.objc.io/issues/9-strings/unicode/   � ����   T O   D O :   f o r   m a t c h i n g   p u r p o s e s ,   c o m p a t i b i l i t y   m a p p i n g   m i g h t   b e   p r e f e r a b l e   ( e . g .   s o   "�  "   l i g a t u r e   i s   t r e a t e d   a s   e q u a l   t o   " f f " ) ;   h o w e v e r ,   t h a t   w o u l d   r e q u i r e   m u c h   m o r e   c o m p l e x   s u b s t i t u t i o n   c o d e   a s   i t   w o u l d   n e e d   t o   c o n v e r t   t h e   N S S t r i n g   b e i n g   s e a r c h e d   t o   K D   b u t   i n s e r t   r e p l a c e m e n t   t e x t   i n t o   t h e   o r i g i n a l ;   e . g .   f o r   g e n e r a l   d i s c u s s i o n ,   s e e :   h t t p s : / / w w w . o b j c . i o / i s s u e s / 9 - s t r i n g s / u n i c o d e /�   parameter must be text   � ��� .   p a r a m e t e r   m u s t   b e   t e x t� ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I      ���� 0 
asnsobject 
asNSObject� �� � o      ���� 0 thevalue theValue�   �  � l    ���� L     �� n    ��� I    �������  0 objectatindex_ objectAtIndex_� ���� m    	����  ��  ��  � l    ������ n    ��� I    ������� $0 arraywithobject_ arrayWithObject_� ���� o    ���� 0 thevalue theValue��  ��  � n    ��� o    ���� 0 nsarray NSArray� m     ��
�� misccura��  ��  � 3 - convert any AS value to its Cocoa equivalent   � ��� Z   c o n v e r t   a n y   A S   v a l u e   t o   i t s   C o c o a   e q u i v a l e n t� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ��� ��  � ( " parameter checking and conversion     � D   p a r a m e t e r   c h e c k i n g   a n d   c o n v e r s i o n�  l     ��������  ��  ��    i  � � I      ������ @0 asnsregularexpressionparameter asNSRegularExpressionParameter 	
	 o      ���� 0 thetext theText
  o      ���� 0 flagoptions flagOptions �� o      ���� 0 parametername parameterName��  ��   k     >  Q     ' l    r     n    I    ������ Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_  I    ������ ,0 asnormalizednsstring asNormalizedNSString �� c    
 !  o    ���� 0 thetext theText! m    	��
�� 
ctxt��  ��   "#" o    ���� 0 flagoptions flagOptions# $��$ l   %����% m    ��
�� 
msng��  ��  ��  ��   n   &'& o    ���� *0 nsregularexpression NSRegularExpression' m    ��
�� misccura o      ���� 0 asocpattern asocPattern � � TO DO: does NSRegularExpression ever return useful error descriptions? if so, may be worth using that instead of generic error description below    �(("   T O   D O :   d o e s   N S R e g u l a r E x p r e s s i o n   e v e r   r e t u r n   u s e f u l   e r r o r   d e s c r i p t i o n s ?   i f   s o ,   m a y   b e   w o r t h   u s i n g   t h a t   i n s t e a d   o f   g e n e r i c   e r r o r   d e s c r i p t i o n   b e l o w R      ����)
�� .ascrerr ****      � ****��  ) ��*��
�� 
errn* d      ++ m      �������   I    '��,���� 60 throwinvalidparametertype throwInvalidParameterType, -.- o     ���� 0 thetext theText. /0/ o     !���� 0 parametername parameterName0 121 m   ! "��
�� 
ctxt2 3��3 m   " #44 �55  t e x t��  ��   676 Z  ( ;89����8 =  ( +:;: o   ( )���� 0 asocpattern asocPattern; m   ) *��
�� 
msng9 I   . 7��<���� .0 throwinvalidparameter throwInvalidParameter< =>= o   / 0���� 0 thetext theText> ?@? o   0 1���� 0 parametername parameterName@ ABA m   1 2��
�� 
ctxtB C��C m   2 3DD �EE ( N o t   a   v a l i d   p a t t e r n .��  ��  ��  ��  7 F��F L   < >GG o   < =���� 0 asocpattern asocPattern��   HIH l     ��������  ��  ��  I JKJ l     ��������  ��  ��  K LML i  � �NON I      ��P���� *0 asnslocaleparameter asNSLocaleParameterP QRQ o      ���� 0 
localecode 
localeCodeR S��S o      ���� 0 parametername parameterName��  ��  O k     tTT UVU l      ��WX��  W
		SDEF-defined commands that take a locale name should define a `for locale` parameter as follows:
		
			<parameter name="for locale" code="Loca" type="text" optional="yes" description="a locale identifier, e.g. �en_US�, or �current� or �none� (default: �none�)"/>
	   X �YY 
 	 	 S D E F - d e f i n e d   c o m m a n d s   t h a t   t a k e   a   l o c a l e   n a m e   s h o u l d   d e f i n e   a   ` f o r   l o c a l e `   p a r a m e t e r   a s   f o l l o w s : 
 	 	 
 	 	 	 < p a r a m e t e r   n a m e = " f o r   l o c a l e "   c o d e = " L o c a "   t y p e = " t e x t "   o p t i o n a l = " y e s "   d e s c r i p t i o n = " a   l o c a l e   i d e n t i f i e r ,   e . g .    e n _ U S  ,   o r    c u r r e n t    o r    n o n e    ( d e f a u l t :    n o n e  ) " / > 
 	V Z��Z P     t[\][ Z    s^_`a^ =   bcb o    ���� 0 
localecode 
localeCodec m    dd �ee  n o n e_ L    ff n   ghg I    �������� 0 systemlocale systemLocale��  ��  h n   iji o    ���� 0 nslocale NSLocalej m    ��
�� misccura` klk =   mnm o    ���� 0 
localecode 
localeCoden m    oo �pp  c u r r e n tl q��q L    $rr n   #sts I    #�������� 0 currentlocale currentLocale��  ��  t n   uvu o    ���� 0 nslocale NSLocalev m    ��
�� misccura��  a k   ' sww xyx Q   ' ?z{|z r   * /}~} c   * -� o   * +���� 0 
localecode 
localeCode� m   + ,��
�� 
ctxt~ o      ���� 0 
localecode 
localeCode{ R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  | I   7 ?������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o   8 9���� 0 
localecode 
localeCode� ��� o   9 :���� 0 parametername parameterName� ���� m   : ;�� ��� p  n o   l o c a l e  ,   { c o n s t a n t ,   t e x t } ,    c u r r e n t   l o c a l e  ,   o r   t e x t��  ��  y ��� Z  @ i������� H   @ L�� E  @ K��� l  @ I������ c   @ I��� n  @ G��� I   C G�������� 80 availablelocaleidentifiers availableLocaleIdentifiers��  ��  � n  @ C��� o   A C���� 0 nslocale NSLocale� m   @ A��
�� misccura� m   G H��
�� 
list��  ��  � o   I J���� 0 
localecode 
localeCode� I   O e������� .0 throwinvalidparameter throwInvalidParameter� ��� o   P Q���� 0 
localecode 
localeCode� ��� o   Q R���� 0 parametername parameterName� ��� J   R V�� ��� m   R S��
�� 
enum� ���� m   S T��
�� 
ctxt��  � ���� b   V _��� b   V [��� m   V Y�� ��� , U n k n o w n   l o c a l e   n a m e :   � o   Y Z���� 0 
localecode 
localeCode� m   [ ^�� ���   .��  ��  ��  ��  � ���� l  j s���� L   j s�� n  j r��� I   m r���~� :0 localewithlocaleidentifier_ localeWithLocaleIdentifier_� ��}� o   m n�|�| 0 
localecode 
localeCode�}  �~  � n  j m��� o   k m�{�{ 0 nslocale NSLocale� m   j k�z
�z misccura� * $ (locale codes are case-insensitive)   � ��� H   ( l o c a l e   c o d e s   a r e   c a s e - i n s e n s i t i v e )��  \ �y�
�y consdiac� �x�
�x conshyph� �w�
�w conspunc� �v�u
�v conswhit�u  ] �t�
�t conscase� �s�r
�s consnume�r  ��  M ��� l     �q�p�o�q  �p  �o  � ��� l     �n�m�l�n  �m  �l  � ��� i  � ���� I      �k��j�k $0 asnsurlparameter asNSURLParameter� ��� o      �i�i 0 urltext urlText� ��h� o      �g�g 0 parametername parameterName�h  �j  � k     '�� ��� r     ��� l    ��f�e� n    ��� I    �d��c�d  0 urlwithstring_ URLWithString_� ��b� I    
�a��`�a "0 astextparameter asTextParameter� ��� o    �_�_ 0 urltext urlText� ��^� o    �]�] 0 parametername parameterName�^  �`  �b  �c  � n    ��� o    �\�\ 0 nsurl NSURL� m     �[
�[ misccura�f  �e  � o      �Z�Z 0 asocurl asocURL� ��� l   $���� Z   $���Y�X� =   ��� o    �W�W 0 asocurl asocURL� m    �V
�V 
msng� I     �U��T�U .0 throwinvalidparameter throwInvalidParameter� ��� o    �S�S 0 urltext urlText� ��� o    �R�R 0 parametername parameterName� ��� m    �Q
�Q 
ctxt� ��P� m    �� ���   N o t   a   v a l i d   U R L .�P  �T  �Y  �X  �   NSURL requires RFC 1808   � ��� 0   N S U R L   r e q u i r e s   R F C   1 8 0 8� ��O� L   % '�� o   % &�N�N 0 asocurl asocURL�O  � ��� l     �M�L�K�M  �L  �K  � ��� l     �J�I�H�J  �I  �H  � ��� l     �G���G  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �F���F  �   type checking   � ���    t y p e   c h e c k i n g� ��� l     �E�D�C�E  �D  �C  �    i  � � I     �B�A
�B .Typ:NaTynull��� ��� null�A   �@�?
�@ 
Valu o      �>�> 0 thevalue theValue�?   k     Q  l     �=	
�=  	 < 6 TO DO: do any other types require special-case tests?   
 � l   T O   D O :   d o   a n y   o t h e r   t y p e s   r e q u i r e   s p e c i a l - c a s e   t e s t s ? �< Z     Q >      l    	�;�: I    	�9
�9 .corecnte****       **** J      �8 o     �7�7 0 thevalue theValue�8   �6�5
�6 
kocl m    �4
�4 
obj �5  �;  �:   m   	 
�3�3   l    L     m    �2
�2 
obj  #  avoid implicit dereferencing    � :   a v o i d   i m p l i c i t   d e r e f e r e n c i n g  >     !  l   "�1�0" I   �/#$
�/ .corecnte****       ****# J    %% &�.& o    �-�- 0 thevalue theValue�.  $ �,'�+
�, 
kocl' m    �*
�* 
capp�+  �1  �0  ! m    �)�)   ()( l  ! #*+,* L   ! #-- m   ! "�(
�( 
capp+ � { avoid implicit dereferencing (we don't want `application NAME` value being treated as an object specifier root, i.e. null)   , �.. �   a v o i d   i m p l i c i t   d e r e f e r e n c i n g   ( w e   d o n ' t   w a n t   ` a p p l i c a t i o n   N A M E `   v a l u e   b e i n g   t r e a t e d   a s   a n   o b j e c t   s p e c i f i e r   r o o t ,   i . e .   n u l l )) /0/ >   & 1121 l  & /3�'�&3 I  & /�%45
�% .corecnte****       ****4 J   & )66 7�$7 o   & '�#�# 0 thevalue theValue�$  5 �"8�!
�" 
kocl8 m   * +� 
�  
reco�!  �'  �&  2 m   / 0��  0 9:9 l  4 6;<=; L   4 6>> m   4 5�
� 
reco< %  ignore custom `class` property   = �?? >   i g n o r e   c u s t o m   ` c l a s s `   p r o p e r t y: @A@ >   9 DBCB l  9 BD��D I  9 B�EF
� .corecnte****       ****E J   9 <GG H�H o   9 :�� 0 thevalue theValue�  F �I�
� 
koclI m   = >�
� 
scpt�  �  �  C m   B C��  A J�J l  G IKLMK L   G INN m   G H�
� 
scptL %  ignore custom `class` property   M �OO >   i g n o r e   c u s t o m   ` c l a s s `   p r o p e r t y�   L   L QPP n   L PQRQ m   M O�
� 
pclsR o   L M�� 0 thevalue theValue�<   STS l     ����  �  �  T UVU l     ����  �  �  V WXW i  � �YZY I     �
�	[
�
 .Typ:ChkTnull��� ��� null�	  [ �\]
� 
Valu\ o      �� 0 thevalue theValue] �^�
� 
Type^ o      �� 0 typeclasses typeClasses�  Z l   1_`a_ k    1bb cdc l      �ef�  e��
		Important: while using a `theValue's class is typeClass` test might seem the simpler solution, it isn't reliable in practice: record and script objects can define arbitrary `class` properties; reference objects are implicitly de-referenced to the class of the referenced object instead, while application objects dereference to `null`; `class of 3 is number` always returns false, and so on. A somewhat more reliable approach takes advantage of AppleScript's query-style filtering, e.g. `every number of {3}` returns `{3}` whereas `every number of {"3"}` returns `{}`, although this doesn't work correctly across all types (e.g. `type class`, `constant`). This handler implements special-case tests for the problem cases, then uses `(count {theValue} each typeClass) � 0` to check for the rest, which is functionally equivalent to `every TYPE of {VALUE} � {}` but with the advantage that it can be parameterized with an arbitrary type class value, avoiding the need to hardcode every single query.
		
		-- TO DO: move following to TypeSupport.unittest.scpt as asserts
		
		log (check type for 3 is integer) -- true
		log (check type for 3 is real) -- false
		log (check type for 3 is number) -- true
		
		script scpt
			property class : document
		end script
		log (check type for scpt is document) -- false
		log (check type for scpt is script) -- true
		
		log (check type for document is class) -- true
		log (check type for document is type class) -- true
	   f �ggp 
 	 	 I m p o r t a n t :   w h i l e   u s i n g   a   ` t h e V a l u e ' s   c l a s s   i s   t y p e C l a s s `   t e s t   m i g h t   s e e m   t h e   s i m p l e r   s o l u t i o n ,   i t   i s n ' t   r e l i a b l e   i n   p r a c t i c e :   r e c o r d   a n d   s c r i p t   o b j e c t s   c a n   d e f i n e   a r b i t r a r y   ` c l a s s `   p r o p e r t i e s ;   r e f e r e n c e   o b j e c t s   a r e   i m p l i c i t l y   d e - r e f e r e n c e d   t o   t h e   c l a s s   o f   t h e   r e f e r e n c e d   o b j e c t   i n s t e a d ,   w h i l e   a p p l i c a t i o n   o b j e c t s   d e r e f e r e n c e   t o   ` n u l l ` ;   ` c l a s s   o f   3   i s   n u m b e r `   a l w a y s   r e t u r n s   f a l s e ,   a n d   s o   o n .   A   s o m e w h a t   m o r e   r e l i a b l e   a p p r o a c h   t a k e s   a d v a n t a g e   o f   A p p l e S c r i p t ' s   q u e r y - s t y l e   f i l t e r i n g ,   e . g .   ` e v e r y   n u m b e r   o f   { 3 } `   r e t u r n s   ` { 3 } `   w h e r e a s   ` e v e r y   n u m b e r   o f   { " 3 " } `   r e t u r n s   ` { } ` ,   a l t h o u g h   t h i s   d o e s n ' t   w o r k   c o r r e c t l y   a c r o s s   a l l   t y p e s   ( e . g .   ` t y p e   c l a s s ` ,   ` c o n s t a n t ` ) .   T h i s   h a n d l e r   i m p l e m e n t s   s p e c i a l - c a s e   t e s t s   f o r   t h e   p r o b l e m   c a s e s ,   t h e n   u s e s   ` ( c o u n t   { t h e V a l u e }   e a c h   t y p e C l a s s )  "`   0 `   t o   c h e c k   f o r   t h e   r e s t ,   w h i c h   i s   f u n c t i o n a l l y   e q u i v a l e n t   t o   ` e v e r y   T Y P E   o f   { V A L U E }  "`   { } `   b u t   w i t h   t h e   a d v a n t a g e   t h a t   i t   c a n   b e   p a r a m e t e r i z e d   w i t h   a n   a r b i t r a r y   t y p e   c l a s s   v a l u e ,   a v o i d i n g   t h e   n e e d   t o   h a r d c o d e   e v e r y   s i n g l e   q u e r y . 
 	 	 
 	 	 - -   T O   D O :   m o v e   f o l l o w i n g   t o   T y p e S u p p o r t . u n i t t e s t . s c p t   a s   a s s e r t s 
 	 	 
 	 	 l o g   ( c h e c k   t y p e   f o r   3   i s   i n t e g e r )   - -   t r u e 
 	 	 l o g   ( c h e c k   t y p e   f o r   3   i s   r e a l )   - -   f a l s e 
 	 	 l o g   ( c h e c k   t y p e   f o r   3   i s   n u m b e r )   - -   t r u e 
 	 	 
 	 	 s c r i p t   s c p t 
 	 	 	 p r o p e r t y   c l a s s   :   d o c u m e n t 
 	 	 e n d   s c r i p t 
 	 	 l o g   ( c h e c k   t y p e   f o r   s c p t   i s   d o c u m e n t )   - -   f a l s e 
 	 	 l o g   ( c h e c k   t y p e   f o r   s c p t   i s   s c r i p t )   - -   t r u e 
 	 	 
 	 	 l o g   ( c h e c k   t y p e   f o r   d o c u m e n t   i s   c l a s s )   - -   t r u e 
 	 	 l o g   ( c h e c k   t y p e   f o r   d o c u m e n t   i s   t y p e   c l a s s )   - -   t r u e 
 	d h�h Q    1ijki k   ll mnm Z   op�� o =    qrq l   s����s I   ��tu
�� .corecnte****       ****t J    vv w��w o    ���� 0 typeclasses typeClasses��  u ��x��
�� 
koclx m    ��
�� 
list��  ��  ��  r m    ����  p r    yzy J    {{ |��| o    ���� 0 typeclasses typeClasses��  z o      ���� 0 typeclasses typeClasses�  �   n }~} X   ��� k   +�� ��� Q   + I���� r   . 5��� c   . 3��� n   . 1��� 1   / 1��
�� 
pcnt� o   . /���� 0 aref aRef� m   1 2��
�� 
pcls� o      ���� 0 	typeclass 	typeClass� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � l  = I���� R   = I�����
�� .ascrerr ****      � ****� I   ? H������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o   @ A���� 0 	typeclass 	typeClass� ��� m   A B�� ���  i s   t y p e� ��� m   B C��
�� 
pcls� ���� m   C D�� ��� @ t y p e   c l a s s   o r   l i s t   o f   t y p e   c l a s s��  ��  ��  � * $ TO DO: move to asTypeClassParameter   � ��� H   T O   D O :   m o v e   t o   a s T y p e C l a s s P a r a m e t e r� ��� l  J J������  � � � note: `count {theValue} each class/constant` doesn't work when theValue is a type class/constant symbol (e.g. `integer`/`yes`), so these need to be explicitly checked -- TO DO: are there any other AS type classes that also need special handling   � ����   n o t e :   ` c o u n t   { t h e V a l u e }   e a c h   c l a s s / c o n s t a n t `   d o e s n ' t   w o r k   w h e n   t h e V a l u e   i s   a   t y p e   c l a s s / c o n s t a n t   s y m b o l   ( e . g .   ` i n t e g e r ` / ` y e s ` ) ,   s o   t h e s e   n e e d   t o   b e   e x p l i c i t l y   c h e c k e d   - -   T O   D O :   a r e   t h e r e   a n y   o t h e r   A S   t y p e   c l a s s e s   t h a t   a l s o   n e e d   s p e c i a l   h a n d l i n g� ���� Z   J������ G   J U��� =  J M��� o   J K���� 0 	typeclass 	typeClass� m   K L��
�� 
pcls� =  P S��� o   P Q���� 0 	typeclass 	typeClass� m   Q R��
�� 
type� l  X ����� k   X ��� ��� l  X X������  � � � check value is not a reference type (be aware that library's SDEF terminology reformats `reference` keyword as `specifier`), then try coercing it to type class, and finally check it's unchanged -- TO DO: check this covers all corner cases   � ����   c h e c k   v a l u e   i s   n o t   a   r e f e r e n c e   t y p e   ( b e   a w a r e   t h a t   l i b r a r y ' s   S D E F   t e r m i n o l o g y   r e f o r m a t s   ` r e f e r e n c e `   k e y w o r d   a s   ` s p e c i f i e r ` ) ,   t h e n   t r y   c o e r c i n g   i t   t o   t y p e   c l a s s ,   a n d   f i n a l l y   c h e c k   i t ' s   u n c h a n g e d   - -   T O   D O :   c h e c k   t h i s   c o v e r s   a l l   c o r n e r   c a s e s� ���� Q   X ������ Z  [ y������� F   [ p��� =   [ f��� l  [ d������ I  [ d����
�� .corecnte****       ****� J   [ ^�� ���� o   [ \���� 0 thevalue theValue��  � �����
�� 
kocl� m   _ `��
�� 
obj ��  ��  ��  � m   d e����  � =  i n��� c   i l��� l 	 i j������ o   i j���� 0 thevalue theValue��  ��  � m   j k��
�� 
pcls� o   l m���� 0 thevalue theValue� L   s u�� m   s t��
�� boovtrue��  ��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  ��  ��  �'! TO DO: this could be problematic (AS is murky on distinction between `class` and `type class`, treating them as synonymous when used in `as` operation but not when comparing them; be aware that library's SDEF causes `type class` keyword to reformat as `type` keyword (for added confusion)   � ���B   T O   D O :   t h i s   c o u l d   b e   p r o b l e m a t i c   ( A S   i s   m u r k y   o n   d i s t i n c t i o n   b e t w e e n   ` c l a s s `   a n d   ` t y p e   c l a s s ` ,   t r e a t i n g   t h e m   a s   s y n o n y m o u s   w h e n   u s e d   i n   ` a s `   o p e r a t i o n   b u t   n o t   w h e n   c o m p a r i n g   t h e m ;   b e   a w a r e   t h a t   l i b r a r y ' s   S D E F   c a u s e s   ` t y p e   c l a s s `   k e y w o r d   t o   r e f o r m a t   a s   ` t y p e `   k e y w o r d   ( f o r   a d d e d   c o n f u s i o n )� ��� =  � ���� o   � ����� 0 	typeclass 	typeClass� m   � ���
�� 
enum� ��� Q   � ������ Z  � �������� F   � ���� =   � ���� l  � ������� I  � �����
�� .corecnte****       ****� J   � ��� ���� o   � ����� 0 thevalue theValue��  � �����
�� 
kocl� m   � ���
�� 
obj ��  ��  ��  � m   � �����  � =  � ���� c   � ���� l 	 � ������� o   � ����� 0 thevalue theValue��  ��  � m   � ���
�� 
enum� o   � ����� 0 thevalue theValue� L   � ��� m   � ���
�� boovtrue��  ��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  ��  � ��� =  � ���� o   � ����� 0 typeclasses typeClasses� m   � ���
�� 
ocid� ��� l  � ����� k   � ��� ��� Z  � �������� =   � ���� l  � ������� I  � ��� 
�� .corecnte****       ****  J   � � �� o   � ����� 0 thevalue theValue��   ����
�� 
kocl m   � ���
�� 
obj ��  ��  ��  � m   � �����  � L   � � m   � ���
�� boovfals��  ��  � �� l  � �	 L   � �

 =  � � n  � � m   � ���
�� 
want l  � ����� c   � � o   � ����� 0 thevalue theValue m   � ���
�� 
reco��  ��   m   � ���
�� 
ocid � � check object specifier record's `want` property; hacky, but should be okay as long as AS's specifier-to-record coercion never changes   	 �   c h e c k   o b j e c t   s p e c i f i e r   r e c o r d ' s   ` w a n t `   p r o p e r t y ;   h a c k y ,   b u t   s h o u l d   b e   o k a y   a s   l o n g   a s   A S ' s   s p e c i f i e r - t o - r e c o r d   c o e r c i o n   n e v e r   c h a n g e s��  � * $ is it an AppleScriptObjC specifier?   � � H   i s   i t   a n   A p p l e S c r i p t O b j C   s p e c i f i e r ?�  >   � � l  � ����� I  � ���
�� .corecnte****       **** J   � � �� o   � ����� 0 thevalue theValue��   ����
�� 
kocl m   � ���
�� 
capp��  ��  ��   m   � �����    L   � �   =  � �!"! o   � ����� 0 	typeclass 	typeClass" m   � ���
�� 
capp #$# >   �
%&% l  �'����' I  ���()
�� .corecnte****       ****( J   �** +��+ o   � ���� 0 thevalue theValue��  ) ��,��
�� 
kocl, o  ���� 0 	typeclass 	typeClass��  ��  ��  & m  	����  $ -��- l ./0. L  11 m  �
� boovtrue/ y s other AS types can be reliably filtered using a `count` command -- TO DO: need to confirm this works for all types   0 �22 �   o t h e r   A S   t y p e s   c a n   b e   r e l i a b l y   f i l t e r e d   u s i n g   a   ` c o u n t `   c o m m a n d   - -   T O   D O :   n e e d   t o   c o n f i r m   t h i s   w o r k s   f o r   a l l   t y p e s��  ��  ��  �� 0 aref aRef� o    �~�~ 0 typeclasses typeClasses~ 3�}3 L  44 m  �|
�| boovfals�}  j R      �{56
�{ .ascrerr ****      � ****5 o      �z�z 0 etext eText6 �y78
�y 
errn7 o      �x�x 0 enumber eNumber8 �w9:
�w 
erob9 o      �v�v 0 efrom eFrom: �u;�t
�u 
errt; o      �s�s 
0 eto eTo�t  k I  #1�r<�q�r 
0 _error  < =>= m  $'?? �@@  c h e c k   t y p e> ABA o  '(�p�p 0 etext eTextB CDC o  ()�o�o 0 enumber eNumberD EFE o  )*�n�n 0 efrom eFromF G�mG o  *+�l�l 
0 eto eTo�m  �q  �  ` �  performs a 'VALUE is-a CLASS' test, which is trickier than it sounds since AppleScript has neither classes nor `is-a` operator   a �HH �   p e r f o r m s   a   ' V A L U E   i s - a   C L A S S '   t e s t ,   w h i c h   i s   t r i c k i e r   t h a n   i t   s o u n d s   s i n c e   A p p l e S c r i p t   h a s   n e i t h e r   c l a s s e s   n o r   ` i s - a `   o p e r a t o rX IJI l     �k�j�i�k  �j  �i  J KLK l     �h�g�f�h  �g  �f  L MNM i  � �OPO I     �e�dQ
�e .Typ:OCIDnull��� ��� null�d  Q �cR�b
�c 
FromR o      �a�a 0 thevalue theValue�b  P l    #STUS Q     #VWXV L    YY n   Z[Z I    �`\�_�`  0 objectatindex_ objectAtIndex_\ ]�^] m    �]�]  �^  �_  [ l   ^�\�[^ n   _`_ I    �Za�Y�Z $0 arraywithobject_ arrayWithObject_a b�Xb o    �W�W 0 d  �X  �Y  ` n   cdc o    �V�V 0 nsarray NSArrayd m    �U
�U misccura�\  �[  W R      �Tef
�T .ascrerr ****      � ****e o      �S�S 0 etext eTextf �Rgh
�R 
errng o      �Q�Q 0 enumber eNumberh �Pij
�P 
erobi o      �O�O 0 efrom eFromj �Nk�M
�N 
errtk o      �L�L 
0 eto eTo�M  X I    #�Kl�J�K 
0 _error  l mnm m    oo �pp   c o n v e r t   t o   C o c o an qrq o    �I�I 0 etext eTextr sts o    �H�H 0 enumber eNumbert uvu o    �G�G 0 efrom eFromv w�Fw o    �E�E 
0 eto eTo�F  �J  T 3 - TO DO: asNSObject() performs same conversion   U �xx Z   T O   D O :   a s N S O b j e c t ( )   p e r f o r m s   s a m e   c o n v e r s i o nN yzy l     �D�C�B�D  �C  �B  z {|{ l     �A}~�A  }  -----   ~ � 
 - - - - -| ��� l     �@���@  � . ( terminology-free synonyms for the above   � ��� P   t e r m i n o l o g y - f r e e   s y n o n y m s   f o r   t h e   a b o v e� ��� l     �?�>�=�?  �>  �=  � ��� i  � ���� I      �<��;�< (0 nativetypeforvalue nativeTypeForValue� ��:� o      �9�9 0 thevalue theValue�:  �;  � L     �� I    �8�7�
�8 .Typ:NaTynull��� ��� null�7  � �6��5
�6 
Valu� o    �4�4 0 thevalue theValue�5  � ��� l     �3�2�1�3  �2  �1  � ��� i  � ���� I      �0��/�0 &0 checktypeforvalue checkTypeForValue� ��� o      �.�. 0 thevalue theValue� ��-� o      �,�, 0 typeclasses typeClasses�-  �/  � L     
�� I    	�+�*�
�+ .Typ:ChkTnull��� ��� null�*  � �)��
�) 
Valu� o    �(�( 0 thevalue theValue� �'��&
�' 
Type� o    �%�% 0 typeclasses typeClasses�&  � ��� l     �$�#�"�$  �#  �"  � ��� i  � ���� I      �!�� �!  0 converttococoa convertToCocoa� ��� o      �� 0 thevalue theValue�  �   � L     �� I    ���
� .Typ:OCIDnull��� ��� null�  � ���
� 
From� o    �� 0 thevalue theValue�  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  �  �  �       ,���������������������������������������������  � *����
�	��������� ��������������������������������������������������������
� 
pimr� 0 
hashandler 
hasHandler� 00 _throwinvalidparameter _throwInvalidParameter�
 .0 throwinvalidparameter throwInvalidParameter�	 80 throwinvalidparameterindex throwInvalidParameterIndex� 60 throwinvalidparametertype throwInvalidParameterType� >0 throwinvalidconstantparameter throwInvalidConstantParameter� 0 rethrowerror rethrowError� &0 throwcommanderror throwCommandError� $0 throwmethoderror throwMethodError� 0 asnumber asNumber� 0 aswholenumber asWholeNumber� 0 	asinteger 	asInteger�  0 astext asText�� 0 aslist asList�� (0 asbooleanparameter asBooleanParameter�� (0 asintegerparameter asIntegerParameter�� 00 aswholenumberparameter asWholeNumberParameter�� &0 asnumberparameter asNumberParameter�� "0 asrealparameter asRealParameter�� "0 astextparameter asTextParameter�� "0 asdateparameter asDateParameter�� "0 aslistparameter asListParameter�� &0 asrecordparameter asRecordParameter�� 0 requiredvalue RequiredValue�� 60 asoptionalrecordparameter asOptionalRecordParameter�� &0 asscriptparameter asScriptParameter�� "0 astypeparameter asTypeParameter�� ,0 asposixpathparameter asPOSIXPathParameter�� 0 
asnsstring 
asNSString�� &0 asnsmutablestring asNSMutableString�� ,0 asnormalizednsstring asNormalizedNSString�� 0 
asnsobject 
asNSObject�� @0 asnsregularexpressionparameter asNSRegularExpressionParameter�� *0 asnslocaleparameter asNSLocaleParameter�� $0 asnsurlparameter asNSURLParameter
�� .Typ:NaTynull��� ��� null
�� .Typ:ChkTnull��� ��� null
�� .Typ:OCIDnull��� ��� null�� (0 nativetypeforvalue nativeTypeForValue�� &0 checktypeforvalue checkTypeForValue��  0 converttococoa convertToCocoa� ����� �  �� �����
�� 
cobj� ��   �� 
�� 
frmk��  � �� 8���������� 0 
hashandler 
hasHandler�� ����� �  ���� 0 
handlerref 
handlerRef��  � ���� 0 
handlerref 
handlerRef� �����
�� 
hand��  � ������
�� 
errn���\��  ��  ��&OeW 	X  f� �� l���������� 00 _throwinvalidparameter _throwInvalidParameter�� ����� �  ������������ 0 thevalue theValue�� 0 parametername parameterName�� 0 expectedtype expectedType�� $0 errordescription errorDescription�� 0 errornumber errorNumber��  � ������������ 0 thevalue theValue�� 0 parametername parameterName�� 0 expectedtype expectedType�� $0 errordescription errorDescription�� 0 errornumber errorNumber� 
�� � � ��������� � �
�� 
leng
�� 
errn
�� 
erob
�� 
errt�� �� '��,j  �E�Y 	�%�%E�O)�����%�%�%� �� ����������� .0 throwinvalidparameter throwInvalidParameter�� ����� �  ���������� 0 thevalue theValue�� 0 parametername parameterName�� 0 expectedtype expectedType�� $0 errordescription errorDescription��  � ���������� 0 thevalue theValue�� 0 parametername parameterName�� 0 expectedtype expectedType�� $0 errordescription errorDescription� ���������Y�� �� 00 _throwinvalidparameter _throwInvalidParameter�� *������+ � �� ����������� 80 throwinvalidparameterindex throwInvalidParameterIndex�� ����� �  ������ 0 thevalue theValue�� 0 parametername parameterName��  � ������ 0 thevalue theValue�� 0 parametername parameterName� �� �������
�� 
long���@�� �� 00 _throwinvalidparameter _throwInvalidParameter�� *������+ � �� ����������� 60 throwinvalidparametertype throwInvalidParameterType�� ����� �  ���������� 0 thevalue theValue�� 0 parametername parameterName�� 0 expectedtype expectedType�� $0 expectedtypename expectedTypeName��  � ������������ 0 thevalue theValue�� 0 parametername parameterName�� 0 expectedtype expectedType�� $0 expectedtypename expectedTypeName��  0 actualtypename actualTypeName� ������ �����������
�� 
kocl
�� 
obj 
�� .corecnte****       ****
�� 
pcls��  ��  �� �� .0 throwinvalidparameter throwInvalidParameter�� :  �kv��l j �E�Y 	��,%E�W 
X  �E�O*����%�%�%�+ � ��'���������� >0 throwinvalidconstantparameter throwInvalidConstantParameter�� ����� �  ������ 0 thevalue theValue�� 0 parametername parameterName��  � ������ 0 thevalue theValue�� 0 parametername parameterName� ��4����
�� 
enum�� �� .0 throwinvalidparameter throwInvalidParameter�� 
*�����+ � ��C��~���}�� 0 rethrowerror rethrowError� �|��| �  �{�z�y�x�w�v�u�t�{ 0 libraryname libraryName�z 0 handlername handlerName�y 0 etext eText�x 0 enumber eNumber�w 0 efrom eFrom�v 
0 eto eTo�u $0 targetobjectname targetObjectName�t 0 partialresult partialResult�~  � �s�r�q�p�o�n�m�l�s 0 libraryname libraryName�r 0 handlername handlerName�q 0 etext eText�p 0 enumber eNumber�o 0 efrom eFrom�n 
0 eto eTo�m $0 targetobjectname targetObjectName�l 0 partialresult partialResult� �kik{}�j�i�h�g�f�e
�k 
msng
�j 
errn
�i 
erob
�h 
errt�g 
�f 
ptlr�e �} D��  ��%�%�%�%E�Y ��%�%�%�%�%�%E�O��  )����Y )������ �d��c�b���a�d &0 throwcommanderror throwCommandError�c �`��` �  �_�^�]�\�[�Z�_ 0 libraryname libraryName�^ 0 handlername handlerName�] 0 etext eText�\ 0 enumber eNumber�[ 0 efrom eFrom�Z 
0 eto eTo�b  � �Y�X�W�V�U�T�Y 0 libraryname libraryName�X 0 handlername handlerName�W 0 etext eText�V 0 enumber eNumber�U 0 efrom eFrom�T 
0 eto eTo� �S�R�Q
�S 
msng�R �Q 0 rethrowerror rethrowError�a )j*���������+ � �P��O�N���M�P $0 throwmethoderror throwMethodError�O �L��L �  �K�J�I�H�G�F�E�K 0 libraryname libraryName�J $0 targetobjectname targetObjectName�I 0 handlername handlerName�H 0 etext eText�G 0 enumber eNumber�F 0 efrom eFrom�E 
0 eto eTo�N  � �D�C�B�A�@�?�>�D 0 libraryname libraryName�C $0 targetobjectname targetObjectName�B 0 handlername handlerName�A 0 etext eText�@ 0 enumber eNumber�? 0 efrom eFrom�> 
0 eto eTo� �=�<�;
�= 
msng�< �; 0 rethrowerror rethrowError�M )j*���������+ � �: �9�8���7�: 0 asnumber asNumber�9 �6��6 �  �5�5 0 thevalue theValue�8  � �4�4 0 thevalue theValue� �3�2�1�0�/�.�-�,�+�*�)�(�'�&V
�3 
****
�2 
kocl
�1 
list
�0 .corecnte****       ****
�/ 
leng
�. 
bool
�- 
cobj
�, 
nmbr
�+ 
ctxt
�* 
errn�)�\
�( 
erob
�' 
errt�& �7 e��&E�O�kv��l k 	 	��,k �& ��k/E�Y hO�kv��l k 
 �kv��l k 	 	��,j�&�& 	��&Y hO)�������� �%e�$�#���"�% 0 aswholenumber asWholeNumber�$ �!��! �  � �  0 thevalue theValue�#  � ��� 0 thevalue theValue� 0 	thenumber 	theNumber� �������~� 0 asnumber asNumber
� 
errn��\
� 
erob
� 
errt
� 
nmbr� �" #*�k+  E�O�k#j )�������Y hO�� ����	 	�� 0 	asinteger 	asInteger� �	� 	  �� 0 thevalue theValue�  	  ��� 0 thevalue theValue� 0 	thenumber 	theNumber	 �����
�	��� 0 asnumber asNumber
� 
errn��\
� 
erob
�
 
errt
�	 
long� � %*�k+  E�O�k#j )�������Y hO��&� ����		�� 0 astext asText� �	� 	  �� 0 thevalue theValue�  	 �� 0 thevalue theValue	 � ��������������������
�  
kocl
�� 
list
�� .corecnte****       ****
�� 
leng
�� 
cobj
�� 
ctxt
�� 
errn���\
�� 
erob
�� 
errt�� � Y�kv��l k  F��,k  "��k/E�O�kv��l j  	��&Y hY ��,j  �Y hO)�������Y hO��&� ������		���� 0 aslist asList�� ��	�� 	  ���� 0 thevalue theValue��  	 ���� 0 thevalue theValue	 ������
�� 
kocl
�� 
list
�� .corecnte****       ****�� �kv��l k  �Y hO�kv� ��R����			
���� (0 asbooleanparameter asBooleanParameter�� ��	�� 	  ������ 0 thevalue theValue�� 0 parametername parameterName��  		 ������ 0 thevalue theValue�� 0 parametername parameterName	
 ����	h����
�� 
bool��  	 ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ � ��q����		���� (0 asintegerparameter asIntegerParameter�� ��	�� 	  ������ 0 thevalue theValue�� 0 parametername parameterName��  	 ������ 0 thevalue theValue�� 0 parametername parameterName	 ������	������� 0 aswholenumber asWholeNumber
�� 
long��  	 ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  *�k+  �&W X  *�����+ � �������		���� 00 aswholenumberparameter asWholeNumberParameter�� ��	�� 	  ������ 0 thevalue theValue�� 0 parametername parameterName��  	 ������ 0 thevalue theValue�� 0 parametername parameterName	 ����	��������� 0 aswholenumber asWholeNumber��  	 ������
�� 
errn���\��  
�� 
nmbr�� �� 60 throwinvalidparametertype throwInvalidParameterType��  *�k+  W X  *�����+ � �������		���� &0 asnumberparameter asNumberParameter�� ��	�� 	  ������ 0 thevalue theValue�� 0 parametername parameterName��  	 ������ 0 thevalue theValue�� 0 parametername parameterName	 ����	��������� 0 asnumber asNumber��  	 ������
�� 
errn���\��  
�� 
nmbr�� �� 60 throwinvalidparametertype throwInvalidParameterType��  *�k+  W X  *�����+ � �������		���� "0 asrealparameter asRealParameter�� ��	�� 	  ������ 0 thevalue theValue�� 0 parametername parameterName��  	 ������ 0 thevalue theValue�� 0 parametername parameterName	 ������	������� 0 asnumber asNumber
�� 
doub��  	 ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  *�k+  �&W X  *�����+ � �������		���� "0 astextparameter asTextParameter�� ��	�� 	  ������ 0 thevalue theValue�� 0 parametername parameterName��  	 ������ 0 thevalue theValue�� 0 parametername parameterName	 ����	 �������� 0 astext asText��  	  ������
�� 
errn���\��  
�� 
ctxt�� �� 60 throwinvalidparametertype throwInvalidParameterType��  *�k+  W X  *�����+ � ������	!	"���� "0 asdateparameter asDateParameter�� ��	#�� 	#  ������ 0 thevalue theValue�� 0 parametername parameterName��  	! ��~� 0 thevalue theValue�~ 0 parametername parameterName	" �}�|	$8�{�z
�} 
ldt �|  	$ �y�x�w
�y 
errn�x�\�w  �{ �z 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ � �vA�u�t	%	&�s�v "0 aslistparameter asListParameter�u �r	'�r 	'  �q�p�q 0 thevalue theValue�p 0 parametername parameterName�t  	% �o�n�o 0 thevalue theValue�n 0 parametername parameterName	& �m�m 0 aslist asList�s *�k+  � �lT�k�j	(	)�i�l &0 asrecordparameter asRecordParameter�k �h	*�h 	*  �g�f�g 0 thevalue theValue�f 0 parametername parameterName�j  	( �e�d�e 0 thevalue theValue�d 0 parametername parameterName	) �c�b	+q�a�`
�c 
reco�b  	+ �_�^�]
�_ 
errn�^�\�]  �a �` 60 throwinvalidparametertype throwInvalidParameterType�i  	��&W X  *�����+ � �\y  	,�\ 0 requiredvalue RequiredValue	,  	-	-  � �[��Z�Y	.	/�X�[ 60 asoptionalrecordparameter asOptionalRecordParameter�Z �W	0�W 	0  �V�U�T�V 0 thevalue theValue�U 0 defaultrecord defaultRecord�T 0 parametername parameterName�Y  	. �S�R�Q�P�O�S 0 thevalue theValue�R 0 defaultrecord defaultRecord�Q 0 parametername parameterName�P 0 	therecord 	theRecord�O 0 
fullrecord 
fullRecord	/ �N�M	1��L�K�J�I��H�G���
�N 
reco�M  	1 �F�E�D
�F 
errn�E�\�D  �L �K 60 throwinvalidparametertype throwInvalidParameterType
�J 
pcls
�I 
leng�H .0 throwinvalidparameter throwInvalidParameter
�G 
list�X � 
��&E�W X  *�����+ O���l%E�O��%E�O��,��, *�����+ 	Y hO��&b  kv *�����+ 	Y hO��,lv��,kv *�����,%�%�+ 	Y hO�� �C	�B�A	2	3�@�C &0 asscriptparameter asScriptParameter�B �?	4�? 	4  �>�=�> 0 thevalue theValue�= 0 parametername parameterName�A  	2 �<�;�< 0 thevalue theValue�; 0 parametername parameterName	3 �:�9	5"�8�7
�: 
scpt�9  	5 �6�5�4
�6 
errn�5�\�4  �8 �7 60 throwinvalidparametertype throwInvalidParameterType�@  	��&W X  *�����+ � �3,�2�1	6	7�0�3 "0 astypeparameter asTypeParameter�2 �/	8�/ 	8  �.�-�. 0 thevalue theValue�- 0 parametername parameterName�1  	6 �,�+�, 0 thevalue theValue�+ 0 parametername parameterName	7 �*�)	9B�(�'
�* 
type�)  	9 �&�%�$
�& 
errn�%�\�$  �( �' 60 throwinvalidparametertype throwInvalidParameterType�0  	��&W X  *�����+ � �#K�"�!	:	;� �# ,0 asposixpathparameter asPOSIXPathParameter�" �	<� 	<  ��� 0 thevalue theValue� 0 parametername parameterName�!  	: ��� 0 thevalue theValue� 0 parametername parameterName	; 
������	=w��
� 
kocl
� 
ctxt
� .corecnte****       ****
� 
furl
� 
psxp�  	= ���
� 
errn��\�  � � 60 throwinvalidparametertype throwInvalidParameterType�  /�kv��l k  �Y  ��&�,EW X  *�����+ 	� ����	>	?�� 0 
asnsstring 
asNSString� �	@� 	@  �
�
 0 thetext theText�  	> �	�	 0 thetext theText	? ���
� misccura� 0 nsstring NSString� &0 stringwithstring_ stringWithString_� 
��,�k+ � ����	A	B�� &0 asnsmutablestring asNSMutableString� �	C� 	C  � �  0 thetext theText�  	A ���� 0 thetext theText	B ������
�� misccura�� "0 nsmutablestring NSMutableString�� &0 stringwithstring_ stringWithString_� 
��,�k+ � �������	D	E���� ,0 asnormalizednsstring asNormalizedNSString�� ��	F�� 	F  ���� 0 thetext theText��  	D ���� 0 thetext theText	E ��������
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� L0 $decomposedstringwithcanonicalmapping $decomposedStringWithCanonicalMapping�� ��,�k+ j+ � �������	G	H���� 0 
asnsobject 
asNSObject�� ��	I�� 	I  ���� 0 thevalue theValue��  	G ���� 0 thevalue theValue	H ��������
�� misccura�� 0 nsarray NSArray�� $0 arraywithobject_ arrayWithObject_��  0 objectatindex_ objectAtIndex_�� ��,�k+ jk+ � ������	J	K���� @0 asnsregularexpressionparameter asNSRegularExpressionParameter�� ��	L�� 	L  �������� 0 thetext theText�� 0 flagoptions flagOptions�� 0 parametername parameterName��  	J ���������� 0 thetext theText�� 0 flagoptions flagOptions�� 0 parametername parameterName�� 0 asocpattern asocPattern	K ��������������	M4����D��
�� misccura�� *0 nsregularexpression NSRegularExpression
�� 
ctxt�� ,0 asnormalizednsstring asNormalizedNSString
�� 
msng�� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_��  	M ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType�� .0 throwinvalidparameter throwInvalidParameter�� ? ��,*��&k+ ��m+ E�W X  *�����+ 
O��  *�����+ Y hO�� ��O����	N	O���� *0 asnslocaleparameter asNSLocaleParameter�� ��	P�� 	P  ������ 0 
localecode 
localeCode�� 0 parametername parameterName��  	N ������ 0 
localecode 
localeCode�� 0 parametername parameterName	O \]d������o������	Q�����������������
�� misccura�� 0 nslocale NSLocale�� 0 systemlocale systemLocale�� 0 currentlocale currentLocale
�� 
ctxt��  	Q ������
�� 
errn���\��  �� 60 throwinvalidparametertype throwInvalidParameterType�� 80 availablelocaleidentifiers availableLocaleIdentifiers
�� 
list
�� 
enum�� �� .0 throwinvalidparameter throwInvalidParameter�� :0 localewithlocaleidentifier_ localeWithLocaleIdentifier_�� u�� q��  ��,j+ Y _��  ��,j+ Y N 
��&E�W X 	 
*���m+ O��,j+ �&� *����lva �%a %a + Y hO��,�k+ V� �������	R	S���� $0 asnsurlparameter asNSURLParameter�� ��	T�� 	T  ������ 0 urltext urlText�� 0 parametername parameterName��  	R �������� 0 urltext urlText�� 0 parametername parameterName�� 0 asocurl asocURL	S 	�����������������
�� misccura�� 0 nsurl NSURL�� "0 astextparameter asTextParameter��  0 urlwithstring_ URLWithString_
�� 
msng
�� 
ctxt�� �� .0 throwinvalidparameter throwInvalidParameter�� (��,*��l+ k+ E�O��  *�����+ Y hO�� ������	U	V��
�� .Typ:NaTynull��� ��� null��  �� ������
�� 
Valu�� 0 thevalue theValue��  	U ���� 0 thevalue theValue	V ��������������
�� 
kocl
�� 
obj 
�� .corecnte****       ****
�� 
capp
�� 
reco
�� 
scpt
�� 
pcls�� R�kv��l j �Y @�kv��l j �Y -�kv��l j �Y �kv��l j �Y ��,E� ��Z����	W	X��
�� .Typ:ChkTnull��� ��� null��  �� ����	Y
�� 
Valu�� 0 thevalue theValue	Y ������
�� 
Type�� 0 typeclasses typeClasses��  	W ������������������ 0 thevalue theValue�� 0 typeclasses typeClasses�� 0 aref aRef�� 0 	typeclass 	typeClass�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo	X ������~�}�|�{	Z���z�y�x�w�v�u�t�s�r�q�p	[?�o�n
�� 
kocl
�� 
list
� .corecnte****       ****
�~ 
cobj
�} 
pcnt
�| 
pcls�{  	Z �m�l�k
�m 
errn�l�\�k  �z �y 60 throwinvalidparametertype throwInvalidParameterType
�x 
type
�w 
bool
�v 
obj 
�u 
enum
�t 
ocid
�s 
reco
�r 
want
�q 
capp�p 0 etext eText	[ �j�i	\
�j 
errn�i 0 enumber eNumber	\ �h�g	]
�h 
erob�g 0 efrom eFrom	] �f�e�d
�f 
errt�e 
0 eto eTo�d  �o �n 
0 _error  ��2�kv��l j  
�kvE�Y hO ��[��l kh  ��,�&E�W X  )j*�����+ O�� 
 �� �& / #�kv��l j 	 	��&� �& eY hW X  hY ���  / #�kv��l j 	 	��&� �& eY hW X  hY ]�a   (�kv��l j  fY hO�a &a ,a  Y /�kv�a l j �a  Y �kv�l j eY h[OY�OfW X  *a ����a + � �cP�b�a	^	_�`
�c .Typ:OCIDnull��� ��� null�b  �a �_�^�]
�_ 
From�^ 0 thevalue theValue�]  	^ �\�[�Z�Y�X�W�\ 0 thevalue theValue�[ 0 d  �Z 0 etext eText�Y 0 enumber eNumber�X 0 efrom eFrom�W 
0 eto eTo	_ 	�V�U�T�S�R	`o�Q�P
�V misccura�U 0 nsarray NSArray�T $0 arraywithobject_ arrayWithObject_�S  0 objectatindex_ objectAtIndex_�R 0 etext eText	` �O�N	a
�O 
errn�N 0 enumber eNumber	a �M�L	b
�M 
erob�L 0 efrom eFrom	b �K�J�I
�K 
errt�J 
0 eto eTo�I  �Q �P 
0 _error  �` $ ��,�k+ jk+ W X  *梣���+ � �H��G�F	c	d�E�H (0 nativetypeforvalue nativeTypeForValue�G �D	e�D 	e  �C�C 0 thevalue theValue�F  	c �B�B 0 thevalue theValue	d �A�@
�A 
Valu
�@ .Typ:NaTynull��� ��� null�E 	*�l � �?��>�=	f	g�<�? &0 checktypeforvalue checkTypeForValue�> �;	h�; 	h  �:�9�: 0 thevalue theValue�9 0 typeclasses typeClasses�=  	f �8�7�8 0 thevalue theValue�7 0 typeclasses typeClasses	g �6�5�4�3
�6 
Valu
�5 
Type�4 
�3 .Typ:ChkTnull��� ��� null�< *��� � �2��1�0	i	j�/�2  0 converttococoa convertToCocoa�1 �.	k�. 	k  �-�- 0 thevalue theValue�0  	i �,�, 0 thevalue theValue	j �+�*
�+ 
From
�* .Typ:OCIDnull��� ��� null�/ 	*�l ascr  ��ޭ