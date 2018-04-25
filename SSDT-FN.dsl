/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLcPka8Q.aml, Wed Apr 25 19:38:01 2018
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000BC (188)
 *     Revision         0x02
 *     Checksum         0x04
 *     OEM ID           "hack"
 *     OEM Table ID     "fn"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "fn", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.CBSC, FieldUnitObj)    // (from opcode)
    External (CBSC, UnknownObj)    // Warning: Unknown object

    Scope (\_SB.PCI0.LPCB.EC0)
    {
        Method (_Q60, 0, NotSerialized)  // _Qxx: EC Query Fn某按键
        {
            If (LEqual (CBSC, 0x04)) //如果是Fn+F4的话
            {
                Notify (RMKB, 0x114F) 
                Notify (RMKB, 0x124F)
            }

            If (LEqual (CBSC, 0x05))//如果是Fn+F5的话
            {
                Notify (RMKB, 0x114D)
                Notify (RMKB, 0x124D)
            }
        }
    }

    Device (RMKB) //配合ACPIKeyboard.kext的一个我也不知道叫什么
    {
        Name (_HID, "RMKB0000")  // _HID: Hardware ID
    }
}

