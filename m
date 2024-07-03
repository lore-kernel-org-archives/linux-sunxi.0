Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCFD16F85D
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 09:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000238; cv=none; b=FYKKrMPqbG8l6l62FKGHPCUTvaymlEigGKGuz+rzcLLJdL+lyUamOdDtyi2TmD2GHBsDu9t1Ev6Bx9cGEf78DmThyhT4D5JrZ4PXVnTwRN0HCKwiZ3cRil7KfCwZlI/DxB8JO9HwINqXnLvNw0qa54J8dsDIXIzoCfY2J2kZIzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000238; c=relaxed/simple;
	bh=QjI2XZ6DpFgtcs0s52itimxDAtU+za0z6ETKz2I5xKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BdyKJ0IzWPBDw77g1rrxfW8MTusBs34bkuwc19PItqtrbp9yN/kixoTsglKfVe+H8ZDRa2C0O4xv5zFQFho6MU5LVkLBVgAG2Q32nVLo/R4GJ2z+aiW8sDhgoLH0UBQXHv1UaQQLehrBVp+sqDhusTIm07Z9azPrvItNLYt1010=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+NPJz14; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+NPJz14"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-58be2b8b6b2so1988616a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 02:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000235; x=1720605035; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5sGY1MHMh4vP9RTlfTXcp30OvUGJ6Up0VGY07imbb4=;
        b=l+NPJz14doCrJWto+cSa/dhiH8T1BxBgW5rWoQS/0aYarfFVaof+/WjwgJUEJlNZvZ
         LbV3FujZUvNqKpGQ+1xEqwndCOz3fDWaCj94onf73i6gBvyCld28m4NzN6o7/zvZlPNJ
         oGlBzrAl302tX+KZsM/YJ8Gf5AuDQpqlOFChgxpm4Wiz0lZzX33PQN1Nx3oJLU1y0Rw3
         jHUm1E3BJvOrFbXBlBcARPP7esSCgNbmaezf+7ChIBx/VpTiMYTM6dMAwpkR96gZTYyr
         ubSGnl8zpQAJtoF0oYaghQHNjk6MhJjxn2oreiALI41mqjwa3oscrGK59ke/Rchx5kTr
         Wl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000235; x=1720605035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5sGY1MHMh4vP9RTlfTXcp30OvUGJ6Up0VGY07imbb4=;
        b=rrk2eIA1hXPPm425nUCQ8QKeI+vxb1/CkEikJ4rKK8TuIE27VUq65lKXMmUoATR55B
         /KcUHHAHS26LU1INVUs7vwc91ta0Qerxx6YShYcpUk30xI0iWvR7kaKOcDpONyMJfHBA
         5PcGBgYumihXZzV4fcTeTLdr43p0n8dea4HPhqQnMB8RrCxcAuaJ7W2AeggPDcQsZeaz
         E63cfRtQWWVggPijX0NJdZPZXNzQDOlP9N0+/jWC2us4ZIxZ8sxgmE0xS9GKaLdbHoIY
         7hM8oFdsEubP0L+GFAt/+notdljLnh+myRHuVOqeI3hEGOBZch1X46MFsvziPLc2iq6g
         bLJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvyX0iH2k9KiTbA89wh9oOqrXGWbejGB0xqcpuE4+oPhmkR4Ae+vgHV57I9G3KIGbPcMm22UYrZ6WZ5YwZ3egS2d2LSoBtP7U4jE8=
X-Gm-Message-State: AOJu0YzK5bztTsY+FxPPnvMkfqpx7987rEJOBXt/IiRTS+03wHKy1Sov
	eAGrZGkN3esN6NuFFjE67vRGqGueJa3OU2rUbmj95O0dHto1f2h1
X-Google-Smtp-Source: AGHT+IHJvWuVEjeg7jS3YGWzwBblEC1aBEjiRtx7Wx+1gkXGABMGiz68aiczGU0eMJw/KYhEPM88eA==
X-Received: by 2002:a05:6402:34c5:b0:57d:4cbc:cb59 with SMTP id 4fb4d7f45d1cf-5879f984a22mr7916813a12.25.1720000235436;
        Wed, 03 Jul 2024 02:50:35 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:34 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:19 +0200
Subject: [PATCH 06/10] clk: meson: s4: pll: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-6-7d15a0671d6f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=782;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=QjI2XZ6DpFgtcs0s52itimxDAtU+za0z6ETKz2I5xKg=;
 b=shXXui07Vv0SxzDWgmKblWiiO/F6QjUD3Gg2XbBPFxNeKr/3DO+TzrHVENvorbTe6ULfqDHDp
 pgzaktXTA0kAf2uTyPcMVNSPw+MBMfrFC59IJ9aaKMY+q4QO4+9Fx/x
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`clkc_regmap_config` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/s4-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index c2afade24f9f..27c10fc499be 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -799,7 +799,7 @@ static const struct reg_sequence s4_init_regs[] = {
 	{ .reg = ANACTRL_MPLL_CTRL0,	.def = 0x00000543 },
 };
 
-static struct regmap_config clkc_regmap_config = {
+static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.40.1

