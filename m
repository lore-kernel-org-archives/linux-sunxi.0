Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3852874FA
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699650; cv=none; b=ZmAGGRhBxZw+HNhZa661ahrRLc3G3J3LkW1D/slzqszhDrNEMyvNYaATzS5WpaTTsRU4iyQh/vlA0S7gMKDXlmfxu2Ccks2vLuoJD14q5vMZkmMl/fU8/NMGBefCkzEHZcX+Eq50g4eQhOPFuRl1BW2kO7Y41CrGcvSq6hMDaq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699650; c=relaxed/simple;
	bh=hefLtFvtSppGuVWRD/xSsfWMjnGgnQggEUG9Y7OFLDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajdyFKqsLBzpUo0QRsSxHurgBgXnZ57vwI/TrJapJBBzL+9N8NH4FXGshtVJQXbGzeUyYfrRWRxHZqvS7EfWOawak7OvVU/Mw9m9K/m4+9QbxoUVtbzC78WfysYT21FriWdVHcabtz9xqri8ccFYlu94ELjHS5P/BxxQfkvlc8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-40f1a1f77a6so1904973fac.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Mar 2026 00:34:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699649; x=1773304449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlLnToI6SbxsSn7ypnmaqq1RX+miw2VMTyDHKi+gwbk=;
        b=uTNWHyzrbiLLzZkev+JMWI2qMkXApHzD7vup/VlnEktmbkQrE0mviKAxSJ18FioORa
         r6Nh8RKBrdGZ2HyuvzReqKvNj8QkLSpb0qG+7b2j1mZIlsTLDQkmrKUSYDGvPx5uQyuV
         gYAIBTFbkTrTbNcRea+u1hg7PadUn88G7wwMeqy3LQTNczTdNlgupbAK96Fx68++Cp4t
         ohu/Jt+cPD5v+qiAiVBnGVMbucMcs17ronsXdVopvh1yYrPRqg7kteBfim27yXNJSbP5
         Zc+bm+NgkTEn7YhZ+ATp2Qgyj5PvFqZF3oWY+itkpI9EUnr2EmjrMvc02BxN33fvtegJ
         IyZw==
X-Forwarded-Encrypted: i=1; AJvYcCVCocGxnqgdOE3Jn7TQGfr/YFkXjuctpNxJsdNOImQ7290iQITiXpc5BTy7OqY7eGNrvUBCu3jiEvA/FQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YygSf6hs5+XHOrZYVhV2qr6/r/+oh0xwJUT5jWnAh/P4VTJsiWP
	4iA+kjRswsICDebA/VsTBIRLzR1v3vpqBdn6XVz5RFDTv9UOMIm261viVcMr3oxl
X-Gm-Gg: ATEYQzzGQh5KYmAzi4OxcfVrGdKLa93mD9DhkN23xxzL6edYd7xx2HjrRPnRm/79jG8
	ofqZk9HRB1nCG4dPeU5/CLIesitbLSpV4dbtEWlCafntR/u9WTIymo8FDsVdIK06ehr81Qs1oBz
	6aF1wzbgnumct0Jghp6t5YxFtO7bxeqnWILl/RNrd6FQgbiccC5zp8EJpwMX0W/XlsSKJYgmH9p
	ROoePXbw6wzHvkLrtYnTrsVEfMnRbAxNLEvDYAwNFMWtT2EI5YkH1MR4utVS5huTleM256dViwF
	9lHoduYrcheo4KIJpmQahr5pCkCeMBziqrJOAj+ISQky8qw9B4N5L/DnuBL6EBYrHRT/mZVY0jr
	uRnEK//CRA6vF/tvfG14Cd1Y6P5Orq+yuTYpVxgPmCdbR93DzqChq3c1djod5hgnonPPmDgufuh
	9jQB9N3swBBqjenaedj1B4i7oXQ+zvoV3Kf6ESjs4G2Qrtrueb86YebhlcFXNc
X-Received: by 2002:a05:6820:3101:b0:679:dcb5:b843 with SMTP id 006d021491bc7-67b177663aamr3151685eaf.55.1772699648643;
        Thu, 05 Mar 2026 00:34:08 -0800 (PST)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d84dacsm14683808eaf.9.2026.03.05.00.34.07
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:34:08 -0800 (PST)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-679efb9eb0dso5959849eaf.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Mar 2026 00:34:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXkY9zzxUyLixYRHuaQsHlB5gilqqWCkGHqIxOe4ThzbkiL50lUOr5lFH9kB35bJRRIEYR2jhKoygJnQ==@lists.linux.dev
X-Received: by 2002:a05:6102:1607:b0:5ff:c64d:228c with SMTP id
 ada2fe7eead31-5ffc64d2600mr724913137.22.1772699340961; Thu, 05 Mar 2026
 00:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-13-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:28:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
X-Gm-Features: AaiRm50Kgxrt1IEt_9GEmeNyCIrylErpUd7qkh7D4FIoK_FYituUB8DTITetq4c
Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public <linux/phy/phy.h>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:03, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
>
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
>
> Two slight points of contention.
>
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
>
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
>
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
>
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
>
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/phy/phy-provider.h

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -1,246 +1,38 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
> - * phy.h -- generic phy header file
> + * phy.h -- Generic PHY consumer API
>   *
>   * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
>   *
>   * Author: Kishon Vijay Abraham I <kishon@ti.com>
>   */
>
> -#ifndef __DRIVERS_PHY_H
> -#define __DRIVERS_PHY_H
> +#ifndef __PHY_CONSUMER_H
> +#define __PHY_CONSUMER_H
>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/phy/phy-props.h>
>
> -#include <linux/phy/phy-dp.h>
> -#include <linux/phy/phy-hdmi.h>
> -#include <linux/phy/phy-lvds.h>
> -#include <linux/phy/phy-mipi-dphy.h>
> +#include "../../drivers/phy/phy-provider.h"

Shouldn't there be one more "../"?
Interestingly, it compiles with/without.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
