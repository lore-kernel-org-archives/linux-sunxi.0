Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E522D7A6
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Dec 2023 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcO9MBWY"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a1ca24776c3so506460766b.0
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Dec 2023 05:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702733671; x=1703338471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTmoBalM2UZzwSsqBtYN4pTcgAH6LuJG4x51tAzCQyI=;
        b=mcO9MBWY1UvKUs92C805rXY215rM1QmtQpxg7LTREk/Jw2BFbgmXG95tM6i5kQF84p
         Nk3IP1pNrANuERdJEy414XJ028C0LfpAom4bgUswba2wBeeTdxSGBT+FVOPKgA8sc4Zn
         IUY4FcZU+za40XbFagCxjPV/uFGw+wVXPNbox8L6isEGxEJO6dcIILPJAr+SC84ae2Og
         CPJkW6vSdE9fnohfumMOxFZhTG+Wm8fEZIsudbOZTC831WZAa/ScV/E0E0ptqmi94FlY
         4oJ0qfiWmd9UmahbeMnYqlt1roHb4R88qfowpv0zKUHhp22G8xfqxH5yLM33Tgtzcw1n
         307g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702733671; x=1703338471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTmoBalM2UZzwSsqBtYN4pTcgAH6LuJG4x51tAzCQyI=;
        b=WiU2WV2j6jY29EkWoBJLj/BW/+GaGSlHG5yILAdlRkjJqzXp/7WotpwNc50derdHGd
         kB7QBds3BcOeEkGZfYWMZVEiS4fhK0he9iV73UcVngElfpR/BrmMyvc6f9MPsLqTn8N5
         uEGT3tD5KrsZDplTFRxWPb82L65noHzE8wBFlerU1lCtDgD1mAG77MhGpUzKgW4EboT6
         VZrJgVP6/SFI13vboBIiBhliplrbQjHgLR3AKCuH6hu1/Lxmo3+sKB537MYeDzGMUtxy
         PYnZm6UXQ5tqKiLdjyMMglylSE1EGHYXtqpvfsD/HoK9/ducNaAP0Zfu++jyPfuU8V4y
         WetA==
X-Gm-Message-State: AOJu0Yx+YuFEoWEUXaENZla+c2MlhiUFn/NN/37CmFe/iZJ/OH1Pq0P0
	DrjoOaCoQLShYZYjVhuNi7Y=
X-Google-Smtp-Source: AGHT+IH3b10j+8jyAKAtdvCEywyWlISzpZTeWRwzu6lMvYyzMBeGp+kGNS8nahX92FU1+f2A18l15Q==
X-Received: by 2002:a17:906:6d4f:b0:a23:31e9:71e4 with SMTP id a15-20020a1709066d4f00b00a2331e971e4mr344349ejt.71.1702733670581;
        Sat, 16 Dec 2023 05:34:30 -0800 (PST)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id l16-20020a170906415000b00a232bf6045csm423629ejk.63.2023.12.16.05.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:34:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/3] media: sun8i-di: Fix chroma difference threshold
Date: Sat, 16 Dec 2023 14:34:22 +0100
Message-ID: <20231216133422.2534674-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231216133422.2534674-1-jernej.skrabec@gmail.com>
References: <20231216133422.2534674-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While there is no good explanation what this value does, vendor driver
uses value 31 for it. Align driver with it.

Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index f253a40cc04f..f7ff0937828c 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -304,7 +304,7 @@ static void deinterlace_init(struct deinterlace_dev *dev)
 
 	deinterlace_clr_set_bits(dev, DEINTERLACE_CHROMA_DIFF,
 				 DEINTERLACE_CHROMA_DIFF_TH_MSK,
-				 DEINTERLACE_CHROMA_DIFF_TH(5));
+				 DEINTERLACE_CHROMA_DIFF_TH(31));
 }
 
 static inline struct deinterlace_ctx *deinterlace_file2ctx(struct file *file)
-- 
2.43.0

