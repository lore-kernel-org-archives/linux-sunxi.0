Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D97A
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Jul 2022 19:07:19 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id l11so5604708ybu.13
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Jul 2022 12:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5pJ2mY4u3LGxMAcCpcPEWdZJC2DKdA33cpYfSaprjpk=;
        b=b6kLel3P40kfn9mtHJmNm3A1puIDxVDvFW+w5n8REW2Qr+jWiPzYUowghbkcalrq+u
         33xJ4rXHnbR1pUhKTvdompZTuFumz9ZG1Qtg9PkbxxzQyvFpmFBGU5a+ZlbpzrlBTP4O
         IQHGa00tcG5NDbi47W1nGe+3g6hNLh9EKDZrJYOcZr1Ma/QPqWhfinJATrT8mdWLWovO
         4atAiGuKR290iDhuftFvqzF7T6FOE9IXZpIg4l/zBFrP4D8a0mepbDWg6V2xikT6ya/K
         hq0aL93vMlXZeV6rukAJ93G609V73mJrSeH+JvTjQ4+PCbEhlBOst81Hi9Z9XLA4/zto
         +qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5pJ2mY4u3LGxMAcCpcPEWdZJC2DKdA33cpYfSaprjpk=;
        b=YxH3vfW8DN4qgyTrNBZ8NMHonxoD/1JLdAiyNeISm+KaayNQrGgqR555vKXMw+qYTQ
         5at0nUjiqqm1H2KA5MlhSIIeYNVkmATVHwHdd2u0HlSkbtHgs+uvYhkU5pjG03ukm+ci
         dfd/bkxo1bADfc6W700xxRsBzHZUDbz6qjN+u9r0Yjszrnx96DOQVrDirshckiYn5cVa
         f6adOioCrzV0C8AWS3A7/RbnpyaZJEw2ohRLN+J/IDur7jcfrVa19Pwkd6ha5lmTQS6D
         N3+E6U5T0rSw8jE1HsESFyiJtNLyIXbKhE4zhqt2CPKI4VBI3AljVcIXOGWB5t1lTs47
         2DRA==
X-Gm-Message-State: AJIora9Y1hYdNmXnVRsseUEEXLBPWi0m/DdYgLn6OO0ozmXprZ7RZJVh
	LO5mrUAs6LoBCOeO+MRoxvMoIlxkaGvrPfpgsZE=
X-Google-Smtp-Source: AGRyM1usMvKd9f2/H5alDs+qjUrsqY+va9QV6ErxeZWmxYWH5zM60anQcdnlEiOVWdGy8L9IlScLjQt6eOQ+XffYNqY=
X-Received: by 2002:a25:cbcf:0:b0:66e:8893:a02c with SMTP id
 b198-20020a25cbcf000000b0066e8893a02cmr14363105ybg.460.1657480037999; Sun, 10
 Jul 2022 12:07:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220710081853.1699028-1-uwu@icenowy.me> <20220710081853.1699028-3-uwu@icenowy.me>
In-Reply-To: <20220710081853.1699028-3-uwu@icenowy.me>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 10 Jul 2022 21:06:41 +0200
Message-ID: <CAHp75Vdso_PGUomjmKaF1ytdUe4qLeAbpwkNmcRng9aNHs7g8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: sunxi: add support for R329 CPUX pin controller
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 10, 2022 at 10:22 AM Icenowy Zheng <uwu@icenowy.me> wrote:
>
> Allwinner R329 SoC has two pin controllers similar to ones on previous
> SoCs, one in CPUX power domain and another in CPUS.
>
> This patch adds support for the CPUX domain pin controller.

...

> +#include <linux/module.h>
> +#include <linux/platform_device.h>

> +#include <linux/of.h>
> +#include <linux/of_device.h>

No use of these.

> +#include <linux/pinctrl/pinctrl.h>

Missed headers:
mod_devicetable.h

> +#include "pinctrl-sunxi.h"

-- 
With Best Regards,
Andy Shevchenko
