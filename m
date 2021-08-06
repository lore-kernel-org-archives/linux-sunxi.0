Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F6172
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Aug 2021 21:42:05 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id r72so110378iod.6
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Aug 2021 14:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nmfrqnjwoNjULKei+83ZCuOTdf232qIaGlCJ5LO8Ffs=;
        b=gGN7z8w/kz544xg4iXRDzl2Zw9VKVBgLDzziO74VKgddG9p3IIKV6XdeIuDQ6/Wgen
         ackDr5G/JGpotQ4uGPRrBa02fiyYWs0qw6vQoF6QomBnaxKkzVQFGZVSbLmkUuro80KS
         yajf4+PAZzX98U3pISGXylPKq4NS+6UJKMTTge4EGplPVcrvdRAFsesxS8iAzpJHaf76
         APwRTcoPXdwp7sXg5gGx5SowBcblrp6WzK3XwrtBinbAdNcuWgghWTM+oPA+1/XNREDn
         pEsr73V5WPQkbkJdB7YN/bJbyqCZPvV6F9wiMnxWVsbZk4yX7w8wZBIkwFGIAFXM0q8A
         xPsA==
X-Gm-Message-State: AOAM531FBqOsniUrYzFDezaJIBI9BqZTrwpuK7rk4RcZN+ka4eGsebTL
	Z6zXtOjqZs5ILGhDnfK6fQ==
X-Google-Smtp-Source: ABdhPJxL9tTMYas12MdJSTLo1bjOtXg69j1t+6wn3v8IxOh6v5bWwr2JiiTBXP8uR8M6U1QRLQ8B/Q==
X-Received: by 2002:a05:6602:27ca:: with SMTP id l10mr198908ios.16.1628286125249;
        Fri, 06 Aug 2021 14:42:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t16sm3891958ilf.63.2021.08.06.14.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:42:04 -0700 (PDT)
Received: (nullmailer pid 1853406 invoked by uid 1000);
	Fri, 06 Aug 2021 21:42:02 -0000
Date: Fri, 6 Aug 2021 15:42:02 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@sipeed.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/17] clk: sunxi=ng: add support for R329 R-CCU
Message-ID: <YQ2sqouVblVWMbye@robh.at.kernel.org>
References: <20210802062212.73220-1-icenowy@sipeed.com>
 <20210802062212.73220-11-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802062212.73220-11-icenowy@sipeed.com>

On Mon, Aug 02, 2021 at 02:22:05PM +0800, Icenowy Zheng wrote:
> Allwinner R329 has clock controls in PRCM, like other new Allwinner
> SoCs.
> 
> Add support for them.
> 
> This driver is added before the main CCU because PLLs are controlled by
> R-CCU on R329.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> ---
>  drivers/clk/sunxi-ng/Kconfig                  |   5 +
>  drivers/clk/sunxi-ng/Makefile                 |   1 +
>  drivers/clk/sunxi-ng/ccu-sun50i-r329-r.c      | 374 ++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun50i-r329-r.h      |  33 ++
>  include/dt-bindings/clock/sun50i-r329-r-ccu.h |  33 ++
>  include/dt-bindings/reset/sun50i-r329-r-ccu.h |  24 ++

These 2 belong in the binding patch.

>  6 files changed, 470 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-r329-r.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-r329-r.h
>  create mode 100644 include/dt-bindings/clock/sun50i-r329-r-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun50i-r329-r-ccu.h
