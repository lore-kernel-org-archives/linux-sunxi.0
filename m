Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C2E3D77
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:30 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id m1so8325081wrb.2
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CygB1KehYAHqhpc4bRUhgcxf+zQL9loE7cQLl/MEP/k=;
        b=VdNEnW4i4C6kZGpiqp1Jxmc+HT2MVBw6IwavlCehBQXlv5QOH8TPwVeq3H4ho5YMpx
         H8exp7Pq3R8RMqC3UBwjz4B4XNaNN5lfob6sT6+PndMQfoaU+DTqcC6wBk5rfoCSNQCJ
         /25J++hcAVbS0URhiPSxzu20PkT4vyStw3QlwmbqipEVuj0SMfiZBMh7ShX9R9n4h95O
         9crhgA7QEsaJW7A0sgHALhx1p9ncqoWinxadYQ4mbkrwCqLicK48miZo2piT71YFto5R
         e92szgit9CnwLu5DANwjGf3x1RqZ4wrj46ixAYyPN9ECBgT4l9bBF3FVNWT0DQBc63Y5
         2+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CygB1KehYAHqhpc4bRUhgcxf+zQL9loE7cQLl/MEP/k=;
        b=rMhhAnDzrw9cYDl92donLMJIxAGwHp9JF7k+uBS7SjEISsxgmgHht/UcPldfeK3k55
         bBoPO2ql77Qy1QdV9kyktGUYdf1B5widFcXN6uESIxtzpQohdUvbFA4EtUbsWW6op59K
         pO8eIIe4TwU2o1Ma7K8eYs/1B2yaS0RjBnow2FJHzSis6ATOQTEPghJ4yHToxDZ1jYi1
         N6+M4fkvDFUPhCN0FabpyE2qOYIN0McNUvLmcGTlntPoKybNZ/BlA5WCSc4GV5T66ouv
         s2Zn5BOSpbq80xOMT+y+7ILtsgaKdtzaFZUUNs9ey+o8bUwg7J1cOXxBI5v1f8YM6m39
         WekQ==
X-Gm-Message-State: AJIora/MG5/nBIcEF5Yh3ffSKsLzrzNd5mmRXdGQNFTh0y2hOAE+fd4O
	I9qudOkD86bODKDFNVTMZiI=
X-Google-Smtp-Source: AGRyM1v/XOcLvn/YOZvKeR4GgDqyzG8bAWUAUx2H4/vrgHli6exwOFqzUpGDvK4ZhP7QI3IhQMp+Sw==
X-Received: by 2002:a05:6000:1567:b0:217:abea:6a67 with SMTP id 7-20020a056000156700b00217abea6a67mr25796898wrz.305.1655755588840;
        Mon, 20 Jun 2022 13:06:28 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
        by smtp.gmail.com with ESMTPSA id a13-20020adffb8d000000b0021a3a87fda9sm12865573wrr.47.2022.06.20.13.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:28 -0700 (PDT)
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
Subject: [PATCH 09/49] mfd: max77650: Remove useless type_invert flag
Date: Mon, 20 Jun 2022 21:06:04 +0100
Message-Id: <20220620200644.1961936-10-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The type_invert flag does nothing when type_in_mask is set,
so get rid of it.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/max77650.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/max77650.c b/drivers/mfd/max77650.c
index 777485a33bc0..3c07fcdd9d07 100644
--- a/drivers/mfd/max77650.c
+++ b/drivers/mfd/max77650.c
@@ -138,7 +138,6 @@ static const struct regmap_irq_chip max77650_irq_chip = {
 	.status_base		= MAX77650_REG_INT_GLBL,
 	.mask_base		= MAX77650_REG_INTM_GLBL,
 	.type_in_mask		= true,
-	.type_invert		= true,
 	.init_ack_masked	= true,
 	.clear_on_unmask	= true,
 };
-- 
2.35.1

