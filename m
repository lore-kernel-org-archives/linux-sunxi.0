Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321A11C54A2
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 04:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745728993; cv=none; b=uYAeh8Ol/dnX6TAlAp3PIXUp5OygoTV/Lodsnbg4L6VGh0Em9vaW40Nd5xsLW/cGxT0vFsbd3fnhjGSkD0CuntINGs1X/zJ8Zuh1JSOePKS5+FDOqCOAnka2APCs+0xyXKqct7SEwMI7XZk8yVPH7qS7My1z/vIGtta7eDok/Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745728993; c=relaxed/simple;
	bh=NMOsczUUODVt3Zolp3/Xl1vOQEtVEsrHp6FHpA3NJYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VF1NEBhvlkkWDOZ8j0xsF7Oq1g/1XkSASmqyS2u49UTcQORhpDyEAw6XlYwLRhsWMF4daKkHF1/5+CqX5tgmrL1NU/ozEpq17JeUGopKw0ElsKu7kbMllioZvAOBsiJRAE1HOFlmT3Fn/jEoNLFt0zAZB+yZnJmgGs/fsbbtzYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d7f4cb7636so11459035ab.3
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 21:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745728988; x=1746333788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gISrtxFe1XEI3Oi2O6vm+8m4GXkK+giUIqyVFsOJWKk=;
        b=OIg7/5BCHYoqTYkBM9owL5iRwTCpogrQn+veEFC67Bbr+MQRTO6NnaJrRUoERlEpMV
         KSDD74rCMRn9/rPBUsFI/fa/63fehOF0DsWSvAw7CX4AP65uOY1sUY8zu3HWWw5vM+EW
         rjt4ubxzkVF0HrZvQNBd2ILXv+pesAdDU8d7gfvVLIRJgB531i2MDlzPlOMb+j6t8Jw0
         1Gl7Ci4wrs2CzreXR2ZYGPF04Y6SnweR8wuu+ihiA7TPuC2Tos1sp4ijLjAXvw9fExDi
         VZl+3U1J3RBc7gVIukZOotvh4UMFCoyBhlIW/6SvAr8JYCszXoa4pZl7/qIJTHid3E+i
         U2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSKVS9hxlwvCg35atE8u0U3O0G6FMxJqy39jI9tSTP2zw3+4MgYQfTDfhWZ7kdvuqcpntaKGOZmGJ0uA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxsQfk234giICfdAidt++zXe3cFoJ1l0dBtiPXXw8DWgBvDBss
	Knan3eSQo6wK7O3VXrQt5UVD/MBXALOE7eHAcoK0xi4gF+gc1wUfXTg1HfXgW+4=
X-Gm-Gg: ASbGncusOLld5vbCCavfidMUmDAuK2UcZuP7XtW8W6EHzBlxzlVVsBul35k+YcFMTod
	MqDyEQ5d6HDdrXNeK9G4cMMonvCKfYs8WLtg08e6UcbXANZ17/1e4EfhZL6OU4o9xfVdaeaZT3A
	7t8bf3bfXOT/hYgmL4hkVgr73SrC3E2gUXA9xTqfR4mTtkzAopolRy5pW8TVK3NVpa2rikvx5ze
	ZF4kyKWU40XoVeFTjj7coe5YEhg0v3ZoYg8bIhkTwW39prANQeH7NdSQCqApXLDcTLfAbfVIlYb
	ATRb0kiuklSEWxFHr9ncvBU56XP4oSwy+lMuUIZ5zoMQsVz2SHaxIteeULmFNIGkXGzXvUuokw=
	=
X-Google-Smtp-Source: AGHT+IHZHB+ODyddaRto2YLsE0WCvy0Lv1aFARDF4AEVv0DUwaQTM0Y0IAyI4W6wPsT+Dl89KU9SPA==
X-Received: by 2002:a05:6e02:1c2b:b0:3d8:975:b808 with SMTP id e9e14a558f8ab-3d93b3c1564mr77915255ab.5.1745728988544;
        Sat, 26 Apr 2025 21:43:08 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824b81d1dsm1610878173.76.2025.04.26.21.43.08
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 21:43:08 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d5e43e4725so9907495ab.1
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 21:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUj2n2r8Ccw2QnBSow1pcozzrXAPNOb5TGsBgRD/Hu9ak0o10DBiy4YNOf11gWmFYLg0hN+KYZPFvDXjg==@lists.linux.dev
X-Received: by 2002:a05:6e02:1847:b0:3d8:1d7c:e197 with SMTP id
 e9e14a558f8ab-3d93b42921bmr71427715ab.7.1745728988001; Sat, 26 Apr 2025
 21:43:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org> <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
In-Reply-To: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 12:42:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64WbBnsWRwy_k3BdeDFBqaTH_QpsZN7mxrzvB8inQLyhQ@mail.gmail.com>
X-Gm-Features: ATxdqUGlkS5EQPGwaf23ftJzckW9DcLS2uG0Iv-DsC8_L7KpG4vBmNT4ibxuK1o
Message-ID: <CAGb2v64WbBnsWRwy_k3BdeDFBqaTH_QpsZN7mxrzvB8inQLyhQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: sunxi: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 12:38=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote=
:
>
> On Fri, Apr 4, 2025 at 7:57=E2=80=AFPM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > Enabling the compile test should not cause automatic enabling of all
> > drivers.  Restrict the default to ARCH also for individual drivers, eve=
n
> > though their choice is not visible without selecting parent Kconfig
> > symbol, because otherwise selecting parent would select the child durin=
g
> > compile testing.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  drivers/clk/sunxi/Kconfig | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
> > index 1c4e543366ddb76c1669b577c1ac337dc1be616f..5e2f92bfe4120981ab68b17=
5dce798ac8b3268b0 100644
> > --- a/drivers/clk/sunxi/Kconfig
> > +++ b/drivers/clk/sunxi/Kconfig
> > @@ -2,13 +2,13 @@
> >  menuconfig CLK_SUNXI
> >         bool "Legacy clock support for Allwinner SoCs"
> >         depends on (ARM && ARCH_SUNXI) || COMPILE_TEST
> > -       default y
> > +       default (ARM && ARCH_SUNXI)
>
> Just wondering, shouldn't this change alone be enough? The remaining
> Kconfig options are gated by this one.

Having re-read your reply to the other patch, this one makes sense now.

Sorry for the noise.

> >  if CLK_SUNXI
> >
> >  config CLK_SUNXI_CLOCKS
> >         bool "Legacy clock drivers"
> > -       default y
> > +       default ARCH_SUNXI
> >         help
> >           Legacy clock drivers being used on older (A10, A13, A20,
> >           A23, A31, A80) SoCs. These drivers are kept around for
> > @@ -19,14 +19,14 @@ config CLK_SUNXI_CLOCKS
> >
> >  config CLK_SUNXI_PRCM_SUN6I
> >         bool "Legacy A31 PRCM driver"
> > -       default y
> > +       default ARCH_SUNXI
> >         help
> >           Legacy clock driver for the A31 PRCM clocks. Those are
> >           usually needed for the PMIC communication, mostly.
> >
> >  config CLK_SUNXI_PRCM_SUN8I
> >         bool "Legacy sun8i PRCM driver"
> > -       default y
> > +       default ARCH_SUNXI
> >         help
> >           Legacy clock driver for the sun8i family PRCM clocks.
> >           Those are usually needed for the PMIC communication,
> > @@ -34,7 +34,7 @@ config CLK_SUNXI_PRCM_SUN8I
> >
> >  config CLK_SUNXI_PRCM_SUN9I
> >         bool "Legacy A80 PRCM driver"
> > -       default y
> > +       default ARCH_SUNXI
> >         help
> >           Legacy clock driver for the A80 PRCM clocks. Those are
> >           usually needed for the PMIC communication, mostly.
> >
> > --
> > 2.45.2
> >
> >
