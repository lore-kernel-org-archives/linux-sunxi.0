Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794156431;
	b=iM+HMoSrulQTwT3fQ0rHJVa9P64yby6Da0af5eVmjLtJYQ86cn6C4RhX04a4gnGGGcVm
	 diI/aAVeLdCYb/FESTVKGLLzPxzc6MKv5dnxbJfhfPBV5116EgKAWRJnia9JkHq00fiMM
	 V962AFhV2B20EjhyKuAEuHyujHSqnY70vAwMQgqtg+Dmnr6qyTnTDn5MgA15SA6jHCIJC
	 qnRJ2BxE052LRVp+tqLBG/IRk8gx6DMpskVKYgfdBUZktVXVZYyori1EP6bfOXMaZPryH
	 k53mNnsYoVPG4M3GctmvC6yiAO8GNb9pJwXWPOcXBwVKQbO2mwpT5QzF9mtuzYs7nCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
	b=C/WsMPBOdB3gfiLUUczsPp64fUM/CbrskYsCTyOGZ4+1WwOFWhPPHHhn+YlqiPqCGiBK
	 ycaWCIQFzfjTwRuJcrnj+tL5xHD/rxEF1AOQ0fqoXwc9+wOnsOf77usEAqkQSfhqQVZ4I
	 uTNLyVQr4vmNyfUQEXV5hP53loLRxCEnvPUf+SHaTpqExEPAvmD5zL8smry+zp3rubnIW
	 R/Di0uSyNj95niTdAdBSMvIklq5D2FPR23ZhBruaO9rvFhQ9F3UIuHxD+gxJXN2txvc9l
	 RMcCHnIPSrkiXV50TiSMobDAyhm2Jpir8Xz3+0MrxBntdHCdYMhyfWCIPkQG/Nj41RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kb67dMpz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BECD606A320
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Nov 2026 16:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BECD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kb67dMpz
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdd4dafdce9so38873a12.2
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Nov 2026 08:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794156431; cv=none;
        d=google.com; s=arc-20260327;
        b=JZ08sPmg9V7wRSRFUuC6ax9XhmrgySbNGetIS8R72eo9lc7bF566xWqJSUQO+fVJr4
         zCeeMOKRRS8qBPWOYtsE9Jt3cGuPj3w8ONQZ7G4ZC+sIP6+/KNzP+eq9Ir6xH8SMnSpQ
         YyBgdW1GiAzfnYXUt8YtfuOVDokih3VMwlp0GANJRQexxUKHlWb1EhMEHN+MYmDMykIy
         I5Ub3nFC9/WhftUaisgfsIY1AU5Lk008x9GRqNPH9bQDs56UNoHGFy2cfZmw8GrfrtKX
         8Fbs8uFPm6TgoPNWkvqqTUuBRlBgkVJWLLG+Lutk41FV2nZybhOuIxXOUYqGHP55oj/V
         Ns2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
        fh=s39TNurU2Av3KucEVoxFFLZRbSURpX4LvullkcI7Ci0=;
        b=FSLrh5tHjQmZwE+XvmaMwmmQBf87/EaJH7bAHXS4nqCX5jwB6iiJIfoSbobDWisD7y
         xqAIwmJEme9hgYsCsD73nijZ9b1z5Ht5eFASO/sNC3qWn67iXmFVOunisHpl4rciv/mq
         Z+5RmRsi36E0jJjGadkyuZFcpg3ommM1nutr/33NEPGJZjrhG6fRx5x2YPJqhfVTWZl5
         7MsqWtPn0xy5Qr2DHxiOs1UiA2PlPdt4Cl7seXCCmf4jbvZ/o0OrmMvw8bHAmCEsKoVp
         0F72y5GCJ+XCV5j+VmHt30BMY+fbQM7jewmEwG8b95fgoXX17WJleR9ndzbStvoOgci9
         iArg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794156431; x=1794761231; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
        b=Kb67dMpzw7wX1mU0TFMVYc4rgKm8N/ALklKXn3pCk6Psfi7vbAmDgNniTuzK3TWxAX
         pIVUHOAgwjpn0o3UqAC4YviEuWd07L0pbSSoEYhF5UrJ5ClWEEzXvqenvwFE6MBeDzw/
         OiGUdoTqmvI8AFrcZlADgZGxN7FHkkiqB1sCl8RVqHckRO+aYi//BOYfjJrGehd8fXPz
         YsyVarTe+evDGFxl1Y/DwxlsKTawADt8VqWmBZ1LONCU7eMO5NsfzXlSKrYFbg6EPSQj
         pX20ZlUmHXJMhsS9wW8RCotIrM+EaXpy+gLl7UU4uJwEBw2kusHky4UQTx3Hvhpx11Uq
         rrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794156431; x=1794761231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
        b=n5dw9WmnucIng6odfJatwdsyckIk6wlK4i33glG9d78kFjDfLuQrE/Cm4XGWXmJb+u
         +IM27ZqMUNBrkTbnkqYTaCW6FKXZlYeWZO/D5l2rJePTkwz4tuTrmHS5RDiKen7yNHiZ
         jC68CfET+zFdus+z7PN94r8cT2aik91R815/9p2uQTGcDLxlBVELqUkN47ua3i0V9DQ/
         VbTNkWVlpr2IG0ywf6DtwN4pr9oda0TR4FqCYEe2ZtkQfXh9ILtE/kkJUDTj3KGcPyj3
         3F5yuBIPa+VP+ho1OWBr0EGy7jOzbdFw8S0dUodBLiLLpW7KuvowDBBvtttPEurKYQbz
         tN7g==
X-Forwarded-Encrypted: i=1; AL+hErEEnPOy5nIExS+Nd6IlodWBebTezgtVm3roF4rPIDeqRIpRk62xZWcO1CyLgKjMq5/1Uhk/OMMmo2PPfQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/hCako0ig/GKP/Hp0ZuiHgd5HvH4Nx1lRoV5TWhh6GuEnEDjLT
	By95enW5Zuybo4JGe4YL49Iz5sTbTWY9jrjCF6e/IiWilAhF5Z8OlzOix6N3IeQEkHCLG1j5pkp
	/KF7E76/a20aXU5rsH1qmChx6COxbWJU=
X-Gm-Gg: AYBFou37tM+fbGkajzL4HBnd+qHaKwTPGMn38g403KC2vPJABE7po4Yzm6q6qR3RVs2
	xnzAqATkHFTmdCF0Dhn5ut31lzSNwR9ch5k8ROuXigieuV0oG3hiTdyv7IZw427V/nsHB65x3XB
	CUPfsiJq75Tl6VtUV3HY+L4OASgAFAFA7M9BNL2HlfmN8RYn/4n2kP/pStO28WBimnt6RikdJ3E
	RiEtIWg4gSS4Gri2x6EO4pNAxnyKjpK0eXpgzj/Lr9xK8hxIr+FgYGzqDyKWY50ZbsxHd/cf7Gr
	klyfmw1LGzmOkNa2oEuuW7wMOMsQHfcZmb3u+gvl0D86zt0gI6k9TX65Vw8d93srau/drzpOFI4
	U8xvnd0/J5SgVpAzhPZaeB6LLJgwWSOUq1q1FG/Bead5+k3qwH8PP
X-Received: by 2002:a05:6a21:7907:b0:3e1:29b:bb35 with SMTP id
 adf61e73a8af0-3eed59db277mr1575456637.88.1794156430631; Sun, 08 Nov 2026
 08:47:10 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108155702.361022-1-pmazzini@gmail.com> <20261108155702.361022-2-pmazzini@gmail.com>
 <sashiko-outbox-203873@kernel.org>
In-Reply-To: <sashiko-outbox-203873@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 8 Nov 2026 16:46:46 +0000
X-Gm-Features: AclHuK8Aes8U3tn1e6jW8hKMbpOMmvpbiNePg-NqNlB0EoDX7OzrjxLvUYhO9U4
Message-ID: <CAAxh=jt9_hsJkEuaWsdAcLMS6mSS0O7PYQj_p6-oWOsQ5B9Shg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:11 PM <sashiko-bot@kernel.org> wrote:
> Could these macro names be aligned between the clock and reset headers an=
d
> with existing sunxi-ng CCU bindings before they become ABI?

Yes, I'll use the names the other sunxi-ng bindings use in v2.

On Sun, Nov 8, 2026 at 4:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: clock: sun8i-b288-ccu: inconsistent clock and reset
>   macro names
> --
>
> commit fb1a7b2f6dc03665d0714b13f4a0587e1bb34467
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
>
> This commit adds the Allwinner B288 CCU compatible string to the
> sun4i-a10-ccu binding schema and introduces the clock and reset DT bindin=
g
> headers for the SoC.
>
> > diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bi=
ndings/clock/sun8i-b288-ccu.h
> > new file mode 100644
> > index 0000000000000..c9b9eaf979ad0
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
> > @@ -0,0 +1,82 @@
>
> [ ... ]
>
> > +#define CLK_NAND     18
> > +#define CLK_MMC0     19
> > +#define CLK_MMC1     20
> > +#define CLK_MMC2     21
> > +#define CLK_MMC3     22
> > +#define CLK_SPI0     23
> > +#define CLK_SPI1     24
> > +#define CLK_SPI2     25
> > +#define CLK_DRAM     26
>
> [ ... ]
>
> > +#define CLK_BUS_THS  32
> > +#define CLK_BUS_NAND 33
> > +#define CLK_BUS_SDMMC0_BUS   34
> > +#define CLK_BUS_SDMMC1_BUS   35
> > +#define CLK_BUS_SDMMC2_BUS   36
> > +#define CLK_BUS_SDMMC3_BUS   37
>
> [ ... ]
>
> > +#define CLK_BUS_USBOHCI0     46
> > +#define CLK_BUS_USBEHCI0     47
> > +#define CLK_BUS_USBOTG       48
> > +#define CLK_BUS_DE   49
> > +#define CLK_BUS_EE   50
> > +#define CLK_BUS_TCON0        51
> > +#define CLK_BUS_CSI  52
> > +#define CLK_BUS_ADDA 53
> > +#define CLK_BUS_SDRAM        54
>
> [ ... ]
>
> > +#define CLK_BUS_TWI0 63
> > +#define CLK_BUS_TWI1 64
> > +#define CLK_BUS_TWI2 65
>
> [ ... ]
>
> > diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bi=
ndings/reset/sun8i-b288-ccu.h
> > new file mode 100644
> > index 0000000000000..6751456545487
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
> > @@ -0,0 +1,45 @@
>
> [ ... ]
>
> > +#define RST_BUS_MMC0 2
> > +#define RST_BUS_MMC1 3
> > +#define RST_BUS_MMC2 4
> > +#define RST_BUS_MMC3 5
>
> [ ... ]
>
> > +#define RST_USBPHY0  14
> > +#define RST_BUS_OHCI0        15
> > +#define RST_BUS_EHCI0        16
> > +#define RST_BUS_OTG  17
>
> [ ... ]
>
> > +#define RST_BUS_DRAM 25
>
> [ ... ]
>
> > +#define RST_BUS_I2C0 34
> > +#define RST_BUS_I2C1 35
> > +#define RST_BUS_I2C2 36
>
> [Severity: Low]
> Could these macro names be aligned between the clock and reset headers an=
d
> with existing sunxi-ng CCU bindings before they become ABI?
>
> Specifically:
> - CLK_BUS_SDMMC0_BUS..CLK_BUS_SDMMC3_BUS vs. CLK_BUS_MMC0..CLK_BUS_MMC3
>   (matching CLK_MMC0..3 and RST_BUS_MMC0..3, without the redundant _BUS
>   suffix)
> - CLK_BUS_USBOHCI0, CLK_BUS_USBEHCI0, and CLK_BUS_USBOTG vs.
>   CLK_BUS_OHCI0, CLK_BUS_EHCI0, and CLK_BUS_OTG (matching RST_BUS_OHCI0,
>   RST_BUS_EHCI0, and RST_BUS_OTG)
> - CLK_BUS_SDRAM vs. CLK_BUS_DRAM (matching CLK_DRAM and RST_BUS_DRAM)
> - CLK_BUS_TWI0..CLK_BUS_TWI2 vs. CLK_BUS_I2C0..CLK_BUS_I2C2 (matching
>   RST_BUS_I2C0..2)
> - RST_USBPHY0 vs. RST_USB_PHY0 (matching other Allwinner CCU reset header=
s)
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108155702.36=
1022-1-pmazzini@gmail.com?part=3D1
