Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D99B67E
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Feb 2024 17:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707240008; cv=none; b=mErcwRI48AOWXdg761O8CGqjFH9IKIgQCxGs+yJkjbcB2ozWMzciIrjE8rPlXTPsAQHKFoKxblnOv7f+HzBTZtMziwyzCqKFTQYHL4GeD+PAHSYTS+TicPFq1aqLC8to9Of7lKxD+P8a2E1+KI3ODfGxYnuVFOzS+jEVD5tiCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707240008; c=relaxed/simple;
	bh=7Uyi6yIcqYod+P2IwnXJG34WTDFw9Tx9oJBgJr18hjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=daATsfrsFUFMOx6kvKymE7rybnvo8C0FEK4ByzGl8oDA8/6EnVsmIZmAFvzVGeaV+x6rmfd8UUZHXNfc4pisWNrTE7BUE/g8Ze8q1B9gpQuQpFif93cix8N25cgj52b3nme7SpGpi6f0dyui97+6kHuAh9SaXgdutZ6n77LM628=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaffEyrJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaffEyrJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40fe59b22dbso5963545e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Feb 2024 09:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707240004; x=1707844804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yO24H5owtgENtATBfciwVl5rPLofQnR2KLvl+C2r6QE=;
        b=gaffEyrJ11QeF/UEa95mN4sbXpSlKwsAQPWcoA+ZpFC0Dq/+6IBZMGp490fMSWnt32
         XUitOtBjIBXKyvXgtP0gQE/QGrDFfvqoZwjRJBweJJdJipvBeXbu99plWeZzNLuzJQO6
         b/7BBJ64sPTPIUWlRzcPpj9ciC+Lier4qXdJSklmXbYpg7WDVIfORtldvnNZCO+68wYA
         BdVffUxJzBAozdZl5mWMiCjJ+LXkPKztP4G9U9Ae6ZW2PKy18PjvnHvwOtGxRslNbSRG
         JmLMTNKosDk80lFj/j980xQSHWH1wfn2xVbsXr2a5Jcxo9ialRZV+9SLCmGu9a8wMgZS
         uz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707240004; x=1707844804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yO24H5owtgENtATBfciwVl5rPLofQnR2KLvl+C2r6QE=;
        b=v+KYsVX2J3gIi12PNSmXVdLGM6ba0DpqTbWxhknBT+DC/St5S1jNxQFJIGBbKcX4cS
         tWYtozUYAtzGzj5fwN5hQ21QE8npBfcGY3byyUxP77Cej3w9lxZbSOe6L4WFMAyseyXq
         KFGNNsAJKZZeDQ7AmNGtcgCCBBzEU8VlGCvbDTyopFq/DC8JebiP1pkquZ7UcmUtzttS
         aZPxHWjCrHJL7jcHyLu3jMzezRU6kKPwrHZIqw9XOrXzlQlS9NxoTlWaBCD8VP5/LUyE
         DZPvl4uH7kLlUAqwjxIZ5KBc97oe6ZH0WDHp3rA4uujRXS0FpHgZe/sRXuygLJenS2Rz
         Hieg==
X-Gm-Message-State: AOJu0YzsVrHQdG8xU9EmwKDDwLyTceCwfrhBNBQf/BrVnBLN3Dot9/sK
	SJsV3/0E1e8fwk2U1qw7F0rpgQR5tHgNkchWdVgbpHHr1YuvorSK
X-Google-Smtp-Source: AGHT+IHHmMUhSlVvsX0qqYDcPjOJhJxkHXsVNPCQ/GNEu7A+7qNZ7Hm4q8JJ/+wls+PtXWv82UyMQA==
X-Received: by 2002:a05:600c:5490:b0:40f:ba0b:16b3 with SMTP id iv16-20020a05600c549000b0040fba0b16b3mr2871453wmb.2.1707240004287;
        Tue, 06 Feb 2024 09:20:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcaP06J19h0rK5CYaD7cMopWN7XslSGg6Kl5BkbdLdIMITucEL4xJJOj7hhoy4R7Tkxk9bCzuRO1BxAJ+xXFILyKj+w1yo4kFKPhMvo/+KjVBxqIA8wi/CiKEohgj+2HSbNLXlqufdFq4RpUK/OdylDJB/0gG+xThrV4V08e905AkMhFd71N3P8EVgPsIQrZWk7jhBJFmPHTsVcOHDRa2oUEjQL/sIiUK7OnPgm3oYdWcNvgkr995v8MDoJZgbZaqTjGM000g9Dm0hUR56wIRSnsC2Bh7qZHmyZ0m1KXmLkKFwxF+wEiJAMljsISev9d/i6gqTowenOZ3qGg4feVFxvusrHHB6OANk
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b0040fe2d3aec4sm2569802wmo.19.2024.02.06.09.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 09:20:03 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
Subject:
 Re: [PATCH 2/2] arm64: dts: allwinner: Transpeed 8K618-T: add WiFi nodes
Date: Tue, 06 Feb 2024 18:20:02 +0100
Message-ID: <2717857.mvXUDI8C0e@jernej-laptop>
In-Reply-To:
 <CAGb2v66=s-k5xNtL9N_Tyzzk92u_32Hk_+V+rFVYne3=fnMjdA@mail.gmail.com>
References:
 <20240204093255.148972-1-andre.przywara@arm.com>
 <8371906.NyiUUSuA9g@jernej-laptop>
 <CAGb2v66=s-k5xNtL9N_Tyzzk92u_32Hk_+V+rFVYne3=fnMjdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 06. februar 2024 ob 02:03:21 CET je Chen-Yu Tsai napisal(a):
> On Tue, Feb 6, 2024 at 2:26=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabe=
c@gmail.com> wrote:
> >
> > Dne nedelja, 04. februar 2024 ob 10:32:55 CET je Andre Przywara napisal=
(a):
> > > In contrast to other devices using Allwinner SoCs, the Transpeed 8K61=
8-T
> > > TV box uses a mainline supported WiFi chip: it's a Broadcom 4335
> > > compatible, packaged by a company called Murata.
> > > It works nicely with the Linux driver, when providing the respective
> > > firmware files.
> > >
> > > Add the required DT nodes to let the kernel find the SDIO device.
> >
> > Can you reword message in a way to omit Linux?
>=20
> Probably reword it to say "add nodes so that custom MAC addresses can be
> associated with it"?
>=20
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  .../sun50i-h618-transpeed-8k618-t.dts         | 23 +++++++++++++++++=
++
> > >  1 file changed, 23 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k61=
8-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> > > index 8ea1fd41aeba..7ec4098e707b 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> > > @@ -16,6 +16,7 @@ / {
> > >
> > >       aliases {
> > >               serial0 =3D &uart0;
> > > +             ethernet1 =3D &sdio_wifi;
> > >       };
> > >
> > >       chosen {
> > > @@ -39,6 +40,15 @@ reg_vcc3v3: vcc3v3 {
> > >               regulator-max-microvolt =3D <3300000>;
> > >               regulator-always-on;
> > >       };
> > > +
> > > +     wifi_pwrseq: wifi_pwrseq {
> > > +             compatible =3D "mmc-pwrseq-simple";
> > > +             clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> > > +             clock-names =3D "ext_clock";
> > > +             pinctrl-0 =3D <&x32clk_fanout_pin>;
> > > +             pinctrl-names =3D "default";
> > > +             reset-gpios =3D <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
> > > +     };
> > >  };
> > >
> > >  &ehci0 {
> > > @@ -60,6 +70,19 @@ &mmc0 {
> > >       status =3D "okay";
> > >  };
> > >
> > > +&mmc1 {
> > > +     vmmc-supply =3D <&reg_dldo1>;
> > > +     vqmmc-supply =3D <&reg_aldo1>;
> > > +     mmc-pwrseq =3D <&wifi_pwrseq>;
> > > +     bus-width =3D <4>;
> > > +     non-removable;
> > > +     status =3D "okay";
> > > +
> > > +     sdio_wifi: wifi@1 {
> > > +             reg =3D <1>;
> > > +     };
> >
> > I don't think this node and alias are useful in any way. SDIO scan will=
 find
> > device regardless and potential mac property set up by bootloader will =
be
> > ignored anyway.
>=20
> If a node with the matching function number is found, the MMC core will
> associate the node with the SDIO function device before calling the probe
> function. It has worked correctly for quite some time.

Ah, I didn't know. Ok then, Andre, just update commit message and it's good
to go.

Best regards,
Jernej

>=20
> If the driver isn't taking the MAC address given in the DT, then that's
> a driver issue.
>=20
> ChenYu
>=20
> > Best regards,
> > Jernej
> >
> > > +};
> > > +
> > >  &mmc2 {
> > >       vmmc-supply =3D <&reg_dldo1>;
> > >       vqmmc-supply =3D <&reg_aldo1>;
> > >
> >
> >
> >
> >
>=20




