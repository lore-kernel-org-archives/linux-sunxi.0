Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90793FC2
	for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 18:48:40 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id j14-20020a1c230e000000b002e748b9a48bso2417033wmj.0
        for <linux-sunxi@lists.linux.dev>; Tue, 31 Aug 2021 11:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ssx/Du/IP+VJ6yRDjCWSrw9PFpibgX8+LOfvx0arrC0=;
        b=puHwvGy27ZCKW1/hb24T4TxdTwdhH8hvACG5TZRQSpyCBIIMky52bBklkqr9uJutP9
         P0wNNsLYBf1rjLSkYPzkH9uMmpQw22uPzb75brSLN9IoR/EySrsjS3gV+thkKOc8/H82
         DI3D7LnOxXZVwTOxYbmAGqepG19w67uxdr+UqtuKgQlAouvhp3shcbNh69RePVDN7xVj
         WLCwur8FuuCsy2nyBXl015EN7380NvJAK3gPDqMFBvPm9y+8MyNgk67elQ7sxGSnioVa
         bz6G4tYRWV/i22lvNZPWSLbZFkZstVT/Xrky1y3wroe9W8wxlSJZn3OiE4MwLdI7la+B
         yM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ssx/Du/IP+VJ6yRDjCWSrw9PFpibgX8+LOfvx0arrC0=;
        b=UHAmML4BGPB1rfbSiHKig2WGGEe9oyFMw0nxjSKEPJwuhRpU+9YYxqunsM6t+SZG0f
         th7mvx0CMhVeWOXiAoqtBBpCiS69tRsCZlw/o+p6HOsudINDn+H+PL18xUBRLUIl4yBZ
         Y/fBca4lv1+KObU0k4NQElB1PXW0+HESHng5ztipdKnDFNtc+V01eoCpdpZp8NtycqeL
         WBsxODWYTQSjoCLn6JHHIHaTWT1L/ESsmqjNnMatTJHjoUEgdGVOry54O7Fi/qUDjA3+
         Oy8aiApGcUQypXxgEX4sF/Fk7hreBFuCsX4C51ibmOzclp8r7LWgkhm8jPt+4fRXwXUQ
         HssQ==
X-Gm-Message-State: AOAM531wIpxp3sbMNwlhIASmjggiIF6sIrhmet66dwRfPlQo954mo9U2
	GwO7uNlo3mLHmuMuHoNv7ic=
X-Google-Smtp-Source: ABdhPJxpHtUrxMXrtWzNzUZfT5NDgfPAC3iEvcgbop4yUZWCq6uU0jUnfin9kUgN30R0dGd3QoArGw==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr5857630wmc.26.1630435719011;
        Tue, 31 Aug 2021 11:48:39 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id d145sm3111884wmd.3.2021.08.31.11.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 11:48:38 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	stable@vger.kernel.org,
	Roman Stratiienko <r.stratiienko@gmail.com>
Subject: [PATCH] drm/sun4i: Fix macros in sun8i_csc.h
Date: Tue, 31 Aug 2021 20:48:19 +0200
Message-Id: <20210831184819.93670-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Macros SUN8I_CSC_CTRL() and SUN8I_CSC_COEFF() don't follow usual
recommendation of having arguments enclosed in parenthesis. While that
didn't change anything for quiet sometime, it actually become important
after CSC code rework with commit ea067aee45a8 ("drm/sun4i: de2/de3:
Remove redundant CSC matrices").

Without this fix, colours are completely off for supported YVU formats
on SoCs with DE2 (A64, H3, R40, etc.).

Fix the issue by enclosing macro arguments in parenthesis.

Cc: stable@vger.kernel.org # 5.12+
Fixes: 883029390550 ("drm/sun4i: Add DE2 CSC library")
Reported-by: Roman Stratiienko <r.stratiienko@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index a55a38ad849c..022cafa6c06c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -16,8 +16,8 @@ struct sun8i_mixer;
 #define CCSC10_OFFSET 0xA0000
 #define CCSC11_OFFSET 0xF0000
 
-#define SUN8I_CSC_CTRL(base)		(base + 0x0)
-#define SUN8I_CSC_COEFF(base, i)	(base + 0x10 + 4 * i)
+#define SUN8I_CSC_CTRL(base)		((base) + 0x0)
+#define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-- 
2.33.0

