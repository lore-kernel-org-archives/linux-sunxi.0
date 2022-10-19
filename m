Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4731FC9
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Oct 2022 03:55:23 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id u21so23346938edi.9
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Oct 2022 20:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/T+TwhfMQhoSEBu79ylX6dCd3SfnghsFRtQGbHzLJI=;
        b=kbxCuD6YkrTCW1xmxlRwl58fWiEcrJl8R+Efv35cjkb31YYkIy+fUFw9nd86GcdyBq
         8TkyrUMnTWl1uXeRFRtv1e6rFRLACGkDGS7K36UrW37mmc9nR44Htrcz+QnyUbeZaJvd
         iKbBbA+mlBAH2TTzllJ8FhpK97mXTZT6lXfENTpbILGC3MCfH+10NVwAi/5QQ4RJV2o6
         OXudRirpW4fRrQhfF3j5rdCAWb2IQHC66nzOkwAJO60T9dHc+O95aDAyzC3WflFuOTVT
         KkV1/fIHmtBywnq0jPQwqvIE6c4BbzlM/1Azo/PC3BjAoWPu4oCXG5hGfMUgPWMxEG35
         jf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/T+TwhfMQhoSEBu79ylX6dCd3SfnghsFRtQGbHzLJI=;
        b=zQGACumH/G5Evyg4HpE/Tq7v8tP8JDvJXbSTtzpoLbUP7/qpmSoHgQWd3SQNxQpHeq
         uiPpF9C8geZzKnFUq+h2Rg9rCwxMMupWEovbk+MP3x1TJ5CZujYNWsg5xz88Njjy2j0n
         hzemMpxWavm6YLYP7E9BgjlTdOd8/58EWQQPUfB0HB/ajabDxhdAoqxMKUpY/2LQ1/bm
         8Y/4z9V74K9bYsmEmwGxjLSCe/ZTbWGUlIg4+k1XL0EfDBBD9X4OeHoNZU71C5qkQLck
         s5jzVnzroqVeKDsFW423zpP1mUgjFjVeEqTsceQIjdr5S5UkYCnFwNMOTsgHhPuh9BwD
         Mw4Q==
X-Gm-Message-State: ACrzQf3ltFgjKKm+im67oZN4gL4IgdqQTH1jDBdq5m74L0OmYSWL4sSZ
	ZvD9TPjOSSXeN/JjukENLfA=
X-Google-Smtp-Source: AMsMyM6mGJLBKBNzE2ClHqyRkPiOa5u4+5VU68fmk3SJwM74BseUTRTZiqJYs6rqBYehl+OweYhJ3Q==
X-Received: by 2002:a05:6402:370c:b0:453:9fab:1b53 with SMTP id ek12-20020a056402370c00b004539fab1b53mr5576083edb.28.1666151722059;
        Tue, 18 Oct 2022 20:55:22 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id h20-20020a0564020e9400b00456d2721d93sm9593339eda.64.2022.10.18.20.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 20:55:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Jesse Taube <mr.bossman075@gmail.com>, Yifan Gu <me@yifangu.com>, Giulio Benetti <giulio.benetti@benettiengineering.com>, George Hilliard <thirtythreeforty@gmail.com>, Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/6] sunxi: f1c100: add UART1 support
Date: Wed, 19 Oct 2022 05:55:19 +0200
Message-ID: <5610966.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <905be4d0-74c3-c563-00e8-fcd039694cb7@arm.com>
References: <20221012163458.1968900-1-andre.przywara@arm.com> <1917971.yKVeVyVuyW@kista> <905be4d0-74c3-c563-00e8-fcd039694cb7@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 18. oktober 2022 ob 11:23:41 CEST je Andre Przywara napisal(a):
> On 12/10/2022 22:42, Jernej =C5=A0krabec wrote:
>=20
> Hi Jernej,
>=20
> many thanks for the review of this series, that's much appreciated!
>=20
> > Dne sreda, 12. oktober 2022 ob 18:34:56 CEST je Andre Przywara napisal(=
a):
> >> Some boards use UART1 for its debug UART, so define the pins for the S=
PL
> >> and the pinmux name and mux value for U-Boot proper.
> >>=20
> >> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >> ---
> >>=20
> >>   arch/arm/mach-sunxi/board.c           | 4 ++++
> >>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 1 +
> >>   2 files changed, 5 insertions(+)
> >>=20
> >> diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> >> index 62bb40b8c89..77216157908 100644
> >> --- a/arch/arm/mach-sunxi/board.c
> >> +++ b/arch/arm/mach-sunxi/board.c
> >> @@ -147,6 +147,10 @@ static int gpio_init(void)
> >>=20
> >>   	sunxi_gpio_set_cfgpin(SUNXI_GPH(12), SUN9I_GPH_UART0);
> >>   	sunxi_gpio_set_cfgpin(SUNXI_GPH(13), SUN9I_GPH_UART0);
> >>   	sunxi_gpio_set_pull(SUNXI_GPH(13), SUNXI_GPIO_PULL_UP);
> >>=20
> >> +#elif CONFIG_CONS_INDEX =3D=3D 2 && defined(CONFIG_MACH_SUNIV)
> >> +	sunxi_gpio_set_cfgpin(SUNXI_GPA(2), SUNIV_GPE_UART0);
> >> +	sunxi_gpio_set_cfgpin(SUNXI_GPA(3), SUNIV_GPE_UART0);
> >> +	sunxi_gpio_set_pull(SUNXI_GPA(3), SUNXI_GPIO_PULL_UP);
> >>=20
> >>   #elif CONFIG_CONS_INDEX =3D=3D 2 && defined(CONFIG_MACH_SUN5I)
> >>  =20
> >>   	sunxi_gpio_set_cfgpin(SUNXI_GPG(3), SUN5I_GPG_UART1);
> >>   	sunxi_gpio_set_cfgpin(SUNXI_GPG(4), SUN5I_GPG_UART1);
> >>=20
> >> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> >> b/drivers/pinctrl/sunxi/pinctrl-sunxi.c index 9ce2bc1b3af..061104be056
> >> 100644
> >> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> >> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> >> @@ -245,6 +245,7 @@ static const struct sunxi_pinctrl_function
> >> suniv_f1c100s_pinctrl_functions[] =3D { #else
> >>=20
> >>   	{ "uart0",	5 },	/* PE0-PE1 */
> >>  =20
> >>   #endif
> >>=20
> >> +	{ "uart1",	5 },	/* PA0-PA3 */
> >=20
> > Comment should be PA2-PA3. With that fixed:
> Well, PA0 and PA1 are RTS and CTS for UART1, so if you don't mind, I
> will keep it like this. Not that the comment really matters anyway ;-)

Ok.

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >=20
> > Best regards,
> > Jernej
> >=20
> >>   };
> >>  =20
> >>   static const struct sunxi_pinctrl_desc __maybe_unused
> >>=20
> >> suniv_f1c100s_pinctrl_desc =3D { --
> >> 2.25.1




