Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E9E1BF37
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 02:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745115220; cv=none; b=G0cV22UI9C5ofkhf2d51tKvHr/ZMUNbVok1KRdMiYTYBeCuVhhQalxmfR8W8N4yCHBUMT3Rdn3TGIpg2LU30ApQjOPT6M90TpRh7RQdAIIEmpNZKX1UWX3R2SqYMiBf6J/ryFme5Nire7OkMvwK6B7cmViLns2fC+8rMCpER2wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745115220; c=relaxed/simple;
	bh=GY9lXoirHTTCyqLEINSF+rmDm8R2C84x8sBW7JFuUHY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=aQsrhMH71ultF3zRGx219R9KyMz/0D61tH8W0sT1HBuzsTRxwoTHEITg7SF99E/JUmdtK9y5ZJU+cwpWCuDo4CmmAMgVZTJmmXtq1u64/eA+L14aqLrzk4HOot6nRb/3qYIxi1qCCk6iYx6AHxgdqEnb2V/+/b5xFZenyzxa7BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=t/K4e4ZQ; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="t/K4e4ZQ"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1745115214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQ+9HgPjVG9TGJ6Ak3dboveUb3Ox1/+E5O2oe0/PTLM=;
	b=t/K4e4ZQ91U40MPZZfYP+tW7G8Yt+i2KZljqWJH+xAXlmPPJo85Mud9lHJYQ0NxQFb1yrf
	OI8F0v6rB8uJJqtrgdH4UQjas+4Yj85SFZDpOu/jihMblsVFvar4sLTstmayAM5Hxy0aG2
	peURqUsmQ7eg28ekoJ4eRw1OrYrBJYgarfySl+uvuXQ/wmvmHsTFCp9Wd4Wt9dNMj4tAH+
	0ipphEZCWT/ECQ6YwexkEWgdxqYZu4xrI2OUvnmN0Ui0DicAt/SxLKi2I0XQrfuusLjo3L
	xgJEC/I8D9eRihda+pkzKGPNPqu6XpndioVPD47rshQjihexa3tjtFpgjHGUzg==
Date: Sun, 20 Apr 2025 04:13:33 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: wens@csie.org
Cc: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on
 SoPine
In-Reply-To: <CAGb2v65s8d_jA3JveqTWUUGkXrAs6mBuNTwP1DahfLNz+x8sRQ@mail.gmail.com>
References: <20250419160051.677485-1-pbrobinson@gmail.com>
 <20250419160051.677485-3-pbrobinson@gmail.com>
 <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org>
 <CALeDE9M_c7556sTdTC37Ce5vzLC2E8SV_P-J2CtFiUksdM_71Q@mail.gmail.com>
 <9380495a5dd09c6ab08e0a8cd315bf45@manjaro.org>
 <CAGb2v65s8d_jA3JveqTWUUGkXrAs6mBuNTwP1DahfLNz+x8sRQ@mail.gmail.com>
Message-ID: <20b11baa25be196ec3e46144f11cb334@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Chen-Yu,

On 2025-04-20 03:59, Chen-Yu Tsai wrote:
> On Sun, Apr 20, 2025 at 3:57 AM Dragan Simic <dsimic@manjaro.org> 
> wrote:
>> 
>> On 2025-04-19 21:26, Peter Robinson wrote:
>> > On Sat, 19 Apr 2025 at 19:25, Dragan Simic <dsimic@manjaro.org> wrote:
>> >> On 2025-04-19 18:00, Peter Robinson wrote:
>> >>> This adds all the pin mappings on the WiFi/BT header on
>> >>> the SoPine baseboard/A64-LTS. They're disabled by default
>> >>> as the modules don't ship by default. This includes, where
>> >>> they haven't been already, UART1 for BT and mmc1 for WiFi.
>> >>
>> >> The patch subject should be improved a bit, to include
>> >> "Baseboard" as well.  Having just "SoPine" is a bit too
>> >> vague, and it should actually be written as "SOPINE"
>> >> at all places in the prose.
>> >>
>> >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> >>> ---
>> >>> .../allwinner/sun50i-a64-sopine-baseboard.dts | 25
>> >> +++++++++++++++++++
>> >>> 1 file changed, 25 insertions(+)
>> >>>
>> >>> diff --git
>> >>> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
>> >>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
>> >>> index be2347c8f267..64d696f110ee 100644
>> >>> ---
>> >> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
>> >>> +++
>> >> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
>> >>> @@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
>> >>> regulator-min-microvolt = <1800000>;
>> >>> regulator-max-microvolt = <1800000>;
>> >>> };
>> >>> +
>> >>> +     wifi_pwrseq: pwrseq {
>> >>> +             compatible = "mmc-pwrseq-simple";
>> >>> +             reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2
>> >> */
>> >>> +     };
>> >>
>> >> Is there a reason why the status of this node isn't set to
>> >> "disabled"?  Or even better, why don't we move this node
>> >> entirely into the proposed DT overlay?
>> >>
>> >> The required reset procedure actually depends on what's
>> >> found on the add-on module, so it should belong to the DT
>> >> overlay that defines the add-on module.
>> >
>> > But the pin itself is pinned out through the header on the device.
>> 
>> Good point.  On second thought, the right approach should be
>> to reserve the reset pin through pinctrl additions to the
>> board dts files, but to move the "mmc-pwrseq-simple" nodes
>> to the proposed add-on overlays.

Actually, s/overlays/overlay/

>> 
>> You can have a look at rk3399-pinebook-pro.dts for an example
>> of such a pinctrl definition and its use.
> 
> For sunxi, we don't add pinctrl nodes for GPIO usage.

I see, thanks for the note.  In that case, I'd still suggest
that the "mmc-pwrseq-simple" nodes are moved to the proposed
add-on overlay, because that's where they belong to.

In theory, some add-on module may actually not need resetting,
so defining that should belong to what defines the specific
add-on module, which is the add-on overlay.

>> >>> };
>> >>>
>> >>> &ac_power_supply {
>> >>> @@ -103,6 +108,18 @@ ext_rgmii_phy: ethernet-phy@1 {
>> >>> };
>> >>> };
>> >>>
>> >>> +/* On Wifi/BT connector */
>> >>> +&mmc1 {
>> >>> +     pinctrl-names = "default";
>> >>> +     pinctrl-0 = <&mmc1_pins>;
>> >>> +     vmmc-supply = <&reg_dldo4>;
>> >>> +     vqmmc-supply = <&reg_eldo1>;
>> >>> +     mmc-pwrseq = <&wifi_pwrseq>;
>> >>
>> >> Of course, the "mmc-pwrseq" property would then also be moved
>> >> to the DT overlay that defines the add-on module.
>> >>
>> >>> +     bus-width = <4>;
>> >>> +     non-removable;
>> >>> +     status = "disabled";
>> >>> +};
>> >>> +
>> >>> &mmc2 {
>> >>> pinctrl-names = "default";
>> >>> pinctrl-0 = <&mmc2_pins>;
>> >>> @@ -175,6 +192,14 @@ &uart0 {
>> >>> status = "okay";
>> >>> };
>> >>>
>> >>> +/* On Wifi/BT connector, with RTS/CTS */
>> >>> +&uart1 {
>> >>> +     pinctrl-names = "default";
>> >>> +     pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
>> >>> +     uart-has-rtscts;
>> >>> +     status = "disabled";
>> >>> +};
>> >>> +
>> >>> /* On Pi-2 connector */
>> >>> &uart2 {
>> >>> pinctrl-names = "default";
