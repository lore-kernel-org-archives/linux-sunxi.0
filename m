Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DC3143C61
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 19:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745092669; cv=none; b=KYtAM1L191x+zpdgTrFNEwUWI7fU3MYVFm1eOFCGcCAS9foHAitTLATrp778RnEQuyltfDV9ZMYmitUFAm7dweKsl6hvEVWABpCNPfU12TqB29gZ+U/pjhE8NZfZhWw0TnhmtPRaB7B5NKoUgoyAywxOOd2hOLNHFtkbsRl0x0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745092669; c=relaxed/simple;
	bh=wVUlRgReb+Zeg+IyF7oKl9idYCbJMG4OAnWh8MRn5m8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ibsr2Q0+UbxAJHDKTDvo/11ZqLAo8Fc3MOj8jZVcsnNigHrx18A+KEpFshlGBKkKQi1c3nY0/8BIUpfdlKeqqxxI4aR4Yse6psfR5duGaNnpbDKqhNT4eSRsdovhXu9rw5ArnES/kyN3i53IHfbMEKT/qpH6BCIuecr+k0Cb4zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=UhwMoa4N; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="UhwMoa4N"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1745092664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=onqSoou6dY5+XKXkINv/htmUtzeNEGCyiNj/IstltmQ=;
	b=UhwMoa4NAY9ZA6PeHPZoMyli/6p2MEI242lAE3kOgI7J/DBWBDOSJASnh3SvoYB3wa9KoN
	Sr9BgLfPrHt4SkrfUIv9SOnClzGYJVpNYKDORX7quPNF7wSzRg/+EhU4L39RynQPSVjzz0
	ZWKnKaaUf8SzPiQssmisR3IBgnPQHjMjakZ2ZmmkrgZk9jbE3o6h6B86W2oPGSsraOYTih
	u27aePvHlJD+B4PAz96GuFj9DGQC4hqLn5ShOVAPT91Ai7fAsQqUhs6lLLgXo5gFX1dAEs
	fyAXGMDPKJxpZWylrqh1tcdAKxs3ak5BBqyPHia3yBA+op6nih2RQhGr4XRvcQ==
Date: Sat, 19 Apr 2025 21:57:43 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on
 SoPine
In-Reply-To: <CALeDE9M_c7556sTdTC37Ce5vzLC2E8SV_P-J2CtFiUksdM_71Q@mail.gmail.com>
References: <20250419160051.677485-1-pbrobinson@gmail.com>
 <20250419160051.677485-3-pbrobinson@gmail.com>
 <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org>
 <CALeDE9M_c7556sTdTC37Ce5vzLC2E8SV_P-J2CtFiUksdM_71Q@mail.gmail.com>
Message-ID: <9380495a5dd09c6ab08e0a8cd315bf45@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2025-04-19 21:26, Peter Robinson wrote:
> On Sat, 19 Apr 2025 at 19:25, Dragan Simic <dsimic@manjaro.org> wrote:
>> On 2025-04-19 18:00, Peter Robinson wrote:
>>> This adds all the pin mappings on the WiFi/BT header on
>>> the SoPine baseboard/A64-LTS. They're disabled by default
>>> as the modules don't ship by default. This includes, where
>>> they haven't been already, UART1 for BT and mmc1 for WiFi.
>> 
>> The patch subject should be improved a bit, to include
>> "Baseboard" as well.  Having just "SoPine" is a bit too
>> vague, and it should actually be written as "SOPINE"
>> at all places in the prose.
>> 
>>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>> ---
>>> .../allwinner/sun50i-a64-sopine-baseboard.dts | 25
>> +++++++++++++++++++
>>> 1 file changed, 25 insertions(+)
>>> 
>>> diff --git
>>> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
>>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
>>> index be2347c8f267..64d696f110ee 100644
>>> ---
>> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
>>> +++
>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
>>> @@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
>>> regulator-min-microvolt = <1800000>;
>>> regulator-max-microvolt = <1800000>;
>>> };
>>> +
>>> +     wifi_pwrseq: pwrseq {
>>> +             compatible = "mmc-pwrseq-simple";
>>> +             reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2
>> */
>>> +     };
>> 
>> Is there a reason why the status of this node isn't set to
>> "disabled"?  Or even better, why don't we move this node
>> entirely into the proposed DT overlay?
>> 
>> The required reset procedure actually depends on what's
>> found on the add-on module, so it should belong to the DT
>> overlay that defines the add-on module.
> 
> But the pin itself is pinned out through the header on the device.

Good point.  On second thought, the right approach should be
to reserve the reset pin through pinctrl additions to the
board dts files, but to move the "mmc-pwrseq-simple" nodes
to the proposed add-on overlays.

You can have a look at rk3399-pinebook-pro.dts for an example
of such a pinctrl definition and its use.

>>> };
>>> 
>>> &ac_power_supply {
>>> @@ -103,6 +108,18 @@ ext_rgmii_phy: ethernet-phy@1 {
>>> };
>>> };
>>> 
>>> +/* On Wifi/BT connector */
>>> +&mmc1 {
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&mmc1_pins>;
>>> +     vmmc-supply = <&reg_dldo4>;
>>> +     vqmmc-supply = <&reg_eldo1>;
>>> +     mmc-pwrseq = <&wifi_pwrseq>;
>> 
>> Of course, the "mmc-pwrseq" property would then also be moved
>> to the DT overlay that defines the add-on module.
>> 
>>> +     bus-width = <4>;
>>> +     non-removable;
>>> +     status = "disabled";
>>> +};
>>> +
>>> &mmc2 {
>>> pinctrl-names = "default";
>>> pinctrl-0 = <&mmc2_pins>;
>>> @@ -175,6 +192,14 @@ &uart0 {
>>> status = "okay";
>>> };
>>> 
>>> +/* On Wifi/BT connector, with RTS/CTS */
>>> +&uart1 {
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
>>> +     uart-has-rtscts;
>>> +     status = "disabled";
>>> +};
>>> +
>>> /* On Pi-2 connector */
>>> &uart2 {
>>> pinctrl-names = "default";
