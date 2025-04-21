Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D76347C7
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Apr 2025 04:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745208427; cv=none; b=OlplVsZ16pdlniVhC3grjLnbjA8L7IutKpzzzBQS72Z7I0ClooF5IjDrnJsOYMnL2ljZ5JkESmWvP86QVQp54UWKHGu5V9tGKubCyqO5RoQrXEN/LeEgVqGwS8I4wiihat+Mac4GuZASIJ/n0FSysyn7lbk0J4RqPz2OFZliOSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745208427; c=relaxed/simple;
	bh=xVmmnLS7Rka7aIa4tpRYJokBiJiCJjZw4FpBDjWWEQQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=mSS+W17bMvoo57/ASd7i7LV9D7714b2xe8odp399gbDg+6u/OtMk2m1Zx3NemWMCPcjByNUEfpCgRQqfSlCat8ySKfDUmNDA67P8Q/iXZgDLIcC5kuQ77wYxSb193r7uWLyNuSFkrq2NkBVDziKdl/6NER/UuqSvcg7oIGBhsws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=bDafJ9QD; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="bDafJ9QD"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1745208416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lY3pHDqBhZkwmlfby1vou0JW0D/+selSw5j/J+G5UCs=;
	b=bDafJ9QDK4n8Kw4J6oQOtsQsJb8TTq//YPFV6XDpE46S4esKOtwQhw9EHL3tIdA8xJel2X
	18Ar/ny+n4/KmKydMkiKNzvwnabxk7Tf4aFSP2nic6mHQrqFTfLYxF4KXNGjpbdDrayrdd
	gCZmn6rF9GymUwOc3MUGS9KSNNO8t6wUux3BsNIRtuPtYyPca6exygrmLijAHK0dxgriq+
	D5xuc6LBc5sVkFqOSxqH2JwSILHjnInmGwVwcB6AjQLqojoCzyJFawKnD+QL7berCMLf6o
	AgUowsvI9c6Su4K8wibFVCXP4OpFCdKb/y6AtJt2ut5Zz8UIhN9MLxH+1s/53g==
Date: Mon, 21 Apr 2025 06:06:54 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [RFC] arm64: dts: allwinner: a64: Add overlay for Realtek
In-Reply-To: <16b34d85a710b4900e6d842c001a38b3d538bc2a.camel@icenowy.me>
References: <20250419160751.678827-1-pbrobinson@gmail.com>
 <f063ced3436e239eaad8ab0589ba2cb1@manjaro.org>
 <16b34d85a710b4900e6d842c001a38b3d538bc2a.camel@icenowy.me>
Message-ID: <98ce582813cd899d4b9efd671625ac99@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Icenowy,

On 2025-04-21 05:43, Icenowy Zheng wrote:
> 在 2025-04-19星期六的 20:08 +0200，Dragan Simic写道：
>> Hello Peter,
>> 
>> On 2025-04-19 18:07, Peter Robinson wrote:
>> > Add overlay for the Pine64 Realtek rtl8723bs WiFi
>> > module that works on the Pine64/64+/SoPine devices.
>> >
>> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> >
>> > I've looked at overlays for other vendors, such as available
>> > for some of the Rockchip devices, and I believe I have this
>> > mostly correct but would like some feedback both on if I have
>> > everything needed for Allwinner devices, but also what's needed
>> > to be able to use a single overlay across more than one device.
>> >
>> > This is dependent on the following [1] patch series.
>> >
>> > Peter
>> >
>> > [1]
>> > https://lore.kernel.org/linux-devicetree/20250419160051.677485-3-pbrobinson@gmail.com/t/#u
>> >
>> > ---
>> >  arch/arm64/boot/dts/allwinner/Makefile        |  6 ++++
>> >  .../allwinner/sun50i-a64-pine64-realtek.dtso  | 30
>> > +++++++++++++++++++
>> >  2 files changed, 36 insertions(+)
>> >  create mode 100644
>> > arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-realtek.dtso
>> >
>> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile
>> > b/arch/arm64/boot/dts/allwinner/Makefile
>> > index 00bed412ee31..be991f8d8110 100644
>> > --- a/arch/arm64/boot/dts/allwinner/Makefile
>> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
>> > @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=
>> > sun50i-a64-olinuxino-emmc.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-lts.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-plus.dtb
>> > sun50i-a64-pine64.dtb
>> > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-realtek.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinebook.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.0.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.1.dtb
>> > @@ -52,3 +53,8 @@ dtb-$(CONFIG_ARCH_SUNXI) +=
>> > sun50i-h700-anbernic-rg35xx-2024.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
>> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
>> > +
>> > +# Overlays
>> > +sun50i-a64-pine64-realtek-dtbs      := sun50i-a64-pine64.dtb
>> > sun50i-a64-pine64-realtek.dtbo
>> > +sun50i-a64-pine64-lts-realtek-dtbs  := sun50i-a64-pine64-lts.dtb
>> > sun50i-a64-pine64-realtek.dtbo
>> > +sun50i-a64-pine64-plus-realtek-dtbs := sun50i-a64-pine64-plus.dtb
>> > sun50i-a64-pine64-realtek.dtbo
>> 
>> Thanks for the patch, having this DT overlay makes perfectly
>> sense to me.  The only possible issues may arise from the
>> resulting size increase of the compiled .dtb files, caused by
>> the implicit inclusion of symbols.
>> 
>> However, please see an earlier linux-rockchip thread [2] that
>> shows the desired layout of the additions to the Makefile, which
>> was determined through a few rounds of discussion.
>> 
>> Finally, I think we should choose a slightly better name for the
>> DT overlay, instead of "sun50i-a64-pine64-realtek.dtso", in which
>> "-realtek" seems a bit to vague.  Perhaps "-wifi-bt-addon" as the
>> filename suffix would fit better, and it's virtually guaranteed
>> that there will be no new version of that add-on board, so there
>> should be no potential for name clashing.
> 
> Yes. In fact I think Pine64 messed up with pinouts of Wi-Fi modules and
> only the RTL8723BS module works with Pine A64. (The Broadcom/Ampak ones
> only work with Rockchip boards, as what I assumed.)

Yes, I can confirm that the two Pine64 WiFi+BT module variants
aren't interchangeable.  I forgot the details about the actual
hardware differences, but they're large enough to be incompatible,
which is quite unfortunate.

>> As a minor suggestion, the patch subject should also be tweaked
>> a bit, because "Realtek" is also a bit too vague there.
>> 
>> [2]
>> https://lore.kernel.org/linux-rockchip/20250226140942.3825223-4-heiko@sntech.de/
