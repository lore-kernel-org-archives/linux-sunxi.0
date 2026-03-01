Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E5CA932
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Mar 2026 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772376617; cv=none; b=hTG+HU0d5hIi1Ey76SSMarDC3xnJVSEd7ibQgoJfwcbCRQorVn445FVAe7BYKCBogzac904/nKHMHUVUVvhD/9sdb/Khx8DcMAmfwVin2s8ka0C9WGoNbvb4XEfi6Wy/dnS3eRSZoWerA+Rn81eB5qfvf9Bos4qS5Vn8FSOzsEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772376617; c=relaxed/simple;
	bh=R389vc8f9ygNLP37okERd6Iml+DXYhbm7Kjr8iEqF10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WWpttWvl+0Wwv90rOZc3e77s/hzjErb0CKHX2A9g0NCK6HShBhJegu6P/g1tcO2JVKSTu3eosuQraGa3sItghkANxTDG0mu9+GInL2NO+Dp8NWmgQ/fEbwXA9fo5lXvDkQWpDBoU3qz7ochdbOJ5HbP2pgPbO2kon8hw3ryNNqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPyQKYEa; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPyQKYEa"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-506aa68065eso37621811cf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Mar 2026 06:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772376614; x=1772981414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jMNSOkyr1OQmwknC/40Y8S8bviPWaYmHo+yrz5Q3E7M=;
        b=FPyQKYEaOEKQTtjoPaRAo4ypiMvGz1ZKhkRMWzNioLXoFVClzkV3o6BmD7sSLUPs52
         +Vkbcomm9u78ybegdw4QsrhdCuRD9zDxLxAjjDd3LvJhgGA+5zg6sA8+6CWSV5Tz7weH
         ANkQjJO5yfJvuf4OGxPn9i0bYGB3yRzF50FydDdt8a946QoxvF+onSpeA38CESYR4+N4
         on4XwmjO8IVm+peKCjm1ff1rgkHaupiMslnufmqOlBEAK0TX80dsGmdmNubYJioYiw7K
         sa1+M6JWaIFWkQQKvlxEX+JdZLMZkwiY5Oj2PUbTYwHpgUiwpqOOhPTQ2f380vZG71fK
         oFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772376614; x=1772981414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMNSOkyr1OQmwknC/40Y8S8bviPWaYmHo+yrz5Q3E7M=;
        b=mfnEFB5VyR+ZPIcYt1xUvNOPl4RhLaoKqZ1Iar2GnhZc32TX/ZMS4rIWo8iigU4Bus
         lgb2QKmd1NMkN+2p2x7bc9GEXPrziQk0izFJ8nvIyUIdZ8T9S8s0voUfqaGPjYktTd7A
         aO/UQ6yB4SG4AQe7pW3Ejvop03GDzFbEFGbL4N1WEsVXlchPEgT7mzRShRs/CULh9tI5
         +XDaCaC6ldSKfn1XkQK9j3erobSglCAoNjjjY0hFVY5bH7JGq4PH1kuMDO1pwJ+AsdJF
         40oxLXZd74BFl3ReRbn8J3ms9bUGl6u+EiwfcbRmYfvWJRc1bAIEkYGBtJ6ZrdhPnCjq
         YxWg==
X-Forwarded-Encrypted: i=1; AJvYcCXKcTR8RmtY6X5/RVhDTiGzXdFuu05KaeEAlefHEJmdtQJljY9MN9ekRgwa+DAldAzz3aaC/mXQKltZbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlbB03rFuMwN1F1Nx0vhje6aCi6pVCEt3Gt1hfu41U4XW82Qkj
	R7o6z9VtumG68UHIuUrCjbwsv4Z4voQk4cbem3syBDgrQGzxvpwNG5PH
X-Gm-Gg: ATEYQzzmwXMOTPheNejVTK6v0x6056HC8tBkc6sWQhPbhm3VJf3SX3xg6dFAC54BGxH
	EukdDcIWWn0fT069bUFwdI0koY6IC2Qy9Bl4F5xYXFisVqXBxuUMM0CuQHt9J68EpN2LPnKAOwl
	xcSlo27GwZ74GuYYtc8S29MoPa/YNIme9ygq/rUALZ/1wXITEHb8HlrRK1ipSG1Zgc97XIxPJeG
	n0ZtOLtP6iz+8oBjoQLBHxKPyIVgSyE63s3Q8mBTb1MgQF/VtjZJJ9r1gRMSHR1LWvR5c9Vf7Se
	3uwcrw3TeZpw2DvPEK//YMwBcBTa0VILRXx4W0u15trU1r/U5vzOnfgdDirjN3P3aWsLe9Flc8I
	82OzduZxXvOjnFaqt65caIngjYaTynGJc7AwN56uA15U1xP3cojJ5n05mgkacR5LiUoauPuxbL1
	oacGG6Za+qfxsXqiKl4h3NkpNDStU=
X-Received: by 2002:ac8:5991:0:b0:501:44a7:ad50 with SMTP id d75a77b69052e-507528d2800mr117305101cf.26.1772376614382;
        Sun, 01 Mar 2026 06:50:14 -0800 (PST)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c73a25e4sm84714256d6.50.2026.03.01.06.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 06:50:13 -0800 (PST)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH] bus: sunxi-rsb: Always check register address validity
Date: Sun,  1 Mar 2026 17:49:39 +0300
Message-ID: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

The register address was already validated for read operations in
regmap_sunxi_rsb_reg_read before being truncated to a u8. Write operations
have the same set of possible addresses, and the address is being truncated
from u32 to u8 here as well, so the same check is needed.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
---
 drivers/bus/sunxi-rsb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index b4f2c64ac1810..daf0ea563e477 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -445,6 +445,9 @@ static int regmap_sunxi_rsb_reg_write(void *context, unsigned int reg,
 	struct sunxi_rsb_ctx *ctx = context;
 	struct sunxi_rsb_device *rdev = ctx->rdev;
 
+	if (reg > 0xff)
+		return -EINVAL;
+
 	return sunxi_rsb_write(rdev->rsb, rdev->rtaddr, reg, &val, ctx->size);
 }
 
-- 
2.51.0

