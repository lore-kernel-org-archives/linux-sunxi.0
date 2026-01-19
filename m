Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31D929B777
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850757; cv=none; b=G8FAAu3zVGsE/hRD/gIHeCDk1iExQklkaHIbgGDgWY4HyhsqasL/3oONoNMsg/Od2tQFyQ6oeQWGrcF8uhmo0Qak1jZNi7CEmZLVU9UPmE2fpWEUa7J27WYjtEMv2QCV+9w6snE19EJS/+ImvM3c0iywEWYZOCayOda1etgNRgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850757; c=relaxed/simple;
	bh=/6iwuNMZc5kIHFz9+eHrkjYu4KucuYpwvc1o9G18MMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liswnkCD7jD+24HnPenWhMtMB2O7QP3NgyJ0Xr7cLeyuvLY20sjrYGzWhOXgOb1kIOjxjs9OZpHAJn5aGI5/spT32PSdYtO1vir16sj5tHSWeqqHPtW8dS7cnIisQJiqMxd7TUF/ZrcBLXHTa4zQPfwLzZ6AK63WiS2caEgHVqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c538d17816so608898285a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 11:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850754; x=1769455554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/ksvhxDAHEK6GRShjDfoLa3UE0f58CuM5UI6afaKhU=;
        b=rwCdyNC7UdWIUVWP9IYbfrMwd61JD8azOkD4zdWaRYAYd1Tv2BV3pXrnBAdC0Ycf4o
         rt6cS30N7mtmsHAoQcH0z+pLTHC1IXZphsXdLmM6fZzhvUeJdt8eBteurt5wdyiI3gZQ
         MGp7pVAwDAqXSY2ucLBjhf+377i0qOgrzGcKiNeQqiCylFxA1fskR+VFTFJnVnNKDe5P
         s4GOiseIlxiUCCcVUGwLQKRuz//Oot+eRff9GVbn1OpIYAbreEB5XnT3nI5qP6vozvX5
         xBkBaCXI4Q5Dhgd9Zl9MIyOo9fCPEAUIe28rgmrRLErtQ1nSahdjGufGQpvy5ZFKcAaX
         FtuA==
X-Forwarded-Encrypted: i=1; AJvYcCVO9yNl7JOi9nZkkguJXthTEgTB3ge/zaC73Mjustd44uTzL2Cb8RtJQlf/ZBp8UFUJ87KotGcJQgDp6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxaSlZwizNNUR/4vCPqUURfFIPp5+0ys+7ReGd2iklRIJRSXeSR
	hhyQvljVDeJl/Ls8tk7p7odzQI2DQWYORO6jpVNWA4OMDL/Tn0kHXNYy39m8+d2X
X-Gm-Gg: AY/fxX4817mDshnYU+x95gzVDPljOMJTCNSZJxMFcOyeWE2+MSVZS4JEYeXQCrnLmbC
	RWQByDnq0WS0mockwDyDHzlmBWhOfoJ6z7nSFfcVJL8/iffkU6A36Xg+I0tUKraWHbLXRvBtdus
	hEOwh28w1UdSdQHpb/hjcI4szzia8IRUC6eHeCMJ+aNFmYEmax5GrYvnUlLALNJIhFSiuQeNRoO
	tsrp3FRdpHqxVE+eQxAJouTVEbHgmpPdnsUZhObTcoMQFJgZXPptlaiqT9ejyoLM/h1DPvaXRZt
	MMCevrliU5CDhPpITea4c62DsvS+PW2RdSAtDBx8vNRYRhEZiZwc4Ln1ydbMDKuZ+5DIxTIOB2w
	0sQHhsD7c9fz1nCmoMgt2ii8E995TUcqvbo9R01ZkYJBLfXfA9L6VFXFhA6CNzuSIOInmBdmHo8
	BilezhqJ1n3FQSBn4JEhGAxxGckdSMg5H74j8qpL0zxI8h08INiI7tm2HG1G5F1Jk=
X-Received: by 2002:a05:620a:4555:b0:8c1:6018:b186 with SMTP id af79cd13be357-8c6a69637cdmr1689582685a.87.1768850754506;
        Mon, 19 Jan 2026 11:25:54 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c149esm841557885a.18.2026.01.19.11.25.54
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:25:54 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c6a822068eso438787485a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 11:25:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJ3dFxF7UsGDkIEYPLNhU3J8BpdX9xZT3oHvMqOX2kjltmpriYyzp53j30HRHwIJgxXYVvd9uPDrvciA==@lists.linux.dev
X-Received: by 2002:a05:6102:dcb:b0:5dd:84f1:b51a with SMTP id
 ada2fe7eead31-5f1a720e344mr3315725137.43.1768850261678; Mon, 19 Jan 2026
 11:17:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:17:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVG-2qucH5dB40CO=8Haw080NqxE-zg=GyVmD2njs-ibg@mail.gmail.com>
X-Gm-Features: AZwV_QiDYUVl5G1JTvUBamxzE_5VCyogXoHB30dVWIYjGOrIgN6mvoOLoE2_KFA
Message-ID: <CAMuHMdVG-2qucH5dB40CO=8Haw080NqxE-zg=GyVmD2njs-ibg@mail.gmail.com>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Provide a helper function allowing users to read the compatible string
> of the machine, hiding the access to the root node.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,19 @@ bool of_machine_compatible_match(const char *const *compats)
>  }
>  EXPORT_SYMBOL(of_machine_compatible_match);
>
> +/**
> + * of_machine_get_compatible - Get the compatible string of this machine

... the first compatible string...

Do you see a need for adding an index parameter?

> + * @compatible: address at which the compatible string will be stored
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int of_machine_get_compatible(const char **compatible)
> +{
> +       return of_property_read_string(of_root, "compatible", compatible);
> +}
> +EXPORT_SYMBOL_GPL(of_machine_get_compatible);
> +
>  /**
>   * of_machine_device_match - Test root of device tree against a of_device_id array
>   * @matches:   NULL terminated array of of_device_id match structures to search in

> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
>         return of_machine_compatible_match(compats);
>  }
>
> +int of_machine_get_compatible(const char **compatible);
> +
>  extern int of_add_property(struct device_node *np, struct property *prop);
>  extern int of_remove_property(struct device_node *np, struct property *prop);
>  extern int of_update_property(struct device_node *np, struct property *newprop);
>

Do you need a dummy for the !CONFIG_OF case?
This is only used by drivers/soc/fsl/guts.c, and FSL_GUTS is selected
by MMC_SDHCI_OF_ESDHC, which is OF-only, but can be enabled
when PPC || COMPILE_TEST.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
