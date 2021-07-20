Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA7168
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Jul 2021 18:33:46 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id r11so27024590wro.9
        for <linux-sunxi@lists.linux.dev>; Tue, 20 Jul 2021 11:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=61Kmkgq9U7prtsfWxGCCK1IlTSw2fR1J6ed3KYPzzMY=;
        b=cg4fNoQrysS/jzj2g1Ww6ktVPGtfNV7t77CUekEUnlQTBdNYlhjXMDtsFhk5GVUrL5
         Jhv0MfLmuD/oecKzGCQqAigQQE6KwWAjhNDhqk3vd8vJPCoNK49/4TR/dWIF49VBIy/R
         GaSi6hLdvumAdcNB3b91uozgM0R/Le/sYLNPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=61Kmkgq9U7prtsfWxGCCK1IlTSw2fR1J6ed3KYPzzMY=;
        b=I/T7BbwjCPHEYEOBPsjcjpGK01wKIC/F6gJS+LO6hPO7aEvSYWopE74cqzP5e6EEky
         mkdwa4LaRTkQ/Vf9rBhgnpuBvmynpxzYh9NswDekbBvQ4GDg0p/ffTWm6Pwyhjlr9h6z
         ZYE4cXXNpoNBAbonNl0NK9vTtVDEXTZovsbC74u2CCc0IGJeshwUtYROndJmyY3e6JH+
         G+/vCAsBjXp/cLnlBimWDf7I5QusnvEeeG40fh47LCiei+aVnWQxC6jUpQHQcpclJktk
         bbb0hV0IGah2crZohKpoc/MaedF+j/Y4ntTbwKcQnA6bnUYZOCWXfNyVhFowKfWU0m/J
         2qaQ==
X-Gm-Message-State: AOAM533glvxX7s5L9ve5dM5qNzyNhPRxtUk7MfYQ+Z13HAHGeEA07PRD
	ieRN84oPqvUFwsrLdX8FRhZlPraZ8X9IsCBkQQzBTw==
X-Google-Smtp-Source: ABdhPJz+FJZeG9i0PdzNgehf+VAHZ462NYEteH3MI2EKlVU5RLfgUncbXPrjBKcqQvUjcg41oBUBHlAGtaDkH8Ou59U=
X-Received: by 2002:adf:ec4b:: with SMTP id w11mr37986031wrn.420.1626806024762;
 Tue, 20 Jul 2021 11:33:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210712100651.6912-1-andre.przywara@arm.com> <20210712100651.6912-2-andre.przywara@arm.com>
In-Reply-To: <20210712100651.6912-2-andre.przywara@arm.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 20 Jul 2021 12:32:53 -0600
Message-ID: <CAPnjgZ1qhkxrQ-2jm3A8b4wtZMJe5YH-KtBxp10FK_mxc6YWtg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 1/3] spl: mmc: extend spl_mmc_boot_mode() to
 take mmc argument
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, 
	Sunil Mohan Adapa <sunil@medhas.org>, linux-sunxi@lists.linux.dev, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Stefano Babic <sbabic@denx.de>, 
	Fabio Estevam <festevam@gmail.com>, "NXP i . MX U-Boot Team" <uboot-imx@nxp.com>, 
	Lokesh Vutla <lokeshvutla@ti.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Kever Yang <kever.yang@rock-chips.com>, Marek Vasut <marex@denx.de>, 
	Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, Ley Foon Tan <lftan.linux@gmail.com>, 
	Patrick Delaunay <patrick.delaunay@foss.st.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

On Mon, 12 Jul 2021 at 04:07, Andre Przywara <andre.przywara@arm.com> wrote:
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
> (resent to also include forgotten U-Boot list)
>
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

Reviewed-by: Simon Glass <sjg@chromium.org>

But I think this should come from a sysinfo driver.

Regards,
Simon
