Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B590B29A9
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 16:15:30 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ez10so8347875ejc.13
        for <linux-sunxi@lists.linux.dev>; Fri, 08 Jul 2022 09:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SLM5PUwTV31o0kHfGXDzIJFVkz9EnZxECRqe7Eh0GBQ=;
        b=QOVATOOfBLjHUxfN9QCROHwRyowlMCkwTO0uRvQYtkT7889uWXuqssJomf8UYieCOH
         rOsyd0Qs1SZpcSisQbGXueVwVgpGfeIgniy7d4JTgKGCnFm7IXyjd34VQ8VDwgnbI34I
         tHJqi8SnqOf99qKxi7g2sH1R2ZdV1jDmrdRdiHfQVHu3QeplkH6iZ5HP68HWKdebByl0
         O08Wy+WH9jN4t84EPDCmr3iqRzhuv21trCJcNgcfVJj4T5sfTdnLpGFnmBHxNXUliXpO
         97leioUbrmBwxj9sQK+4jjq3jyuNI6lPxHF5G/FeleG3IBhxIY5hhbZ6hKHPf11Zo7D5
         CKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SLM5PUwTV31o0kHfGXDzIJFVkz9EnZxECRqe7Eh0GBQ=;
        b=CCPvt8KpHamNc5EYasoVp+GDOJnucIAtdyFfyHiCs48ieb6VBdq+KWijYgDaO2PA5E
         K1GleTR20DiI8yzSbjKzX7ugy1m9YjiM68bd5diPjlFvXwplis0AwmQkGNW5TMFS/SpR
         xjyjIP/YR7ypEltfN10XjC2IWpREfxEz8E6wr4iCSS1QvDhwFuQcdcfkwNz53h2fZvb+
         iCSJbXiTgg9bb9ajCHjlmApV5dxI1HwQdaXQlL2BVpDvFVppLp4V7EPdyZBotOfEey2i
         Ar4hRJHETqW2QpX+koIZ8JtAW7KuMmJ9YwOkmZ7+g+nvH6e9xPsTmCnpEa2tAvoiPSHN
         R53Q==
X-Gm-Message-State: AJIora8f0+JKZPpDBYCD48yXt3KOQDt8Ohbwjk3UN/+wvZR19eionxng
	svC3dkOXVPPsEtiKuegi7Us=
X-Google-Smtp-Source: AGRyM1sUnIACkJ+dK6objElcohl7xX5z6IIBO2igjeYRXpiLZCRqJ+I7upZxDk5p8T2cnAhMP/w6wA==
X-Received: by 2002:a17:906:9b09:b0:72b:d70:32a6 with SMTP id eo9-20020a1709069b0900b0072b0d7032a6mr4248571ejc.723.1657296928940;
        Fri, 08 Jul 2022 09:15:28 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id cn22-20020a0564020cb600b0043a896048basm6071727edb.85.2022.07.08.09.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 09:15:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: samuel@sholland.org, Roman Stratiienko <r.stratiienko@gmail.com>
Cc: peron.clem@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, mripard@kernel.org, wens@csie.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH v3] clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration to support DFS
Date: Fri, 08 Jul 2022 18:15:27 +0200
Message-ID: <1930698.8hb0ThOEGa@kista>
In-Reply-To: <20220705075226.359475-1-r.stratiienko@gmail.com>
References: <20220705075226.359475-1-r.stratiienko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 05. julij 2022 ob 09:52:26 CEST je Roman Stratiienko napisal(a):
> Using simple bash script it was discovered that not all CCU registers
> can be safely used for DFS, e.g.:
> 
>     while true
>     do
>         devmem 0x3001030 4 0xb0003e02
>         devmem 0x3001030 4 0xb0001e02
>     done
> 
> Script above changes the GPU_PLL multiplier register value. While the
> script is running, the user should interact with the user interface.
> 
> Using this method the following results were obtained:
> | Register  | Name           | Bits  | Values | Result |
> | --        | --             | --    | --     | --     |
> | 0x3001030 | GPU_PLL.MULT   | 15..8 | 20-62  | OK     |
> | 0x3001030 | GPU_PLL.INDIV  |     1 | 0-1    | OK     |
> | 0x3001030 | GPU_PLL.OUTDIV |     0 | 0-1    | FAIL   |
> | 0x3001670 | GPU_CLK.DIV    |  3..0 | ANY    | FAIL   |
> 
> DVFS started to work seamlessly once dividers which caused the
> glitches were set to fixed values.
> 
> Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> 

Applied, thanks!

Best regards,
Jernej


