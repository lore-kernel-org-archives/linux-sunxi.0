Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38413D6E
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:07 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id n185so6369435wmn.4
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ioRXJqRjZqDXf4uhS+zPl4sLu26/rBgrPA3q0xnI1Pk=;
        b=bnHiwq/OClrzuqi/qkl++cxkoDtbanVKeopfnQWVzhU6b4gvB+73xPfwfecrFvG0fg
         c94hGekA8YHpGAXe9zm4qRYYRU0MygrSlEa2zYIu7XgB36o7uYhJEoYrROKQmUBSIY4o
         GC/IaRLTd6YmBywt5HAzxlmtbcVviB558rpnzU3IVr9JxhUY6/cumMLeOBejkhO41DwT
         DsEaO5ReO1eTDEIa8hszhVJBZB5Hbw7MzANj+u8x+/yO6D10YAQ3WQUnywEkt8FEYgLt
         +TQ57DgXgy4ZTyDpkcfoqzaf3zEuCixQ6UraTBXfq3S+ppuoQQgmhycH0ATq77SlYom2
         h4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ioRXJqRjZqDXf4uhS+zPl4sLu26/rBgrPA3q0xnI1Pk=;
        b=eB1qtMtL8t0fBDEsGEPzJ3E1FTvgl2paRVOnaK9SW1kpfwvTE3ol8EMd8GNdOILUwy
         bjVT84nDNcT9/eHXreSvZ8OKRH2NOwOOPdtne5ZF0OLK3xzVagZ0ZhqplRL9AqOoH7Tk
         LCeS3/fciR6/p4QwSnhCV6qdgSMS/q0NP+lRy6zKSEcKj+h7ioQVDCgjy+j/+ktubPuD
         ZbWNFTLVMivdrBjEMjMaFVq4bgCF10hyQIpk1eeLE5TLR52jPMAwJlCI20fGfVDpxUno
         pwYzeFF9UHqnPwA57G351Eh4OoShbANnpL2/+YeC4Xx2R1qLUmBkuPcivT7aYx0IFkow
         +loQ==
X-Gm-Message-State: AOAM533KRN5XEwX90B5jYKy9WBIpXTvnstjSAh+kjKBvELTCDSQ0atdV
	eg3lK8r3CRptzmBFNWbzno4=
X-Google-Smtp-Source: ABdhPJyk2pG0lVa2PXgg+IL73pDXXybyl784/0CAFzghroiptrtMxz7E7l4unjYw5iEqpwxxNZmr7A==
X-Received: by 2002:a1c:4c0d:0:b0:39c:5233:1873 with SMTP id z13-20020a1c4c0d000000b0039c52331873mr37323556wmf.28.1655755627588;
        Mon, 20 Jun 2022 13:07:07 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c4d0a000000b003942a244ee6sm15738587wmh.43.2022.06.20.13.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:07 -0700 (PDT)
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
Subject: [PATCH 33/49] mfd: rohm-bd718x7: drop useless mask_invert flag on irqchip
Date: Mon, 20 Jun 2022 21:06:28 +0100
Message-Id: <20220620200644.1961936-34-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to set the flag explicitly to false, since that
is the default value from zero initialization.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/rohm-bd718x7.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index bfd81f78beae..ad6c0971a997 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -70,7 +70,6 @@ static struct regmap_irq_chip bd718xx_irq_chip = {
 	.mask_base = BD718XX_REG_MIRQ,
 	.ack_base = BD718XX_REG_IRQ,
 	.init_ack_masked = true,
-	.mask_invert = false,
 };
 
 static const struct regmap_range pmic_status_range = {
-- 
2.35.1

