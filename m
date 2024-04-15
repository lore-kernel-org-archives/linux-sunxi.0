Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F47D15F3FB
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209694; cv=none; b=maw8Z3qFH9c/efJNRks9tD0eyYjG4REpWpCli5Mos17AnzBzxGckjyZCJucWlnVoedJVbYXJRgYBNxENQaev9X87w2YuEo02Ft3xYRShaskMc6fAj+5KjESG74tkslyLo5TuNUY9SjmWA4T5w44tdclqYLco7LjK+U4CVc4y+Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209694; c=relaxed/simple;
	bh=YPNZ8kVmJqYj3aJ9reXbJjAI4Lm1Fxh7hl3qKl9KMYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EONq/TxwdSv6MwMyj1E/MYoxE2AozKN4I2Lbo1+A2hobHkM4PD4BbGpJdHHYSYLAWkLSnq39nbh4d5x7vytsdHgGHVXmMTcqVI58+4HpDwuzk6j9smbiYE7at5nsnz+Y8i62cJTxWC8soP5NcU8bNDFZybaPNRJ0P/ugYViiyP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mPPMEq3q; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mPPMEq3q"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6ea2ac4607aso1923394a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209691; x=1713814491; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xYCSct9boZ0BOkqN2tXVepjBV7/8cHg/+IKo1joAc4=;
        b=mPPMEq3qa46b50fGiLrbATcb+oTLnE6xoiSremZ9TEa4l3egwSBexTZWuDNzHYXFQK
         M4oeEOIx/l1PpfLgk2rkkMyfAxLXdvd7FLEjEJWY7xZIeDLJvcu5RFCdBn47tf/q4TI+
         s5Kusj+f2Y6g60hiUyB7P2jGgZcI03w+19pe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209691; x=1713814491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xYCSct9boZ0BOkqN2tXVepjBV7/8cHg/+IKo1joAc4=;
        b=nFW4eHPp3TTPaIBzkv8H9ltKCQG+dfRUIdDyFs861Wic69GonU6j6YwXuavVofOp97
         NGUQdY2ZrYZIPHJr5iVVzoNnSVJoYCwaiqhAG7bwrxVSb4jDIHqbCJNUrGcdj1E1oGvq
         gKq1nnfmSO6Y1aaYlUfb3t+T+XFUrIIeoZArgGHm1WOZJRaSyQgLY8xFuIzAcGzXsQmo
         v/Z3Q3a6oU1QE3i7ADjJmolYOLGeWW06d1TpumAbayRlQtCCxa0GDXkxj/0HQ2+xmNca
         eAbZLkA7khWirJwb39ra71TWhetwRGr26aOVw8+sWTJv7vYtHUhASLGs/wepoU/a7jaM
         l0gw==
X-Forwarded-Encrypted: i=1; AJvYcCXC51V+nKIRn5cg1u0B/Wv6urY04Bwg0gi0FjOR1pSK7ktD8CxosWFeEAbZ34LnW9H2yVEkyT3Tr7l9nwpNQ8s3UhmlLh2eQFwI9oU=
X-Gm-Message-State: AOJu0YwnnH95BYzESuzIXn6RQYWW5MurHpn6OL2bzkP0pK6ZFkwg1WPt
	WcD3wwosOYrpWtq1nNsg3LaFQbtTgObWgN+mBw+pJcYZTK1gRQRgTqOGQgdrJg==
X-Google-Smtp-Source: AGHT+IH6vSvyyYYzExFejV09di7HyPhtKMxRA7xlKo8y+g1ouireMhE+BqwQkFqVSegum+jG+Rz+Iw==
X-Received: by 2002:a9d:6ac8:0:b0:6eb:75b6:4245 with SMTP id m8-20020a9d6ac8000000b006eb75b64245mr6116943otq.15.1713209691286;
        Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:37 +0000
Subject: [PATCH 20/35] media: tegra-vde: Refactor timeout handling
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-20-477afb23728b@chromium.org>
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

Reorder the branches a bit, so cocci stops complaining about the code.

drivers/media/platform/nvidia/tegra-vde/h264.c:645:20-21: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nvidia/tegra-vde/h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index 204e474d57f7..cfea5572a1b8 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -633,7 +633,9 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 
 	timeout = wait_for_completion_interruptible_timeout(
 			&vde->decode_completion, msecs_to_jiffies(1000));
-	if (timeout == 0) {
+	if (timeout < 0) {
+		ret = timeout;
+	} else if (timeout == 0) {
 		bsev_ptr = tegra_vde_readl(vde, vde->bsev, 0x10);
 		macroblocks_nb = tegra_vde_readl(vde, vde->sxe, 0xC8) & 0x1FFF;
 		read_bytes = bsev_ptr ? bsev_ptr - vde->bitstream_data_addr : 0;
@@ -642,8 +644,6 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 			read_bytes, macroblocks_nb);
 
 		ret = -EIO;
-	} else if (timeout < 0) {
-		ret = timeout;
 	} else {
 		ret = 0;
 	}

-- 
2.44.0.683.g7961c838ac-goog

