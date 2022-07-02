Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1872A4414
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Jul 2022 20:29:39 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id o9so6829248edt.12
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 13:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OV+VH3ejxTOPhJCvTbtM9lAhiNsNlXfTZrLr2VYv0q0=;
        b=p6yaS1FSKTSFFsBMibD0IXB/DFpLrMLuxJoB/xOJqUUETATFYdIeuvRIPb6scPfoYG
         bSBoGR+QqhIYT3TWBWtAm0QuiVPumg+J6McmYxRjmBTl1k/1U61sqpCL1fGgnaUPjf80
         1YOYE4aw5YmfMDeRal07dHj0VObpCtPjQKAAkDWblzmqLGeE7myuyhoz9aMMvKljTqmF
         iShG3lBuPgvyrC9sC+jbLGpDnAZYc3QvtXMskZEPP/07Rx5yrT4VKILdlW0/NRj6m0Pj
         F6ZCY1pzkZ7VZf5UtMz/EvUIw25vP5aljBf7xdxxw1RQQhrgN6gtshZ9yimNcG13SH5a
         lmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OV+VH3ejxTOPhJCvTbtM9lAhiNsNlXfTZrLr2VYv0q0=;
        b=zvp8eYRKhc/u62rpgkpxU1DZDv5kRYI+yKND6gSBnYCBMEsek1y7At0QJOZhhxdFyJ
         Q6+MkE43XhCAhWnQyfSbhAt3QCzGDC5kYRdqvZX0ogZej6Bb2qbp0gK++E+iY26kt6Cl
         w4UU/o6Vg2YreG07rffwum3Cvzfgfm8B1my7fV4vrf3/Fb12bYHf1+C1/5JQuchdjltX
         /xsOeUvO6ABy618ro25oH4qo2Mw0KrzGAkFNyGh9HcWFTtNQmNbrQan1EY8fiCeAsBp4
         IsdEtSou8GAZTnoGVqo8fb6bclM9cynxDn2M2M9dCgNfIGBBlAHVZwKM3NzXX9fk4GqH
         wIcg==
X-Gm-Message-State: AJIora9vklNEc5Wtiv2Lk+6ZHhtmKyOl4GH+8Ki92UZWUQ461TfqWpoL
	8bkzfuExTfReraJOza690CY=
X-Google-Smtp-Source: AGRyM1uKvqc3mvz9z8LqDdfV/Fy8cu02zPY3BhLSn/f525LA7ITVIhC/aHi3rQLrgIafrQHlFTnG6Q==
X-Received: by 2002:a50:fd16:0:b0:435:9170:8e2c with SMTP id i22-20020a50fd16000000b0043591708e2cmr27500981eds.216.1656793777413;
        Sat, 02 Jul 2022 13:29:37 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id g20-20020a50d5d4000000b0042617ba63c2sm17553929edj.76.2022.07.02.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 13:29:36 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Ondrej Jirman <x@xff.cz>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/6] pinctrl: sunxi: Refactor register/offset calculation
Date: Sat, 02 Jul 2022 22:29:35 +0200
Message-ID: <2116734.Icojqenx9y@jernej-laptop>
In-Reply-To: <20220626021148.56740-5-samuel@sholland.org>
References: <20220626021148.56740-1-samuel@sholland.org> <20220626021148.56740-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 26. junij 2022 ob 04:11:45 CEST je Samuel Holland napisal(a):
> Starting with the D1/D1s/T113 SoC, Allwinner changed the layout of the
> pinctrl registers. This new layout widens the drive level field, which
> affects the pull register offset and the overall bank size.
> 
> As a first step to support this, combine the register and offset
> calculation functions, and refactor the math to depend on one constant
> for field widths instead of three. This minimizes the code size impact
> of making some of the factors dynamic.
> 
> While rewriting these functions, move them to the implementation file,
> since that is the only file where they are used. And make the comment
> more generic, without mentioning specific offsets/sizes.
> 
> The callers are updated to expect a shifted mask, and to use consistent
> terminology (reg/shift/mask/val).
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Nice cleanup.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


