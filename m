Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4605A79FC
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Jul 2023 17:57:16 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-577637de4beso29464257b3.0
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Jul 2023 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689443836; x=1692035836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWfuaj908ezvTCArkn3iKuZY57pS5DEGCvs818aKT1g=;
        b=hXFWx/7V2ilUSpF3voEEHL3miMi68ZScjxXTYKsraLjLXai5wQQF4WPMOEwKknT73Z
         TosQJPQ0jcS9mV4PZ/Hrjat87xHfW1QZJJvKse42oBPzZB+EGbp2N3i5id7JTxjUsgtN
         WDL0fBXFgAJ7IwzYFb0eaIrxQI4wqfHa1Tk5UXF4g6QhSgtnbN6HAd5LXyrsoH093BeZ
         dnzHSgUdn7weBlTbCB7MsfNkTRHFyDdDqy3vayXALCvXkwp2xHLINAeKis0MHStT3gGB
         zSRQipZgpEoUedpY9iX8KSuraRlyBWdrTzGFZ/p6RBKPRCTekMb8kbzZG2seChNlsEGP
         QXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689443836; x=1692035836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWfuaj908ezvTCArkn3iKuZY57pS5DEGCvs818aKT1g=;
        b=bGrcF9W6Ot6bMheUosnvjP8fnSn1rbcy7/wwDdXLw3E0hq2GTxFryqWK0pUON5LhlX
         el8ZnUw7+JrNztEwUT5G4Xj9hBB/u6zw37aJHzTBV2rxHMFtWIFz6OIbmgmfoJnxtwJy
         +8Edne0twm1aXubyTG96yv4v2ZpOzE0DrCL+zYb74D1G9iuQY26TqZta8gPFKyHyI1zm
         6CtUelLCiYMMqSDAUW/Wd7v0H5fGfCjx7mgmnRHyZtsrByzu9VDLnRpzqPPbKX8oJ8yv
         +3Y5mCl59Ry8bvHTx0QokJuEwSkDsCQ+pLAqfROJqOrGZzLbb1YSRnPG+u6kji7pwzYi
         a88Q==
X-Gm-Message-State: ABy/qLakn8J9XmHV6YdmaY7l7rfXrAy/3bsS1hw0HzGkhXBL4vNn1jvj
	uZOHVKC894uLjyNIZ46icrEbhN9ODProoOLAL5dERQ==
X-Google-Smtp-Source: APBJJlEOgFSlT/aTEORmFdIMvrXhSvSNS+ivT8OhWO9TBnbzSoXq3K3OfZ5ITuyPBt0YYAqSQP7aCMjSrPWQ6SLmwFM=
X-Received: by 2002:a81:4ec2:0:b0:573:cacd:3b6e with SMTP id
 c185-20020a814ec2000000b00573cacd3b6emr7407493ywb.30.1689443836031; Sat, 15
 Jul 2023 10:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230714174751.4060439-1-robh@kernel.org>
In-Reply-To: <20230714174751.4060439-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Jul 2023 19:57:04 +0200
Message-ID: <CACRpkdaxqeZH_SOhmuZ2rhoU73uDVNPmzGFpCEuk636Jb2qMsw@mail.gmail.com>
Subject: Re: [PATCH] mtd: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@nxp.com>, 
	Harvey Hunt <harveyhuntnexus@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michal Simek <michal.simek@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Vladimir Zapolskiy <vz@mleia.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 7:48=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for going back and fixing up this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
