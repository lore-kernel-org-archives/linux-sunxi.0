Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E78C3F54BC
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102994; cv=none; b=c1RMMtFqwqv9NPS1Hl+Ui8OTh9m/J8kylFetnE/WbplGdYzCRl9g9sErSfk4346r7XgOqCpqxQrDktU+nFkQexBSnq9Ividtec9kZ3BhCZKYSVsY1rdSapXveI9qZAJpEFZ21CNT53K4zXebQAKIURNMP+eCu7J9qWuyEizGFS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102994; c=relaxed/simple;
	bh=pGAA9c13luwcUcUhUugAihmhN9XjUfMcS8y9zrZSnnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmjMbVoA0KDKNGeJFTBL6Y1wPeVdCbk458e63RWCYtH4s4iqdFjgXdp2hf61GmqwZ9gaEs9rMMF5Dyyt9BppYz802zSetefXZEhZLwhz603WiqcRJWc83LIhYW7NV0WrgYtp7JanAttmzI8RdojWn5dFcVa2k740lOvyAWUPVu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dLicqqL0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dLicqqL0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF1C845BF;
	Mon, 18 May 2026 04:15:59 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73BEB3F85F;
	Mon, 18 May 2026 04:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779102965; bh=pGAA9c13luwcUcUhUugAihmhN9XjUfMcS8y9zrZSnnQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dLicqqL03syVPcpPs2lnAl7S4pW0JfjBmLo2rVqYorr4b6cn/M2MOZxDH6120QlhM
	 eUDSLsu9bNmHcHqSYGD2TvEOwdHf12DcBPaT4Fu3YUcON1otOO4Ay6MbesbLres1Kc
	 ePOSKXwrxMK7dXcIE+HgmYGRtVCEpls6WVmJL9AA=
Message-ID: <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
Date: Mon, 18 May 2026 13:16:02 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alexander,

On 5/17/26 22:38, Alexander Sverdlin wrote:
> Hi Andre,
> 
> thanks for the quick feedback!
> 
> On Mon, 2026-05-11 at 13:44 +0200, Andre Przywara wrote:
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
>>> @@ -0,0 +1,162 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>> +/*
>>> + * Copyright (c) 2025 Arm Ltd.
>>
>> Please put your own copyright here, even if that has been largely copied
>> from an existing file.
>>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "sun50i-a100.dtsi"
>>> +#include "sun50i-a100-cpu-opp.dtsi"
>>> +
>>> +/{
>>> +	compatible = "baijie,helper-a133-core",
>>> +		     "allwinner,sun50i-a100";
>>> +
>>> +	aliases {
>>> +		serial1 = &uart1;	/* BT module */
>>
>> Do we really need an alias for the BT UART? And is the BT module
>> supported already? Then please add a child node to the UART node.
> 
> That's the only thing I can do currently regarding BT: stabilize the
> serial enumeration, because UART1 cannot be used for anything else
> except BT module, because this is soldered inside "core" module.
> We can avoid different tty enumeration, should the support for
> BT be implemented in the future...
> 
>> Isn't the WiFi/BT module on the SoM? Then please mention and enable MMC1
>> here. Provide the child node for the WiFi chip, even if there is no
>> upstream support in the kernel for it yet.
> 
> So both the above BT and the WiFi is AW869A/AIC8800 combo chip, which
> has neither upstream driver, nor [upstream] DT bindings. Even github
> driver for AIC8800 doesn't seem to use DT, therefore it looks quite
> pointless to me at this point to specify anything in the DT for the
> chip which doesn't have the bindings idea even theoretically.
> 
> Nothing in the current DT shall block any future work on the AW869A
> support though and the above "aliases" entry shall even guarantee
> unchanged serial enumeration shall such support arise.

Fair enough for not providing DT nodes for those unsupported chips, but 
why do we need to force enumeration? For the eventual Bluetooth usage, 
the driver will find the respective serial interface by just looking at 
its parent interface. IIUC there is nothing referring to ttyS1 
explicitly. So we wouldn't really need an alias, would we?
I see that some boards do define an alias, but others with Bluetooth 
don't, which I think is the right thing to do. Which name the kernel 
comes up with for UART1 shouldn't matter in any way.

>>> +&reg_aldo1 {
>>
>> What is aldo1 used for, actually? I don't see this referenced anywhere.
>> I guess the kernel turns that off after booting?
>> If you have access to the schematic, please check that. If that's for
>> some peripheral not yet supported, please note the user anyway, ideally
>> by an explaining regulator-name, or by a comment. Also if it's used for
>> any of the required SoC VDD pins. See the Liontron .dts for comparison.
>>
>>> +	regulator-always-on;
>          ^^^^^^^^^^^^^^^^^^^
> I suppose it's not being switcdhed of because of the above.
> It's used for both PLL supply for the whole SoC + as analog voltage reference
> for LRADC (the buttons you've noticed on the board are connected to
> this ADC via a resistor ladder).

Ah, yeah, somehow missed that line. So as stated below, please use a 
descriptive regulator name.
Look at sun55i-a527-cubie-a5e.dts, I think is a more modern example of 
how to handle regulators best.

> 
>>
>>> +&reg_aldo2 {
>>> +	regulator-always-on;
>>
>> For always-on regulators we definitely need an explanation. Does the
>> board stop booting if you remove this line?
>> Maybe it's for DRAM? Can you say what voltage it is, either from the
>> reset default, or set by the bootloader?
> 
> Thanks for the hint! I'll put proper voltages into all regulators +
> comment all the always-on regulators.

Thanks!

> 
>>
>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
>>> new file mode 100644
>>> index 000000000000..ccbca5d0a40c
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> 
>> And you should provide a top level 5V regulator here, to be the root of
>> the regulator tree. Look at reg_vcc5v in the Liontron .dts.
> 
> It doesn't look to me as if Liontron had reg_vcc5v as its 5V "root" regulator.
> It seems to be only used for reg_usb1_vbus, while HelperBoard A133 doesn't
> have USB power control. The second issue with Helper/Core split is that
> all PMIC story is inside Core board which has 5V input rail, while HelperBoard
> around it has indeed 12V->5V DCDC regulator (similar to Liontron), but
> putting it in the DT would introduce wierd dependency of the core to the
> HelperBoard which carries it. Do you think it would make sense?

Ah yeah, the Liontron is not the best example, we don't have the full 
description there, because this board misses schematics.
So look at sun55i-a527-cubie-a5e.dts instead, which uses the top level 
regulator correctly. We didn't traditionally do this with the A64 boards 
using the AXP803, and just learned to live with those dummy supplies 
created by the kernel, but for new boards we should do better.

Regarding the board/SoM split: You should have a fixed regulator in the 
SoM .dtsi reflecting the 5V input pin(s), and then using that as the VIN 
  supply for the various PMIC rails, as the Cubie A5E does. This would 
mimic some barrel connector on a standard board: the voltage is applied 
"by the user", externally.
So in this SoM .dtsi node, there is no vin-supply property, but you add 
that in the board .dts:

&reg_vcc5v {
	vin-supply = <&reg_vcc12v5v>;
};
Please come up with some better names than I just did ;-) Maybe 
something like reg_vcc5v_som to make this clearer.

And then you have that 12V->5V regulator described in the board .dts, 
along with a parent-less 12V regulator, check sun55i-t527-avaota-a1.dts 
for an example.

That should work cleanly, I think.

>> So from the pictures I found online it looks like there is an USB-C port
>> labelled "OTG", so can you please add an &usbotg reference here and
>> describe that port.
> 
> Nice catch! I've missed the fact usbphy 0 has to be in peripheral mode,
> not host mode. Will rework!

I guess that's the same situation as in the other recent boards using 
USB-C: they hardwired it to peripheral mode, although you can use this 
as a host port with some tricks, check sun50i-h616-orangepi-zero.dtsi, 
and copy this comment, should it apply.

>>> +&usbphy {
>>
>> Are the two USB ports always powered?
>>
>> And anyway, I see a *dual* USB-A socket on the pictures online, in
>> addition to the USB-OTG port. So where does the third USB come from? The
>> A133 only supports one host USB port plus the one OTG port. So is there
>> an USB hub chip on the board?
> 
> There are two hubs, one on each usbphy. OTG side hub is even bus-powered,

What do you mean with OTG side hub, exactly? Is there a hub on USB0? How 
does this work, then?

Cheers,
Andre

> two USB-A ports are always powered from the board's 12V->5V DCDC, no USB
> load switches.
>>
> 

