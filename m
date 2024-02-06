Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF4137E
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Feb 2024 01:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707181416; cv=none; b=sF2zBJsIaLj0xkMCdhcRf+bkpe9FNvVfKR7AdJm26o0ACPon2JRH6bEt9QbN49CS3yV/KoweSYG8HhHyhsB8GuXLep3pa8/9SDEAmLGqFPSbOf7mHwhvspaROK40aLfOHqTazbGFypk04DCO/4Yo3YKoKurAd7YnMIW2UghgcVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707181416; c=relaxed/simple;
	bh=m+hqrbnjYzjb3f/TfrLbr6WE8hRengMuZ2HnAv9/dgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nwu68TJ8ut+rHOIuH/TyRNjdKkNVg5feHTo96jmFJtJ/EPx1aIZFINst0s5EnZ1lfztehz7WZGiYxWyxKqvKoHbZ/Xx1EBvTx8Ra2MS96V2xGRt5AU4CPkLiXU27t6r1rfBUrxX7jcT+GiYwICJguyRSO+8ZSfVzdLKvjx47ZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e0353e47daso1418588b3a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Feb 2024 17:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707181413; x=1707786213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eejqj0cnRGuq/NpBYeNhmqSIOanT/DXHEIV03E8ZoX0=;
        b=J5zHK8G09WOUCQqXzMIbKSl4cIG9kUXyMb+GtMYdeB7T35mUB25J3qd4rYePuV/EDo
         TSqUxNBk2pi8aiaN3wrh8l3vWcm7+pIrtPj/QWOOJDXCQVp+cewhR85Fgme0c+p9nKB5
         S7tJwTh9RwiIFAZWBjc5jHRhZzSQRGPlQOvz7XllZrOANiISRoG2+ywRtzr/bUHkSJdO
         Oh1jA8x4szxiBhcXm5AbT9nDS2UG+yBst5GKhlAFkGlSKzpu6fLB1YWkIhe7kQR3cE4n
         Vn76f4Fl1Np0LfkgrdPmJde/ZjKDfx4f52W22JAs6QTHjsX2tu2Wk1ijhMT3L4mRD8Sx
         cEGw==
X-Gm-Message-State: AOJu0Yz3BSxbzGoivzy5ZMFExTVHRWo44hTHXs9S+pWbqsZBladeC0Iu
	wWHZvy9t26aTBFKxw48FrslREJZ/R5WlofDghlYLHK6SlZRxyaB8vAxcG5uy56b3GQ==
X-Google-Smtp-Source: AGHT+IHYRTpI4zTw63rhUBvio1aQE7EMHWSrnbKoP3RPJZClUM8kz1my706FkVJs3Bfs+S5/OdB8Jg==
X-Received: by 2002:a05:6a00:17a0:b0:6e0:4e69:6ec4 with SMTP id s32-20020a056a0017a000b006e04e696ec4mr1616156pfg.5.1707181413113;
        Mon, 05 Feb 2024 17:03:33 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXiDXr7v4oCFKmEg4W7fdMcCN9tBQLYctfxB8LTXSKmpIq9HuE5unnbPUm00FBuXymwe6Fp4hrLd5WtTTHloGtoaJOoZyn8MfsjDN0=
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id 3-20020a630c43000000b005d7c02994c4sm683427pgm.60.2024.02.05.17.03.32
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 17:03:32 -0800 (PST)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5cdf76cde78so4554283a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Feb 2024 17:03:32 -0800 (PST)
X-Received: by 2002:a05:6a21:a593:b0:19e:32fa:b178 with SMTP id
 gd19-20020a056a21a59300b0019e32fab178mr179606pzc.31.1707181412200; Mon, 05
 Feb 2024 17:03:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240204093255.148972-1-andre.przywara@arm.com>
 <20240204093255.148972-3-andre.przywara@arm.com> <8371906.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <8371906.NyiUUSuA9g@jernej-laptop>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 6 Feb 2024 09:03:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v66=s-k5xNtL9N_Tyzzk92u_32Hk_+V+rFVYne3=fnMjdA@mail.gmail.com>
Message-ID: <CAGb2v66=s-k5xNtL9N_Tyzzk92u_32Hk_+V+rFVYne3=fnMjdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: Transpeed 8K618-T: add WiFi nodes
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Nick Alilovic <nickalilovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 2:26=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec@=
gmail.com> wrote:
>
> Dne nedelja, 04. februar 2024 ob 10:32:55 CET je Andre Przywara napisal(a=
):
> > In contrast to other devices using Allwinner SoCs, the Transpeed 8K618-=
T
> > TV box uses a mainline supported WiFi chip: it's a Broadcom 4335
> > compatible, packaged by a company called Murata.
> > It works nicely with the Linux driver, when providing the respective
> > firmware files.
> >
> > Add the required DT nodes to let the kernel find the SDIO device.
>
> Can you reword message in a way to omit Linux?

Probably reword it to say "add nodes so that custom MAC addresses can be
associated with it"?

> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../sun50i-h618-transpeed-8k618-t.dts         | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-=
t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> > index 8ea1fd41aeba..7ec4098e707b 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> > @@ -16,6 +16,7 @@ / {
> >
> >       aliases {
> >               serial0 =3D &uart0;
> > +             ethernet1 =3D &sdio_wifi;
> >       };
> >
> >       chosen {
> > @@ -39,6 +40,15 @@ reg_vcc3v3: vcc3v3 {
> >               regulator-max-microvolt =3D <3300000>;
> >               regulator-always-on;
> >       };
> > +
> > +     wifi_pwrseq: wifi_pwrseq {
> > +             compatible =3D "mmc-pwrseq-simple";
> > +             clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> > +             clock-names =3D "ext_clock";
> > +             pinctrl-0 =3D <&x32clk_fanout_pin>;
> > +             pinctrl-names =3D "default";
> > +             reset-gpios =3D <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
> > +     };
> >  };
> >
> >  &ehci0 {
> > @@ -60,6 +70,19 @@ &mmc0 {
> >       status =3D "okay";
> >  };
> >
> > +&mmc1 {
> > +     vmmc-supply =3D <&reg_dldo1>;
> > +     vqmmc-supply =3D <&reg_aldo1>;
> > +     mmc-pwrseq =3D <&wifi_pwrseq>;
> > +     bus-width =3D <4>;
> > +     non-removable;
> > +     status =3D "okay";
> > +
> > +     sdio_wifi: wifi@1 {
> > +             reg =3D <1>;
> > +     };
>
> I don't think this node and alias are useful in any way. SDIO scan will f=
ind
> device regardless and potential mac property set up by bootloader will be
> ignored anyway.

If a node with the matching function number is found, the MMC core will
associate the node with the SDIO function device before calling the probe
function. It has worked correctly for quite some time.

If the driver isn't taking the MAC address given in the DT, then that's
a driver issue.

ChenYu

> Best regards,
> Jernej
>
> > +};
> > +
> >  &mmc2 {
> >       vmmc-supply =3D <&reg_dldo1>;
> >       vqmmc-supply =3D <&reg_aldo1>;
> >
>
>
>
>
