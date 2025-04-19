Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB509647
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 23:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745103907; cv=none; b=XYZI6DzQSx3XSXxrSvqXrsNYDxzd1icWO6XYfRM7GEVUbmXd8pYpLX49f7e0xVuutmzfdrw9VTJUkzfXXgb86Qm06Y5dkvJ2MjpbIFtRiDJEt5TimQZXBmByUCYjaGA/w1gwKPqjlqQI5yPb+voEpIZZJjc8vPQQxsXjLXWmJV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745103907; c=relaxed/simple;
	bh=v0komfdwHVKItoht1m9mWq23AvlDG+OHCDLJw1NqExg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=k4yyviWE5jVLGVyov76TFDsFH02J0Rz+umV9NXZnptE42xkKXGM9L8gf49uSJ5XIOTdCACEZe+c/N+CUrqLzfER6V260S7/Tq9vFRUdbD+q/MYTWQEQhoqP6txnhCwuqvgMTZt4Ilq9Nl10tex3Fuj2Ep0NZY+2UjeAlThC6DZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=nfTSy4iv; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="nfTSy4iv"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1745103902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dJILUVU/k/Bgulj8IWhv/IpUvhi1cwbH8que/xb7Oh8=;
	b=nfTSy4ivwamtUe6xhyiRZNGFNNVqR3T/ehrNgDVTrzulhpJrSjwtZeizb9bgIyf8kAKVN/
	d8EQx4Q+36HDuxF10sMjzTR68BjvuInLg25iiqwZhqXb6mAGk3oqkw+rlVg8BxOnM1rv4n
	3th9LV91atqNEx+zlaMGVgWV7HzAEwl0dzR76gObW8VvRT2cNq3s7yZmKH4FasBR4LxZME
	amVNmTzeXN044Hx5/mbNwrxwVmRtGSMXGXAb8HVSrhpJrb0uLUZFOMmWzzmGdvOf2MORWr
	6gBMOH811oAPLNpFIjanu51hXjwB4j7bT3Y37MxkxcWz1UY6i3u231pIeg6J1A==
Date: Sun, 20 Apr 2025 01:05:01 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [RFC] arm64: dts: allwinner: a64: Add overlay for Realtek
In-Reply-To: <f063ced3436e239eaad8ab0589ba2cb1@manjaro.org>
References: <20250419160751.678827-1-pbrobinson@gmail.com>
 <f063ced3436e239eaad8ab0589ba2cb1@manjaro.org>
Message-ID: <bae03568fa68eab7d861d33cfb816bce@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2025-04-19 20:08, Dragan Simic wrote:
> Hello Peter,
> 
> On 2025-04-19 18:07, Peter Robinson wrote:
>> Add overlay for the Pine64 Realtek rtl8723bs WiFi
>> module that works on the Pine64/64+/SoPine devices.
>> 
>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> 
>> I've looked at overlays for other vendors, such as available
>> for some of the Rockchip devices, and I believe I have this
>> mostly correct but would like some feedback both on if I have
>> everything needed for Allwinner devices, but also what's needed
>> to be able to use a single overlay across more than one device.
>> 
>> This is dependent on the following [1] patch series.
>> 
>> Peter
>> 
>> [1] 
>> https://lore.kernel.org/linux-devicetree/20250419160051.677485-3-pbrobinson@gmail.com/t/#u
>> 
>> ---
>>  arch/arm64/boot/dts/allwinner/Makefile        |  6 ++++
>>  .../allwinner/sun50i-a64-pine64-realtek.dtso  | 30 
>> +++++++++++++++++++
>>  2 files changed, 36 insertions(+)
>>  create mode 100644 
>> arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
>> 
>> diff --git a/arch/arm64/boot/dts/allwinner/Makefile
>> b/arch/arm64/boot/dts/allwinner/Makefile
>> index 00bed412ee31..be991f8d8110 100644
>> --- a/arch/arm64/boot/dts/allwinner/Makefile
>> +++ b/arch/arm64/boot/dts/allwinner/Makefile
>> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += 
>> sun50i-a64-olinuxino-emmc.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-lts.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-plus.dtb 
>> sun50i-a64-pine64.dtb
>> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-realtek.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinebook.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.0.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.1.dtb
>> @@ -52,3 +53,8 @@ dtb-$(CONFIG_ARCH_SUNXI) +=
>> sun50i-h700-anbernic-rg35xx-2024.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
>> +
>> +# Overlays
>> +sun50i-a64-pine64-realtek-dtbs      := sun50i-a64-pine64.dtb
>> sun50i-a64-pine64-realtek.dtbo
>> +sun50i-a64-pine64-lts-realtek-dtbs  := sun50i-a64-pine64-lts.dtb
>> sun50i-a64-pine64-realtek.dtbo
>> +sun50i-a64-pine64-plus-realtek-dtbs := sun50i-a64-pine64-plus.dtb
>> sun50i-a64-pine64-realtek.dtbo
> 
> Thanks for the patch, having this DT overlay makes perfectly
> sense to me.  The only possible issues may arise from the
> resulting size increase of the compiled .dtb files, caused by
> the implicit inclusion of symbols.
> 
> However, please see an earlier linux-rockchip thread [2] that
> shows the desired layout of the additions to the Makefile, which
> was determined through a few rounds of discussion.

Please, see another linux-rockchip thread [3][4] for more examples
of the DT-overlay-related additions to the Makefile, which includes
a rather neat comment block to be copied over.

> Finally, I think we should choose a slightly better name for the
> DT overlay, instead of "sun50i-a64-pine64-realtek.dtso", in which
> "-realtek" seems a bit to vague.  Perhaps "-wifi-bt-addon" as the
> filename suffix would fit better, and it's virtually guaranteed
> that there will be no new version of that add-on board, so there
> should be no potential for name clashing.
> 
> As a minor suggestion, the patch subject should also be tweaked
> a bit, because "Realtek" is also a bit too vague there.
> 
> [2] 
> https://lore.kernel.org/linux-rockchip/20250226140942.3825223-4-heiko@sntech.de/

Having the above-mentioned ML thread [3][4] in mind, I think that
"-wifi-bt" should actually be fine as the filename suffix.  It would
also result in some kind of consistency.

Finally, I'd suggest that you merge all three patches into a single
series, because that's how they naturally fit together.

[3] 
https://lore.kernel.org/linux-rockchip/20250211-pre-ict-jaguar-v6-1-4484b0f88cfc@cherry.de/
[4] 
https://lore.kernel.org/linux-rockchip/20250211-pre-ict-jaguar-v6-4-4484b0f88cfc@cherry.de/

>> diff --git
>> a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
>> new file mode 100644
>> index 000000000000..51b57a46e23f
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
>> @@ -0,0 +1,30 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +// Copyright (c) 2025 Peter Robinson
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +&mmc1 {
>> +	status = "okay";
>> +
>> +	rtl8723bs: wifi@1 {
>> +		reg = <1>;
>> +		interrupt-parent = <&r_pio>;
>> +		interrupts = <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 */
>> +		interrupt-names = "host-wake";
>> +	};
>> +};
>> +
>> +&uart1 {
>> +	status = "okay";
>> +
>> +	bluetooth {
>> +		compatible = "realtek,rtl8723bs-bt";
>> +		device-wake-gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
>> +		enable-gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
>> +		host-wake-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* PL5 */
>> +	};
>> +};
