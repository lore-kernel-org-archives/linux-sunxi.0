Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3821FA4
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 02:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713666528; cv=none; b=ZSWEkAVhqkTTFgTowPxLPj5X3Djgv8nPkj8h9zber8ZyTkoNZuk/tDiR2KOvzth1p8f2STD9ex7E36Q8FhtK7hOVS3rgdE9bIXggC8drmiEyYLozHJx6ekwLDKY3kO1ZxA2L3zmdlcatAIaRoPChE3PdoCFQYYw/L6qk+Ut12m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713666528; c=relaxed/simple;
	bh=3Rt2OBhP0cEcrvnhi7V4gf+6t7xnxeyqLi1He5ac8FI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=L67WXIYj/rdQ859VDmuWQicCaTmb7I43+TRmccaRLFrP/facn2ETIMTuDIY2V/K0NQoaa8XkkWEX8sKkon/SmAlPPjf3T1ICvAwSNgCrTLLTy1DmLmywxvRTpYl9xK1cJpYppJPV9e/IjmvOSnTIFFAY3a7Jjq5a9kzCxUnGPRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=hSGqwe+7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ekmvzWuV; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="hSGqwe+7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ekmvzWuV"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 30E0E180012B;
	Sat, 20 Apr 2024 22:28:45 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Sat, 20 Apr 2024 22:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713666524; x=
	1713752924; bh=+xY/lMR+j7DPEToGaOlAuhZZE6oyfJeV5TaEs29LqB8=; b=h
	SGqwe+76vg7J4LvO+tlKHna4VxbwFaHeeK1IdwxFYMjMWqJAOHDL96053xGTK4Ai
	7PZYDzrgrqmzI35Mzasfyo/mo0m6PMwbIE8c/D1gJgTztTYQFkv3eCQqkiX2dDLn
	UEgKhxRcu/Y5sSQQqLn0nPEzkoboTaAblgNFzcYT1GsD2d4PZ1rXzsfIMWp+JF7P
	usRf2ONLGs3XKiLJQJE29YilFOJ9O0f5zFEueVqVIWacu6SOCqWykuOrSzcJEAhH
	Wktztcbu86uBnyIIR/W8HEmd9gdqX+LiJPOJC6XAaX3pRRfL7ps4MjNJB/fIOcp1
	IXjq2EmNIlU+3geKIl5Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713666524; x=1713752924; bh=+xY/lMR+j7DPEToGaOlAuhZZE6oy
	fJeV5TaEs29LqB8=; b=ekmvzWuVcjPaB8F94pHl7K3x3Jw5V3KcwyCxIqpfLkoL
	V4cx5egAPzfCkQ65EPv6SXTYUABhof4KufxWEuXibZwwhqTiPx/UPJGRikOOPRJE
	NLNG2lGPz9zhSqPS9AAQbaIsydCuVnua2FOL7Rjek7alE3xljutT6zUjjwMDA5KD
	dYcu2GBPB7Eefn+19u44KYAMOpteyZtfJnp/vHxkKN+ynqJmjouH9Pwp21Kz5uet
	HqJT/0cLFsL7y7PjNTclhIbMa4UumnSDKlyVDWQzYeHEL0XlmPk6tyUbDnAVd7Eh
	q5QSQlAd7N9npfl2ZHb1FpIOHh6gR7qbszQBF4AGSw==
X-ME-Sender: <xms:3HkkZv-xdxtr_5Jvf2s_1ExXhEKjsqvGIXrxA7qW8vSBLF2SZwFXcw>
    <xme:3HkkZrv_67z_hNg6FYDSXZswwqMiG71wzD5Op4y-ihKzZ9XqQnT464UYarvmu9sFn
    AU7RJqA-xqQspsHZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekhedgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
    rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
    ftrfgrthhtvghrnhepjedvudegieejheetudejkeffieeigefhveeiteekjeekgfevkedv
    iedttedvtedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghs
    thdrtghomh
X-ME-Proxy: <xmx:3HkkZtA8Alovnhn2WD902_ukHVTwdl4wHfOYnVSjm7DVNwL2HO4byw>
    <xmx:3HkkZrcwOgq7fm1Jd5W1k4jPMlZDoAZXLFRLpwrCHUVFVGwYi5u8eg>
    <xmx:3HkkZkPsgnk5QcZiae9MLAAVe9DqUBN7P18CL_ASknGe4rJmRQE6ew>
    <xmx:3HkkZtlmrcXoK3MrFUZ2b8-ooAzt5mKHWY9y7iQq88CzhRhRvjrepA>
    <xmx:3HkkZjrtKN2eCTry93Rz7pMA7BBvMSeYSUpQXhbPmmYJCIYvDI_I6Oso>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4FF43A6149F; Sat, 20 Apr 2024 22:28:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <275d01fe-1360-4e9b-80c1-2029fce4b2a5@app.fastmail.com>
In-Reply-To: <20240421014920.4946a5ce@minigeek.lan>
References: <20240420104354.334947-5-ryan@testtoast.com>
 <20240420104354.334947-8-ryan@testtoast.com>
 <20240421014920.4946a5ce@minigeek.lan>
Date: Sun, 21 Apr 2024 14:28:22 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: "Chen-Yu Tsai" <wens@csie.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Chris Morgan" <macromorgan@hotmail.com>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/5] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Content-Type: text/plain


On Sun, 21 Apr 2024, at 12:49 PM, Andre Przywara wrote:
> On Sat, 20 Apr 2024 22:43:56 +1200
> Ryan Walklin <ryan@testtoast.com> wrote:
>
> Hi Ryan,
>
> many thanks for the respin and the changes! We are getting there ...

Thanks for the review!

>> 
>> [1]: https://lore.kernel.org/linux-sunxi/20240419071450.7aiheeoyq35yjoo7@vireshk-i7/T/#t
>> [2]: https://lore.kernel.org/linux-sunxi/20240418181615.1370179-1-macroalpha82@gmail.com/T/#t
>
> As those are dependencies, but WIP, this gets a bit tricky:
> - cpufreq is pretty far, but comes through a different tree. I suggest
>   you drop the cpu-opp.dtsi include, to not complicate things. We can
>   add this later as a fix, once this OPP file has reached the master
>   tree.

Done, thanks. Have also not increased the DCDC1 voltage to 1.16v for 1.5GHz as it's not yet working (and technically out of spec for the SoC) but will relook at the vendor BSP once this set is merged.

> - The NMI binding and DT node seem important, but have not been merged
>   yet. I suggest to mention them as a requirement. 

Done, thanks.

> - The GPADC (in the later patch) is similar, but it is not as critical
>   as the NMI. 

Will pull this out separately, as you say its only required for the joysticks on the -H.

>> +	reg_vcc_usb: regulator-vcc-5v0-usb {
>> +		compatible = "regulator-fixed";
>> +		enable-active-high;
>> +		gpio = <&pio 8 7 GPIO_ACTIVE_HIGH>; /* PI7 */
>> +		regulator-name = "vcc_5v0_usb";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		vin-supply = <&vcc_3v3_usb>;
>
> This looks wrong, see below.
>
>> +	};
>> +
>> +	vcc_3v3_usb: vcc-3v3-usb {
>> +		compatible = "regulator-fixed";
>> +		enable-active-high;
>> +		gpio = <&pio 4 5 GPIO_ACTIVE_HIGH>; /* PE5 */
>> +		regulator-always-on;
>> +		regulator-boot-on;
>
> There seems to be something off with this one. First, it seems odd that
> an always-on regulator is GPIO controlled, as this surely means it's
> not enabled at reset time (because the GPIO is initially HighZ and thus
> not enabled). So who turns this on? Most likely it's the kernel? What
> happens if we turn this off (or leave it off)?

This makes more sense with that explanation, thanks. Taking a while to get my head round how the power distribution is done in the embedded space.

>
> Secondly, why is this 3.3V (both by name and voltage), but then
> supplies the 5.0V USB VBUS?
> And given that this is chained with reg_vcc_usb above, are those really
> two regulators, controlled by two GPIOs?
>
>> +		regulator-name = "vcc_3v3_usb";
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-min-microvolt = <3300000>;
>> +	};
>> +
>> +	reg_vcc5v: regulator-vcc5v { /* USB-C power input */
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc-5v";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +	};

Will do some more work on this and try and figure it out. The USB and second SD are not working well currently, probably this is why.
>> +
>> +	reg_pll_dcx0: regulator-pll-dcx0 {
>
> It's DCXO (letter "oh", not zero): digitally controlled/compensated
> crystal *o*scillator.

D'oh! Had to google PLL, should have googled this too.

>
>> +		compatible = "regulator-fixed";
>> +		regulator-always-on;
>> +		regulator-name = "vcc-pll";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +	};
>
> That one looks odd as well. While there might be a discrete regulator
> (what this node is describing), I doubt it, since the AXP717 has plenty
> of rails. In particular I am not sure if that fixed one would supply
> PortG (mainly WiFi), which seems unneeded for the boot process, and
> surely we want that switchable to save power if the WiFi is not needed.
>
> You also have a VCC-PLL regulator below (BLDO2).
> So please try to drop this regulator, I am pretty sure there is an AXP
> rail that powers the WiFi.

Makes sense, will dig into the vendor BSP.
>
> See below for more on this.
>

>> +
>> +&mmc2 {
>> +	vmmc-supply = <&reg_vcc_sd2>;
>> +	vqmmc-supply = <&reg_aldo1>;
>> +	cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
>> +	bus-width = <4>;
>> +	status = "okay";
>> +};
>
> This one seems more plausible. To confirm this, you could not use
> reg_vcc_sd2 anywhere, and use some other 3.3V supply for vmmc, which
> should break operation on the second SD card. Then just swap
> reg_vcc_sd2 back in, and if it starts working again, we have confirmation.
>
In hindsight this is taken from the vendor BSP, so I think is correct but will do some testing.

>> +		x-powers,drive-vbus-en;
>
> Remove this last line, the AXP717 binding does not support this, and the
> Linux driver doesn't implement this, as the AXP717 does not seem to
> have this functionality.

Thanks, fixed.

>> +
>> +			reg_aldo3: aldo3 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>
> Please remove this last line, it doesn't make sense in this context. Cf.
> Documentation//devicetree/bindings/regulator/regulator.yaml.
> I think the same applies to the other uses throughout this file.
>
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3500000>;
>
> This is not right. What is the voltage of this rail? The kernel should
> tell you what was set in the register, through regulator_summary, or you
> check what's the voltage on a BSP system.
>
>> +				regulator-name = "axp717-aldo3";
>
> If the system dies when you remove always-on, you might have found some
> essential supply. Candidates for consumers are listed in the
> H616 or T5 series datasheet. Matching the voltage might give you an
> idea. Then use this consumer as the name.
>
>> +			};
>> +
>> +			reg_aldo4: aldo4 {
>
> Same for this one: Please remove regulator-boot-on, fix the voltage,
> and provide some rationale why this needs to be on.

Thanks, will get the correct voltages. It turns out ALDO3/4 are both needed, but CPUSLDO is not. Will try and figure out what they are supplying.

>> +
>> +			reg_boost: boost {
>> +				regulator-min-microvolt = <5126000>;
>> +				regulator-max-microvolt = <5126000>;
>
> It might be better to use a range, say 5.0V till 5.2V. The
> kernel will then just continue using the default, which seems to be this
> 5.126V (5440mV + 9 * 64mV).

Thanks, fixed.

>> +
>> +&pio {
>> +	vcc-pg-supply = <&reg_pll_dcx0>;
>
> As mentioned above, it seems unlikely to be a fixed regulator. If in
> doubt, leave them out, they are not essential for the operation.
>
Will do for now, thanks.
>> +};
>> +
>> +/* the AXP717 has USB type-C role switch functionality, to be implemented */
>
> Replace "to be implemented" with "not yet described by the binding".
> This is DT land, so we don't care about implementations or the Linux
> kernel, it's all about DTs and DT bindings.
>
>> +&usbotg {
>> +	dr_mode = "host";   /* USB type-C receptable */
>
> So does this really work? It seems wrong to make this unconditional,
> given this is the only way to charge the device. When power is supplied
> through the USB-C port, surely driving VBUS from the board sounds
> wrong. Unless you have a killer feature for a host port, I think
> without working role switching, "peripheral" would be the safer
> choice.
>
>> +	status = "okay";
>> +};
>> +
>> +&usbphy {
>> +	usb0_vbus-supply = <&reg_vcc_usb>;
>
> When you stick to "peripheral" above, you should drop this line for
> now, especially since this regulator chain looks quite suspicious still.
>
Thanks, fixed.
> Cheers,
> Andre

Thanks again for the review! Will post up a v3 after some more thought about the regulators.

Ryan
