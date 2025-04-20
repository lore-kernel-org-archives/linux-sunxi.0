Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E96135893
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745141605; cv=none; b=N4Npawg0LpxCtxDLjCQbSy038dO+qyKZo8aDgdsqANDq4vBIbuAYzBsXABa8uAVy6VLfpMkaSDmYh9/R06o5BppB3x7oZ4UhhoA6ZeOLxX+DuhBtP3uDXDNeBrWMMAymsi5HENHRrSaRo7CTworHSFqrRwrNVQ525nsdtrFGEtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745141605; c=relaxed/simple;
	bh=CERzLF2HMMagvpVmZ72rVu4QgARchQ1fUnnFwJHdGug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+EJiPDQgvUIC5IX6Jy9cgwOKLzw9LeIRi0MsMqa+Sa4xpv0rwNxaJhRfqWmGfasTuJmBrb7noxmsQ6vI99pLq1Y1i4xgjhUU2pCuP2Q54rkGX48vv6XHOoeuUfw9W0YhSn9OW1oil/ezvndOnlsrVKhrR0ukRoo3MRRLLlNKGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQC/mxXf; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQC/mxXf"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so5244474a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745141602; x=1745746402; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/8TOZ1wqavZra/je2htJyl9Z7dmGZ7iMnPc5kvx9b5c=;
        b=MQC/mxXfeBVxOotgWxpLMFOXZgh434XiM/dUIqjk6x+UxeQ7yYCm5bESiA7HC9LLaK
         v/qtqLBuEYeJtCKptAd0BUYSk7s14F0Ja88Ptodju8jScfMdSe3RdFNyatETe3n8ChfE
         h7CsVgC1kaKn/dSIWww1XZUj1ndEHorQ+TUzrpYi9gz0ddDkxIG+ZleMt4t5ZGarmnRx
         tV4YEvwZcequOiY4AapJEWogNqK9tFM+C5ekOPAQH9Z28eQhGY7p9miwEL0AKqi9pdLQ
         Fmbo02eu4esgcQmdwg5OmTBUSsqBF7+1Pyfs6tSjBOvN+nGK9BhVfWGQfaNc99gP1kx1
         xHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745141602; x=1745746402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8TOZ1wqavZra/je2htJyl9Z7dmGZ7iMnPc5kvx9b5c=;
        b=Es8Mph3wrxLVs1owv0880ewdbwrhd0V1tK3U63UVAz0II0d53QK6REk7e3uzQREODg
         aj/a1FO7lKgxe/6YQirZJGq4PrpE5HPUxIT605jIDYnOsWqXxr7UK7eGZDfNYHJI95OD
         5s8pmuT6OXn92l45uleg8V4poy3PntWw/nzWFYTjNMvlEW31a5pXxGY/sRj4gUH8zjOD
         5NxymDbpsLV6WNbfcZSaLYyHrFoLPnYv+TqbYrLgbm9Xp1YMmfl5WwzX+eFrOrLY0u5g
         3jC0jSF6FxwL9dmLXfzV2O6NjEHUxc4oITjW4I2Lwm3TvNa0OjpirhwnCOcHi1XJotrT
         wd5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZLJaszo6t3KHMTy/ZVhJ1L4lgJpvOUPNgKe5iJLrskPpFMsi7UTej0BpyLZl3MQrdGSVfYVHsWdwkew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUNmS5NhMB0yX7xIAmgM5oUca5bv5Fqcmcyk8x1ukySc+RnjK5
	JcM3PwEQtW1rUOR0H6wmRKtNCGQ+VrDoNY8uu6HLGMwUUW5RpIIpQnEknXn57iccJjSi0McvFue
	N//bQr1XgQfrShmirTmkr8qGCMBA=
X-Gm-Gg: ASbGncvJziDhcHwdhoIvGlv3tO0lFO5HC6w1/9zuh14LRo+ky0yok4kQNnzTjUt60fj
	EI1znJXg2HEKfYzAVzyl1qrR3eRmolGh0VAKSogGkwcn9CN19byEhmug/X2LjYEgjaF4s7g0jVX
	pR7TOCmHo9raKi7b+4U7a5Pjf9eFqhH309bHUq2/12Xw/+R5prZZbrWD4=
X-Google-Smtp-Source: AGHT+IGX10xsrDu5V/UjkEupGH0LyUzW3ha9EoTXPcUMoBfunRTwSAC3I1NonXEe/hPiG88ngXa6JOs1oqW3vl3TGZA=
X-Received: by 2002:a17:907:1c07:b0:ac6:e20f:fa48 with SMTP id
 a640c23a62f3a-acb74bdcde0mr706379066b.33.1745141602109; Sun, 20 Apr 2025
 02:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250419160051.677485-1-pbrobinson@gmail.com> <20250419160051.677485-3-pbrobinson@gmail.com>
 <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org>
In-Reply-To: <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sun, 20 Apr 2025 10:33:11 +0100
X-Gm-Features: ATxdqUG50NCyTDEBxJuIUN4T06VkkXzEZg9j2zhXsssvhxuy2mRvejdomh4GKDo
Message-ID: <CALeDE9Nyt7Di2_u-Vf=6OCAg-6wmbz75Cs_MCfZrk6upbD9nZw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Dragan,

> > This adds all the pin mappings on the WiFi/BT header on
> > the SoPine baseboard/A64-LTS. They're disabled by default
> > as the modules don't ship by default. This includes, where
> > they haven't been already, UART1 for BT and mmc1 for WiFi.
>
> The patch subject should be improved a bit, to include
> "Baseboard" as well.  Having just "SoPine" is a bit too
> vague, and it should actually be written as "SOPINE"
> at all places in the prose.

It literally has baseboard in the second line of the description.

> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >  .../allwinner/sun50i-a64-sopine-baseboard.dts | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git
> > a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> > b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> > index be2347c8f267..64d696f110ee 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> > @@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
> >               regulator-min-microvolt = <1800000>;
> >               regulator-max-microvolt = <1800000>;
> >       };
> > +
> > +     wifi_pwrseq: pwrseq {
> > +             compatible = "mmc-pwrseq-simple";
> > +             reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> > +     };
>
> Is there a reason why the status of this node isn't set to
> "disabled"?  Or even better, why don't we move this node
> entirely into the proposed DT overlay?
>
> The required reset procedure actually depends on what's
> found on the add-on module, so it should belong to the DT
> overlay that defines the add-on module.
>
> >  };
> >
> >  &ac_power_supply {
> > @@ -103,6 +108,18 @@ ext_rgmii_phy: ethernet-phy@1 {
> >       };
> >  };
> >
> > +/* On Wifi/BT connector */
> > +&mmc1 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&mmc1_pins>;
> > +     vmmc-supply = <&reg_dldo4>;
> > +     vqmmc-supply = <&reg_eldo1>;
> > +     mmc-pwrseq = <&wifi_pwrseq>;
>
> Of course, the "mmc-pwrseq" property would then also be moved
> to the DT overlay that defines the add-on module.
>
> > +     bus-width = <4>;
> > +     non-removable;
> > +     status = "disabled";
> > +};
> > +
> >  &mmc2 {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&mmc2_pins>;
> > @@ -175,6 +192,14 @@ &uart0 {
> >       status = "okay";
> >  };
> >
> > +/* On Wifi/BT connector, with RTS/CTS */
> > +&uart1 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> > +     uart-has-rtscts;
> > +     status = "disabled";
> > +};
> > +
> >  /* On Pi-2 connector */
> >  &uart2 {
> >       pinctrl-names = "default";
