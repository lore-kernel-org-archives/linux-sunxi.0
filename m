Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB1A7B
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Aug 2022 12:30:06 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id j21so27813230ejs.0
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Aug 2022 05:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=A4ebziFGIGKWedk4/E9Y9YHWqlnnQT7eJEB+itOg6jY=;
        b=JV4NxLJrrSRlvhdBCQR0BmBXWvBPD2WWY57yL9lQtZiNURXqJpW+V5TxKtgglU8sfr
         8h0saIQScUeus/RY4HdeNiEsA6CqBZsV5Z9pDrACaY0tZcAxGuVb7q083EomrLNDC40e
         odwPYLn28lzNGxZNRAjiuAPURDYf9lpPS9WKBAGU5Ly214gBijHGAUB5XOWefa2WXJTh
         I4V+h/62ngM8TNNQUcvs4g16JwsYe9ZtdRvwBVyGQqgULED08G3uMVf1nyDa14i+tesK
         7IHifg30XF+EjhDYcPgPLX+unpTE3yx0aumKCsZoelIzFF3+cnpPGECjoTxRKYH5Khuq
         e3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=A4ebziFGIGKWedk4/E9Y9YHWqlnnQT7eJEB+itOg6jY=;
        b=B9ee+Q/IAC1MM+XdckucGKJWwdfawLfNs36xNcZxCz0wUdxxJodKcj0RRkvubpqqJO
         N905rVgOpvDnaE+kXPezLqr9acIMMuiqyAt9MATyTgs1Ht1nLLKH2zFd7KV7G8IW/Lmm
         F0G/YaCeTS3qATlLM24hpfbhx1bQs5hojygzZc5MkghLgSN610PgEZre8QPrGKfWmARw
         R/J1aOCbujVCP0+64T3daJZTYFOx5G81IZ4aAjjXgIaClnjsUlyf18ChNldzXNR42n4e
         gRmIr4J8UuTnkW1+moehKpyVm+jmJxgmFYbRSaaAmyXIzTBehPZYJAjwQOFKNho0jfVS
         cw+w==
X-Gm-Message-State: ACgBeo1zEJHK52+VXibA1vTTK+9KeEPuoSuYa1fKiEhxK6XzMNLpojrI
	SLGa9nwMNE1/rYrjTXNj8S/+ZycwY5vkLWGSAbF7IA==
X-Google-Smtp-Source: AA6agR4y8IkROVTTFYuvJGLyuFpJlX7rUg/lBd9WKIqzPf1600ZmKhkQ1tKmij2PmJr9CSFfVIP2c0YYAvxPH8SXo4Y=
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id
 nd19-20020a170907629300b0073db27be594mr2746905ejc.526.1661344204322; Wed, 24
 Aug 2022 05:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220823145649.3118479-4-robh@kernel.org>
In-Reply-To: <20220823145649.3118479-4-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Aug 2022 14:29:52 +0200
Message-ID: <CACRpkdb28sHn3XOEJD_rqYRWU1GxWGX1udMpk8Cdu3Qn-rxS0g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: Add missing (unevaluated|additional)Properties
 on child nodes
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Tim Harvey <tharvey@gateworks.com>, 
	Robert Jones <rjones@gateworks.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	- <patches@opensource.cirrus.com>, Steve Twiss <stwiss.opensource@diasemi.com>, 
	Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
	Alistair Francis <alistair@alistair23.me>, Amelie Delaunay <amelie.delaunay@foss.st.com>, 
	Renner Berthing <kernel@esmil.dk>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 23, 2022 at 4:57 PM Rob Herring <robh@kernel.org> wrote:

> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
