Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE82E2106
	for <linux-sunxi@lists.linux.dev>; Sun, 22 May 2022 07:36:59 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id q21so2644734ejm.1
        for <linux-sunxi@lists.linux.dev>; Sun, 22 May 2022 00:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WXPZMIuDMh3nH2dL31GT3vk5sClUvSn8jN8RcdsCbL4=;
        b=k91qRNUzU0dwmpRuQtkAG3m/N0VPpXanYb3QoApiKq42cFZT4HQL5JmtaVxgdYhlBu
         MqX+fzyKkAde9IqUMQ0ovn6zF3DCuzqSl+F5AuJTnBj1MReyWEs9yN57f6OyO4qogsD2
         LPbJGJ0hX0TxPvAR1qJMdENQajTcq/1bF2wGNhtkxjTqzB4Wu43kDbSZoMjz03+w7IQ9
         vLe4QTWG+wPpI4jcChvpgtHBbmzd3GPKw/PLATBgy2wuK+52Nt9U0kDxRSpQ+LstVk5J
         PFTRxCRtvjj1l436l5vtgAVlthegT4+iCUwVWPVjwTOxrB6fxEFMgY+oERNLFI+K/aIO
         D5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WXPZMIuDMh3nH2dL31GT3vk5sClUvSn8jN8RcdsCbL4=;
        b=LLau6LPOUnBx8Y0YaXIeEMjEy7zNvW/bl/9HXo+uNNC579XmoAXXbh3ADQ5yNfGyXg
         Q5HYECKJVXzGVNoNFBEKQ9ZIcsJVo/OlTXTF2QCkU7kNiNp2ZaOIUbCLNab9Jc9v8ppL
         nGYzA9T851MkjKstUkvhvDjGBiJRIDOhplgA0jnzpmN1g1bxDtJApSte8GLwpEsb+xBR
         jQhzpgSeREMs+1U2DlAtVsyy5YdDXodkdCPJhfnulkZcWRE208M47w8rONav5c+vBA7w
         x3enHbdBe+eJ9TVnXd/ufA98W06zhEDPx32KASoUu5BFluisRkwymmmQHtmLtW42XdLs
         dl6A==
X-Gm-Message-State: AOAM531cGnyyXWjWjLA7IlCMRoI3pQAzkaE1fhPTlAtAKIUqq/aIfUah
	2pfxwdbRejVwlWlQCGE80Uo=
X-Google-Smtp-Source: ABdhPJx8/8naAzFBDiHnI0FTe8FKv3lYnIyerQW26X4ehpEB/p2aGjgHgEbyP6lICoR5V1gtsekP1Q==
X-Received: by 2002:a17:907:7283:b0:6f4:ff4f:1b6e with SMTP id dt3-20020a170907728300b006f4ff4f1b6emr14752427ejc.344.1653205018257;
        Sun, 22 May 2022 00:36:58 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id s27-20020a170906221b00b006f3ef214dbdsm4911430ejs.35.2022.05.22.00.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 00:36:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-spdx@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Subject: Re: [patch 09/10] clocksource/drivers/timer-sun4i: Convert to SPDX identifier
Date: Sun, 22 May 2022 09:36:56 +0200
Message-ID: <5567157.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20220510171254.908144392@linutronix.de>
References: <20220510171003.952873904@linutronix.de> <20220510171254.908144392@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 10. maj 2022 ob 19:24:49 CEST je Thomas Gleixner napisal(a):
> The license information clearly states GPL version 2 only. The extra text
> which excludes warranties is an excerpt of the corresponding GPLv2 clause
> 11.
> 
> So the SPDX identifier covers it completely.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-sunxi@lists.linux.dev

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clocksource/timer-sun4i.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> --- a/drivers/clocksource/timer-sun4i.c
> +++ b/drivers/clocksource/timer-sun4i.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Allwinner A1X SoCs timer handling.
>   *
> @@ -8,10 +9,6 @@
>   * Based on code from
>   * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
>   * Benn Huang <benn@allwinnertech.com>
> - *
> - * This file is licensed under the terms of the GNU General Public
> - * License version 2.  This program is licensed "as is" without any
> - * warranty of any kind, whether express or implied.
>   */
> 
>  #include <linux/clk.h>




