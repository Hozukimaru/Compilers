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
iload 0
invokevirtual java/io/PrintStream/println(I)V
ldc 1
istore 4
iload 0
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
return
.end method
