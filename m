Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2250143C5C
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000234; cv=none; b=kSfYah7Baj0Mr9Q0byK3hAN0FwUTyHDWFqXu1aSDNmnr1NVhxeUhEbTHfXnbjGFYnP+HyCwVFr63mVE1z66cYRFAUO6qqgdVpRC4o51za7af9gJFt7Q6moe39OlzhzBXA5pTx6onmaxzmjqL/vsmKqyUt/dCqGEp5pAzRZFuCjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000234; c=relaxed/simple;
	bh=TxADEvEEBX/TothZVxPgAJ7RkXfQpn93WbFswKz2wf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=emy1/Pu/tHynZwQRqSMOTjqeZnxPAo8tP+6264O4axoaEJxDSUhDKcKTPBQtLRu4Ptg/COkS4Q+5gp+vnEPMMrbLhuM3w0N7utDc6zQC6M2UMOk6c6IIMacbDFy33DsR+E3QkN4z9tQwqn/nZRPQ1rKspzLuYkzxrnaBkPgLxdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L85bk4eq; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L85bk4eq"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-58bac81f40bso2226612a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 02:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000231; x=1720605031; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvMEinijEwgsKZDsBmGm/iKxTFLThMpGobnSIWlzUFc=;
        b=L85bk4eqpsLJ39g84Yu7gG8XjMCvS+oWGJOZ5nMRfHWQOBF2EafdqRbaCr67iabpex
         I0HqznKitJjSDIkQN4DYFcT3OiMtGRNnki6aaxvogW2/ENxi96YzKXGt/9tfs8ClUA6q
         iqcUdCgAZuPeZg4xqc1DMVeZQZyvjWIco5CBQ0BvF7iqRqxbuRTB+d+seRWPCLlYQjBp
         xfhSpBO8ZIFjA1EljFGnWWRDGcRWYoboc8A5o/ej6BSpWqt1JBpjK6oAP1GLzsBtg3U8
         Xh8XP4z+UnBf8HtV+pWY10w71m6NPsTwcFUX/Xeh2tl3XP0x3ffY/SliD1B35snzv0Gl
         eJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000231; x=1720605031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvMEinijEwgsKZDsBmGm/iKxTFLThMpGobnSIWlzUFc=;
        b=vb+kvYfS6EsJ2t4X5dWjio6llsDKvbWVgvdczy9ZmCE3raghB2GdpN6zcvWwYQkOfg
         OUYLnqZRVoI0+HwTL5/4vbuKa/uDSfiSXyq/JtUuC5ViyQI71O8yCZSYXOHiWy8kpnpQ
         jgqrevk2+puU4qPy5qIjehQvOHSDrl+6Wc60F5BSxASi6zHJnTtB2iVIKuvfXcCM3CGk
         Lmo8P+C0jsodP69uIRZUeb1yGvLcH027A1b2Jsed8/UMrgVWabseS9o7+gX5uxrbiqFk
         yA8UyiErruyWaO5MgcfFEO8CzEQ8+RTe5dlWx55aT3rLHKGUQqvLe6XARw+VOEP9sFZt
         fbDg==
X-Forwarded-Encrypted: i=1; AJvYcCWo9PMwPbyGObPA62o7YH2JUTzc74UlwOPNDXAdqiXGODXLX4uCZ+OU7OBUxSlogNhEQbfJEfBzNYCj6G9+0zkMAV9mbkYWhQ/Yd6g=
X-Gm-Message-State: AOJu0YzOh7cKr5XaDsW8phpCkRbFoF0sqBG52Y7GvYrzsAwf8YZHDO4r
	uTSBS4Wz21R3fblYGEBRzZSKRCLWP2ef0dqQRKb46400g+bLLGSo
X-Google-Smtp-Source: AGHT+IHqO0NeW0hYgOS++CrB+maws1bAp/Jb+zrdkccIaJUBHpnIHgiVuw0F79kfyt8XXwzzdBrjHg==
X-Received: by 2002:a05:6402:90e:b0:57c:abf9:e6ab with SMTP id 4fb4d7f45d1cf-587a0bfc706mr8446988a12.31.1720000231004;
        Wed, 03 Jul 2024 02:50:31 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:30 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:16 +0200
Subject: [PATCH 03/10] clk: meson: c3: peripherals: Constify struct
 regmap_config
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-3-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=790;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=TxADEvEEBX/TothZVxPgAJ7RkXfQpn93WbFswKz2wf8=;
 b=ZRDeYsd4qQkFOSJF/zfGi7N72RpeUf69oTYxSsNrKIIUNBXaLyo9mTarnDmlHNHfjp8M5XoMO
 P5IZN9S7rqXB/deiDxd3FbCvxgerParLlTFa3YYJek2EV5ur4YeuUNQ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`clkc_regmap_config` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/c3-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index 56b33d23c317..cfa573262bf1 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -2296,7 +2296,7 @@ static struct clk_regmap *const c3_periphs_clk_regmaps[] = {
 	&vapb,
 };
 
-static struct regmap_config clkc_regmap_config = {
+static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.40.1

