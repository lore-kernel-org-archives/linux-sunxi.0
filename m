Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794156475;
	b=rtN2RNtvmou0MAztMbJwCD2V3I+kYM1iaZ4f2nC7XxD6WKP72c8nIGzd0nYq0UWTe3kC
	 rGjXDKbvepCBmKLpSH3zbnuDUPdSSKbWr8X38NGoJX5J01SfCLqmaVcr4ldr9LMyCb9tI
	 Q1K7IxdQPAEY3XRBYUCu+6A7rsPEp/8am9CsPK8ciuCoAfsS8CWS0sznFfSMWCbmfxTVm
	 sd9f59KPYA2Nr8CwnR+GtxKFKBESj5E6Dwi54KNx9Je91Fv+LF/v8BOK6O2mtfM7TB2W7
	 0yRJZn9N9MfncQ5OpSkVZ4zkSHu7CSNg+sQFYXgy04E+sSZQYxnctzV/BaYuTf4ybqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=evSxEGT7EP5yWt4VQjY1odATlVADyf2LwindW+8Vgkk=;
	b=w31EVbm2iW/as+KTgSk+3rHVrQU3dgyDRfda+iFydKJ6RxNARJFhbWBLYRvrCj/OwHoR
	 +X25q7+AHFUHliL9SxP22l4g7csPh2hyQs/nT7bSygGZ54diKQi4f3bcRV1KV2EqoKqtw
	 aQllJHSTl+xe6Qqk8YD97JTAOcz5y6EkZmXEQtrZpqQf/cfdPzpTik5fsATk8Nbt/RH4n
	 5/wZfF4x6Gy512uMbsaLqyhgQx6PE1PQm4C6hp/74KHa9T7Up0hDXRRncijRKWwWn4xdr
	 knlL6VgQxqXoKkBT1D7h5ArpOHzVVPCYCOyRyBM2zZqRumJlOxlVBMp0pleO4NdLPVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0GzASbr+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DAA606A321
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Nov 2026 16:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50DAA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0GzASbr+
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a07078200fso26222b3a.2
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Nov 2026 08:47:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794156474; cv=none;
        d=google.com; s=arc-20260327;
        b=dHzAX1ct8biVDZrA1xvbwY2vsCEmS/vME5shBH9XlWSKpd38xrVO0AQjCqnhPW7RNm
         9cRIDF8P72OaQIsKliWL7HkEIFV3HAMaO3vkh3VZgy3BeG2yEur6iDykHkmlkMiC1DLV
         CGKq8qFohAddO4ogMfjtbETdrRjjnbDJ1C+zhEJj10w2xfqcpnswfMSVnZ1zCbGw4nfl
         1/0U58XVHuv3vd5x1ASTjRY0KXnZDzW3Y7uIUeS4Fb43Wz8pFlIDpJzfNDVG8cw1GHUe
         glvlo2alWiEa8zqxhnOkYFSAWbiOGNMpmqRqVu5LG5AAaUPurLLq05NZN4+57Wx+xiTf
         isKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=evSxEGT7EP5yWt4VQjY1odATlVADyf2LwindW+8Vgkk=;
        fh=JR8A2PtGAtN+vYZSxRYswpdPfgaSuraq1jobTAojd/8=;
        b=pZE7+pAqwe87zilBPX8EVqM/+W+nEv1NM7d9A1SgS3o0srGdjd4tIfrVPl//VYaefg
         mqheFL6bmKYxtceCEhpAgB3O17rxDRITeJzuxyVxnuF0i9h17QkGWG0UsMUbAo15JZx9
         +LNypAmu+jpf+ta/tvHlbH7f4PvNXPsyrAsR61Gh8JF8BJDoGpY7Jp6VDYYRuZcFN9vJ
         7riTRb9dSLJdP/sJMUOtNT4L274J3WRGYv/Qzzmg0p/+xxonnWbN2ioHBSQZ82kFYYGO
         B5T8z6pRcHDjAAJg3XVPmzbayTS1BkveyBPC6DMsgt6sMGjaHA/N3QKj17zFrP2ZiZ8j
         /d3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794156474; x=1794761274; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=evSxEGT7EP5yWt4VQjY1odATlVADyf2LwindW+8Vgkk=;
        b=0GzASbr+VcbhkpNt32h2JX4jdNkfH+VIOzK2PfLaw56Ty5CDp4gSdOrlFT9EEpJxyF
         bx3poHFyhnmMhHp/zRcjUbdupw3c+MRSv0EQRdc+JMfQ4EqQkQXITH+LTN9Ds9B/OnX6
         BZyDcRjgu79bjqEkyQCv5+ou4ceJ3f22+h2Lmj3VQlHscUh/eA9V9tKgAwqE/EOvwOak
         iT1a0RhFeIs78pm2tKLmpWpsr3eW/cZHHjvicotZ2WlBz41sb/64BCL887x41Ip+PmOU
         HcDerUoDvekHSXPHLdhPWC6iLOIRqsA2zbc3/8RzYzYhLXZ+1I9TrpsCdm6WQrSLyMKD
         kTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794156474; x=1794761274;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=evSxEGT7EP5yWt4VQjY1odATlVADyf2LwindW+8Vgkk=;
        b=JyNpUDmEv+JjvO4DvUFsGGUFdo01V2LHx33FJyrZ8AIC5XhrOPst1+PoPMvREu8WWE
         +8azxiY/+6BF0NXIkvK7DnuGPl0i3AR3xiUwKhePRDCO+S8EcvA+B3IzZYvrwjzDa3v6
         VFjN08bbeM86Ix5dVN46MScEnrqnfvVa8PUX1R21wAIuCrQiKZ2oUjt1r1dLm3voFtLM
         nEqxE0A8Tn5Sd+HOsAbJSyDPOBPkytw344QvK1h33b4CvA08FobkOM7VWlkjuAKTfzFv
         Ck0BOwzxL/2MY897vjsYkx6WcCO3PRAwj/B5yVVdRXarA5cttgHj2jPgD01ruHT3kvrt
         n6+g==
X-Forwarded-Encrypted: i=1; AL+hErEJFj5I+s+5RWFUCLn9wziqmvJiPwsNhSL+qKw+yr6wvw1t+nJLVkix87zKpvMTTA8F+bodxVE9B5I3Qg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9pJzoGfCyuorRAU54Mru5XEGiKHLShYzmNyxW9MHs0pun12Zln
	zGcurJExVsiwMRvf0U6Qae6xrv9jFzs4+JVSMqI1GqAa0t9708m11I5C4MeoyX7yEVdtK4POi2h
	84N5/5fUMLzDmDC7+TAYLpzpWWZIhBJA=
X-Gm-Gg: AYBFou2ogXBk3FFXhPttzJgyW8NauRN5e3RozdQRnxbBtYJ1+grkII7Jbw6+qOcWHJO
	fuZyIWooQ4QaRxABufl9bFi1zy6DXQDhzUy2q85XKmj9ouDffhRwXUf2jufbZsyxGDnPObRI4T/
	M0ZxahImFyhzKWlQnxnOnxUmBWeA5GuxVvXLnpIMHgIikJXWE5wKEuJEmsZiFI/GmJKOki5H445
	MrP9CZ0XKhrVMF7V+dh3Fu2oGxgpBaicdU1sGtLs6p8S7PONVqN24GjOLdOSmaWOTdApJaHs0KT
	lzWYDmOsXa7bT9/QFBHkgUPiLlKuSFKnWxws2Lhak7NETzQfIbmMcXn79aOOyJiLKWE5Va17g9G
	BJbyZbL4cGyb8p4/MwU1InOEh3lYlIjRcdBJaMV9+so4iFtdpqQTP
X-Received: by 2002:a05:6a00:4107:b0:8ac:3a71:38a6 with SMTP id
 d2e1a72fcca58-8b66fc970afmr1523563b3a.52.1794156473421; Sun, 08 Nov 2026
 08:47:53 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108155702.361022-1-pmazzini@gmail.com> <20261108155702.361022-4-pmazzini@gmail.com>
 <sashiko-outbox-203874@kernel.org>
In-Reply-To: <sashiko-outbox-203874@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 8 Nov 2026 16:47:28 +0000
X-Gm-Features: AclHuK_4qeDidbx21BSiyl5hMY3CGY3Px979lH25Bd33ehuOp-xo-GZuM04gYbg
Message-ID: <CAAxh=jtSHByK2H1fM=1bBiFJPkunKctR1oKU_anf2zYidXtUBw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: sunxi-ng: add Allwinner B288 CCU driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:14 PM <sashiko-bot@kernel.org> wrote:
> Should this build sun8i-b288-ccu.o (with sun8i-b288-ccu-y +=3D ccu-sun8i-=
b288.o
> below) like the other drivers in this Makefile?

Yes, I'll fix it in v2.

On Sun, Nov 8, 2026 at 4:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] clk: sunxi-ng: missing CPUX mux and PLL notifiers in
>   sun8i-b288-ccu
> - [Low] clk: sunxi-ng: inconsistent module object name for
>   sun8i-b288-ccu
> --
>
> commit 2d968133b3c297b695cc7e5349c65174d952448b
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> clk: sunxi-ng: add Allwinner B288 CCU driver
>
> This commit adds a table-based sunxi-ng Clock Control Unit driver for the
> Allwinner B288 (sun8iw10p1) SoC.
>
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > index 796f443f4d765..debae396555f6 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -41,6 +41,7 @@ obj-$(CONFIG_SUN4I_A10_CCU) +=3D sun4i-a10-ccu.o
> >  obj-$(CONFIG_SUN5I_CCU)              +=3D sun5i-ccu.o
> >  obj-$(CONFIG_SUN6I_A31_CCU)  +=3D sun6i-a31-ccu.o
> >  obj-$(CONFIG_SUN6I_RTC_CCU)  +=3D sun6i-rtc-ccu.o
> > +obj-$(CONFIG_SUN8I_B288_CCU) +=3D ccu-sun8i-b288.o
> >  obj-$(CONFIG_SUN8I_A23_CCU)  +=3D sun8i-a23-ccu.o
> >  obj-$(CONFIG_SUN8I_A33_CCU)  +=3D sun8i-a33-ccu.o
> >  obj-$(CONFIG_SUN8I_A83T_CCU) +=3D sun8i-a83t-ccu.o
>
> [Severity: Low]
> Should this build sun8i-b288-ccu.o (with sun8i-b288-ccu-y +=3D
> ccu-sun8i-b288.o below) like the other drivers in this Makefile?  Adding
> ccu-sun8i-b288.o directly names the module ccu-sun8i-b288.ko instead of
> sun8i-b288-ccu.ko.
>
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.c b/drivers/clk/sunxi-=
ng/ccu-sun8i-b288.c
> > new file mode 100644
> > index 0000000000000..6e12ed8248f20
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c
>
> [ ... ]
>
> > +static const struct ccu_tbl_clk sun8i_b288_clks[CLK_NUMBER] =3D {
> > +     /*
> > +      * PLL_24M @ 0x034 -- B288 only. It feeds the PLLs 24 MHz whateve=
r
> > +      * the crystal: it converts a 26 MHz one and is bypassed with a
> > +      * 24 MHz one.
> > +      */
> > +     CCU_TBL_FIXED_RATE(CLK_PLL_24M, "pll-24m", CCU_TBL_HOSC, 24000000=
),
> > +
> > +     CCU_TBL_STD1(CLK_PLL_CPUX, "pll-cpux", PLL_CPU, CLK_PLL_24M, UNGA=
TE),
>
> [ ... ]
>
> > +     CCU_TBL_STD(CLK_CPUX, "cpux", CPUX, cpux_parents, CRIT | RATE_PAR=
ENT),
>
> [Severity: High]
> Can changing the rate of CLK_CPUX hang the system because no CPU mux or
> PLL rate-change notifiers are registered?
>
> CLK_CPUX sets CLK_SET_RATE_PARENT, so clk_set_rate() propagates to
> pll-cpux and updates its A31-style NKMP factors in place while the CPU is
> running from it.  Other A31-family CCU drivers that allow rate propagatio=
n
> from cpux to pll-cpux (such as ccu-sun50i-a64.c, ccu-sun8i-a33.c and
> ccu-sun8i-h3.c) register ccu_mux_notifier_register() to temporarily
> reparent cpux to the 24 MHz oscillator during the rate change and
> ccu_pll_notifier_register() to gate and ungate the PLL after updating its
> factors, whereas sunxi_ccu_table_platform_probe() registers neither.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108155702.36=
1022-1-pmazzini@gmail.com?part=3D3
