Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01583D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:38 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c21so16100082wrb.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eYKul7O4rkuRHadVgAD9GkF5EF0/tHVMEgyPNxDHsC8=;
        b=gfHGkEQotdDXzonMB5rbM3c8h6BVBrRvbtHhDjj8TB7PUfzKOirNkdHY6GRUcU3QOh
         pN3K3EMybUVH+S6paaWqW87mojZHxKV/KVv6mbG0MfLyFrJiMUS8aEEqAvLcWCbt6l/P
         Hzm7Ul+OYaXZyv/zNw15FgCOHKUCC7ntnW4BdzAX7j1i0rwhvAYiIhbdm+UfaPQ12HgW
         /Ba3wUF9pXtUbhcj50Zvj7lQx6eqKf5c0AarPVaEOvSYvWp73IjYJvOHQOtJ9XQF3QAI
         uc7N5zEeDGCklg2w1zbzB14CeQdszSSXX0bBBbgpTOXk4/oeMs384ZrqD+jYJS8NiWaQ
         MGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eYKul7O4rkuRHadVgAD9GkF5EF0/tHVMEgyPNxDHsC8=;
        b=V2MWzsd3kzx2Bnz53qUoPEQuA0Hoz0oL1d2rr3sZqSIjfYq1XfHlcoPCtAjgjjJkWx
         XToKeIcv+u1BnVPRaL9FQ8OOmLipVSeu+7awMxISK2ytNy6eD3lXbVZz6i/R+4JY4xYF
         SIzngEE1TsNI27XQ684ongIfl7avbM+iVO+mHM8wth6nwWQB2qkRkSck9m1SJtwgCWe8
         uYrokefoLPbvCTbrv8knAeE894ls4SNWJMcuErYbhfxiOZD6gAeHMAnTTHy+u7GxPwv1
         AhzPdk74DXFxhB5UUQENPsGi6rF0IgE8iEal7fS/yqZL0gACu9aBpL4mziBKFJyMadH2
         52KA==
X-Gm-Message-State: AJIora9hyioxL1WLvsracGjZNsZrVy9mS1sOpA9dNT7XvKGCqWyvaVEV
	vU004GFzQ0nwd/wMf0Rogec=
X-Google-Smtp-Source: AGRyM1syc7S1LTS1FFXH6QNulnGOQO1vhdeYnisKeurGdpZwcIyfiJ171d1MMzBPPFFYg3HyKCPoOw==
X-Received: by 2002:a5d:410a:0:b0:21b:9549:e151 with SMTP id l10-20020a5d410a000000b0021b9549e151mr2036808wrp.702.1655755598450;
        Mon, 20 Jun 2022 13:06:38 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
        by smtp.gmail.com with ESMTPSA id t2-20020a1c4602000000b0039db60fa340sm19508415wma.33.2022.06.20.13.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:37 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Cc: agross@kernel.org,
	bjorn.andersson@linaro.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@codeaurora.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	cw00.choi@samsung.com,
	krzysztof.kozlowski@linaro.org,
	b.zolnierkie@samsung.com,
	myungjoo.ham@samsung.com,
	michael@walle.cc,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	tglx@linutronix.de,
	maz@kernel.org,
	lee.jones@linaro.org,
	mani@kernel.org,
	cristian.ciocaltea@gmail.com,
	wens@csie.org,
	tharvey@gateworks.com,
	rjones@gateworks.com,
	mazziesaccount@gmail.com,
	orsonzhai@gmail.com,
	baolin.wang7@gmail.com,
	zhang.lyra@gmail.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [PATCH 15/49] regmap-irq: Change the behavior of mask_writeonly
Date: Mon, 20 Jun 2022 21:06:10 +0100
Message-Id: <20220620200644.1961936-16-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No drivers currently use mask_writeonly, and in its current form
it seems a bit misleading. When set, mask registers will be
updated with regmap_write_bits() instead of regmap_update_bits(),
but regmap_write_bits() still does a read-modify-write under the
hood. It's not a write-only operation.

Performing a simple regmap_write() is probably more useful, since
it can be used for chips that have separate set & clear registers
for controlling mask bits. Such registers are normally volatile
and read as 0, so avoiding a register read minimizes bus traffic.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index dd22d13c54c8..4c0d7f7aa544 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -84,7 +84,7 @@ static int regmap_irq_update_bits(struct regmap_irq_chip_data *d,
 				  unsigned int val)
 {
 	if (d->chip->mask_writeonly)
-		return regmap_write_bits(d->map, reg, mask, val);
+		return regmap_write(d->map, reg, val & mask);
 	else
 		return regmap_update_bits(d->map, reg, mask, val);
 }
-- 
2.35.1

