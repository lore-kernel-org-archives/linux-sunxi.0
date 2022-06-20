Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C6D3D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id k22so9641978wrd.6
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dbyvlkbY4sJOjh3UQdGyOPNGXQQ/y7Irc+C1CWkw+ak=;
        b=O31tT53sO/Sz1zUUmz4+b7clogfECSiQb9wF145zFCWeos95kyFGhyMNr0ihPdqpqx
         bJc50KM0wIrtRqZCqzGADVF4M3k1QjGTHVo1VYjGwT74JLbT3B4kvTSheNe818VtY8DZ
         HDqJJzSXulU9aA8Q7p64IRscmVk+LyazVQczqtnvFpnAbVUfczXyJXpSX6rv84tpA2ID
         Fp6mzmh7R3C0ofGj++M07N5Nk1RQvkOi9t24WmMCnaJkp1Xa/s9Jij2cEafhCNNYBn56
         seJUbVNIALw9YCjjSnuje4l/jDR/w2Hi2qVNJRlUiL9Bqsun5VReJR/qIIMDhEg6iASO
         mm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dbyvlkbY4sJOjh3UQdGyOPNGXQQ/y7Irc+C1CWkw+ak=;
        b=zK3rH7gZZWkGR9+o4Xa/e0ugFk9fjCUhsWmFWQH2wGek+XN+cRND8HjR/V6snVxVXj
         xb93OnEqyg8V8Uz9OpSJg6fFlP+HBOeyjW2+klW4pTFJyg/xDmkwmurkDAEj5bC+RPJH
         yHewqH949If1kTPTKiby9MEshHrX4JtbexdweTQ+a2Doj3m8rwyiOdPqTEJ+I9BZmssU
         fmkufnDB23mkkmiBfq1mxRtR+9v2AH9q6jjK9xoawkJDZ4M3TT74wYEIqt1QJ4BgZ3uH
         Cl4nVURpCgnKFpLK8jPZHg38rXMmP3b4Rlta/G4w2kUkaQbG+tjaC/tWXxgYqAyeP7bp
         YWRQ==
X-Gm-Message-State: AJIora92EMdpcuSOu/I3AEPEniKyU+mCCsAOYtXF+59mZvLUG4z0ke/y
	qK3XUN/kAwVfhncnMPZ6NOM=
X-Google-Smtp-Source: AGRyM1txLq4Tx5IKJyl2yL+hQwHqEppU3pzgOBeDxgV9FsOmPyXZOlr03TOSB7o38hDoIT4MKowqhA==
X-Received: by 2002:a5d:588d:0:b0:218:4d0e:b89 with SMTP id n13-20020a5d588d000000b002184d0e0b89mr24292034wrf.58.1655755634413;
        Mon, 20 Jun 2022 13:07:14 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id n68-20020a1c2747000000b0039c5a765388sm15705645wmn.28.2022.06.20.13.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:14 -0700 (PDT)
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
Subject: [PATCH 37/49] extcon: rt8973a: drop useless mask_invert flag on irqchip
Date: Mon, 20 Jun 2022 21:06:32 +0100
Message-Id: <20220620200644.1961936-38-aidanmacdonald.0x0@gmail.com>
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
 drivers/extcon/extcon-rt8973a.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/extcon/extcon-rt8973a.c b/drivers/extcon/extcon-rt8973a.c
index 40c07f4d656e..02ba770acb27 100644
--- a/drivers/extcon/extcon-rt8973a.c
+++ b/drivers/extcon/extcon-rt8973a.c
@@ -192,7 +192,6 @@ static const struct regmap_irq_chip rt8973a_muic_irq_chip = {
 	.name			= "rt8973a",
 	.status_base		= RT8973A_REG_INT1,
 	.mask_base		= RT8973A_REG_INTM1,
-	.mask_invert		= false,
 	.num_regs		= 2,
 	.irqs			= rt8973a_irqs,
 	.num_irqs		= ARRAY_SIZE(rt8973a_irqs),
-- 
2.35.1

