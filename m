Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB4B2253F6
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Feb 2025 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836884; cv=none; b=rrMucSin8DLXMlAQfRhUYK87fo2DKg7eiE5IuVp4/1A0XjugmMugl4IDnGzOPgHQoNulKYcohALmK7Vl66MMCiRPLGOsdA/Y3GlikJOCT+4zK+J/y+NxMQ/142gsuQxAeRNqVM6FVI6a0psqMchVhuW0rgua1YJutLw7hgdfmgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836884; c=relaxed/simple;
	bh=pROxy4pf04TXH7Mq5LQ2jLXo6EmggJFwNOEavqeCF80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUnpVZpqp6HTbm4DwLTvlAWsJnFwbD8xKiviJBJzZAIj+F1RpIYf6ju9x4PodPvRvQSP9RV/eq513ApI00d2bC0G7xfMpuW+P3CtuvtD22df2e7pXire/YRwf/p8MOju5oITVdLmc6DcMQ+qK3+3Zc4w9/7qX+rg6Nj1VxmYNqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30613802a59so7852421fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Feb 2025 02:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738836879; x=1739441679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2/IIP3n3Vq0jAraoBBXavMXEaBuRqCM8Y1vyh7jgZo=;
        b=g6TNkvPG1Qhc2UHkolJ6gIyEEZ1kkp2mZAo0bgjDoyoMqR40Aww/97lnCCLCZyjSOM
         fXiZHiQj8+FB0z0QgmCb1GraKjFkhpoQ0FM2E0htBk2NI/IH77f/ygwXApSD7HtP1p6y
         XTixw7/RIwSuBid0xsI/4/Hxog1LSpA9hP3z2/Qq48yGWUuVOZGZyWLDTvWolSfKGe7j
         zG3lsTwLggsjsxVl7CGqG3a8AUKTGENhWtPvtzo65Kq6Se7kTaFU+OGnR6xWDOEsmDvC
         YZYL2/CvXlhLzANyirYUsMHJ2+SV0YwCZxbe/82QwN9wSrZU2jNrSdMltBGVF7sJa+V3
         KXFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJuteqCF6M0oHVY0JnYYUIhyo41NNfU7EhS6PybvAk8EU5AXa16bu1EoI5zcZZXTQKmunF+GHZtTfoyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvb+lmliTppO88DOmuVwrt0V03E6EnXlJFH+/4cRNmKtKbKcov
	39pvxSazh2Z53+f86qCxPv+yTtZuSqZ1hPrUhwLCRQx+0kGPsbykMbFXHeG3
X-Gm-Gg: ASbGncsd/Ldwb87yDM93/DZ91BARyem2gwePoKY6gT1L+EX3VWKJ6AbosX6NceswQzq
	C3z1qgPXyemV77KHD6rdRxDe2vBx4rEZHBg+nhd2UUp+EpMNTZZRaBBi5n6yS9aX9dPKEMl+Ifi
	ljkDzTBR9aAKyrOOzE7FDkgpraDSVbc7yQyTxbgCTFr6ZRWc6k5Fo41HtG/NU5bND5uYiAhK3YJ
	mVTbHaE3p6k105QTUmgDw6aHptWgmuB4JenuyjfRx1uWZiji4Noy3uZChKekl+pL84zJzCUrZZf
	Fug75oQEonJuU8GysTNa6+nGotUFRobXf07PJXt6hJzG
X-Google-Smtp-Source: AGHT+IFEDn7lFAPqep8n/FEfUJOCJ85kByYrBUMTKu0yQEN1MvHKEwieVPbihVRqnEEgPCkWwSLYdQ==
X-Received: by 2002:a05:651c:b26:b0:300:3307:389d with SMTP id 38308e7fff4ca-307cf3145c9mr23484831fa.19.1738836879049;
        Thu, 06 Feb 2025 02:14:39 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de177d17sm985171fa.13.2025.02.06.02.14.38
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 02:14:38 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5439e331cceso924877e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Feb 2025 02:14:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWi85s5oPACwWlu4qegs7+RyvCdAj4OJzWwG0KyOB8Uyvn5uwikqKDm2SsB9S0Z2ubN47D8LZUcle51Tw==@lists.linux.dev
X-Received: by 2002:a2e:a912:0:b0:301:12:1ef3 with SMTP id 38308e7fff4ca-307cf2ecc76mr23979521fa.4.1738836878292;
 Thu, 06 Feb 2025 02:14:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206093956.46593-1-regis.dargent@gmail.com>
In-Reply-To: <20250206093956.46593-1-regis.dargent@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 6 Feb 2025 18:14:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
X-Gm-Features: AWEUYZlm4gSn7cw1IB1gbPXGlwF-pdLLAGIdGOws-wlbxjHAlekI14cTphPxU20
Message-ID: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
Subject: Re: [PATCH]: watchdog: Allow watchdog to remain enabled after probe
To: Regis Dargent <regis.dargent@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 5:40=E2=80=AFPM Regis Dargent <regis.dargent@gmail.c=
om> wrote:

Please format your commit subject correctly. See previous commits for
examples.

Please provide a commit message including justification for the change.
The message below already makes sense, though it could be made more
concise.

Please also include your Signed-off-by.

> ---
> The sunxi_wdt watchdog unconditionally stops the watchdog during probe (o=
n my Allwinner H616).
>
> What I want to achieve with this patch is to start the watchdog in the bo=
otloader (either manually or automatically), then boot Linux.
> The watchdog is about 16sec timeout maximum, while the full boot to userl=
and lasts about 90sec, and I want the board to reset if, eg.
> the rootfs cannot be mounted. So I need the watchdog to be handled by the=
 kernel during boot (which it can do pretty well).
>
> The thing is, the current driver stops the watchdog during probe, so it d=
oes not run during boot, and it also does not manages the "status"
> field, so the kernel would know that it must handle the HW watchdog.
> This avoids automatic reboot in case a problem occurs during boot (and fo=
r example handling in the bootloader).
>
> The driver should detect if the HW watchdog is already running during pro=
be and set its appropriate status bit to allow the kernel to handle the wat=
chdog pings itself.
> The call to sunxi_wdt_start/stop allows for proper driver and device conf=
iguration.
> By default, the kernel will then ping the HW watchdog at apropriate frequ=
ency, but the user can have it stop after a time with open_timeout paramete=
r.

                                                           ^ appropriate

Please wrap your messages under 80 characters per line.

>  drivers/watchdog/sunxi_wdt.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b85354a99582..20fe7da445ea 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -192,6 +192,16 @@ static int sunxi_wdt_start(struct watchdog_device *w=
dt_dev)
>         return 0;
>  }
>
> +static int sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)

Make it return bool.

> +{
> +       u32 reg;
> +       void __iomem *wdt_base =3D wdt->wdt_base;
> +       const struct sunxi_wdt_reg *regs =3D wdt->wdt_regs;
> +
> +       reg =3D readl(wdt_base + regs->wdt_mode);
> +       return (reg & WDT_MODE_EN);

          return !!(reg & WDT_MODE_EN);
> +}
> +
>  static const struct watchdog_info sunxi_wdt_info =3D {
>         .identity       =3D DRV_NAME,
>         .options        =3D WDIOF_SETTIMEOUT |
> @@ -268,6 +278,11 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
>         sunxi_wdt->wdt_dev.max_timeout =3D WDT_MAX_TIMEOUT;
>         sunxi_wdt->wdt_dev.min_timeout =3D WDT_MIN_TIMEOUT;
>         sunxi_wdt->wdt_dev.parent =3D dev;
> +       if (sunxi_wdt_enabled(sunxi_wdt)) {
> +               set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);

Maybe also read back the current timeout? This should be done after
watchdog_init_timeout(), so ...

> +       } else {
> +               clear_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +       }

... you should just combine the if-else block with the one below.

>
>         watchdog_init_timeout(&sunxi_wdt->wdt_dev, timeout, dev);
>         watchdog_set_nowayout(&sunxi_wdt->wdt_dev, nowayout);
> @@ -275,7 +290,10 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
>
>         watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
>
> -       sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
> +       if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
> +               sunxi_wdt_start(&sunxi_wdt->wdt_dev);
> +       else
> +               sunxi_wdt_stop(&sunxi_wdt->wdt_dev);

FWIW this is what the dw_wdt driver does as well.


Thanks
ChenYu

>         watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
>         err =3D devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
> --
> 2.25.1
>

On Thu, Feb 6, 2025 at 5:40=E2=80=AFPM Regis Dargent <regis.dargent@gmail.c=
om> wrote:
>
> ---
> The sunxi_wdt watchdog unconditionally stops the watchdog during probe (o=
n my Allwinner H616).
>
> What I want to achieve with this patch is to start the watchdog in the bo=
otloader (either manually or automatically), then boot Linux.
> The watchdog is about 16sec timeout maximum, while the full boot to userl=
and lasts about 90sec, and I want the board to reset if, eg.
> the rootfs cannot be mounted. So I need the watchdog to be handled by the=
 kernel during boot (which it can do pretty well).
>
> The thing is, the current driver stops the watchdog during probe, so it d=
oes not run during boot, and it also does not manages the "status"
> field, so the kernel would know that it must handle the HW watchdog.
> This avoids automatic reboot in case a problem occurs during boot (and fo=
r example handling in the bootloader).
>
> The driver should detect if the HW watchdog is already running during pro=
be and set its appropriate status bit to allow the kernel to handle the wat=
chdog pings itself.
> The call to sunxi_wdt_start/stop allows for proper driver and device conf=
iguration.
> By default, the kernel will then ping the HW watchdog at apropriate frequ=
ency, but the user can have it stop after a time with open_timeout paramete=
r.
>
>  drivers/watchdog/sunxi_wdt.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b85354a99582..20fe7da445ea 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -192,6 +192,16 @@ static int sunxi_wdt_start(struct watchdog_device *w=
dt_dev)
>         return 0;
>  }
>
> +static int sunxi_wdt_enabled(struct sunxi_wdt_dev *wdt)
> +{
> +       u32 reg;
> +       void __iomem *wdt_base =3D wdt->wdt_base;
> +       const struct sunxi_wdt_reg *regs =3D wdt->wdt_regs;
> +
> +       reg =3D readl(wdt_base + regs->wdt_mode);
> +       return (reg & WDT_MODE_EN);
> +}
> +
>  static const struct watchdog_info sunxi_wdt_info =3D {
>         .identity       =3D DRV_NAME,
>         .options        =3D WDIOF_SETTIMEOUT |
> @@ -268,6 +278,11 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
>         sunxi_wdt->wdt_dev.max_timeout =3D WDT_MAX_TIMEOUT;
>         sunxi_wdt->wdt_dev.min_timeout =3D WDT_MIN_TIMEOUT;
>         sunxi_wdt->wdt_dev.parent =3D dev;
> +       if (sunxi_wdt_enabled(sunxi_wdt)) {
> +               set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +       } else {
> +               clear_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +       }
>
>         watchdog_init_timeout(&sunxi_wdt->wdt_dev, timeout, dev);
>         watchdog_set_nowayout(&sunxi_wdt->wdt_dev, nowayout);
> @@ -275,7 +290,10 @@ static int sunxi_wdt_probe(struct platform_device *p=
dev)
>
>         watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
>
> -       sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
> +       if (watchdog_hw_running(&sunxi_wdt->wdt_dev))
> +               sunxi_wdt_start(&sunxi_wdt->wdt_dev);
> +       else
> +               sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
>
>         watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
>         err =3D devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
> --
> 2.25.1
>
