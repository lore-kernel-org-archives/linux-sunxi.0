Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4002581
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 12:08:42 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v12so26722302wrv.2
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Feb 2022 04:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CV5c3iXN0ZDroe+O7EtfCuby385XVMnLRIPAVIqOzLQ=;
        b=VzDjcwpFw8Bt4+sKQemYRvJXOFpFzlJC4o7nPKh7gBfc/1uZq9iZRUm/gUl0kzALwR
         oxPa9aCTLOW9FaGrfH7w7pLx0iVwTt/GOXHE768JxURnxqtjvX7Niy6SMgOihwz31ziU
         yiXn6isvXh+AOxd1bBRHl+XyKf89NyMrYj/FJQQ3/QHE0Lh4zHDWNZfayfVIsXYuqIiP
         rFEyNLRJGwn/TkVQQNt2eayE/f5SPebnOsJSJuaBmkUDnwTfOvuxe2egfKg+x5OrqbLW
         gPtWHM3dfsl5OfEkaprLcnzVF2zOuCiq9nLyXw6oGM2riIaq7T2S8PLyEtFKNZuRPqDc
         uwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CV5c3iXN0ZDroe+O7EtfCuby385XVMnLRIPAVIqOzLQ=;
        b=ha25RdRvIiT4I/kVtIMzXnYrRmSv3Tm+kujkiHW0fWSbhDb9VLWSoqAGWfUGWrDJX0
         GtKjzHpuGhKOhffYBaweSIeDkSFc2i3+zLCyfU/Ne0TGpCs01TV9DQOUHnwvoOMWJaV9
         kKiQv1aK2neRpM8rVDHEN3srvxjerhtqhIVBnipBBsz4evkfVWcGV3BXsHHzD6HyFT+z
         HTAlSGZMK7T7BTAGjrtz43Ovngfw4g9sj0DEoFA3DuhDX7ZzmKHft4JLcAUmQw/PBR75
         OzL//TV/WX6Ik18yicyGgvZJP/guGxnaCbmP/8kjNRaz6a+b1BXvNlXSAW12XIPHKVpy
         En/A==
X-Gm-Message-State: AOAM533PLynd9BdKkj4pPQVAOWFd7GZONPfrCGuTxu71FaqyLTMKZlZz
	E1KfZKxySS6a2htmLJbX58+9YQ==
X-Google-Smtp-Source: ABdhPJyecBtSfKLHEPz8mlqMUDjEEOgcR2GUvvzZ9e+5PQYFO/+gF3qRyJfmk0DgodzGmHicQFGuPw==
X-Received: by 2002:adf:ee0d:0:b0:1e3:f28:487f with SMTP id y13-20020adfee0d000000b001e30f28487fmr15441462wrn.620.1645445320385;
        Mon, 21 Feb 2022 04:08:40 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a8sm11821546wra.0.2022.02.21.04.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 04:08:39 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	linus.walleij@linaro.org,
	narmstrong@baylibre.com,
	ulli.kroll@googlemail.com,
	wens@csie.org
Cc: linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 0/5] crypto: completion should be ran with BH disabled
Date: Mon, 21 Feb 2022 12:08:28 +0000
Message-Id: <20220221120833.2618733-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello

This is the follow up of https://lore.kernel.org/lkml/Yd1SIHUNdLIvKhzz@Red/
and https://patchwork.kernel.org/project/linux-crypto/patch/20220127133332.4011509-1-clabbe@baylibre.com/
This serie fix all drivers which do not call completion with BH disabled
and add the check in crypto/engine asked by Herbert.
I have verified that this check does not generate warnings on all other crypto
hardware I got (omap, ccree, rockchip)

Regards

Corentin Labbe (5):
  crypto: sun8i-ss: call finalize with bh disabled
  crypto: sun8i-ce: call finalize with bh disabled
  crypto: amlogic: call finalize with bh disabled
  crypto: gemini: call finalize with bh disabled
  crypto: engine: check if BH is disabled during completion

 crypto/crypto_engine.c                              | 1 +
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 +++
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 3 +++
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 3 +++
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c   | 3 +++
 drivers/crypto/amlogic/amlogic-gxl-cipher.c         | 2 ++
 drivers/crypto/gemini/sl3516-ce-cipher.c            | 2 ++
 7 files changed, 17 insertions(+)

-- 
2.34.1

