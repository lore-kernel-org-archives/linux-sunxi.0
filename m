Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF84C96
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713689030; cv=none; b=hemWFreufe4r2mtLb8ton3CYjfUAiiQmD27AzXepRtBXWBDPm6RxixOwviqDsAOMmyz6hyDFzD0w5i2TN7RZHj15Bj2ZWqeWDGq1aeNOEuSvG4KM52YE6GUf04DTJp+JAQXJcXYLYo+M5SkKcSIlhXcX3JeRYPHrwNbqXnV0A+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713689030; c=relaxed/simple;
	bh=UWyAALjuIpVFabeaxMVUBCChPCq5AlYRzwZOkIBR6m8=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=NknVpoZR7CayooeKmAqKHnI9WyNP84oaBbWovWGJMMEgC3XLJjjYeh5wTPJh75J/u/jcC2xw6RyAfnxIY9MsEGVs1EXV8otIAiTiaijWK2kEcIQ4jlw53c3H0AXWUZ3VtXpn9n7u5+0D3Wf7FD3NEFsz6k8yHI4jXFgtDAZiKlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=LDCdsYrk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Nymzn4ap; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="LDCdsYrk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Nymzn4ap"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id D51B61140106;
	Sun, 21 Apr 2024 04:43:47 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Sun, 21 Apr 2024 04:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1713689027; x=
	1713775427; bh=AU1RSpBWDrI1Gn8fVHBhHinFceDQNZd9SgUPqYVdpqk=; b=L
	DCdsYrkA8lzwMvsz7oG9unsmmaz5sb5Hx1OG2wkSywEkvQSzBN0zbgrxSM5TOpmd
	GcxyEgtMa8/j9CbPOUqqcTKdWca51UXlEi753wYeb5rUaXJ+oEBQRyAFye1Ekh9s
	k/8+qgoCwoMhVVGErtDFarHG2G/U2QCpJ2H7O7nN0/+l5L5MdW4BgANCBpsdx+J4
	KRyq5zvsqc5uPp0HvBSFLmfbbi3ORfuCoAv3ql7Oz0DewTCZRDeqwvhX97xO5uf4
	FVx4hxoZXMV2J+FpktUkNupDLwh1veXW/DSve+NwCkEb6atOeCqvxXaWGTW4TiD3
	bXgmunXzW1XzwVoeSz4SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713689027; x=1713775427; bh=AU1RSpBWDrI1Gn8fVHBhHinFceDQ
	NZd9SgUPqYVdpqk=; b=Nymzn4aps+Lnj8fgcGOK1Z+Q92v7WxxTxBTgbleANCGw
	etFk44s2qKcpHcX/3JH000B0r4OIqc4BT8rNrg/vSnFAhY15ho6DrsWX9TYpehV/
	UJvpcd8N8/yvH82ozoZsQN1UEUZraPV2hVMnxcHImfeXskfHi1xtA0PGNHhld7FS
	jd2IEhixWStIV7A88NMgFU5Zp8b6CHu0fejMiHqkqu+2qY31HnrPRXAU9MHUYX3N
	fk7LNx8K579fGzEe/5OJRClu1TkIo0js/SWRiM4yB872WRF7nJ2XJlo5Ntb4NX8C
	F5LaDesnur21+DnKVg+p/OHTHnru4xOttEj2GJJmag==
X-ME-Sender: <xms:w9EkZqobQpTG2nI-6Hv9Sd0yHtl2-lwg30q75mE4dRqO_zxFHooslw>
    <xme:w9EkZoqfrrkh90wYzawR425Oi4ggVeGZ9rPFL6OzePhDCuiB6l_K7bAlg4kuwQaKf
    h1OdWImrvuRjlIf9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekjedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
    rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
    ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
    ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:w9EkZvNBSKl4IAMH9cnJoH9AZZSk-VYYIT1J7UOq8a6Czs4C59_ajw>
    <xmx:w9EkZp7S68kj2eoxVGaIBngLJtqJ84ABOLY5e0dq3tDn6LxJAT4Zxg>
    <xmx:w9EkZp5ljkI9c9e2wzU1V5ZebiOEJGfw8Sz7jeJF_T6S50FhtEs0qA>
    <xmx:w9EkZpjUe3j6KWcMC6xae61f-fr54ivsQqsRQaDG0sSaxrtagWF0iQ>
    <xmx:w9EkZuHWMumN7ucmaz5_JLIIdZy6rMVXQIYdpVHWnSI8q3wrTDqK5n1l>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3117AA618EF; Sun, 21 Apr 2024 04:43:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <2735abdc-764d-4073-a55b-a4f5572a74f8@app.fastmail.com>
In-Reply-To: 
 <DM4PR05MB922920FBFF980694507FAE11A5132@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240420104354.334947-5-ryan@testtoast.com>
 <20240420104354.334947-8-ryan@testtoast.com>
 <20240421014920.4946a5ce@minigeek.lan>
 <DM4PR05MB922920FBFF980694507FAE11A5132@DM4PR05MB9229.namprd05.prod.outlook.com>
Date: Sun, 21 Apr 2024 20:43:26 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Chris Morgan" <macromorgan@hotmail.com>,
 "Andre Przywara" <andre.przywara@arm.com>
Cc: "Chen-Yu Tsai" <wens@csie.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/5] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Content-Type: text/plain



On Sun, 21 Apr 2024, at 4:00 PM, Chris Morgan wrote:

> FYI - PI12 can run as a PWM so when we get PWM output I intend to
> request this be run as a PWM led (so we can adjust the brightness).
> I'll handle that when it's ready though so don't worry for now.

Sounds good.

> Your preference, but in the past I've had the volume up/down done as a
> seperate node so we can enable key repeat. 

Done as mentioned.

> separation.  Also I usually alphabetize node names, I don't remember
> if I'm just that anal or if I was told to at one point though.

I'm easy, the order there seemed logical based on the physical layout on the -Plus but I don't have a real preference.

>
> It's described wrong, but based on the behaviour I've seen. The specific
> seems to be 2 GPIO controlled regulators; one of them enables the logic
> voltage for the USB (the 3.3v regulator) and the other enables the VBUS
> for the USB (the 5v regulator). If you only enable the 5v regulator the
> bus otherwise lays dormant. If you only enable the 3v3 regulator the
> USB bus powers on and intermittently enumerates devices at 3.3v.
> Further enabling the 5v regulator drives the USB at 4.6v (I'm guessing
> something is still wrong, we have more to poke at).
>
> To my knowledge this only applies for the USB host port which this
> device lacks.
>
Will await your work on this, I'm not at all familiar with USB to this depth, conceptually makes sense though. This will also rely on the boost working well, which is at least now being enabled with the WIP AXP717 driver.


>
> After much digging I'm certain the rails powering the wifi are
> reg_cldo4 for the 3.3v and reg_aldo4 for the IO bits at 1.8v.
> The curious thing about reg_cldo4 is it appears to feed into
> another regulator that regulates at precisely 3.3v. If I under or
> overvolt cldo4 I still read exactly 3.3v at the wifi module, but as
> soon as I turn off reg_cldo4 the wifi reads 0v. So while I can't
> directly control the power of the wifi's 3.3v rail, as long as I
> get cldo4 close to 3.3v it powers correctly.

Nice, have reworked the SD and Wifi regulators as described, and power management for the Wifi in particular seems to be working much better after moving it off BLDO2 (which seems to be VCC-PLL) to CLDO4. 

>> > +&mmc0 {
>> > +	vmmc-supply = <&reg_vcc_sd2>;
>> 
>> I don't think this GPIO controlled regulator provides the supply voltage
>> for the first SD card, since it would be disabled on reset, and the
>> BROM couldn't boot from the SD card. So it must be some other 3.3V
>> source, either a discrete regulator (fixed regulator), or some
>> default-on 3.3V AXP rail.
>
> Both the vcc and the logic for the mmc0 appear to be handled by the
> cldo3 regulator at 3.3v.
>
Thanks, makes sense. I've tentatively renamed CLDO3 to VCC-IO, looking at the H616 datasheet.
>> 
>> > +	disable-wp;
>> > +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
>> > +	bus-width = <4>;
>> > +	status = "okay";
>> > +};
>> > +
>> > +&mmc2 {
>> > +	vmmc-supply = <&reg_vcc_sd2>;
>> > +	vqmmc-supply = <&reg_aldo1>;
>> > +	cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
>> > +	bus-width = <4>;
>> > +	status = "okay";
>> > +};
>> 
>> This one seems more plausible. To confirm this, you could not use
>> reg_vcc_sd2 anywhere, and use some other 3.3V supply for vmmc, which
>> should break operation on the second SD card. Then just swap
>> reg_vcc_sd2 back in, and if it starts working again, we have confirmation.
>> 
Swapped in CLDO4 for MMC2 and the card read fine, will swap it back and see what happens.
>
> cldo3 and the gpio controlled regulator are the 2 regulators used for
> mmc2 on my board. My notes have the vmmc supply as cldo3 and the
> vqmmc supply as the GPIO controlled one, but that feels wrong. That
> said the IO pins measured 1.1v when the GPIO regulator was off and
> 3.3v when the GPIO regulator was on. The 1.1v didn't seem to come
> from the PMIC, as the only rail I had running 1.1v at the time was
> the RAM and I tested and confirmed that wasn't it.
>
>> > +
>> > +&ohci0 {
>> > +	status = "okay";
>> > +};
>> > +
>> > +&ehci0 {
>> > +	status = "okay";
>> > +};
>> > +
>
> I haven't confirmed on my board we need ohci0 and ehci0 for the OTG
> port.
>
OK, shall I remove them or will it do no harm?

>> > +&r_rsb {
>> > +   status = "okay";
>> > +
>
> Any advantage to doing this on the rsb over i2c? That's how I have mine
> wired. Both are fine with me, I just didn't know what was better.
>
I don't think so, this was Andre's first suggestion when he sent the AXP717's kernel driver so have stuck with it, but either should be fine.


>> 
>> > +
>> > +		vin1-supply = <&reg_vcc5v>;
>> > +		vin2-supply = <&reg_vcc5v>;
>> > +		vin3-supply = <&reg_vcc5v>;
>> > +		vin4-supply = <&reg_vcc5v>;
>
> FYI - I never actually confirmed the vin supply of the PMIC, I just put
> these in here to shut up some errors or warnings. If these are based
> on something I did it couldn't hurt to recheck.

Ta, will see if I can find anything out.

>
>> > +
>> > +		regulators {
>> > +			reg_dcdc1: dcdc1 {
>> > +				regulator-always-on;
>> > +				regulator-boot-on;
>> > +				regulator-min-microvolt = <810000>;
>> > +				regulator-max-microvolt = <1100000>;
>
> The CPU opp table in the BSP device tree had this between 900000 and
> 1120000. Though like most things, take anything in the BSP device
> tree with a grain of salt (lime and tequila help too).
>

Quite! That's the spec from the H616 datasheet, I may need to push it up to 1.16v max to hit 1.5Ghz, but will relook at it once the cpufreq patches land.

> I'm just speculating, but I strongly *guess* that this dcdc2 is used
> for the GPU. SoC datasheet says max should be 900000 for the GPU, but
> I don't have an opp table to go off of sadly.
>
>> > +			reg_dcdc2: dcdc2 {
>> > +				regulator-always-on;
>> > +				regulator-min-microvolt = <940000>;
>> > +				regulator-max-microvolt = <940000>;
>> > +				regulator-name = "vdd-sys";
>> > +			};

Thanks, I think I did know that from somewhere. My reading of the datasheet is 0.81-0.99v though, so will put those in.

>
> aldo4 is a critical regulator that should run at 1.8v based on my
> testing.
>
Yup, noted.

>
> cldo3 is a critical regulator run at 3.3v based on my testing. It
> supplies power to the majority of the system's pins.
>
Have called this VCC-IO for now.


> On my 35XXH I can confirm PG is supplied by reg_aldo4 at 1.8v and the
> rest are supplied by reg_cldo3 at 3.3v.
>
>         vcc-pa-supply = <&reg_cldo3>;
>         vcc-pc-supply = <&reg_cldo3>;
>         vcc-pe-supply = <&reg_cldo3>;
>         vcc-pf-supply = <&reg_cldo3>;
>         vcc-pg-supply = <&reg_aldo4>;
>         vcc-ph-supply = <&reg_cldo3>;
>         vcc-pi-supply = <&reg_cldo3>;
>
> This is what my 35XXH looks like after manually raising or lowering the
> PMIC voltage values a tad, observing the GPIO out voltages, adjusting
> again, measuring the voltages again, etc etc. By checking at least 1
> pin from each bank and confirming voltage changes via PMIC changes
> I get this mapping.
>

Great, have added these in. From the vendor DT looks like the audio codec is powered from the G pin bank.

> Thank you for all your hard work on this series. I'm going to continue
> to try and identify the remaining regulators on my board and what they
> do/how they're used. I expect at least one or two of the ones we've
> flagged for removal will need to be added back once we get the panel
> code working.
>
> Chris

No worries, thanks for the feedback! Much improved now, I think the last big issue here is the USB ports. Have been testing on my -H for now, but will have to look at the -Plus too given the single port.

Ryan
