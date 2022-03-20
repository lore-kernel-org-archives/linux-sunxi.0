Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF1D20E4
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Mar 2022 21:10:36 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id p9so18341937wra.12
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Mar 2022 14:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SnrtPlmOffeZj6T7GE+tanB2uK1Y6oGCWk5gspUCR0Q=;
        b=dgDD7JBM5aF973Pd+bCKYP7HarHcawC9pIaR0mu/mSl7zG7daUDk3Ai8g+EdRhnhtG
         VGMUW5/JrtAtJ9QOXbM796A0wnAd2HdQ36ezr32V3Rmz+CeCof1/iOXUT3rToMJK/Gw/
         zJfjoh+cQ+jgJAX+DcGqJTx29ahYIB7vZin9eof4ufDYkpLOHmNMpYE9P7TMFgvI5EGD
         D5ghqND03oNtKXoeEvYS3igEYKK/dOQj67ybvZzY1YdA7I//3JuRG/WCnAiv/chCGibt
         tdzasKtdOPuNC3aTRvPQTt4qRK57U3jo3Wgw81T6QxydahCV0mGI28XP/QwEojzZcNP1
         3UhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SnrtPlmOffeZj6T7GE+tanB2uK1Y6oGCWk5gspUCR0Q=;
        b=V5oks0drEEMd1HHBU36qs0UxsBo7fvHfPyt2XZt8RLOZ24Wx5Fwvr3GXqELi+TpUqL
         Rovhj5AodKMokxYqS3MwNnzG0eSF1FEJcxake9OBYwAMtZh0kaUw0LjPiKsReBwAP6Yn
         PwsoNFV6GYqACJJT1zM1SLz/3AAJVuOuqMWqurvutBJJd+D7bMQcppP98Zhk6BDH6v/D
         HG+LFYqHNFyQyfdhXppN0LnyJC2SHcj6kFdiyuFiG4hJbcx2r/V9mKO63vlyKDczAyn8
         ZGWNLjAHkCaJhqytLMjqUiF+mu/rCIe8XJKEeGkFgIPd0Ald49lJlQMtV+fpg2xHEaiE
         TAVg==
X-Gm-Message-State: AOAM531xqq2Z5BxZ9wXyzkJD8QlZ8WhdbpVmTGCTUV+CLlK8CRTm3zKc
	vwASSbF0+v6o7Nm6j+guF9M=
X-Google-Smtp-Source: ABdhPJwiU+n1q6r5/cPaRlWWrMm2PghCqUJO1nCR4tiXAbP510ymFnq2c37jzDiAJb/5AXhuZnU7Ow==
X-Received: by 2002:a05:6000:1e09:b0:204:44a:7837 with SMTP id bj9-20020a0560001e0900b00204044a7837mr5438144wrb.6.1647810634467;
        Sun, 20 Mar 2022 14:10:34 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id u8-20020a5d4348000000b00203dbfa4ff2sm11613911wrr.34.2022.03.20.14.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 14:10:34 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: sun6i-rtc: include clk/sunxi-ng.h
Date: Sun, 20 Mar 2022 22:10:32 +0100
Message-ID: <2620573.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20220320210905.6606-1-alexandre.belloni@bootlin.com>
References: <20220320210905.6606-1-alexandre.belloni@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 20. marec 2022 ob 22:09:04 CET je Alexandre Belloni napisal(a):
> This solves:
> >> drivers/clk/sunxi-ng/ccu-sun6i-rtc.c:334:5: warning: no previous
> >> prototype for 'sun6i_rtc_ccu_probe' [-Wmissing-prototypes]
>      334 | int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
> 
>          |     ^~~~~~~~~~~~~~~~~~~
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c index 712fda22efd5..8a10bade7e0d
> 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> @@ -9,6 +9,8 @@
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> 
> +#include <linux/clk/sunxi-ng.h>
> +
>  #include "ccu_common.h"
> 
>  #include "ccu_div.h"




