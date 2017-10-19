Attribute VB_Name = "Module1"
'by Slek @ 17.10.17

Private Declare Function ExXOR Lib "USER32" Alias "CallWindowProcW" (ByRef first_asm As Currency, ByRef data() As Byte, ByVal key As String, Optional ByVal null0 As Long = 0, Optional ByVal null1 As Long = 0) As Long

Public Sub ExtendedXOR(ByRef bvData() As Byte, ByRef sKey As String)
    Dim asm(11)     As Currency
    
    'asm
    asm(0) = -491787674460851.1136@: asm(1) = 841286998215042.4449@: asm(2) = -79852934014782.6425@: asm(3) = 515528406529503.9627@
    asm(4) = -721949260446174.1296@: asm(5) = 154586377509624.4677@: asm(6) = -363671606484101.5671@: asm(7) = 397718592918623.4761@
    asm(8) = 359205382400696.5123@: asm(9) = 109476837521481.1345@: asm(10) = 11936398627692.7363@: asm(11) = 471732174979.1348@
    
    Call ExXOR(asm(0), bvData, sKey)
End Sub
