Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C548870
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Jul 2021 14:26:37 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id ch27so1844624edb.10
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Jul 2021 07:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=30ds7vcJKAk7VFHs4pjMaahxEdxLGVgCw9afrUbPEuI=;
        b=DmKAuTARSZD+EwAuxvfa7mXlUjGuPeWQgeIwFMNDATZF1I+HzC//z6AM8qAvBzmVpL
         cqn53Ir9oeP5Ia7ycbG9dFW1tr4zt+ZX9Y2PYV+AlqP+4dpDgtK8rB2KTwL9fadcbfOV
         3GwxlvKWovqxwHSBGhRuljDnBYoAvIXBz9IgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=30ds7vcJKAk7VFHs4pjMaahxEdxLGVgCw9afrUbPEuI=;
        b=lOxWoEcfIDXaZA0ZN310FQfqVtm5FQYe0EBunug5kMcOkcxw2YIP8/esABvco5i3yb
         PsGw+vHNuuyfC55zJhwE0gymIlmkPQEF9GUyWAR4kF1rw/sODWrgKFvRBfdkMAQyDD/D
         WkN0Sf/DRVPu2bUyWsuGn/XruYAMhHgGXjFMlC6+ybhzYBn49tGpw6S1EXBwHYBkDcp2
         WvLBuixqAyXfx0oWGyHqH7+ueVGjLdG8WHMSWzNzVnPSpFOY8IjkUjkNooV3LKr9b8fO
         1WjAm/BEJ+AO/Sk3abCCD7KJkhdcVFA4gsvvdKLUlUNb50DJEyfY7+3MPM97VeYkx708
         qrWQ==
X-Gm-Message-State: AOAM533ByKU4ckJ9iTG71cpi5iGiCkYHKjYQ69MtiLDlaeJKscDctKRG
	ccsoqN3nB4G/L0Feokmp7Zt2Ui6052W8p2v6DVfSug==
X-Google-Smtp-Source: ABdhPJzUllSTzUEXq3+Sh5VwT5lMqOCkARNSCd93avNMK5yuHs2P4quHIkbCvJVFsCMzIyIRMnnloLD266bQEdHZZKI=
X-Received: by 2002:aa7:db16:: with SMTP id t22mr23084023eds.204.1625581596078;
 Tue, 06 Jul 2021 07:26:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210705232319.15149-1-andre.przywara@arm.com>
In-Reply-To: <20210705232319.15149-1-andre.przywara@arm.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 6 Jul 2021 19:56:24 +0530
Message-ID: <CAMty3ZDv3WPqRAMQEZe6D8BxJgz+MhzxdaKMQLUcG5K-CL7=Ew@mail.gmail.com>
Subject: Re: [PATCH] cmd: ums: Enable by default for sunxi
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, U-Boot-Denx <u-boot@lists.denx.de>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 4:53 AM Andre Przywara <andre.przywara@arm.com> wrote:
>
> The ums command (presenting a U-Boot block device as a USB mass storage
> device) is very useful for accessing eMMC devices via USB-OTG.
>
> At the moment we enable USB fastboot by default for Allwinner devices,
> so it makes sense to do the same with USB mass storage, which is
> actually more versatile and can be accessed on any USB host easily.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  cmd/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/cmd/Kconfig b/cmd/Kconfig
> index a9fb4eead29..7b1c96910a8 100644
> --- a/cmd/Kconfig
> +++ b/cmd/Kconfig
> @@ -1347,6 +1347,7 @@ config CMD_USB_MASS_STORAGE
>         bool "UMS usb mass storage"
>         select USB_FUNCTION_MASS_STORAGE
>         depends on BLK && USB_GADGET
> +       default y if ARCH_SUNXI && USB_MUSB_GADGET

UMS or any secondary-emmc accessible are considered in production
u-boot config instead of mainline u-boot since we have fastboot
already available for this kind of purpose. This might be one of the
reason not conisidered UMS by default till now, atleast on Allwinner.

Thanks,
Jagan.
