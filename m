Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6ED7A
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Jul 2022 19:09:02 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-31c89111f23so31038107b3.0
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Jul 2022 12:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g8uBrLbWc94Zt3/5+ItReRZraOQhpXiAxYkcJ2+dIok=;
        b=YvHdS0dcpg797mdkhiGVt5EYXBki+VqxBmuaZtbSw/FuLBBGfXBkeEFpMyGUeCoeOZ
         tkN4QAWerGT9YiJHy9rhnaldPXCG1SAmfWff89/ppYzAKuvVpWFLjzvYudlRJvBkcgq3
         29kKJgs7KrfCsqID+Oap4Xo7rbUTL1JG7rqcyCKolRHR/tpmysEwCwwMuRysEksm6ODA
         FkQjCGhKS+j4Xv6uaQM5cF/dnqrveBhpH7vwfdmZu6WHTLH///Yj+F0iAr1qaauC5IHH
         OzWOkmx465cLskT5lAxwt+Y8vjb6ugJV95myiv6v7NWz6rpuoo+oD5rxEZQYVQbEZA8e
         3QbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g8uBrLbWc94Zt3/5+ItReRZraOQhpXiAxYkcJ2+dIok=;
        b=l2asUc1LRAlt0EnYvvuyaZYP1+DhZZzjWoYcfpwhEk43nipvfSs7/j6/HZh8qVC3UM
         qUt8ZpKSV3cUnaLlPkzLHb+B/a7eBdc+wFUZUJatwNyiO5G1G3BUACkJ5BJMVfXaCF1f
         cblnY+6WZlplgqwrig6XLbTPdBb4KvA+oLE58clsVxdqUzbAIEHeUPM9Do0LDMnHTbwB
         5Cb2AGAIVe7JWkwW3quZtovaNaD6tz4W+nhE9/imhbiE+EKte87Fp6enX2HTTtqU9gwp
         1VBc3zGqFhaP42FUQXDi0lB3cfynW0V1BGU8zkTtzkpWo9+6b+ziMw+MjIipbxF0mxYS
         D0Qg==
X-Gm-Message-State: AJIora9AFzpE7q+ADu4lSzkL8/oHklNlG/Fxo95Zl2A4NDGZUxAhBYZu
	cst4e9K0gbrVMCv2mqto5ltYiAOGeovrgrW+Rvc=
X-Google-Smtp-Source: AGRyM1uQhf5F8te2uFSd0prGAFf6uTxYdIFIrz6w9GanRjKRI0AwDZInMAcv9znJU/AI6ZDy3jbdkzHSycFBE5OPSlE=
X-Received: by 2002:a81:468b:0:b0:318:4cac:6576 with SMTP id
 t133-20020a81468b000000b003184cac6576mr15721393ywa.277.1657480141962; Sun, 10
 Jul 2022 12:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220710081853.1699028-1-uwu@icenowy.me> <20220710081853.1699028-4-uwu@icenowy.me>
In-Reply-To: <20220710081853.1699028-4-uwu@icenowy.me>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 10 Jul 2022 21:08:24 +0200
Message-ID: <CAHp75VcK4nF6TxE2e3s-qTE5RKLuAeKykoKN3usXe+NiJX4Eng@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: sunxi: add support for R329 R-PIO pin controller
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 10, 2022 at 10:28 AM Icenowy Zheng <uwu@icenowy.me> wrote:
>
> Allwinner R320 SoC has a pin controller in the CPUS power domain.
>
> Add support for it.

> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/reset.h>

Same comment as per previous patch.
Also I forgot to mention kernel.h from which ARRAY_SIZE() is currently
available.

> +#include "pinctrl-sunxi.h"

-- 
With Best Regards,
Andy Shevchenko
