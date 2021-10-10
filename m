Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C14472
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Oct 2021 07:18:23 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id i12so31752391wrb.7
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Oct 2021 00:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ircsRGiSRRDI5vvTT/PYNTjvV8p5MX9cyk5yss2d11M=;
        b=mRV1EPIDOcWgi0ZDOfVMxd+VAqx5nw6cxQgaAoXTRBd0FIGA9mnt+5SIYAhejtfZCr
         pfspAqx9qtIXRQTXHm01Pndlv3O9OXvtwktCVMMaYIouFz6eL902LeYzGz5VBUNig4kZ
         PFbs58PpaUYjrTZPYaCTuE/G0kQD2aCj6q2xgL/zuNobHASXYY0NiG4hOEUXSW2x2H6H
         aGhIpWJFfEJ2fhYwA1kGm6e8pEbRpW9NwO6HNKrVkAhzRXUGWmUR0fecsiMcwJG8pVId
         eeulCiEQquGk3JRwnzcTANMzOk/zwuJnQ69/qDFurk9O31OoWHFAMcUv0yN9W2TSQ/rK
         wRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ircsRGiSRRDI5vvTT/PYNTjvV8p5MX9cyk5yss2d11M=;
        b=V0JqZXAgauG42dtkXjXXLtF/2u8r0FU4X0KRcwsZKwZd9ckD/wrDCn+xEKF69CmICl
         qG2OwxEZh3PB8bF2CbRzepQzjDl18Wnpfbdwvg0A0Jse/4bs383VNWAqaGvmx/VaYOyT
         d0NknMyxh0MMK4Lz0jSllJZrrW9+ZCgT0ZWH7Zp0DblzyvfnG4XQbKJnsMl5gxbYGqT4
         OK/ZSsPKrp7hM7F07w/8jJDoRoCPv1fQi9N845qib2AELgbS+x3yddx4I9FiWaFZT0Y5
         oVcQ4Lt0q9SE7XWmjGLajVlhCyJLhURR2dFKi/Q7XmPT8UFsB/NiSjONL7ZaL+GiYzx9
         mUow==
X-Gm-Message-State: AOAM533+52LxgNk+R3MHdU5mks9d/I15+yRgbzeGTvfYjLcA0QQr1CIy
	Zlqv1HIULKysLYyGrYpaGoY=
X-Google-Smtp-Source: ABdhPJweOswcCJDMYDuEl0xsle+Ew2RuPx8ZRdW1YZ8M6RpUDbLmdzUmpEsY2CiRm/5fQXWfxpHHPw==
X-Received: by 2002:a05:6000:1042:: with SMTP id c2mr9783493wrx.272.1633850301699;
        Sun, 10 Oct 2021 00:18:21 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id m4sm17473305wml.28.2021.10.10.00.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 00:18:21 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] bus: sun50i-de2: Adjust printing error message
Date: Sun, 10 Oct 2021 09:18:12 +0200
Message-Id: <20211010071812.145178-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SRAM driver often returns -EPROBE_DEFER and thus this bus driver often
prints error message, even if it probes successfully later. This is
confusing for users and they often think that something is wrong.

Use dev_err_probe() helper for printing error message. It handles
-EPROBE_DEFER automatically.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/bus/sun50i-de2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/sun50i-de2.c b/drivers/bus/sun50i-de2.c
index 672518741f86..414f29cdedf0 100644
--- a/drivers/bus/sun50i-de2.c
+++ b/drivers/bus/sun50i-de2.c
@@ -15,10 +15,9 @@ static int sun50i_de2_bus_probe(struct platform_device *pdev)
 	int ret;
 
 	ret = sunxi_sram_claim(&pdev->dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Error couldn't map SRAM to device\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Couldn't map SRAM to device\n");
 
 	of_platform_populate(np, NULL, NULL, &pdev->dev);
 
-- 
2.33.0

