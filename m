Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CBC493D48
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171914; cv=none; b=H+py4ksct925kYpwKfyE3CKsg5RAAGvQqWgFkIdQ2hWLDbktrT7syW9y7YDemT52FVNfnvYDG4fP+HMm/oCNC3KwNgLWN7mJG22c7YyELydk0mBeslIr50L5XetJ5u806lxf2Z0hl8VkPny8DqHaOvqZbhaM+ADegvWXAeqVVug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171914; c=relaxed/simple;
	bh=seaxJTJr1QFSqstIVULiAM2ADNpuuFzk/qAkkHE/eoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6gRGR+ZDb63bbZwZqOrwkD3KK7pKopW47yoL4ZwqMC9Aabyay3+WAMFS/CcW20ks0xgT/nLIiQ1ZehfWIUD/28kj7f/h4ldsvwlV3v3Wg+ey6CimJcqPkG5IEWw+/ZJH1OKoQ2KTU3bHJC+7q+4kUYynZG5WKQJ9p/GR41oWto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tJnXnP8S; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tJnXnP8S"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 826DA1516;
	Wed, 23 Sep 2026 06:58:28 -0700 (PDT)
Received: from [10.57.8.59] (unknown [10.57.8.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E356B3F86F;
	Wed, 23 Sep 2026 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790171912; bh=seaxJTJr1QFSqstIVULiAM2ADNpuuFzk/qAkkHE/eoE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tJnXnP8Sxw1bW2f63cbHT/VB+QmCDJS/5cq6JlJRa/8qvbrrspWASzx3O0ihYVwsH
	 63upJJ8K+2t80zCYxPFRKVG5oq1raYhdy+IRaILEI5SiuMAuzjrGE3wYeNp+wcKg1s
	 Nh76mlizhUwBnVEEN88rbm+lTBnCJghfvxEzNOVc=
Message-ID: <b01154aa-16be-4dbb-861f-d4a70da7ad83@arm.com>
Date: Wed, 23 Sep 2026 15:58:29 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h616: orangepi-zero2w: add
 SDIO WiFi/BT (AW859A)
To: Vladimir <anykey196@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260923112009.1062-1-anykey196@gmail.com>
 <20260923112009.1062-2-anykey196@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260923112009.1062-2-anykey196@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

your threading looks somewhat off, and you are missing a cover letter, 
so I am a bit lost in here. But just jumping in here:

On 9/23/26 13:20, Vladimir wrote:
> Enable the SDIO bus (mmc1) and power the on-board AW859A (UWE5622)
> WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18) and
> gates the RTC 32 kHz fanout clock (PG10), with the 3.3 V and 1.8 V supplies.
> 
> The pwrseq clock must be named "ext_clock" (what mmc-pwrseq-simple requests)
> and its output pin must be muxed to the clock function, as done for the other
> H616/H618 boards.
> 
> Tested on: OrangePi Zero 2W (Allwinner H618) with the out-of-tree uwe5622 driver.
> 
> Signed-off-by: Vladimir <anykey196@gmail.com>
> ---
>   .../allwinner/sun50i-h618-orangepi-zero2w.dts | 42 +++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> index ff9b40352a5..39f580af15b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> @@ -189,3 +189,45 @@ &usbphy {
>   	usb1_vbus-supply = <&reg_vcc5v>;
>   	status = "okay";
>   };
> +
> +/ {
> +	reg_vcc33_wifi: vcc33-wifi {
> +		/* Always-on 3.3V regulator for WiFi and BT */

Why is this a separate regulator? Looking at the schematics, the WiFi 
chip seems supplied by VCC-WIFI, which is connected to DCDCE/VDD33, 
which is already modelled as reg_vcc3v3, in the .dts file.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc33-wifi";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		vin-supply = <&reg_vcc5v>;
> +	};
> +
> +	reg_vcc_wifi_io: vcc-wifi-io {
> +		/* Always-on 1.8V regulator for WiFi and BT IO */

Same here, VCC-WIFI-IO, which is supplied by aldo1. It's naturally the 
same voltage as the PortG supply, already specified in the "pio" node.

So I think those two regulators can go, and ...

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-wifi-io";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		vin-supply = <&reg_vcc33_wifi>;
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&rtc CLK_OSC32K_FANOUT>;
> +		clock-names = "ext_clock";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&x32clk_fanout_pin>;
> +		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>;	/* PG18 */
> +		post-power-on-delay-ms = <200>;
> +	};
> +};
> +
> +&mmc1 {
> +	vmmc-supply = <&reg_vcc33_wifi>;
> +	vqmmc-supply = <&reg_vcc_wifi_io>;

... be replaced here with &reg_vcc3v3 and &aldo1, respectively.

And this is all depending on that we actually make DT changes for 
devices which don't have a binding, and for which we don't specify a 
child node in here.

Cheers,
Andre

> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	bus-width = <4>;
> +	non-removable;
> +	mmc-ddr-1_8v;
 > +	status = "okay";> +};

