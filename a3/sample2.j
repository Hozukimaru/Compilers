.class public sample2
.super java/lang/Object

.method public <init>()V
aload_0
invokenonvirtual java/lang/Object/<init>()V
return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 10
.limit locals 100

ldc 1
istore 0
iload 0
istore 1
LABEL_6:
ldc 3
istore 2
iload 1
iload 2
isub
iflt LABEL_0
ldc 0
istore 3
goto LABEL_1
LABEL_0:
ldc 1
istore 3
LABEL_1:
iload 3
ifeq LABEL_7
ldc 1
istore 4
iload 4
istore 5
LABEL_4:
ldc 3
istore 6
iload 5
iload 6
isub
iflt LABEL_2
ldc 0
istore 7
goto LABEL_3
LABEL_2:
ldc 1
istore 7
LABEL_3:
iload 7
ifeq LABEL_5
getstatic java/lang/System/out Ljava/io/PrintStream;
iload 1
invokevirtual java/io/PrintStream/println(I)V
getstatic java/lang/System/out Ljava/io/PrintStream;
iload 5
invokevirtual java/io/PrintStream/println(I)V
ldc 1
istore 8
iload 5
iload 8
iadd
istore 9
iload 9
istore 5
goto LABEL_4
LABEL_5:
ldc 1
istore 10
iload 1
iload 10
iadd
istore 11
iload 11
istore 1
goto LABEL_6
LABEL_7:
return
.end method
