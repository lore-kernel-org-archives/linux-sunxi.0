Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7732F80
	for <linux-sunxi@lists.linux.dev>; Sat, 22 May 2021 20:50:59 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id j14so22648695wrq.5
        for <linux-sunxi@lists.linux.dev>; Sat, 22 May 2021 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FqGZVkSfOTjIydyeIzbBzvazr+vyEv7M9XhPMOmAi8A=;
        b=QEHzQjuimSdSUCq0g6rbtS2Wu2L2XqH2E5ihW6/I0ZlO8/r96exAq6WS0+WuY1Lkwy
         DWFy+YoImr9R4c8iNKorjUNR58DIvio7UH2KQ/L5A4899DLl3CSHeK96e+77eoKaqmIF
         zka8aEiIL7Q9sRIzJA8zj1+BHd0Y1lgmO84monohfLj13F99hqA3+kCKxOKXjpxulK6k
         xAPfgGuFt2jGwCW/zteVtYclYWMYe+sBK8gW0rMMPOGJxPSx5xNJLAvQaqoZV7zwTGDP
         ajxyPL4bDcKKpUpCe36RnK3Dk+gqQcuENhn1mMNfgyTxXHp4zgyBNKhRVVozr3ecV+zu
         Shmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FqGZVkSfOTjIydyeIzbBzvazr+vyEv7M9XhPMOmAi8A=;
        b=Hd0fxC6LfjQylXAY7ciOozRk4AloeGOrtincyF05ESPqXytgkPgNSOBDhNtr8uW6C9
         M3zHAE/uQUvyCvMcTXOVAgihV+VKnl88IBgMIlAgQOiDN+bFrhaeOar8RrZvJ4MwPG0j
         vQ4A6hE7ZWE6v19rNdGKH38bSj9HGs8UzciZLMlwPRwmZ5tvL5S2Zl8m7hx++9eDiFDS
         Y59dat+xbH5rQ/6zE2glvhmCc+vJvsdV2sPNLCmVh4DJHXHIs0w0U1nvwPnuX3OhUUAH
         +r1bu7x4Vw5AdLdsFLekdO27DUY8mLK02ss4uu2Pw+h7sRuhrmrO/n7M03plD5KHvteC
         IgOg==
X-Gm-Message-State: AOAM530htbb1iP4oUanZqmzZo0vOoA0Eejo/w2ILCbijHCYTG2hyTt02
	IWnARpFRhIeJjQj0vwwD0YA=
X-Google-Smtp-Source: ABdhPJxrh0ij+DcignA5QkW1HZigF7cAQ5Raqv/pvvx0ZTChgrdYsg7JYWhgJoNWKsASNXHXWTX7Eg==
X-Received: by 2002:a5d:4384:: with SMTP id i4mr13798343wrq.332.1621716658150;
        Sat, 22 May 2021 13:50:58 -0700 (PDT)
Received: from flex-5.fritz.box (dynamic-077-012-139-231.77.12.pool.telefonica.de. [77.12.139.231])
        by smtp.gmail.com with ESMTPSA id p6sm3447055wma.4.2021.05.22.13.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 13:50:57 -0700 (PDT)
From: Andreas Rehn <rehn.andreas86@gmail.com>
To: mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andreas Rehn <rehn.andreas86@gmail.com>
Subject: [PATCH] ARM: dts: sun8i: v3s: enable emac for zero Dock
Date: Sat, 22 May 2021 22:50:39 +0200
Message-Id: <20210522205039.179486-1-rehn.andreas86@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dwmac-sun8i supports v3s and
Licheepi-zero Dock provides an ethernet port

Signed-off-by: Andreas Rehn <rehn.andreas86@gmail.com>
---
 arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
index db5cd0b8574b..2d78b7a52fd3 100644
--- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
+++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts
@@ -94,3 +94,8 @@ button-800 {
 		voltage = <800000>;
 	};
 };
+
+&emac {
+	allwinner,leds-active-low;
+	status = "okay";
+};
-- 
2.25.1

