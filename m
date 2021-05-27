Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9702FAD
	for <linux-sunxi@lists.linux.dev>; Thu, 27 May 2021 13:44:31 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id z137-20020a1c7e8f0000b02901774f2a7dc4so5161932wmc.0
        for <linux-sunxi@lists.linux.dev>; Thu, 27 May 2021 06:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QNCQjpSLwdq/MjRPWmx/SHGZ3b/aP3Ibjdfzp+Zf/jA=;
        b=LmAk7zeX49IwdN7gxsosl7NGAiwdkIL+EPDQyLwyWLEcdNmSGavTwP86jJfFUe7QPX
         a4FMUmvxLA3rJT+WMC0hlAjPJzU5k8ufgl8idUsN6UwjClkFYQtt5vnekZgQ7vgGe94e
         8P3ZuHsz6JZ/Gy19E6thS7s6mrwbQ0EWh0+Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QNCQjpSLwdq/MjRPWmx/SHGZ3b/aP3Ibjdfzp+Zf/jA=;
        b=oWh7fTa7A5EboCp797nhgaHpRB5uFmkVURit/WRDdIuQ/4cTqJMfoiYEAIGjfqikBT
         BHfAP5x9KmxJlkfx2VIBc3y6SJMYS2vEmRzzT6oYdhkadWcxLgwDr5lgRiJXAr7j2u4S
         aZykgIKuq2BI7YHaNvTmqWv3V/HaYvPMHaSRnWTRTwP5uCpBPB2T81aFboERxdxwYkBB
         oH4bVhvBnK4RMVXoBR4px6el4qfsRRWfTPMSZlnitfkqRO5/03/BNYeMhd6QNA6JjcCa
         GMzgK/h9bxrc+I7rM4MiPlbDQzuzK9dycZN7Q0kXi05yWhpAJDUEQyeWtV3EI/GF9HpO
         poSQ==
X-Gm-Message-State: AOAM530PfF78vBJdBdpARV5fZ84GMF6PBqOSAgLKj6vQnmCP5k99CEKd
	P/uMySwiKE8WurZyDrepW/Jx1ZGg6bV5kNfUTyKJUQ==
X-Google-Smtp-Source: ABdhPJwtqYX6Z0FhB7oxkBjoc9AStEA9PHFTaKCCm8nyXDd9Azq4OE2zG4l0nZHCufIH3Ae/gVQMLAZbKMVoG7e+mcc=
X-Received: by 2002:a1c:9d02:: with SMTP id g2mr8225284wme.119.1622123070018;
 Thu, 27 May 2021 06:44:30 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210524003650.24469-1-andre.przywara@arm.com> <20210524003650.24469-2-andre.przywara@arm.com>
In-Reply-To: <20210524003650.24469-2-andre.przywara@arm.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 27 May 2021 07:44:17 -0600
Message-ID: <CAPnjgZ2gd2Lj0CXR-k_oPrRus19WWV1dMBnysCU1a_zgPPKeRg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] fastboot: Allow runtime determination of MMC device
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	linux-sunxi@lists.linux.dev, Patrick Delaunay <patrick.delaunay@foss.st.com>, 
	Sean Anderson <sean.anderson@seco.com>, Heiko Schocher <hs@denx.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

On Sun, 23 May 2021 at 18:37, Andre Przywara <andre.przywara@arm.com> wrote:
>
> At the moment the fastboot code relies on the Kconfig variable
> CONFIG_FASTBOOT_FLASH_MMC_DEV to point to the MMC device to use for the
> flash command. This value needs to be the *U-Boot device number*, which
> recently got more dynamic, and depends on other MMC nodes in the
> devicetree, but also on mmc aliases defined. This leads to situations
> where it's hard to fix this number at compile time, because a WiFi
> device might enumerate before the wanted eMMC device, for instance.
>
> To avoid this fragile situation, allow this value to be determined at
> runtime. This decision is probably platform specific, so introduce a
> weak function that returns the needed number, and use that everywhere
> instead of the Kconfig variable.
>
> For now the default implementation just returns this very Kconfig
> variable, but this can be overwritten by platforms later.
>
> No functional change at this point.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/fastboot/fb_command.c |  6 +++---
>  drivers/fastboot/fb_common.c  |  3 ++-
>  drivers/fastboot/fb_mmc.c     | 12 ++++++++----
>  include/fastboot.h            |  7 +++++++
>  4 files changed, 20 insertions(+), 8 deletions(-)

I wonder if this would be better done using a sysinfo driver? Then it
could be hard-coded, picked up from the DT, probed at runtime, etc.,
just as with a weak function.

Regards,
Simon
