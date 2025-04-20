Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713EA224EA
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 02:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745115670; cv=none; b=jj3lEZPCXSLtJoPECLB3KrwLByjVQn43eTZE+BSPDjskwR2UmK0bNgzqXmipvAvnX3G6nxXr1gMmg+mVsUfGcDSP0ck98RLcDpNt94x3ecLdmNVV2voQjJ8nrYWnCqxgGQYeEIVuXuz0bWQSE6lfdL1qAy7DuiZyLMFInfp3rn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745115670; c=relaxed/simple;
	bh=/oHR1mO+Ms0vTbiSKXZWwc+pJ/A4fZQHrfSjp0yXkhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f00jDpJK1MMvNMwZDs9xkC4zOohUGrukzvO3atmp8hUMXCnNjtniB0l/VN8PUG+TUoBJV2SzHO4YVTS2Gh8qmfi0I8AkrRj6IZrTMXsS9PiIh1n4hvpxQ4WE20X1PzXwp/6Q5moBg428ssRkRnX+S4mmOLF3yz8K7RanvUJouO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso3980843e87.3
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 19:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745115665; x=1745720465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qg2wv8GF6M7XRIb44nhP/CauCw9/Jy21/AsV6h0SZts=;
        b=RaRiY4hqinzt94Kq/yM+Z6dfkVaICKRAsh6wjm3oFE26AFT7vhCVswt1HaqMeVLaCJ
         Fk14VsoLuCa88gVD7bksU1RVTrTAeU1FLbHYYVfIondI6xIfEowWZY+hMVTmpqfKMLPU
         7aCeCO2UJeeNWc+8SN+3cPkfJBMwdt41xYY90KB0wm7fZJVH6X6VEKCkx6elQory2xXr
         5NOyquNaHRsYb+uuaSx5fCWw8STJ7RCe20G9mlQHOvXxk2FwJ/G9iBzR4FiA3XvxRYAi
         /jTpm9VMaalNgJeGKsizu6fBlCKaUZ6qTawP4QBtkoQV9WgRYyFW4JUI03KHu2VpO3F+
         uNaA==
X-Forwarded-Encrypted: i=1; AJvYcCVR+VbiaI0yEdqdXThb72SR/0WOxLtvzkai12DOKuPLqsSZG8RCsx5x1s6NC/Xsn2YnC0qdVD2d4krfcA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4z5U2q0O+2SEPeKLK8Deoz0rY+E4h2OVsw0u6szH3HZDvajss
	CNiMv4SFYrC82mhm3VrBMP5fEbGtaIJV6NOxUs9V+fiiRWJSs0cyBOd0cFte
X-Gm-Gg: ASbGncvHhN6RhduochFX3WLSHSRwtNVjbiyt+p3dwPAfJYRD9hxLoXwQnja2M3c3Y8B
	5pNT1zjXoyDQrgStc1GgSO5EPMBbjU+LWC9FyOLwfsrjd2MMhYRObqsHaApVjv2FXoj2Uu4CD17
	mJj2cnWvpnbqOOMczOjxOUV9hfMTShLUa76lt13WCENdqeoc/uaGHySqR46WPBdIxR+aAdbrIc9
	J27JY/PEKAOg+QU2TDzts4gMfMC2cPd95rQo8XuexgwNe3JbjRYzTy8hUMP+wOb0WapndFx1pcn
	01ZWu3adNA53tf0LIyLEoi5G0+CUonfTZ04Vqlax1H+fykEl0NQrpcH6r7+5c6UQMAnp6iEgfQ=
	=
X-Google-Smtp-Source: AGHT+IHV5zCcyq1HtBL6e/aOuzWPgIJKxoRa0Nv+dohwaXndIXHl9mmP68kLrw9cYKfc4jBP1XFcCw==
X-Received: by 2002:a05:6512:401a:b0:549:8a44:493e with SMTP id 2adb3069b0e04-54d6e61c6a5mr1739326e87.5.1745115665383;
        Sat, 19 Apr 2025 19:21:05 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5cfbcasm565597e87.107.2025.04.19.19.21.05
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 19:21:05 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30db1bc464dso29620331fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 19:21:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNpY/WWVdNifNSOHKGABpa1wePH9eiOLNvPP+furVzsFlDTBIH7QZ9VmU9QuX4bVDsXeqk75Q8atmpXg==@lists.linux.dev
X-Received: by 2002:a2e:a547:0:b0:30d:b49d:7fb7 with SMTP id
 38308e7fff4ca-310904db02bmr22991831fa.16.1745115664872; Sat, 19 Apr 2025
 19:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250419160051.677485-1-pbrobinson@gmail.com> <20250419160051.677485-3-pbrobinson@gmail.com>
 <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org> <CALeDE9M_c7556sTdTC37Ce5vzLC2E8SV_P-J2CtFiUksdM_71Q@mail.gmail.com>
 <9380495a5dd09c6ab08e0a8cd315bf45@manjaro.org> <CAGb2v65s8d_jA3JveqTWUUGkXrAs6mBuNTwP1DahfLNz+x8sRQ@mail.gmail.com>
 <20b11baa25be196ec3e46144f11cb334@manjaro.org>
In-Reply-To: <20b11baa25be196ec3e46144f11cb334@manjaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 20 Apr 2025 10:20:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v66bui3Ddhteaz577okxAZjvW6q0KdK0rV6p5T4L15MZ_Q@mail.gmail.com>
X-Gm-Features: ATxdqUE0Ykt6DxMi0bwj0hRXcKnJZa21RBLZvuOPQ2qQ1O91XX1328QXUi7RSJQ
Message-ID: <CAGb2v66bui3Ddhteaz577okxAZjvW6q0KdK0rV6p5T4L15MZ_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
To: Dragan Simic <dsimic@manjaro.org>
Cc: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2025 at 10:13=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> =
wrote:
>
> Hello Chen-Yu,
>
> On 2025-04-20 03:59, Chen-Yu Tsai wrote:
> > On Sun, Apr 20, 2025 at 3:57=E2=80=AFAM Dragan Simic <dsimic@manjaro.or=
g>
> > wrote:
> >>
> >> On 2025-04-19 21:26, Peter Robinson wrote:
> >> > On Sat, 19 Apr 2025 at 19:25, Dragan Simic <dsimic@manjaro.org> wrot=
e:
> >> >> On 2025-04-19 18:00, Peter Robinson wrote:
> >> >>> This adds all the pin mappings on the WiFi/BT header on
> >> >>> the SoPine baseboard/A64-LTS. They're disabled by default
> >> >>> as the modules don't ship by default. This includes, where
> >> >>> they haven't been already, UART1 for BT and mmc1 for WiFi.
> >> >>
> >> >> The patch subject should be improved a bit, to include
> >> >> "Baseboard" as well.  Having just "SoPine" is a bit too
> >> >> vague, and it should actually be written as "SOPINE"
> >> >> at all places in the prose.
> >> >>
> >> >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >> >>> ---
> >> >>> .../allwinner/sun50i-a64-sopine-baseboard.dts | 25
> >> >> +++++++++++++++++++
> >> >>> 1 file changed, 25 insertions(+)
> >> >>>
> >> >>> diff --git
> >> >>> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >> >>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >> >>> index be2347c8f267..64d696f110ee 100644
> >> >>> ---
> >> >> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >> >>> +++
> >> >> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >> >>> @@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
> >> >>> regulator-min-microvolt =3D <1800000>;
> >> >>> regulator-max-microvolt =3D <1800000>;
> >> >>> };
> >> >>> +
> >> >>> +     wifi_pwrseq: pwrseq {
> >> >>> +             compatible =3D "mmc-pwrseq-simple";
> >> >>> +             reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2
> >> >> */
> >> >>> +     };
> >> >>
> >> >> Is there a reason why the status of this node isn't set to
> >> >> "disabled"?  Or even better, why don't we move this node
> >> >> entirely into the proposed DT overlay?
> >> >>
> >> >> The required reset procedure actually depends on what's
> >> >> found on the add-on module, so it should belong to the DT
> >> >> overlay that defines the add-on module.
> >> >
> >> > But the pin itself is pinned out through the header on the device.
> >>
> >> Good point.  On second thought, the right approach should be
> >> to reserve the reset pin through pinctrl additions to the
> >> board dts files, but to move the "mmc-pwrseq-simple" nodes
> >> to the proposed add-on overlays.
>
> Actually, s/overlays/overlay/
>
> >>
> >> You can have a look at rk3399-pinebook-pro.dts for an example
> >> of such a pinctrl definition and its use.
> >
> > For sunxi, we don't add pinctrl nodes for GPIO usage.
>
> I see, thanks for the note.  In that case, I'd still suggest
> that the "mmc-pwrseq-simple" nodes are moved to the proposed
> add-on overlay, because that's where they belong to.
>
> In theory, some add-on module may actually not need resetting,
> so defining that should belong to what defines the specific
> add-on module, which is the add-on overlay.

I agree.

> >> >>> };
> >> >>>
> >> >>> &ac_power_supply {
> >> >>> @@ -103,6 +108,18 @@ ext_rgmii_phy: ethernet-phy@1 {
> >> >>> };
> >> >>> };
> >> >>>
> >> >>> +/* On Wifi/BT connector */
> >> >>> +&mmc1 {
> >> >>> +     pinctrl-names =3D "default";
> >> >>> +     pinctrl-0 =3D <&mmc1_pins>;
> >> >>> +     vmmc-supply =3D <&reg_dldo4>;
> >> >>> +     vqmmc-supply =3D <&reg_eldo1>;
> >> >>> +     mmc-pwrseq =3D <&wifi_pwrseq>;
> >> >>
> >> >> Of course, the "mmc-pwrseq" property would then also be moved
> >> >> to the DT overlay that defines the add-on module.
> >> >>
> >> >>> +     bus-width =3D <4>;
> >> >>> +     non-removable;
> >> >>> +     status =3D "disabled";
> >> >>> +};
> >> >>> +
> >> >>> &mmc2 {
> >> >>> pinctrl-names =3D "default";
> >> >>> pinctrl-0 =3D <&mmc2_pins>;
> >> >>> @@ -175,6 +192,14 @@ &uart0 {
> >> >>> status =3D "okay";
> >> >>> };
> >> >>>
> >> >>> +/* On Wifi/BT connector, with RTS/CTS */
> >> >>> +&uart1 {
> >> >>> +     pinctrl-names =3D "default";
> >> >>> +     pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> >> >>> +     uart-has-rtscts;
> >> >>> +     status =3D "disabled";
> >> >>> +};
> >> >>> +
> >> >>> /* On Pi-2 connector */
> >> >>> &uart2 {
> >> >>> pinctrl-names =3D "default";
>
