Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC059291C
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 11:03:39 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id e69so2183032ybh.2
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Jul 2022 04:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre-computer.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=o5rErEkHGCkTSMZgJgsY0qkL+g3Lk1jQwpG+NJT6gFs=;
        b=e5Ytputp9DYiEdEfJ3wrQ72VCfPQWchKPgS10hmfqfI0pFJEbB5UTEahHQlt6JzxdQ
         QjoUcLluH/s8eBq/a17nqVh8tMou1aEMYcwNf88TGC6MgNAQNFNzuIzCWba/fKRZi8Cr
         QB8pFgnBy3jjS5zSoe9qwxbAnBuyYf7txzEzZHlnP/crvkqOWyKit6Ux5L2R3MDXISCa
         TWmQsUnxE3LNIAW3wLPsL9UsMpTOr+Dwk66MQPAPlYWETeTTVJINBWhfcDpgiS+ji9O6
         L4Wf+bBuQ0V1DykT0B3u1V8E6C3qhxAky/OeufVXDHznp+YjV2zbcHOPCbeTgN8QpDIZ
         PCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=o5rErEkHGCkTSMZgJgsY0qkL+g3Lk1jQwpG+NJT6gFs=;
        b=bz1rOpBZijLtTvSAnZQJNGwZqwrDtXXx2E99XKhJbwr7WrYKZRsn/971HFO5COgpzp
         AJ/z487f4g0D7sk7EmP1X+8lehBQK/5czixtxpCD6FbdcM2+P8KI5Ze0976zQsQDp8Zu
         LwD8RoLP8PJTTyGmUy5QRywHlRJLR7k8vYa2CbknhmW1DUPK10/A9Mz5dzYDxXSSzDnU
         9nXKZ1CotG35RrX+KmhaK5s+cGDn4HU2SkQIM1zMFcBfdBKcYRgAD6FyruzZJcBGsDpb
         d5g1CptQF6bviUAW3J+ov1CpHLDzNvfgIhLA3s7C6b9O464+qO5bxw9DmzYLIW9OQ4pL
         RbiQ==
X-Gm-Message-State: AJIora8CCDj/W/KUg02h92n2LDRixHWAqZs1DhilYr7zRuyJPI8X5SMR
	fUUJUpT1BMJf/Tn94Qyosj35GzE0g/JhK/5gALeiduUOEwRjfM8=
X-Google-Smtp-Source: AGRyM1tUlJhB32GNGlnNNXbmbjDIaiGia+O5Kou4nsrVWiGw2nmGfRLWsKaLkFz4/jWWmKgogY56y3ZzcfBtjMSTStE=
X-Received: by 2002:a25:5006:0:b0:670:9834:8767 with SMTP id
 e6-20020a255006000000b0067098348767mr5881189ybb.147.1658401418349; Thu, 21
 Jul 2022 04:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Da Xue <da@libre.computer>
Date: Thu, 21 Jul 2022 07:03:27 -0400
Message-ID: <CACqvRUZ=3CJOOmX_5Tk=ZR9JhnL-aYpeshJLySEQ_-p6EqgARA@mail.gmail.com>
Subject: Increasing stabilization time in sunxi_mmc_core_init
To: linux-sunxi@lists.linux.dev
Cc: u-boot@lists.denx.de
Content-Type: text/plain; charset="UTF-8"

Hi,

Users were reporting non-boot on our H5 boards (ALL-H3-CC-H5). u-boot
gets stuck in SPL with this message for SD/eMMC respectively.

Trying to boot from MMC1 or Trying to boot from MMC2

I tested about 20 MicroSD cards from different brands and some were
happy and some were not. Increasing the udelay to 8-10ms in
drivers/mmc/sunxi_mmc.c sunxi_mmc_core_init after reset seems to fix
the issue for the MicroSD cards.

Author: Da Xue <da@libre.computer>
Date:   Wed Jul 20 19:11:55 2022 -0400

    sunxi: raise stabilization time for mmc from 1ms to 8ms

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 1bb7b6d0e9..499e057725 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -297,7 +297,7 @@ static int sunxi_mmc_core_init(struct mmc *mmc)

        /* Reset controller */
        writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
-       udelay(1000);
+       udelay(8000);

        return 0;
 }

I don't know the implications of this change so I am seeking feedback.
Are other boards having this issue as well or is it specific to our
hardware?

Best,
Da
