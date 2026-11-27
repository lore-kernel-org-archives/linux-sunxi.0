Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799222;
	b=Mv8TEFSgzoRQqEekk+q/WsxJDEr/tOxa3HgwKo7GGR0UXWlrnBU6JeacYwH2y3+chpGi
	 8RImdS391p3Ui/ecw9mV+nsys9yVKQEK1ojNawDoC42V+v80ZYeBeBifJgCqgUXmv6pKF
	 V6sasqjOoKSh1o91AmC8P20etaEAEGfgZmp4SYd8j0wC5C1FqAqUNV/+X35S20SGG+dxu
	 kZ4DI5CFm4cDDrIqvVPW/TFU16kugAdcismAHERNVNDNBiR+WuC3FJoGo0MY33knmdb6X
	 dpkz/WdUcMD4tQUdrkBJEOxCiVejccM/5puwQai7jxM5dhOmNlKD2pW6ONqY1FeoH+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799222;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9gzHBqo1ZS1N9lhELOvmEI3+H79vKOr9CzjE/QFqZ20=;
	b=cdFYw2Pm/303A9HuEAf4etkEDd93I1P1ODwqqqwFqyfGrQDq67DS9Ib4u1UwFC4imL5v
	 gvdCprWQC+XK4Cde1vaeqSpuv4xJAMZVNaawER1u1sS75HaqlXYtkAlzT4ABxM9cY8SFf
	 YI87GCfHRpJnnbddrVOACavnz/RIbrEDcAQlWk1GD2RYyEm1oJ23PSEvWZj6eCDXGg3rb
	 U2lLR4lr9fliMq/4xECMTOoEo9drFtSDpHQJFVAi8DvUfSLrVagxatqAnlnFfNtwbSb4F
	 /J9jjwkEsu42kIE5afqbhjthvv3/fu6/DXcOTQXSFtLmgMb+WKKQoD45rF0scKyQ+qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=V1Rkddvt;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141AC606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 17:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 141AC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=V1Rkddvt
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 181621575;
	Fri, 27 Nov 2026 09:06:58 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCBED3F632;
	Fri, 27 Nov 2026 09:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795799220; bh=qFa6sy83V0It3krE5paW+O7B9Fqh10IXDVByOoZlZCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V1RkddvtAdtrHpMFzFpDiZ4C/UaR5WYNc0ztJ5+Z463L6+Nv4oHyzmK4HiDTvzwPm
	 6AN/jKSaaEq5km6iu5X7tdN3q7y61sqjxji932nkfydkvILEPaCr/n+5gNJQa4j/1l
	 RxbqgiXm9QE3eTgf9w3rbLIjjLNBO5C4uWWNZwhg=
Message-ID: <682cee16-d56c-436a-8661-0cf511fa2e78@arm.com>
Date: Fri, 27 Nov 2026 17:06:54 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
To: Norman Herms <dockseed@proton.me>, Jerome Brunet <jbrunet@baylibre.com>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, Enzo Adriano <enzo.adriano.code@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
 <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
 <1jld6eldic.fsf@starbuckisacylon.baylibre.com>
 <wzwsbUKM-fEhYpTIhswvHly5oyuMCPDOExJEWjbSf-OS3Lrwx2H_l9CUfuMITJUK5CyEz4pNojUFRzjDDczUQmX_LmSWwF7DVSceD34XeHY=@proton.me>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <wzwsbUKM-fEhYpTIhswvHly5oyuMCPDOExJEWjbSf-OS3Lrwx2H_l9CUfuMITJUK5CyEz4pNojUFRzjDDczUQmX_LmSWwF7DVSceD34XeHY=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/27/26 17:37, Norman Herms wrote:
> Hi Jerome,
> 
> On the PF voltage selector: we have been running UHS-I on the Cubie
> A7S for a while in our own trees (6.18 and mainline based). Here is
> what we ran into, in case it helps whoever models it.
> 
> - The switch: on this board bank PF takes its supply from VCC-IO
>    (3.3 V) or from CLDO5 (1.8 V), selected by GPIO_POW_VAL_SET_CTL
>    bit 0 (1 = 3.3 V). There is no external regulator to switch, so

What do you mean by that? The proper solution is to *create* a new 
regulator driver, either embedded in the pinctrl driver (make the 
pinctrl export a regulator device), or as a separate driver, using some 
pinctrl provided regmap. To be precise, it should be some kind of 
regulator mux, selecting between VCC-IO and VCC18-PF.
And then it should indeed just be a matter of pointing vqmmc-supply to 
that regulator to make it work.
Are you using a different approach? I have seen various downstream 
patches implementing something similar, and they seem to be happy.
And I have seen pinctrl states as well, but think we need a proper vqmmc 
regulator, regardless?

>    vqmmc does not fit, and sunxi-mmc without vqmmc returns -EINVAL for
>    1.8 V.

Do you mean you use vmmc-supply to point to some 1.8V regulator? This is 
indeed bound to fail, as the SD spec requires 3.3V always for the supply 
voltage. And the binding/SD card Linux subsystem allows not providing 
vqmmc, at which point it will assume it's the same as vmmc - but not the 
other way around.

 >    We use two pinctrl states, "sdmmc-3v3" and "sdmmc-1v8" as on> 
Tegra, whose pin groups carry power-source.
> 
> - The withstand mode: with PF in the adaptive mode of
>    GPIO_POW_MOD_SEL (01, which is what the pinctrl automatic voltage
>    detection patch sets), the pads follow the SoC's own supply
>    detector, and on our board that detector now and then reports
>    3.3 V while PF runs at 1.8 V.

Is that a timing issue, maybe? Maybe the sampling happens only so often, 
and you just happen to miss the change, occasionally?

> With one card, 14 of 40 SD rebinds at
>    SDR104 failed: the CMD6 status read gets a data CRC error and the
>    card falls back to high speed; once the card was lost ("error -5
>    whilst initialising SD card"). Setting the PF mode by hand together
>    with the switch gave 0 of 40: 10 (3.3 V) before switching to 3.3 V,

Just to clarify: "0 of 40" means *0 fails* here, so it works?

>    and 11 (1.8 V) after switching to 1.8 V, once GPIO_POW_VAL reports
>    PF at 1.8 V. Our final patch does that and also gave 0 of 40.

Do you mean your patch just badly hacks those two bits to do what you 
want, by treating PortF separately, but it's not something that looks 
nice and upstreamable?

>    Oddly, the fault also goes away while the USB3 combo PHY runs; on
>    this board CLDO5 supplies its analog part too. Another card passed

So according to the A7A schematics VCC18-PF is a separate power supply 
pin on the SoC, and it's supplied by CLDO5. On the A7A CLDO5 is not 
always-on, so you would need to reference it somewhere to be enabled, by 
the SD card node.

>    40 of 40 even in the adaptive mode.
> 
> - The eMMC on bank PC needs no switching, CLDO5 is fixed at 1.8 V.
>    But if the boot chain leaves the PC field at its reset value 10 (the
>    register resets to 0x022aaaa0), HS400 enhanced strobe fails with
>    "mmc_select_hs400es failed, error -110". So on PC, 10 behaves as the
>    3.3 V mode, as in the register table, not as the adaptive mode the

But this is a firmware problem, then? As 0b10 is documented as 3.3V, 
which is wrong if you use a 1.8V eMMC. So doesn't the new pinctrl fix 
patch overwrite this with "auto" (0b01)?
Even if not, firmware should not program the wrong values. I guess 
U-Boot would similarly fail to access the eMMC with that wrong value?

Cheers,
Andre

>    text of 18.14.4.6 gives for C/E/K. 01 and the fixed 1.8 V mode (11)
>    both work.
> 
> We can test patches for this on the A7S, SD and eMMC.
> 
> Built and measured by AI agents (Claude) on my boards.
> 
> Thanks,
> Norman

