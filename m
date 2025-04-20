Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B89101E6
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 02:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745114410; cv=none; b=eEZaCDAr4/1JofhcCGFLT/+VtZ40LQazPLabRrA+VCSCDUCiq4p8fb9lxK3+p3En3lNVpZ2tnLlDoLNXKHXtDsMdgimCxRQimoTbyPXG9kgG4JgEFn5HpUlOBZACG0elznJsm45Xshrz+wlJ154dwiK9uqo6UQCNvx4JOVPcLLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745114410; c=relaxed/simple;
	bh=zGQ0p3zQpngvnxIeTQlS8kggRpSOVurioGEBZX3eZcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyRQ23vBFGT1bfZMaCJ9ZujgAti8qk2POmO481cafdIs8RzzYoGWzYrkR+sRUKkanjJJHknK2YHJ+VoRY6kdOt9L64ftWcUYsiI50SckzLXlDI4aOnd7nyzohE/+Gv/XUMHz93qtvEcqF313mSAJQ3bKSew+wDmDLMkrrdrnxX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bef9b04adso28839871fa.1
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 19:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745114406; x=1745719206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WuUiJAprhTfd/7N1cTCz1I/bNbyZ2dvM2pkrLYnbO14=;
        b=rME+btD4jxIMO6068NQSsqDoj3QD+8Nal2mihGR2hgrg7ARAJMAhCdXkJ2q8s1JtS7
         tJujrtpO6WWTdPVSJo1HrsLrxkFHjluml/i4WHyApcp4TpBsN2sJEqH4ZuwyaWU7NnkP
         VUPi2jfxKpYIhU4Nigwa2Sdux/sO2ePZBKPrp+zk0JJjyxjpud8+mvqwAQF5im8jkZIM
         vEDDlFWqDnMToxgTl/9TYtxlLFVlsOUQ4vCO+Iab67WBL3RAQrU74tS/ln0OHZ+Cnait
         iZFBBouB6tfmU8RLc4Ahfg+JEkZOER8CogdxWJd7v5JnmnSsA/VXGSVbxfM7hmSP4Nv9
         0eJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl+sV3tPDwEKdW2zca1puGLSz3Vl9DF1cMGqe4gJUMYjbjJkVYkxHMOaPZxo1FcPBwJQdVifV0tQpF0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIPqSv1knKx2UreUyF0KWYgCGPuYCzTjDphbhkZeAE/eKJn9pg
	e/53ux0zFz6yD9E7PdJQEepsa3y7chNDctCC92BUoEw+/A9gAG4ihk+NkgvY
X-Gm-Gg: ASbGncvXl2Z6ydBdvlb2hAnc6zoqgqqgaLauddvc+oinF39hd/B1Ob+MajkwYVvCMBJ
	7ibDZH2+wZ+e/Gjb3xZFQUY7e/8dgL42UcWcPIkOPIfUxY+5+PXNrlxuqyvIQ5MRfc8ZKgcfuvB
	xHHNmseD0/lZhiw/0n9K+M+UtUgdIH2dFeoZHUba+o6MVylZxlkD7IG8M7YL5t7KRw8xcn9CNlZ
	Ok5oLmZ7xpQHIgMfX37gejT5rNjlxjI9QV1fpkKaBViNS1iZJ2+GoqUKE+dnfu3XQaVXB2j9NV4
	+gAsfVfska6+aoxN577F4CWHNkfn069E5UrOwul2mqsTeb60kgbjDEYCe4SyWQEqTxQOwXmuGl7
	1kp2y
X-Google-Smtp-Source: AGHT+IEDfMzt0Sgn/knkac6LCX6e0jOFDRkzrpaTJISh/nyT2gyDkmIppsxKkqYvNXu1mtoSP2Wo4A==
X-Received: by 2002:a05:651c:542:b0:30b:b00f:9507 with SMTP id 38308e7fff4ca-31090501b07mr16318331fa.24.1745114405212;
        Sat, 19 Apr 2025 19:00:05 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090826840sm7077171fa.75.2025.04.19.19.00.04
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 19:00:04 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso3972847e87.3
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 19:00:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1aXVhfJPexauZhQdvLatKN4lUHRLDPkAK6iwdnvx4thLkr7C3Gm0AxRcir6m1wXUIAQ3Qt3GXaFVhlg==@lists.linux.dev
X-Received: by 2002:a05:6512:308f:b0:549:7d6d:3db5 with SMTP id
 2adb3069b0e04-54d6e634e96mr1867868e87.25.1745114403930; Sat, 19 Apr 2025
 19:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250419160051.677485-1-pbrobinson@gmail.com> <20250419160051.677485-3-pbrobinson@gmail.com>
 <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org> <CALeDE9M_c7556sTdTC37Ce5vzLC2E8SV_P-J2CtFiUksdM_71Q@mail.gmail.com>
 <9380495a5dd09c6ab08e0a8cd315bf45@manjaro.org>
In-Reply-To: <9380495a5dd09c6ab08e0a8cd315bf45@manjaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 20 Apr 2025 09:59:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v65s8d_jA3JveqTWUUGkXrAs6mBuNTwP1DahfLNz+x8sRQ@mail.gmail.com>
X-Gm-Features: ATxdqUGNwcZRn9djcXgz8WhuVq93RxzgStGeSJRbMh_1bf7iGfQQ1FrDXrf-rrs
Message-ID: <CAGb2v65s8d_jA3JveqTWUUGkXrAs6mBuNTwP1DahfLNz+x8sRQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
To: Dragan Simic <dsimic@manjaro.org>
Cc: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2025 at 3:57=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> On 2025-04-19 21:26, Peter Robinson wrote:
> > On Sat, 19 Apr 2025 at 19:25, Dragan Simic <dsimic@manjaro.org> wrote:
> >> On 2025-04-19 18:00, Peter Robinson wrote:
> >>> This adds all the pin mappings on the WiFi/BT header on
> >>> the SoPine baseboard/A64-LTS. They're disabled by default
> >>> as the modules don't ship by default. This includes, where
> >>> they haven't been already, UART1 for BT and mmc1 for WiFi.
> >>
> >> The patch subject should be improved a bit, to include
> >> "Baseboard" as well.  Having just "SoPine" is a bit too
> >> vague, and it should actually be written as "SOPINE"
> >> at all places in the prose.
> >>
> >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >>> ---
> >>> .../allwinner/sun50i-a64-sopine-baseboard.dts | 25
> >> +++++++++++++++++++
> >>> 1 file changed, 25 insertions(+)
> >>>
> >>> diff --git
> >>> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >>> index be2347c8f267..64d696f110ee 100644
> >>> ---
> >> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >>> +++
> >> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> >>> @@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
> >>> regulator-min-microvolt =3D <1800000>;
> >>> regulator-max-microvolt =3D <1800000>;
> >>> };
> >>> +
> >>> +     wifi_pwrseq: pwrseq {
> >>> +             compatible =3D "mmc-pwrseq-simple";
> >>> +             reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2
> >> */
> >>> +     };
> >>
> >> Is there a reason why the status of this node isn't set to
> >> "disabled"?  Or even better, why don't we move this node
> >> entirely into the proposed DT overlay?
> >>
> >> The required reset procedure actually depends on what's
> >> found on the add-on module, so it should belong to the DT
> >> overlay that defines the add-on module.
> >
> > But the pin itself is pinned out through the header on the device.
>
> Good point.  On second thought, the right approach should be
> to reserve the reset pin through pinctrl additions to the
> board dts files, but to move the "mmc-pwrseq-simple" nodes
> to the proposed add-on overlays.
>
> You can have a look at rk3399-pinebook-pro.dts for an example
> of such a pinctrl definition and its use.

For sunxi, we don't add pinctrl nodes for GPIO usage.

ChenYu

> >>> };
> >>>
> >>> &ac_power_supply {
> >>> @@ -103,6 +108,18 @@ ext_rgmii_phy: ethernet-phy@1 {
> >>> };
> >>> };
> >>>
> >>> +/* On Wifi/BT connector */
> >>> +&mmc1 {
> >>> +     pinctrl-names =3D "default";
> >>> +     pinctrl-0 =3D <&mmc1_pins>;
> >>> +     vmmc-supply =3D <&reg_dldo4>;
> >>> +     vqmmc-supply =3D <&reg_eldo1>;
> >>> +     mmc-pwrseq =3D <&wifi_pwrseq>;
> >>
> >> Of course, the "mmc-pwrseq" property would then also be moved
> >> to the DT overlay that defines the add-on module.
> >>
> >>> +     bus-width =3D <4>;
> >>> +     non-removable;
> >>> +     status =3D "disabled";
> >>> +};
> >>> +
> >>> &mmc2 {
> >>> pinctrl-names =3D "default";
> >>> pinctrl-0 =3D <&mmc2_pins>;
> >>> @@ -175,6 +192,14 @@ &uart0 {
> >>> status =3D "okay";
> >>> };
> >>>
> >>> +/* On Wifi/BT connector, with RTS/CTS */
> >>> +&uart1 {
> >>> +     pinctrl-names =3D "default";
> >>> +     pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> >>> +     uart-has-rtscts;
> >>> +     status =3D "disabled";
> >>> +};
> >>> +
> >>> /* On Pi-2 connector */
> >>> &uart2 {
> >>> pinctrl-names =3D "default";
