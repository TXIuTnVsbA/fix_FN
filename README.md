# fix_FN
Hackintosh     ssdt_hotpatch

说明：

    ACPIKeyboard.kext放入EFI/Clover/kexts/other/
    
    SSDT-FN.dsl使用iasl编译为SSDT-FN.aml放入EFI/Clover/ACPI/patched/
    
    编辑config.plist的ACPI页的DSDT patches使得原函数失效，同页添加SortedOrder选项SSDT-FN.aml使得hotpatch生效



config.plist

      find:5F513630 00
    
      replace:58513630 00
    
    
    
原理：

    Clover 更改本机dsdt的_Q60函数为XQ60，使其失效，再用ssdt_hotpatch补函数
    
    
    dsdt patches是用iasl加l参数编译原dsdt.dsl然后从dsdt.lst查找到的
    
    
    也可以用如下命令
    
    
    echo "_Q60" | xxd
    
    
    echo "XQ60" | xxd
    
