Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0767E81726
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403088; cv=none; b=u4DtuRdWmtvy7SAKXuc/YPlBg/vAg4ylfiotwSf1xr4BxQP5JRRDHfZK5g1bo7mZwdJj0zXne8N/O0d5XfM70+rgPkruqeVP0u9yR1AYPd1dPw1Z/9eWn9EWn3ZX80bIUhfgmugxrbNH1KCl/XuY4Hl5R5MxmwHeNgFfYm6/r2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403088; c=relaxed/simple;
	bh=eXbttcpUuvi0IptVhr7LEXzauMF/5khZjI9wxngZz54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sawmlYmovT1h/dQRfm3cdmVx9XlgWP8XOLk1PT2oHy6NGXecs6znheXmuTsZv3sMtZ1hZjktCM+NYTSfyn2j1xmV8e0GWu3EfdKPatCqc8GEeAAhQzeIZw5/vPONqxLA3iAQrzH/NMkFzYSD1yvuOdm51bBTJldm1iTNOhTYW0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P6wkXP+E; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P6wkXP+E"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-790f699eb2cso103501785a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403084; x=1715007884; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX0Nt2WjhKwJC/tEnFmYRvlB1MfFk2LmbDG81TIdFVM=;
        b=P6wkXP+EvV39251RlvJ05QTicv0c9cKRlBgx3kwpt0w+11e/GuXM/TnNNFkz2+HpCQ
         IKoeTQxp5gLeYsX+J1ciJlnYCYDJfSrYl3pOHxt38cQT9dPXYdOGiRR4qYdViYzqZ8Nw
         m8HrMk2xu7mBF2HpvPtSgiLpmAmon9BYGiqHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403084; x=1715007884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX0Nt2WjhKwJC/tEnFmYRvlB1MfFk2LmbDG81TIdFVM=;
        b=vkiGgLeO9Agp4h99bt1eKMRedpvDv60bBSNpWJUHPGIVEXeAPxTcxWBdRu1OEpVuIF
         7Bghp/i7ofy2dYr7Pp8C4xswc4aPF83kcC3w+6ylivF26LESdxSNP1k9N2FMNSxJuwGi
         xdihorGkxidsUqeh24EJRPn1HcKSVPFqWmnEuYWJWneEvLGOdQBSsZACu0jDgrdHgH5d
         vXPDpWQLuZv1Lp0IxxZmS1OQDxvpUCy/yQKZf614n6geVXwPZDsG5/vi/1EaMtf7pB2L
         M7wUHmAFqoPbcwokgqvodWiqIReHsvxc1P2n3aUWDquJjoZVdAdezxJVthAw3vrYmIEu
         I3AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm4wgMPv03S5Y6SJIDaJyweH1XZ9ZDcCSpbLgbQV3QxFJynoBFkXAXSOkbifK+qTM9TJvE9J3G6ZcqwwanjDEqWLSwXYZ9HF/mHj0=
X-Gm-Message-State: AOJu0YxN0dJ8nvwsnuBgepTd2aKe+fGE7dM5R1WMeTy3nr1wMYtJIHlT
	rBCoHB6z1VHkmfxwUUURIIqIC5nr1tE1inBG8jk95TKfUaj+5nRDeVJU9QY94w==
X-Google-Smtp-Source: AGHT+IHWuK1oddmDBavr6+ksLu5/g3HWffeblwIQsTBH58X6jA8tyFIvmLIj97Bf7YP3AKSemxlfBQ==
X-Received: by 2002:a05:620a:4eb:b0:790:8e96:7841 with SMTP id b11-20020a05620a04eb00b007908e967841mr10130143qkh.60.1714403083799;
        Mon, 29 Apr 2024 08:04:43 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:40 +0000
Subject: [PATCH v3 01/26] media: pci: mgb4: Refactor struct resources
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240429-fix-cocci-v3-1-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

The struct resource end field signifies the end address not the
relative offset from the start field i.e size == (end - start) + 1.

Amend the .end field to specify the end address not the relative size
from the offset as is currently given.

Fixes cocci check:
drivers/media/pci/mgb4/mgb4_regs.c:13:22-25: WARNING: Suspicious code. resource_size is maybe missing with res

Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
2.44.0.769.g3c40516874-goog

