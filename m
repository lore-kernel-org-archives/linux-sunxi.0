Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1C33C4152
	for <linux-sunxi@lists.linux.dev>; Wed, 13 May 2026 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663948; cv=none; b=qCFAbPhC7h/MSyQYh3bMxy97tsbmhJssBy8GAQupCUJsRXbcEz7wWlsZzM1Gg43dIIMMP2HjE3JeMb7fDtkWZpXJM0jgzIn8Jdvb2FsC0mJFI5Yf8Dph6qLpIN3ESxbuNhg/QQ73QJY0U4qP86TEzpJNeAZa8geKqO04RMB7zQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663948; c=relaxed/simple;
	bh=saPWjah0HLHCM+YaxUtnkBSyrUnoxwuOOdQv3RhfwtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvzoj/TzhMD16hAOjucxsdZub/9EtcZEKXoonzWVav5zBKCEZXF2QuMgUBV0rlJPpZAVTk++iy5aCSGpnpVWQ2ucAXM24NratlYnX2+QfNh9l6LpYlyEzy+XIUNGPNgzQtkm4UwJTOqPncjVS4EuujagS+SYKUCjaafP2A7joWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Dp0lKEjq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Dp0lKEjq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88EC6165C;
	Wed, 13 May 2026 02:18:59 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15E203F85F;
	Wed, 13 May 2026 02:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778663944; bh=saPWjah0HLHCM+YaxUtnkBSyrUnoxwuOOdQv3RhfwtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dp0lKEjqTCnzO3qTka4I2ucQ8tggXkfL5dRAw+ZXV19eZPL5lw5mqRgu0Vjwc4/Od
	 +xwK1qZuG2j4G/5JPv0tilYc81JyCSIp//iuf0VifXoYYfpeoLRDFqHkDpppmUvalw
	 Ahw3GnbTX+4+YFViQC2gh+Uh7NVn1tKI01vfPrZc=
Message-ID: <ee9fca66-d079-4ad7-9cb3-5077e8a4f6d6@arm.com>
Date: Wed, 13 May 2026 11:19:01 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20260511221741.25888-1-andre.przywara@arm.com>
 <CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chen-Yu,

thanks for chipping in!

On 5/13/26 07:21, Chen-Yu Tsai wrote:
> Hi,
> 
> On Tue, May 12, 2026 at 6:18 AM Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> The Cubie A5E board comes with 16MiB of SPI NOR flash.
>>
>> Enable the SPI0 DT node and describe the configuration.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
>> index bfdf1728cd14b..7ad22fc85d1fd 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
>> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
>> @@ -344,6 +344,21 @@ &r_pio {
>>          vcc-pm-supply = <&reg_aldo3>;
>>   };
>>
>> +&spi0  {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
>> +                   <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>;
> 
> This whole thing needs to be an overlay. The HOLD and WP pins
> conflict with eMMC usage, so it seems that Radxa only populates
> one or the other.
> 
> If you look at the pictures on their official website, you'll see the
> SPI NOR chip populated, but not the eMMC chip. On the linux-sunxi wiki
> page, you'll see the opposite.

Well, I have a hard time spotting any actual eMMC SKUs in the shops anyway.
But you are right, the hold and WP pins conflict with eMMC, whereas the 
other pins are not.

> And you probably want to enable QSPI, like Sashiko mentioned.

Well, in the interest of keeping this simple and enabling the usage of 
SPI flash for all the users out there, I'd rather drop the extra pins.
This is mostly really useful for booting the firmware, maybe loading a 
tiny kernel or other data once, so performance is not a big concern in 
this use case. The BootROM surely does not use QSPI.

And as you say, if people are really interested in the last bit of 
performance, they can use an overlay.

Cheers,
Andre

> 
> 
> ChenYu
> 
> 
>> +       status = "okay";
>> +
>> +       flash@0 {
>> +               compatible = "winbond,w25q128", "jedec,spi-nor";
>> +               reg = <0>;
>> +               spi-max-frequency = <40000000>;
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +       };
>> +};
>> +
>>   &uart0 {
>>          pinctrl-names = "default";
>>          pinctrl-0 = <&uart0_pb_pins>;
>> --
>> 2.46.4
>>
> 

