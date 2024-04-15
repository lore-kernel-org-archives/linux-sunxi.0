Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A06156C53
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209709; cv=none; b=u/kXHB2cWvCtGmaLk2DzebbUpdf15WBRoVZW+sEEhsQ3/HlUmd/SpXfZv/Izd726/+RsUcNFYZSTXz7tgqcje01cqipXb/CjVXBA6h9dI1QyYgvVCyqGAX+5ZebYUrMME2wgwRV8LsA5ZSvamXZF5h6aMEmd10vGPkdNh1Kc760=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209709; c=relaxed/simple;
	bh=lxhOF+1XoX0GvbMqRieQPI9daN592yHX/FeyNVCIGVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=txI3kbI1x7Cstl3PJRwRJp5ALLxJr0DLJTJcHNrfTXEabNCXsUyftcGmT+HSN1LEvORZjwWiiSS8zXBdY/CpCeLhtaYY4MMjokRdWdXVZkz8GaJWTAwBx0ppbXi3ShJu+EdnMBXyXdvR/ge4lYbXiHyJZEwrvmUpB8+kp8QfwMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hrXhWgWs; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hrXhWgWs"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61816fc256dso31279277b3.0
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 12:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209705; x=1713814505; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KP0c5kcroy4r+J8V6+b8GPdTtYSSQc0uibLBJF+m54=;
        b=hrXhWgWss/grLu82it9JotjWuSNFZc8QkE/8BJnM8QopBMuVTsLpt0+AliH0PCqv3i
         DkIYJXBOOvxPwvxjUPz4Ns26M66NT38e4IhyU6xvjr5b3nT5RPt1djexlhvnRHLU2vcM
         gI17uVVUBI3X419mH0lNkC7b90uIY8zL6YHoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209705; x=1713814505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KP0c5kcroy4r+J8V6+b8GPdTtYSSQc0uibLBJF+m54=;
        b=KzLCEj9VJDv8UxXI+nWGJfIPJ8JkiGWwfPu0I0diaJkFD+cii7bEVYFQLiUbPuc8Qs
         OTU/Dy6QThvBuEdIjZWSkFADqNqrIunlSKnBMP0lcY2Jf+TwdbVnR1c9jk/vcb3mDJ+t
         BfdpnEFCRkwRfKkO5zUXgDSHadiUdB6gB/6ZmhMpiq31R0HeFna06DYWDIybCVbbD4LU
         49V3Nm3bQfJqfRiUbftRI3fGh1rw5I6md05f6ip0sJ3U+jD8gvl+aR6o4mOqHyhRCEss
         iwSoo1h7X3M5pOVTWr8xN/v3+AJ8JEAb68BvpfqdWUoOR07Xl5qbJueeoHMwMou3fY6i
         7hEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVmAO11y6Lhmj5o00aXbaTGijZ0bTuoaxaSmWfcldXEjveTK2trK5sbRznNrs2Gj0aDdbcd8S0Hu8w0qHY9NdCL2sprreN3iIaUnA=
X-Gm-Message-State: AOJu0YyfOkPjky+A0BesBu+yEviGRPKIe63wxWbHmO6s85kBuFpG/tH9
	nL81sH1vsy1DeIi7Wj1EptQzAwuJEz00FO32cHdUv4Ueb/eZQNnCqzmSNRje5g==
X-Google-Smtp-Source: AGHT+IFGGKloXi4LQc1kB9HoB/VhdVmfNZmSGv5YL+7VwXl3CHp5amZHgBcaP1BDvt5Qqswtqu1lLA==
X-Received: by 2002:a0d:cd01:0:b0:618:875e:2bc1 with SMTP id p1-20020a0dcd01000000b00618875e2bc1mr8807707ywd.21.1713209704967;
        Mon, 15 Apr 2024 12:35:04 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:50 +0000
Subject: [PATCH 33/35] media: ttpci: Refator return path
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-33-477afb23728b@chromium.org>
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

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/pci/ttpci/budget-core.c:280:15-16: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/ttpci/budget-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/media/pci/ttpci/budget-core.c
index 25f44c3eebf3..2d85ae1ef50b 100644
--- a/drivers/media/pci/ttpci/budget-core.c
+++ b/drivers/media/pci/ttpci/budget-core.c
@@ -277,7 +277,10 @@ static int ttpci_budget_debiwrite_nolock(struct budget *budget, u32 config,
 	saa7146_write(saa, MC2, (2 << 16) | 2);
 
 	result = saa7146_wait_for_debi_done(saa, nobusyloop);
-	return result < 0 ? result : 0;
+
+	if (result < 0)
+		return result;
+	return 0;
 }
 
 int ttpci_budget_debiwrite(struct budget *budget, u32 config, int addr,

-- 
2.44.0.683.g7961c838ac-goog

