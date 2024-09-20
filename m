Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE11C693
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Sep 2024 05:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726810740; cv=none; b=oqj9HFeEcldp6eGm9E680t41pTzfDp1kZz9zZ050VFY0zUzQxDWUsZboAOQvGeyNp2JjAh/IlTk5Z+6XlEp8anPPpT6KeofIcwzkHJ/VgQRQUDZcwy740Fku8FeLJaQhtU3OeMaISCys+i7xmO8FO28sv2ikySH6gt+diHyMBQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726810740; c=relaxed/simple;
	bh=9mM7JGjQh2uRfy2PIfM9U9eC6nQ/UPRh8t+iXq52YLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g/oHOkEr5aLSl5JBfTGQdsvj8+ohS25tn1WNcyPOn0mBXBTfFDU+uBKkCva4Zo4UEl2e+3OM1TzaRfqRAkuHIOoQYYCga4IF0ZmkRQ/6g+gFAOKc30Sh2AIRBKOP9aZHYjNHAzLCh9YpMzu843qarzsw2WMDdPOv9KrKxvuCusU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R76IFc+c; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R76IFc+c"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so13514475e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Sep 2024 22:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726810736; x=1727415536; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Frjxz5etneHCaaJgzRHNp4iPyV6Hzbgn0iIJTfYdgIk=;
        b=R76IFc+cFa8iQF266u8PQQUNSnLCYXTI22f3VNnKx8L63xZeys3zgH8+2IkIOBCAlH
         +Xv60Tqd9a1zRemrnGFAU9HLSWrp3hgFKmA3bAv7VxdKBxJ8Kelt1MhZvxcwVXRYtlOR
         MKOqnE6eBMVDVfRLCwZojkYlDIsCrg5s0ZK+5/Am+sn2OqAdBysJVfOK5jexYRQi6sLS
         v/tWcKEx3bgML1Ii7LqkbZCt8LOXP6wb2GiofelCrLhV6w9KvR38G3F2cPT/vsWeQTXC
         BZGCglhf1IcI+bG6YoJYkweK8J6RxxLB/Ab434Yzzyg5yHA9aHxuEpU3b2jmYmViiLf1
         gHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726810736; x=1727415536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Frjxz5etneHCaaJgzRHNp4iPyV6Hzbgn0iIJTfYdgIk=;
        b=Psjjn2ONu7U6vQq746GvFewF7xZ20+Jb3QfXvsYE8F0WdpcFEI4hQRkQYDy4XB4LIR
         Z+rFR3rplBEMFvxeAemMewwdyQELvcptltL4usubiY/x6/eJqlqzDOah897RxAoM4gF0
         KXYuQcCXz04XJ/lMQk8RDrrtuEChmgUgDxb2/Mz2H/9lRTb3pYsXh2AUMj0Tpfu8fPtM
         K7apSB9cLSxSdPxipq17Cj0/S1Su/lP5SQDO48mroElHA+n2WPewxgd8X/85qgPkPObj
         oSB9ODlT5hWsLuFarHRb1waYLmr8s4E7ZgpsJfeC7Hkud3xtA9J2WQFDDyZXe7HKXClF
         vg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWs0IcmEqEt16fuA78jFob9b20fE57uUkCJGEOHRNLIclPBlqznrIyP0wTK7CqyGZcgKjr3g35HzRGS7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwC61lnml427DkpchzhA0CyaZJwJA4UqU4+b8Vh8i4nxWmzmQu2
	DVtSAtakk5K4JhTzgP0jtkN7Si9aSVDZj1UzMInRgzu84P+ewCQt
X-Google-Smtp-Source: AGHT+IHyVmJ/Xhl5VAZSjrj3EfgC6w8klVkHfqzqRBFPY326hghRpoKJbRZkPZkL2dOJa1WhWtl8LQ==
X-Received: by 2002:a05:600c:310a:b0:42c:a89e:b0e6 with SMTP id 5b1f17b1804b1-42e7abe8e3emr9928395e9.11.1726810735502;
        Thu, 19 Sep 2024 22:38:55 -0700 (PDT)
Received: from [192.168.0.241] (85-193-33-128.rib.o2.cz. [85.193.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afe0eedsm12297155e9.32.2024.09.19.22.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 22:38:54 -0700 (PDT)
Message-ID: <fed7f9f5-0189-4ac4-bcc5-4b59e8b1ccc1@gmail.com>
Date: Fri, 20 Sep 2024 07:38:53 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: allwinner: Add disable-wp for boards with
 micro SD card
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240919-b4-nanopineoplus2-fix-mmc0-wp-v2-1-c708a9abc9eb@gmail.com>
 <20240919212151.50957a14@minigeek.lan>
Content-Language: en-US, cs
From: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
In-Reply-To: <20240919212151.50957a14@minigeek.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 19. 09. 24 v 22:21 Andre Przywara napsal(a):
> On Thu, 19 Sep 2024 20:35:39 +0200
> Kryštof Černý <cleverline1mc@gmail.com> wrote:
> 
>> Adding disable-wp property for micro SD nodes of Allwinner arm64 devices.
>> Boards were verified from online pictures/tables
>> that they have micro SD slots.
> 
> The changes itself look good to me, and I checked that the boards in
> question have a microSD card slot, so do not feature a write-protect
> switch.
> You seem to be missing the mmc0 node in
> sun50i-h616-bigtreetech-cb1.dtsi though, can you please add this file,
> to fix the two boards using this file as well?
> 

I wondered about that one, as it's just a compute module without the
actual slot, I thought it was not right to put it there, as
someone could wire it to full SD or eMMC in their own board.
Maybe put it to sun-50i-h616-bigtreetech-cb1-manta.dts and
sun-50i-h616-bigtreetech-pi.dts instead? The dtsi has broken-cd
property already, but as it seems it is wired to the connector.
I was not sure about this, what are your thoughts?

> With that added:
> 
>> Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 
> There are some boards which have their base .dtsi in the arch/arm
> directory, but we can tackle those separately.

I missed them, if I add the property to sunxi-libretech-all-h3-cc.dtsi
and sunxi-bananapi-m2-plus.dtsi, could tag you as a reviewer?
There is also a module called Emlid Neutis, the compute module itself
has not a slot, but the board that uses it does, unfortunately they are
not separate files, so I do not see a clear solution here, as above.

Best regards
Kryštof Černý

> 
> Cheers,
> Andre
> 
>> ---
>> Sorry that my last messages were not in mailing list,
>> one was wrongly sent and second was rejected, as the bot claimed it
>> contained html. ---
>> Changes in v2:
>> - NEW: Added the property to all Sunxi arm64 boards, as discussed in
>> mailing list
>> - Link to v1:
>> https://lore.kernel.org/r/20240914-b4-nanopineoplus2-fix-mmc0-wp-v1-1-12f54f0d6620@gmail.com
>> --- arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts    |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts         |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts       |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts        |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts      |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts  |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts         |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts          |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi           |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts            |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi              |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi    |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts          |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dts       |
>> 1 + arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts |
>> 1 + 16 files changed, 16 insertions(+)
>>
>> diff --git
>> a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts index
>> 526443bb736c..18fa541795a6 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts @@
>> -136,6 +136,7 @@ &mmc0 { vmmc-supply = <&reg_vcc3v3>; bus-width = <4>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
>> +	disable-wp;
>>   	status = "okay";
>>   };
>>   
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts index
>> 05486cccee1c..128295f5a5d6 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts @@ -88,6
>> +88,7 @@ ext_rgmii_phy: ethernet-phy@7 {
>>   &mmc0 {
>>   	vmmc-supply = <&reg_vcc3v3>;
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
>>   	status = "okay";
>> diff --git
>> a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts index
>> 3a7ee44708a2..44fdc8b3f79d 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts @@ -157,6
>> +157,7 @@ eth_mac1: mac-address@fa { &mmc0 {
>>   	vmmc-supply = <&reg_vcc3v3>;
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
>>   	status = "okay";
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts index
>> ce3ae19e72db..0f29da7d51e6 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts @@ -153,6
>> +153,7 @@ &ir {
>>   &mmc0 {
>>   	vmmc-supply = <&reg_vcc3v3>;
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
>>   	status = "okay";
>> diff --git
>> a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts index
>> b699bb900e13..d4fc4e60e4e7 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dts @@
>> -153,6 +153,7 @@ &ir { &mmc0 {
>>   	vmmc-supply = <&reg_vcc3v3>;
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
>>   	status = "okay";
>> diff --git
>> a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
>> index ae85131aac9c..3322cc4d9aa4 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts @@
>> -82,6 +82,7 @@ ext_rgmii_phy: ethernet-phy@1 { &mmc0 {
>>   	vmmc-supply = <&reg_vcc3v3>;
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
>>   	status = "okay";
>> diff --git
>> a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
>> index 734481e998b8..3eb986c354a9 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts @@
>> -79,6 +79,7 @@ hdmi_out_con: endpoint { &mmc0 {
>>   	vmmc-supply = <&reg_vcc3v3>;
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
>>   	status = "okay";
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts index
>> 3be1e8c2fdb9..13a0e63afeaf 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts @@ -129,6
>> +129,7 @@ ext_rgmii_phy: ethernet-phy@1 { &mmc0 {
>>   	vmmc-supply = <&reg_cldo1>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts index
>> 6c3bfe3d09d9..ab87c3447cd7 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts @@ -131,6
>> +131,7 @@ hdmi_out_con: endpoint { &mmc0 {
>>   	vmmc-supply = <&reg_cldo1>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
>> b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi index
>> 13b07141c334..d05dc5d6e6b9 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi @@ -94,6
>> +94,7 @@ hdmi_out_con: endpoint { &mmc0 {
>>   	vmmc-supply = <&reg_cldo1>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts index
>> c8b275552872..fa7a765ee828 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts @@ -133,6
>> +133,7 @@ ext_rgmii_phy: ethernet-phy@1 { &mmc0 {
>>   	vmmc-supply = <&reg_cldo1>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
>> b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi index
>> 855b7d43bc50..bb7de37c0d58 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi @@ -124,6 +124,7
>> @@ &mmc0 { pinctrl-0 = <&mmc0_pins>;
>>   	vmmc-supply = <&reg_vcc3v3>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	status = "okay";
>>   };
>> diff --git
>> a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
>> b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi index
>> fc7315b94406..a3fe39f8e2ca 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi @@
>> -81,6 +81,7 @@ ext_rgmii_phy: ethernet-phy@1 { &mmc0 {
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts index
>> 26d25b5b59e0..dd3bd9cca710 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts @@ -52,6
>> +52,7 @@ &ir { &mmc0 {
>>   	vmmc-supply = <&reg_dcdce>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	status = "okay";
>>   };
>> diff --git
>> a/arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dts index
>> 18b29c6b867f..16c68177ff69 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dts @@ -111,6
>> +111,7 @@ ext_rgmii_phy: ethernet-phy@1 { };
>>   &mmc0 {
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;	/* PF6 */
>>   	vmmc-supply = <&reg_vcc3v3>;
>> diff --git
>> a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
>> b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
>> index d6631bfe629f..024377b333c1 100644 ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts @@
>> -71,6 +71,7 @@ &ir { &mmc0 { vmmc-supply = <&reg_dldo1>;
>>   	cd-gpios = <&pio 8 16 GPIO_ACTIVE_LOW>;	/* PI16 */
>> +	disable-wp;
>>   	bus-width = <4>;
>>   	status = "okay";
>>   };
>>
>> ---
>> base-commit: 57f962b956f1d116cd64d5c406776c4975de549d
>> change-id: 20240914-b4-nanopineoplus2-fix-mmc0-wp-9d77fb9e6513
>>
>> Best regards,
> 

