Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D94156899
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 19:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209671; cv=none; b=PRFCYv0vPaSVgqyXomupEeTHsM/zI/y+SjxqQbp/Euw7IgdB1QYlWffQKvkUshm+jCR4SH/pUohg2gAS+dlv0Lx3V+3dHVbq1a+0cW7g4urjQ2mlgSHRVyaYl/2DiO1ZVQ+pica7mSdFxJKhI62xvTeWFp6PcJQkAQWopuBU2B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209671; c=relaxed/simple;
	bh=nJaDXaC2UVv5JFYI9MrsyQjDUNAmDoZ6Ny+NoEoYLTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdjfBODWPOyGMiYl5tG5n4BcXtpu5+gxyi9YWQUvq3Fc+tlpj0eyZ3HVDJZtZYt0NiVD+JxeVqMiqTnNb0tVAexy1cdRJnOJQ0XUW3TIDDlmCAaKZCdKPAEum/d6hnwbV+Cs/Id/c8L8ZClyCa5Wi6FJcgE6YFN1WYq08BatyXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mRH8lGik; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mRH8lGik"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c70ef25e19so576049b6e.3
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 12:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209668; x=1713814468; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+qS5Z4vkKN1UceEhIkP1myjPLSe7r+1w4SAg1mZwEM=;
        b=mRH8lGikvp6Ez7Lh66bmFP9fUjfX/fQno+N00Whg/uEunzyLcvvAFbXoSrwBE/Tc1M
         TlWQLiMLMaqfajJKuHeU2rEICxJvP9yqcnXF2J85y/HA40fFpG4mSjm4lgOx+qAg+8aj
         nZjAcagkJQTPoQgd0QujeKSJVTKE5cxPRyEIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209668; x=1713814468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+qS5Z4vkKN1UceEhIkP1myjPLSe7r+1w4SAg1mZwEM=;
        b=ZkyEEJPNy+EGlaxghFpkpPUVhxwlbPiAXA+JSBXePUWqQs/g5Al1xoIADoAIXTfgU7
         +UI6tqJKCXmqFYTGxIpslG2t9wDxm6ajEKTFWhlx+D0ppj1+X9CPperumcJHWx5NbgD+
         7wGqwuEHJhUHkVmLhuHWYB+iUycOzc6z+StOh7fjUHDee6jQYETKvdhTLtzpEhFc6zQJ
         hhOnmovrOpjOZ9ZpKCBjLGONweFNcuysbX/vKrpHFA6oi2PufHP6JjXgffUMQjXkxr0R
         kmU+nRPv/60Xzbv0TRzUYuDUU/6+h3JyLdVje8CueVr0y+/X+vuRAx4XE+fiHT/nfkEj
         oIRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoxqYXH5PccjkyB1Sl0XdoG0L4WFn0Nek8AQGQcEvoqbE2ok4nd/SGIo772Jf3aaVpnrwbBEvQqTqTxxYKqJGS7RWA7jrhbCSwF3Q=
X-Gm-Message-State: AOJu0YyWXLBgKtJ68UeR+PM7Cm5z0EB5Ssua3HmK3/z7VG9XyPuWkuTQ
	URlNlb5SGIY8tJ2AeFRM4XWJOkhvYG0fDZau4tZPHIQxG88Xo4JA+UejF6/ySQ==
X-Google-Smtp-Source: AGHT+IGdtkSiZhnfiSTfKFrIX7aC7mQfEfNuaLQ9aOCusHbpbm/GtxuTWZQaZZkHNYhX7JRsmp7ZXg==
X-Received: by 2002:a05:6808:4084:b0:3c5:f5a0:3b40 with SMTP id db4-20020a056808408400b003c5f5a03b40mr11232302oib.58.1713209668180;
        Mon, 15 Apr 2024 12:34:28 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:18 +0000
Subject: [PATCH 01/35] media: pci: mgb4: Refactor struct resources
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-1-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The struct resource end field is inclusive not exclusive, this is, the
size is (end - start) +1.

Update the definitions and use the generic resource_size() function.

Fixes cocci check:
drivers/media/pci/mgb4/mgb4_regs.c:13:22-25: WARNING: Suspicious code. resource_size is maybe missing with res

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/mgb4/mgb4_core.c | 4 ++--
 drivers/media/pci/mgb4/mgb4_regs.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index 9bcf10a77fd3..60498a5abebf 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -493,13 +493,13 @@ static int mgb4_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct mgb4_dev *mgbdev;
 	struct resource video = {
 		.start	= 0x0,
-		.end	= 0x100,
+		.end	= 0xff,
 		.flags	= IORESOURCE_MEM,
 		.name	= "mgb4-video",
 	};
 	struct resource cmt = {
 		.start	= 0x1000,
-		.end	= 0x1800,
+		.end	= 0x17ff,
 		.flags	= IORESOURCE_MEM,
 		.name	= "mgb4-cmt",
 	};
diff --git a/drivers/media/pci/mgb4/mgb4_regs.c b/drivers/media/pci/mgb4/mgb4_regs.c
index 53d4e4503a74..31befd722d72 100644
--- a/drivers/media/pci/mgb4/mgb4_regs.c
+++ b/drivers/media/pci/mgb4/mgb4_regs.c
@@ -10,7 +10,7 @@
 int mgb4_regs_map(struct resource *res, struct mgb4_regs *regs)
 {
 	regs->mapbase = res->start;
-	regs->mapsize = res->end - res->start;
+	regs->mapsize = resource_size(res);
 
 	if (!request_mem_region(regs->mapbase, regs->mapsize, res->name))
 		return -EINVAL;

-- 
2.44.0.683.g7961c838ac-goog

