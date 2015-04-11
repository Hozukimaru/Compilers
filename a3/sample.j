.class public sample
.super java/lang/Object

.method public <init>()V
aload_0
invokenonvirtual java/lang/Object/<init>()V
return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 10
.limit locals 100

ldc 10
istore 0
iload 0
istore 1
ldc 20
istore 2
iload 2
istore 3
getstatic java/lang/System/out Ljava/io/PrintStream;
iload 1
invokevirtual java/io/PrintStream/println(I)V
ldc 1
istore 4
iload 1
iload 4
iadd
istore 5
getstatic java/lang/System/out Ljava/io/PrintStream;
iload 5
invokevirtual java/io/PrintStream/println(I)V
ldc 0
istore 6
iload 6
istore 1
ldc 5
istore 12
ldc 0
istore 11
LABEL_0:
getstatic java/lang/System/out Ljava/io/PrintStream;
iload 3
invokevirtual java/io/PrintStream/println(I)V
ldc 100
istore 7
iload 1
iload 7
iadd
istore 8
getstatic java/lang/System/out Ljava/io/PrintStream;
iload 8
invokevirtual java/io/PrintStream/println(I)V
ldc 1
istore 9
iload 1
iload 9
iadd
istore 10
iload 10
istore 1
iinc 11 1
iload 11
iload 12
if_icmplt LABEL_0
return
.end method
