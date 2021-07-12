Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C72170
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jul 2021 19:44:05 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id f17so27204014wrt.6
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Jul 2021 12:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oBKmlyhox/mqoK0hf8kDuqm6dV4AXupAQC7AOPACPzk=;
        b=drr1uZyqxLdtc4s6fz9RPA5MECJjN9UgJQHTdqCXxKJYhPQF3Rf9DhePAay6DYrxCh
         fxT7tWpV5lMibXeRKj06FVyhG00TgJ/dYct9IsvdXtIGgk0PDhO7mycSwRGFbZW65XEx
         vEZfBuUX6hultDVNvd7nyMOuJqkuPZUeRFPgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oBKmlyhox/mqoK0hf8kDuqm6dV4AXupAQC7AOPACPzk=;
        b=EKugV3rPFc+tQ1wfCcdqS3zLyyV2OPqDyAuIg6CZFIxEKtALF4NJr/rDyZWAeZpDFm
         OWMcIpbAZgjPUiEKDjVS4sfGq4uEcDjGg6DTjwlEgSrXWPP4J76eCM/emUfXoTyue598
         Vy4bKgNRZUObfLawlffNkKboUjqz8mbOuevkxQQq6ciCPFUi0fsBNrwhn8Gsd5+kEq8N
         e/ryNMxELpW2+fH9cmtQdTPJH3n2tGvEVXvtFlIjKTQfoWKNy8li2qCdHJUr79ORxkwF
         jSo6ea7NZ0wUUPDHKs3m3xIPf7hNtmH+ubuLcqaFWGFRFzTXqNFWIRHOwAYkKDuVTvXF
         CrTg==
X-Gm-Message-State: AOAM530X+ElN2ZAq2nu8V2MW0Ho4uufqs5qtwQV+VXKrhEy1WIf1762p
	pKvZLlCR0YSX7M/S3E+asf3GPWP6yYQ3UDwBxTUACA==
X-Google-Smtp-Source: ABdhPJz+UGW5Ih+ndr3noxhfy+B6xp0r78/Vxh28Jd/4O4uDWDwRlhhDLEkGP4mHfpFUAnaPxjIxXyLpSYfFu2gaWsU=
X-Received: by 2002:a5d:4522:: with SMTP id j2mr735413wra.43.1626119043641;
 Mon, 12 Jul 2021 12:44:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210711223812.29886-1-andre.przywara@arm.com> <20210711223812.29886-2-andre.przywara@arm.com>
In-Reply-To: <20210711223812.29886-2-andre.przywara@arm.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 12 Jul 2021 13:43:50 -0600
Message-ID: <CAPnjgZ2T+dVVduzwnHnXnQT3khiNQdVPTh5j7rJ_tmMWZQ9ZGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] spl: mmc: extend spl_mmc_boot_mode() to take mmc argument
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, 
	Aleksandr Aleksandrov <aleksandr.aleksandrov@emlid.com>, Sunil Mohan Adapa <sunil@medhas.org>, 
	linux-sunxi@lists.linux.dev, Stefano Babic <sbabic@denx.de>, 
	Fabio Estevam <festevam@gmail.com>, "NXP i . MX U-Boot Team" <uboot-imx@nxp.com>, 
	Lokesh Vutla <lokeshvutla@ti.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Kever Yang <kever.yang@rock-chips.com>, Marek Vasut <marex@denx.de>, 
	Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, Ley Foon Tan <lftan.linux@gmail.com>, 
	Patrick Delaunay <patrick.delaunay@foss.st.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

On Sun, 11 Jul 2021 at 16:38, Andre Przywara <andre.przywara@arm.com> wrote:
>
> Platforms can overwrite the weak definition of spl_mmc_boot_mode() to
> determine where to load U-Boot proper from.
> For most of them this is a trivial decision based on Kconfig variables,
> but it might be desirable the probe the actual device to answer this
> question.
>
> Pass the pointer to the mmc struct to that function, so implementations
> can make use of that.
>
> Compile-tested for all users changed.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Stefano Babic <sbabic@denx.de>
> Reviewed-by: Ley Foon Tan <ley.foon.tan@inte.com> (for SoCFPGA)
> Acked-by: Lokesh Vutla <lokeshvutla@ti.com> (for OMAP and K3)
> ---
>  arch/arm/mach-imx/spl.c                | 2 +-
>  arch/arm/mach-k3/am6_init.c            | 2 +-
>  arch/arm/mach-k3/j721e_init.c          | 2 +-
>  arch/arm/mach-omap2/boot-common.c      | 2 +-
>  arch/arm/mach-rockchip/spl.c           | 2 +-
>  arch/arm/mach-socfpga/spl_a10.c        | 2 +-
>  arch/arm/mach-socfpga/spl_gen5.c       | 2 +-
>  arch/arm/mach-stm32mp/spl.c            | 2 +-
>  arch/arm/mach-uniphier/mmc-boot-mode.c | 5 +----
>  common/spl/spl_mmc.c                   | 4 ++--
>  include/spl.h                          | 3 ++-
>  11 files changed, 13 insertions(+), 15 deletions(-)

This looks like U-Boot code but it doesn't seem to be going to the
U-Boot mailing list.

Regards,
Simon
