Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C1915A4BE
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 19:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209678; cv=none; b=h8qB87XuGLrPBQXiBNAYKoSny9ZklkjNwuciQhV3Ou3riY2OPgZLoFpiRnMlL579yMIxKAs/k/t/HsJv7bIwvuS0K0vxGlUraa1/pl243r2JBEzXHU3KatJr6dmWXDaeEnGhsuN4WE6l6uU0+Z6Jz5B8bDcq++MSFp0OjDHeCL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209678; c=relaxed/simple;
	bh=Vt+H5ZpqsJCiF9cU1Vjk0O2CGGQ8VmqV+GtNWpgDBmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TT1kJ8/FQUsVn/TEHAoaTKYWNdXZqds0VH8oKHW24H6jUdwWfV739eTuEIl/ZL+YXyuAnh/ii4Fpy1LUM2KCPWJE27bJYCp5yiEdeTCDsbpgtoeY/OQfUMrbPV8AdjdbUirBtlmyuIE1tY1prRy0fOJ+rjRCQRLP0YwY0I5jpqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cRDbWDTb; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cRDbWDTb"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-78ec78c4fceso238100485a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 12:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209675; x=1713814475; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISUo+c+Z6d9jp43vDna7WArpy0Bh/pUYqJP92YgrR0w=;
        b=cRDbWDTb1T7luV83vGJpQ0sx4mx48FpBd2A16fNZmORgb5IdQ54vtc6K5SmyWqDSiY
         g+O2o/5/ttcd17hMnqo6NpHiu16msdPkzcwuCv3iSkXIy5euQNhr34ZYPoTGZ51gLrGi
         2qjd5y1hcV+6rn5klQrF21vaK4kxenrnBwOr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209675; x=1713814475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISUo+c+Z6d9jp43vDna7WArpy0Bh/pUYqJP92YgrR0w=;
        b=bxxdx2mlP2FdNGeZBPuy+qOPsVnFsjl3NjR7GCvnBWeQd3wY7OWt6qaX9oFJ5V/2dJ
         ykmDn6pGjyoOiPn3xkAXhSFEw247w925bp+mFYUhiz8BvQ5WXIp4m4w3H2OW44L6xZV1
         v/s7uabcr0GdyulVDg26rL85LXvKnR7R8dtzUTynEu5L1uaOWYBTSt48GjyD6wVwtUs3
         MHyiMSexZ1vE83RQbb0pLtqiBnKdydyNSc8QKIpFNTUP9IApkwD8rsxhOWHsCtIgGH5O
         8HAdR9+hRO+gxXeFL9ohSN/vzf4Ct51l9AUaSFb9HBo12WdV0FQ4U3B4hyD8wIB9aXda
         wevw==
X-Forwarded-Encrypted: i=1; AJvYcCV98UphELz1bOYQ5blHU80a6krOBJMCxgVPweHkSisseR9sv2qEM1JNlxuQS7os39/A7tLDuYVsw2RFLRYjGLkW67XZPLrntzlz6a4=
X-Gm-Message-State: AOJu0YzUbMTIZLym+0CPg9qTozo0BEVRSlrh6kulZlu94P9y8ok8ys0M
	GT+Sxovx65DdzM0jA3Xi5K5cMSVrB/rYImplvCVLrAXZp/hiMNnH6Hywr3hZjw==
X-Google-Smtp-Source: AGHT+IHNEVyzd3evramKoXF4voaYnhuPvr7ES/TUx15oMijuB+fT7oxPAB5JZ66ego178FVyftQu6Q==
X-Received: by 2002:a05:620a:470f:b0:78d:3b55:21c8 with SMTP id bs15-20020a05620a470f00b0078d3b5521c8mr1321999qkb.24.1713209675268;
        Mon, 15 Apr 2024 12:34:35 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:25 +0000
Subject: [PATCH 08/35] media: dvb-frontends: tda18271c2dd: Remove casting
 during div
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-8-477afb23728b@chromium.org>
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

do_div() divides 64 bits by 32. We were adding a casting to the divider
to 64 bits, for a number that fits perfectly in 32 bits. Remove it.

Found by cocci:
drivers/media/dvb-frontends/tda18271c2dd.c:355:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
drivers/media/dvb-frontends/tda18271c2dd.c:331:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda18271c2dd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda18271c2dd.c b/drivers/media/dvb-frontends/tda18271c2dd.c
index a34834487943..fd928787207e 100644
--- a/drivers/media/dvb-frontends/tda18271c2dd.c
+++ b/drivers/media/dvb-frontends/tda18271c2dd.c
@@ -328,7 +328,7 @@ static int CalcMainPLL(struct tda_state *state, u32 freq)
 
 	OscFreq = (u64) freq * (u64) Div;
 	OscFreq *= (u64) 16384;
-	do_div(OscFreq, (u64)16000000);
+	do_div(OscFreq, 16000000);
 	MainDiv = OscFreq;
 
 	state->m_Regs[MPD] = PostDiv & 0x77;
@@ -352,7 +352,7 @@ static int CalcCalPLL(struct tda_state *state, u32 freq)
 	OscFreq = (u64)freq * (u64)Div;
 	/* CalDiv = u32( OscFreq * 16384 / 16000000 ); */
 	OscFreq *= (u64)16384;
-	do_div(OscFreq, (u64)16000000);
+	do_div(OscFreq, 16000000);
 	CalDiv = OscFreq;
 
 	state->m_Regs[CPD] = PostDiv;

-- 
2.44.0.683.g7961c838ac-goog

