Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D012F2D7DD4
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 21:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495368; cv=pass; b=keouEK5QfPMS8W5xXYb8u/pe3qlWGZ54+GusqSFQNylbohEWyfYjkqmcwqNaDt4Qjao/L0QIYGSOHu1OAJqt0EeOJY5Z4jIiQ49rSUoK0hivDXZAkCl3VwV7Krst7MF3XqJ6G4vv+j53H7VmnmWb21KIg6JiaoEN6QLL2FnSu+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495368; c=relaxed/simple;
	bh=g/5/Kl8DcMdbeuZhnrZTX2rGAUenmbF60rnYbwvssq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSUoj8xNjZrh69rVYWwGtZMaUDg+OvhgdI+yZSAeVG+YoInTZjHmlnzwsO0yDxnXm1Kf8XSQySe+TNWYW3MLesi89y8sWn+Vg9BdD7utFqbLhUK5bzkZWDN2+aMXLPfxV235HTtzDhY2hm/Wrc/9Tddldgy3wPbjbC3Wg92g7nA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERU+RDDG; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERU+RDDG"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-80e24970f1dso46454417b3.0
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 14:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784495365; cv=none;
        d=google.com; s=arc-20260327;
        b=riaKMbHv19aw6Mi80xsRDsbJEe+V2MIMzYgnOewp+GNfsVgRpaRtR0MmdbDPaLCBd1
         iVJOBDPC32Qn5JsgSLOTQHMvDdyYzj+veII7MWbdZwGUmztshWNmGrmMSRncnclwcyfr
         eUI6ZLJbWO/3FKP4I9DDfwdu0MHW7bks1O89B1ax/BNvt+gnlPGwbMp7txk7I2Pb1YWx
         gOtcYUbZXvE4yrjoyhBwR5nTfK3RhdnPK9n8w4737r8s/2j1Q3e4tvmkh5IENcHYxLf8
         ZUcbK/WFtU+YCtNYBWjFOiXTL5l+3kfBgEg0pCDhhqlGcinv6Amq0xYbh5wMpMiGBLXx
         zXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AhtM1hpbjZSDdUK5uO0cI/aNaLK1lqiY4lPHHX9EMZU=;
        fh=fz/zrZdWf3hzt/tVrBd2UmxeB6bi2sOdl4+PSPsRFig=;
        b=KCIsqtP0V40XPMWThLDtaLmerTdRIfrELbwfpOPuHYeSFLwR5zpjBCHX5DKeJS/xlP
         xUaGtkGs/fjgVPwEByfXqgGTOQA4krrhx0wAvtr529/7/hDYlTVSAbw1e05nXc7zx0/9
         fr2cNfAlo6MR695orrkS7NmNbKKtkLO6iCmbC8tYgEcWpiKHn0/OkFy0JnuNgx+1UrfO
         TZt8f/CyE00GiyaIAlPluahxidcB0LA/Haq4xLM8B3a4Zqu2Jf4UIGNP6uR4SrzUIkGp
         p8A32887ZYQSvjaYzJY54hGpPqUgB80jnM0FZCEGd7EoJW0bKbwUuCGcYV5+svNgBQTT
         KlVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495365; x=1785100165; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AhtM1hpbjZSDdUK5uO0cI/aNaLK1lqiY4lPHHX9EMZU=;
        b=ERU+RDDGilmAn+i9WAfTCRJ8m3bSV+ZW6VeIJWXsIPBi14hed/8OYtFHFdtwnMLkqr
         gonIpOs8n6OADkwZAiOo1/fYGJJX+hOrH07gTZUbIXz6xLhBF7R2TDNYM6yvR45mSvy9
         TIUmNQkfBK6prhbK50/Fi5+76N7y57uz5u6fp8K4ccpR3A0NI110r1cHSXzxdDz2gjKH
         ZwRH5HtQhz8kX0BoDbLg7h6f2b3CCVf4wO2SzO6JBGGExs/hTTJFRqljasAManJar7WX
         JNiM2+ddebrSppF9mxuK9ZLmhQRITiX9ovQt5Z3lG5S+aD+eVRQtCvaewd74gpuDBK3c
         zzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495365; x=1785100165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhtM1hpbjZSDdUK5uO0cI/aNaLK1lqiY4lPHHX9EMZU=;
        b=SbjD1oYc2iyTCjL79PuWNm8IpFoQuiod2qjHUX89Vct8B3HCsRSsn4S2V9IwqLu6dh
         LTOZ+hia6KnH+8EbOrBXcCRbefGhnCzXRFraKiSKSXdg2z5GqqDOYjIfTgGxU/4DIyS9
         ioyw64N9tjZnoI66vx/9GPHCFCw3q0LvOMKEoErqazaaVWiFp3PhlfJQ+cKOtE2yZ+uk
         BfrIQcFMzYi6sg67YI6i2+ZhNsZt/14xYabQuPxMpvqqzQ7wKWIQpvCX9NncvgHTJqNb
         +3czgLClXRzrUt1wU6ji+/CIUGpjbC9LefxRPrtargCTPcxId7flZdeff0gvkP3ptEl6
         x89Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrp+GDlf6nranVEyziBoONosJpxxny67JPqAHbQ9Fcu9cjawb9N7byO6Z2AwteLjsMusN0NXFa4HO+IUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq83cqIp33AenvE+0sIYYYlyb2g91jZK1Pmch+ooK8ANYqcdz+
	4Qll9U4dY55IhhYwsYXNfeGeNK5tIhVAlJA0QRArj7q1XUuBIRKijoVBc5EJ+NY1h90686IGs+O
	HBCxOqGglxNPjOOQzh99wRsm8S9JI5/w=
X-Gm-Gg: AfdE7clpjUGwkrV5PO4C/YZc0vFsIFs067sgdj/AAWX5as9LTVH+6o4VpTGUFwhnP7f
	U8iVUhHfsFyhvjYH1V4kTdiIRmKFiY73SVD7Om9d+OO+BsG7Cd+23yeiWmZgYPjBGU7CUYpGB6h
	ou7zwof3A302UeTmiRhfOTlBEKU2X/eEJmX3p2eKhc1XHw/DSGuOnoZRgY1MNTaMM9iI32ZXqqb
	mPvlf1hQcOhaIyuVYF9P9LTpUsKa8F16JYSUuCF+LTj8XHmhvDc/2cdb7kIWt0P/3rkEZkByzcm
	GCMed7Xw3eTOvEyAAlI=
X-Received: by 2002:a05:690c:4d83:b0:81d:d035:eb4b with SMTP id
 00721157ae682-81ef22f15ecmr41881237b3.19.1784495364767; Sun, 19 Jul 2026
 14:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260719153122.892013-1-juanmanuellopezcarrillo@gmail.com> <CAGb2v64Mdq-+C2e6GGHEN_n_H6QEEd66zp6O2W9y--58L=5yzQ@mail.gmail.com>
In-Reply-To: <CAGb2v64Mdq-+C2e6GGHEN_n_H6QEEd66zp6O2W9y--58L=5yzQ@mail.gmail.com>
From: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Date: Sun, 19 Jul 2026 23:09:12 +0200
X-Gm-Features: AUfX_mzAKn4OrNAtXWomQRAbZerhdiZ5kkyJSxJPwI1hfOOK1mJBaeXrnWi0ctw
Message-ID: <CA+c=wxXJCB3Ms=eRy4Bs6fG_uA0owLYpmaXHmxP6woeP+icsWA@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: div: implement set_rate_and_parent
To: wens@kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Thanks a lot for the quick review!

> So the patch itself is OK, but I think there is also something wrong
> with the GPU mod clock. The GPU clock is not a standard divider, but
> actually a fractional one. The formula for the output is
>
>     Clock Source * ((16-M)/16)
>
> with M being 0~15.

You were right, and it was worse than I expected.  I checked the T527
user manual (v0.92, section 2.7.6.58: "FACTOR_M: mask M cycles at 16
cycles") and then measured it on the Orange Pi 4A, forcing each OPP
and reading the real GPU frequency with the Mali cycle counter.  With
the current linear model:

  OPP request    programmed    measured
  150 MHz        600M, M=3D3     ~487 MHz
  200 MHz        800M, M=3D3      648 MHz
  300 MHz        600M, M=3D1      560 MHz
  400 MHz        800M, M=3D1      749 MHz
  600 MHz        600M, M=3D0      599 MHz

so every OPP below 600 MHz silently overclocks (thermal throttling to
"400 MHz" actually raises the clock to 750 MHz).  Interestingly the
vendor BSP models this register as a linear divider too, so the
vendor kernel has the same mislabelling; it also removed the 800M
parent from its parent list citing GPU job faults.

I have a fix working: a small ccu type implementing the cycle-masking
semantics, with the A523 GPU clock switched over to it, the 800M
parent dropped from the selectable parents, and the OPP table for the
Orange Pi 4A.  Re-measured with the same cycle-counter method the five
OPPs now come out at 149/199/300/399/597 MHz from the intended
parents.  I'll send it as a follow-up series referencing this thread.

> And we're also missing a notifier to switch the GPU clock away from
> the PLL while the PLL is being changed.

Agreed =E2=80=94 the series also registers the existing sunxi-ng mux notifi=
er
on pll-gpu (cpux precedent), parking the GPU on pll-periph0-600M
during PLL rate changes.  The manual states the mux switch is
glitch-free.  Nothing retunes pll-gpu at runtime yet with the standard
OPPs, but the higher speed-bin operating points (648-792 MHz) will
need it as a live parent.

> Do you plan on implementing GPU DVFS on mainline?

Yes =E2=80=94 see above; the series is on its way.  The speed-bin OPPs (SID
efuse gated) are left for a follow-up.  Happy to test any related
series on this board in the meantime.

Juan Manuel
