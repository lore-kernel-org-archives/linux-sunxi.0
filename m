Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A9B1649CD
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 19:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209706; cv=none; b=HsCMcV94AkPNy2e7Ffwqa9aPscBJTJ8Zm5fL6MtX0oT6CH8tmkwBaPUxKtZhis+VMceCEIOc61mCXFvHaHDA9ukyZG+Rq/rj6EjHy3mGwcRF0vYC+ct/DBPHSwZrEJqKhp9TBiD6SsmptQ097nsUtWGlEa/9J1T9IRIGsMWQvu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209706; c=relaxed/simple;
	bh=XZhwvXRbcWKSHFSPcZ7MTtPfoRGwp5KRtZGpZNte2nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MI2LTLLZyUdoMK3EsmJeKvHg1addtw0dEuVwLT3cvFRBe707wx2Uy9UZjbBC3to261nJO/9N1eqCgmAD7i0iO49BtxA/oqZt79XrUYzMcoow26IrwHJgRVURgviCzDWaGpv1GrqAU95xv9d5kjD09s2cctlp6qWjWCJHXfzOlgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k6ADr6TE; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k6ADr6TE"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-61587aa956eso34881627b3.1
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 12:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209702; x=1713814502; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jt2XKVmYwRsbqiFBuUwX1RfD+QA2xOHKpcd2HjFMj/E=;
        b=k6ADr6TEnxNXCW00Xp5GPt5u0ZvMiZYp0f9/H8FMkX56w1URd43IVU5h9JVABm7c8F
         Vsk+NL6Vk2+Mqix+sAgH7ircI4aEBHyeceiC9qfBnnUNGIC08HgsYN+2tyfPnbu2t0iD
         pYH4VYWefX/VwPEZiNmYm30iOXc/HAAArXoCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209702; x=1713814502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jt2XKVmYwRsbqiFBuUwX1RfD+QA2xOHKpcd2HjFMj/E=;
        b=rLblh2iXar+t3ublksUpTn0f2f2Ijpjudv2kq+macMnQxL2oUgkXIPg+T6hs818SvC
         AFdLO7SUwhGXAmIeLa9kh5wPYrC6Rto9OWfkqP/UhgqCZ3Eu8/W9oZOMGsJKC+GISZdu
         X+FchZfAjbDSQvFJW9bA9rKCnf0oITzcTsh1IvW0AiuslyHDMyZGAMl+hWzL5kkPZGcY
         w1AJuTuwRFqPoXVFwNWtN4bVwGN7eRIn81CY/7IFX7/ecKjhC9sTLTKvUTnU7AZAe7mJ
         q9ZJFAstPGsxZg0AAsTcQOprgTTqx2cT2D9eRaC5s0ud2l/ytieX0THoV/hex7SPp4WN
         ZxRw==
X-Forwarded-Encrypted: i=1; AJvYcCXMOQEOD1BTKlWHD2a/vL5SskGWMnGTI+L9gJTNKLbrHquv4aRUr0sG4uLk9QW1Ao6YQ2Sl2yORI01tYI1/5iuFkJMuGGioMsrN87k=
X-Gm-Message-State: AOJu0YxBVRDi2YjyqKYqXuGNa4MKvTrsGmblWNhoK2fHaDv+JNG5gA7K
	UmuDn1RL0mTIY7l46ZYoseJA9Bgh5tbs+WKAX+Er3VlfUIhM99+NQF4bzVdKCw==
X-Google-Smtp-Source: AGHT+IEHr8lEllDyip6pAkUMGURPdINr08Mt5MZfIhMi3nIR8h+wyIaxQ16q8BBaKyR8INXB42ugWw==
X-Received: by 2002:a0d:e292:0:b0:615:2078:9c0b with SMTP id l140-20020a0de292000000b0061520789c0bmr10298321ywe.40.1713209701695;
        Mon, 15 Apr 2024 12:35:01 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:35:01 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:47 +0000
Subject: [PATCH 30/35] media: i2c: et8ek8: Refator return path
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-30-477afb23728b@chromium.org>
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

drivers/media/i2c/et8ek8/et8ek8_driver.c:255:13-14: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index e932d25ca7b3..c7984f90ae4d 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -252,7 +252,9 @@ static int et8ek8_i2c_buffered_write_regs(struct i2c_client *client,
 
 	rval = i2c_transfer(client->adapter, msg, wcnt);
 
-	return rval < 0 ? rval : 0;
+	if (rval < 0)
+		return rval;
+	return 0;
 }
 
 /*

-- 
2.44.0.683.g7961c838ac-goog

