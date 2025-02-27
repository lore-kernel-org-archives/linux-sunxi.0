Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB16226177
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Feb 2025 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649211; cv=none; b=ekaaKBEifglUgFTZ0N+p2cVswx3byRSXqhxQw0XPgI2W6pJRjuo84942++eFHDI3fA4chpkw5KFcw5Z4ySxQpFSA5VAx+6tuMQRER33s23aPhNGDMZCv7t5W93Olv0F7OnRJHJdgNYGpaxvsxaIBwxEMHbOAv1GhibU4ZNw8hB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649211; c=relaxed/simple;
	bh=G56e6T7N0AS1QUnn4c+GxR6le/4/uvsYzyrCw8JfIDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nosf0n37JcA7IrRfpPVuYWczUN99bOIOpuI2igemPGPA13YbkeHXNE5WHblL8UiqY7K8c94ns3vGBj0pwQNqsxJ0RBtALcWu9obawK+/VCvJxzMep6mihqSPcSG7UY96IYRDI0ixS/N91MiuHJOuULOlN2GvnmJixOwlhFv6ads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iURC931s; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iURC931s"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f6475f747so307473f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Feb 2025 01:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740649207; x=1741254007; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5QDWkO2mZIUqFyZfWARuefSQbIGKebt4uDjmqBxFCM=;
        b=iURC931sSyFCvle27TOS8IzLOBkpLY/xwrQhbXk9O0H69XalIqvcCjKr6BdcXb6u42
         BCP4cXj7l+gx00YJzASxCN9GP7R/8gRK1myDEvnB/3y9xWoT0kvbOly5xqMA/y3Phaay
         ve9voj9xKbPSDuXUerM8f8mh/RDQRYJiD96mPeb8uJI4vsZDVrdG0CpCFrAIgEPxq8w1
         it+sg9nTRDhOoVR1+js9TDPeuuivCbdHR3PQkM9MwD1aTrMEyd2Neuz1hGuARtfZhk3V
         oxiyHFujdehl2/Ams6CPhGFH9bxSNtaE7DlPOjsGrHYx6D7X6VxFTo9OnTgTP2hI6B/5
         3zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740649207; x=1741254007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5QDWkO2mZIUqFyZfWARuefSQbIGKebt4uDjmqBxFCM=;
        b=gyI6nrGXx+kf6+P/EAop6SVkD5Nin+EmGSn/g5IL85fgCSSisgURry1fDxt/QNxbNe
         rE4jFX0W9UTl+9M2gGyUtRUqbiqtBw7St1x/uClwhJRuSVJoKYmTrMcOkHXI032x425E
         ydCuodAzDsg7fVBCxs+ozxV8YjSYp7pHHwWKOhUv8sqAGXCdje4SUZIkePZgCQzvP2j+
         wUiUN5EyjntDX3KwHq5E098iigziF6Q7LIzB8OxUbcGGQ7iDyqV+EKuZEBaJk8TF3M6n
         8INSLJ5GmEQ1pe+/z8BXRvAd4KuOW4zh2IA7I8oeEfVjMTDmtFwxa6CdQhM9+T3Qsgos
         pNag==
X-Forwarded-Encrypted: i=1; AJvYcCVRiWi5FBHIQ6jzFG0YgMMcGd4fGlJAeF/5N730ZeGrvlqcAWei2vaJd4ATR6w1ZY0PKFUhUHIddG5IsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyC91aFlhWwSrKdXyY4+wh1C9N6enjsImXdwX9ce97v6GlozyMB
	S3YO1b92H78AgEm+DAO65Lf6jhHK4KqmBqqTHl/PhJt5RoD58jsG3R4Jy1BVN2XvYsyp87+YHT3
	bZ3haxkSin0hFxBG0h4TC2S9JaAU=
X-Gm-Gg: ASbGncvZOl/8nSunNKg4P1DFmQZ9xGRQ/miigrY1B7Hrouq1rUg94kiZRPfCo8aglPh
	mLiyRU0VYWwHCbeGJ3Lhdw8MfV9cPJamukgsroQuHzmDnbhYG5R9aC2NMQwxFRquLoAlL19KmZS
	vyjlCjNDUL
X-Google-Smtp-Source: AGHT+IHVxpKqJjF6Oy3UiSsoNMUk3O6YtCQmwyuh/+RElalPL6ZKmZpdr7GUuDOpP7wb1pIYfzRVat/b4jfY+6rXg4Q=
X-Received: by 2002:adf:ed4c:0:b0:38f:476f:e176 with SMTP id
 ffacd0b85a97d-38f6ec63868mr17667271f8f.31.1740649207536; Thu, 27 Feb 2025
 01:40:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225143638.1989755-1-regis.dargent@gmail.com>
 <20250225143638.1989755-2-regis.dargent@gmail.com> <2547277e-d9c0-4138-abaa-7afbff1ba3ca@roeck-us.net>
In-Reply-To: <2547277e-d9c0-4138-abaa-7afbff1ba3ca@roeck-us.net>
From: =?UTF-8?Q?R=C3=A9gis_DARGENT?= <regis.dargent@gmail.com>
Date: Thu, 27 Feb 2025 10:39:56 +0100
X-Gm-Features: AQ5f1JrSA6DaEhL-Nslpn5PJiSZvOfwBqv4VOqRh3wNZ-79IdfFHdRc-00phYLw
Message-ID: <CANarb_ci_vgBMU4XejMwOwxKjGVccfMuweUQA7JwbNzWZqotuw@mail.gmail.com>
Subject: Re: [PATCH v3] watchdog: sunxi_wdt: Allow watchdog to remain enabled
 after probe
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 25 f=C3=A9vr. 2025 =C3=A0 22:51, Guenter Roeck <linux@roeck-us.net>=
 a =C3=A9crit :
>
> On 2/25/25 06:36, Regis Dargent wrote:
> > If the watchdog is already running during probe, let it run on, read it=
s
> > configured timeout, and set its status so that it is correctly handled =
by the
> > kernel.
> >
> > Signed-off-by: Regis Dargent <regis.dargent@gmail.com>
> >
> > --
> >
> > Changelog v1..v2:
> > - add sunxi_wdt_read_timeout function
> > - add signed-off-by tag
> >
> > Changelog v2..v3:
> > - WDIOF_SETTIMEOUT was set twice, and other code cleanup
> > ---
> >   drivers/watchdog/sunxi_wdt.c | 45 ++++++++++++++++++++++++++++++++++-=
-
> >   1 file changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.=
c
> > index b85354a99582..d509dbcb77ce 100644
> > --- a/drivers/watchdog/sunxi_wdt.c
> > +++ b/drivers/watchdog/sunxi_wdt.c
> > @@ -140,6 +140,7 @@ static int sunxi_wdt_set_timeout(struct watchdog_de=
vice *wdt_dev,
> >               timeout++;
> >
> >       sunxi_wdt->wdt_dev.timeout =3D timeout;
> > +     sunxi_wdt->wdt_dev.max_hw_heartbeat_ms =3D 0;
> >
> >       reg =3D readl(wdt_base + regs->wdt_mode);
> >       reg &=3D ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
> > @@ -152,6 +153,32 @@ static int sunxi_wdt_set_timeout(struct watchdog_d=
evice *wdt_dev,
> >       return 0;
> >   }
> >
> > +static int sunxi_wdt_read_timeout(struct watchdog_device *wdt_dev)
> > +{
> > +     struct sunxi_wdt_dev *sunxi_wdt =3D watchdog_get_drvdata(wdt_dev)=
;
> > +     void __iomem *wdt_base =3D sunxi_wdt->wdt_base;
> > +     const struct sunxi_wdt_reg *regs =3D sunxi_wdt->wdt_regs;
> > +     int i;
> > +     u32 reg;
> > +
> > +     reg =3D readl(wdt_base + regs->wdt_mode);
> > +     reg >>=3D regs->wdt_timeout_shift;
> > +     reg &=3D WDT_TIMEOUT_MASK;
> > +
> > +     /* Start at 0 which actually means 0.5s */
> > +     for (i =3D 0; (i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] !=3D r=
eg); i++)
>
> Unnecessary (). On top of that, its complexity is unnecessary.
> The timeout in seconds, except for reg =3D=3D 0, is wdt_timeout_map[reg],
> with values of 0x0c..0x0f undefined. Worse, the above code can access
> beyond the size of wdt_timeout_map[] if reg >=3D 0x0c.

Ok, I prefer parenthesis for (my) readability, but I will remove them.

wdt_timeout_map is not linear, so timeout in seconds is i when
wdt_timeout_map[i] =3D=3D reg, some values of i not corresponding to any
reg value.
reg values of 0x0c and more will end with a timeout of 16s
(i =3D=3D WDT_MAX_TIMEOUT) which will lead to unknown behaviour only
because these values are marked "reserved" in the HW timer documentation.

> > +             ;
> > +     if (i =3D=3D 0) {
> > +             wdt_dev->timeout =3D 1;
> > +             wdt_dev->max_hw_heartbeat_ms =3D 500;
>
> This is an unacceptable API abuse. max_hw_heartbeat_ms, if set,
> should be 16000, not 500. You could set the timeout to 1 second instead.

sorry about that, my comprehension of the documentation on
min/max_hw_heartbeat_ms suggested that they define the time window during
which the HW timer must receive a heartbeat or it will reset.
0-'timeout' defines the time window for the userspace point of view,
meaning that if 'timeout' > max_hw_heartbeat_ms, extra heartbeats must be
sent to HW timer so that the reset can occur only after 'timeout' seconds.

Just to be clear, setting max_hw_heartbeat_ms to the maximum HW possible
value (here 16000ms) means that one cannot use sub-second HW timer values,
while all the watchdog API actually handles them well enough (my tests on
the 500ms HW timer worked good).

For this sunxi driver case, this implies that instead of just reading the
current timeout value from the HW timer (if it was enabled before the
kernel start), I also have to reconfigure the HW timer (to 1sec) if its
timeout is less than a second (the 0 register value).

> Guenter
>
