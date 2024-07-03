Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4A3172BCD
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 09:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000241; cv=none; b=iCefOQSZtfDsOVZ+mIyJh76Jy67IO3owqFpn0YW1XVkL0GqYIdGz3uCL6PhXSokb1b07bxbvsOKR/chTyCH+SaKP9PLdlxwbxqeqz99n9V/Kcb+0ujhGwPCogVuvplJR+n4Yc/Ote8POnl0s3tioI22v14B7nzB09zF+Zw3SLsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000241; c=relaxed/simple;
	bh=r9UG0iaRfl1edz0iDrKl1TCA7udEuIQIOzcFOl/X/K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aM8mkW+tNS0/d7bWbK8refrmXnfELKJqIVKzApqEXKiHdhMaoEviyi0H0iZ6Lq1k9Blg3uhqd7pXUDkIsaqaLhny1/TIPuv8kyBxEhZH+gA46yJCf0X66h0SUQEHeWfa8p5sBhAgecXPXJfjf/HriiPeRg5DT6cxmkEjG2Dk8VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSUB+GLZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSUB+GLZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-58b447c5112so2179312a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000238; x=1720605038; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLgsGqmc7BPqHMYWncG3lDrLlsc7ZfRJcAq4ykKg8iQ=;
        b=XSUB+GLZx0/+stl86Y+ATpJJfIU+O7xXPG9xletSlTNrCpnMl2ldUDGE7TmCZ8BNUU
         O/uMQ0+QRJYbfItVzirtT+P///gQszmOtDmxMWHV3XpHoXdubbkbYXFLqLT/pE4r8aW7
         p1CkViI3PVOlvV23DVI0mihx3FRxGKK9/ejNT9k9DpULou7/Gdv2s5utk56J/4ydra2r
         bAqKXxA38FuJ4NQ4RcWm9fK95fgTtnerswhiysmdh8jhKPh63MGYr0t8NWb0bgyd7AK9
         0WNagGfcCbsAY4vFrvJ73Ns+VDu9D30bQvTOITJ1tRtUleq2LlFDffiGzljEIKdBSGz7
         H8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000238; x=1720605038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLgsGqmc7BPqHMYWncG3lDrLlsc7ZfRJcAq4ykKg8iQ=;
        b=dA8fcFRA2RfQpKMt1oMoeMqRek8ToqacImMvEi2by62giPLjaoh7sHDm2EujSVRCSf
         D1fimTo7EEksfzHc8PRNWgQtFoUi/ZYgRva71bOTx1dcE64/PvmmBOVPEubjQWo1OoHW
         zdU6MxhTCI4fPxsY5I9I8RRm/LsRotp6UWKZPx0DzjMnxa1GVBqMgjU5QJS0/v+iDISK
         2bLNu9x1YS2a7lxO/0IEsxnA+tPuDTmiyKy+NxCA/dQPQQmCRHlSXbOFGyzDrLZu+bnp
         nfTnLDjedsudm0lOlvfID55qlt8L9BJjafTOYZ+vpvfDjR6G7Ht8Uc23wtAwsV3NF7T/
         5WzA==
X-Forwarded-Encrypted: i=1; AJvYcCU8UKGsnfqvn1VuR5Jh0JbOPcxx1FmCkmyNVUU1MvfxwCsiTX3kWcWkK7ITSekl2UcfhpoXBWH15LZgHh2ZZRUFCvBeh8rCCinv7qw=
X-Gm-Message-State: AOJu0YzSxK6Nm4Vu4GccHX61rFFfmJHhtOvwhJw+by4DdlldVIk3AKH5
	CiLov+2GS0xgzil6CXOOIldsES7+/JosXY+mRyA2wgnaOItyrNk5
X-Google-Smtp-Source: AGHT+IHDBJT3Q4Laj/q87YJoetkDqI5ofUOXbXiuW/rDGosGYXbLBVOAupqJHnTVnz6rBOrgARQkAQ==
X-Received: by 2002:a05:6402:27ce:b0:572:4fc3:3a28 with SMTP id 4fb4d7f45d1cf-5879f982ffamr8309648a12.23.1720000238458;
        Wed, 03 Jul 2024 02:50:38 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:37 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:21 +0200
Subject: [PATCH 08/10] clk: qcom: lpasscc-sc8280xp: Constify struct
 regmap_config
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-8-7d15a0671d6f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=1251;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=r9UG0iaRfl1edz0iDrKl1TCA7udEuIQIOzcFOl/X/K4=;
 b=B7jdNvHm/5Mt3ktcfDeM9c8KninOBlgFk8K0PVOq+LB2WsKsc0vbO7U/7APUKe4yiJSNoyh1i
 HlwYoMOYWxNBOUay+b6kvtC6NNAQ4xpzKMHyksGClZZg3Nd+T/kDVWb
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`lpass_audiocc_sc8280xp_regmap_config` and `lpasscc_sc8280x_regmap_config`
are not modified and can be declared as const to move their data to a
read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/qcom/lpasscc-sc8280xp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/lpasscc-sc8280xp.c b/drivers/clk/qcom/lpasscc-sc8280xp.c
index 3693e47d548e..9fd9498d7dc8 100644
--- a/drivers/clk/qcom/lpasscc-sc8280xp.c
+++ b/drivers/clk/qcom/lpasscc-sc8280xp.c
@@ -23,7 +23,7 @@ static const struct qcom_reset_map lpass_audiocc_sc8280xp_resets[] = {
 	[LPASS_AUDIO_SWR_WSA2_CGCR] =  { 0xd8, 1 },
 };
 
-static struct regmap_config lpass_audiocc_sc8280xp_regmap_config = {
+static const struct regmap_config lpass_audiocc_sc8280xp_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -41,7 +41,7 @@ static const struct qcom_reset_map lpasscc_sc8280xp_resets[] = {
 	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xc010, 1 },
 };
 
-static struct regmap_config lpasscc_sc8280xp_regmap_config = {
+static const struct regmap_config lpasscc_sc8280xp_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,

-- 
2.40.1

