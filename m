Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F10192
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Dec 2022 23:40:52 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 2A31232000F9;
	Wed, 14 Dec 2022 18:40:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 14 Dec 2022 18:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1671061250; x=
	1671147650; bh=3KxGC4m0SO7soOVEDEsWDJFAvYuVstY2xQBrf1aA5bI=; b=u
	g/hmwqk4D7EadpAr188NXxTIXwpDM5Fqi0TMLtIkEGexZyQz2MDHa31kqKGKM5RR
	v09FQt2e4JNI92aRN3ui3JccTdz/rh5T4oTkzRf6OGb6Q1R9S5g65Z6AhFu7my/s
	YxT+FMHGKQJHuYAyojz+Vqsz7urxDVIkdhPg8JWoCoQ8AJ3bfK3xa0NmEznoIB39
	i3PnWdwgjb5eZh2N9Ua09fc7Rwv+bIB3VMatiWIxIfRdHI4TAfdxdqyFRn7JTGFK
	T1m4ewXV4Bh1WnLoTQVRomrmq81zQNolGidxrqr6n99msphl2zQ0Vi99WxYlewOG
	UtJnz4GA1D9OoqHDIsKcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671061250; x=
	1671147650; bh=3KxGC4m0SO7soOVEDEsWDJFAvYuVstY2xQBrf1aA5bI=; b=N
	Di8Vyyd6uAW3ze1RcHsUiuSzh1agnznZ4X+UMl7BEHJLdRj83MiLp+mFoz/5npEI
	dr6Mkq+JTacXDTFrjL3CdbIMEQenW6i+noaDrIMAzK6kdQDzQXKB39zaxlcdMSuI
	O+8uEGM100TNC3Q58YQpERLqm5gpZTTj3y6KVUaeJKZBeNmTvYWh+6iey6HYCIEW
	gfrZ/kWmRSx0jP1bqjrXJxKujk9k9OpMXUWuNjxD9vOgJyGRLnejZiox0nwzflXW
	ivvBHVRUrdfriAJrt0AqGxh1OvaXuZkjUTyBYzT3YwF4tW6pvzu7LKY2KhMkDLAc
	N5ut3CvBBcPljAN1Vljbw==
X-ME-Sender: <xms:Al-aYwwzidbPJl0qHDcUz-0JyonpbogVTZd3v5Q3wVIOVyzwIKu4Zg>
    <xme:Al-aY0SgTVswUlrpVMiDNIF-uvCCAPfIgx1jMoMQd3_L_8IGApv073ME7ugvOy1TU
    QOXravRDIAn76b-uQ>
X-ME-Received: <xmr:Al-aYyWtGkwQ6foV4xRfFDpRzazDYb7ax39fKHsh8nbXchsH5BifWehn2qh7lQsbzC5g9bTkrja-a9vFNwIx3ViUobXLKhCesFH1QxIzJUwam4dcnwJOgGKUyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepjefgfffhudejfedtuedugeeutdetgfeiteffffehjeeugfeuvdeh
    jeetfedtffdtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:Al-aY-hi6ldsQQ0eJoll34OFa6cQRo6RkYiKxkR8a-21yKzUMHYueg>
    <xmx:Al-aYyBRzJ2-6L6ps4iV_d_3n1lMdik-059FAsemAdjZXRKpWRgP0w>
    <xmx:Al-aY_LmR8vnZZIbIgtykWHoLzE7wpjwFHKnGBJS_3B9en9Y0TV6XA>
    <xmx:Al-aY1-j4w0MWHm8YUkEOV-OIgJqI3CCuaUQKiuKISdVSjZkdFpEwQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:40:49 -0500 (EST)
Message-ID: <1202d90b-f433-10be-fb2a-b5bf4ef605f7@sholland.org>
Date: Wed, 14 Dec 2022 17:40:49 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
 Icenowy Zheng <uwu@icenowy.me>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
References: <20221206004549.29015-1-andre.przywara@arm.com>
 <20221206004549.29015-2-andre.przywara@arm.com>
 <bb2ef69f-23e1-9936-e824-6b86924b9c8a@sholland.org>
 <20221214142517.66b69b02@donnerap.cambridge.arm.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 01/17] sunxi: remove CONFIG_SATAPWR
In-Reply-To: <20221214142517.66b69b02@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Andre,

On 12/14/22 08:25, Andre Przywara wrote:
> On Wed, 14 Dec 2022 02:37:12 -0600 Samuel Holland <samuel@sholland.org> wrote:
>> On 12/5/22 18:45, Andre Przywara wrote:
>>> diff --git a/configs/Sinovoip_BPI_M3_defconfig b/configs/Sinovoip_BPI_M3_defconfig
>>> index ab70eff68eb..bcc8b1fba98 100644
>>> --- a/configs/Sinovoip_BPI_M3_defconfig
>>> +++ b/configs/Sinovoip_BPI_M3_defconfig
>>> @@ -13,7 +13,6 @@ CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
>>>  CONFIG_USB0_ID_DET="PH11"
>>>  CONFIG_USB1_VBUS_PIN="PD24"
>>>  CONFIG_AXP_GPIO=y
>>> -CONFIG_SATAPWR="PD25"
>>>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>>>  CONFIG_SYS_MONITOR_LEN=786432
>>>  CONFIG_CONSOLE_MUX=y
>>> diff --git a/configs/orangepi_plus_defconfig b/configs/orangepi_plus_defconfig
>>> index 5c7f0731d90..f4ce4851d7c 100644
>>> --- a/configs/orangepi_plus_defconfig
>>> +++ b/configs/orangepi_plus_defconfig
>>> @@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=672
>>>  CONFIG_MACPWR="PD6"
>>>  CONFIG_MMC_SUNXI_SLOT_EXTRA=2
>>>  CONFIG_USB1_VBUS_PIN="PG13"
>>> -CONFIG_SATAPWR="PG11"  
>>
>> BananaPi M3 and OrangePi Plus have USB-SATA adapters, not onboard AHCI,
>> so they would lose the ability to use SATA with this change.
> 
> Many thanks for having a thorough look, I much appreciate that.
> Of course you are right. I actually found this myself, and thought I
> mentioned it somewhere, but apparently this got lost in between cover
> letter versions and commit messages on different branches. Apologies for
> that.
> So yeah, my research figured that this isn't described properly in the DT,
> so SATA disks just work in Linux because U-Boot flipped the bit here.
> I heard about USB child DT nodes, which IIUC are possible to describe
> errata and such, but I don't think it's a good solution here. Would
> probably need driver changes, so wouldn't be backwards compatible.
> 
>> OrangePi Plus has the SATA controller regulator as usb3_vbus-supply in
>> its devicetree. So we could replace this with CONFIG_USB3_VBUS_PIN for
>> now, and it will continue to work once we switch the PHY driver to use
>> the regulator uclass.
>>
>> But the BananaPi M3 has its USB-SATA downstream from an external hub.
>> CONFIG_USB1_VBUS_PIN is used for the regulator powering the hub, so I do
>> not see an obvious solution here.
> 
> Yeah, I didn't find a neat automatic solution for that either.
> Can we add a regulator-fixed, and make this regulator-boot-on? Without
> actually referencing this regulator anywhere? I need to check this
> actually works in U-Boot, but what do you say with your Linux/DT maintainer
> hat on?

I can think of a few solutions, though none is perfect:

1) As you suggest, add a new fixed regulator with regulator-boot-on. It
also needs regulator-always-on to keep the OS from disabling it later,
since it would have no consumer. We would also need to call
regulators_enable_boot_on() from our board code to enable in in U-Boot.

2) Add a new fixed regulator, and point usb1_vbus-supply to it. Then
have the new regulator reference the hub regulator as its vin-supply.
This would require updating the U-Boot fixed regulator driver to control
its vin-supply. And it is also a misleading use of usb1_vbus-supply.

3) Add a gpio-hog to the devicetree, to unconditionally enable the
regulator. This would be the closest equivalent to what we are doing
now, and the quickest path to getting the legacy board code removed. We
could do this entirely within U-Boot, so I lean toward this solution.

Regards,
Samuel

