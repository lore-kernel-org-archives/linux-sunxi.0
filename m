Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433333FD4
	for <linux-sunxi@lists.linux.dev>; Sat, 11 Sep 2021 17:39:27 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id n7-20020a05600c3b8700b002f8ca941d89so3567612wms.2
        for <linux-sunxi@lists.linux.dev>; Sat, 11 Sep 2021 10:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=50ycPeIKxWM32FP7lw0USVE+nCVaQdzyGR+eZye/qnI=;
        b=arkkn/yfd+iF7v+ETb9MgD9oamYRiQ2XWwsgb0zaGlXFcNhrZd7oAU4kXNrKI/+A2E
         K5HNYdqARmYupu4YHEua40VQn4ZSIioBb8fvoeERBBjvM+n3Xo7nF3qVpQCjynGgAG2h
         jNfnF+pDg0uSrP96vgOeS0UTlx+/OnhtwdHGeGIMJBDvBOTXOB8mL/Y3LAMgHmRcQ13d
         0fIxJU/9L0/LLPZ6Pdj2RQU2G1im4ON+fIDYycN9pyo51p8dBfin8pCtfmpmD8IJz+lx
         ddurFyAkGkyc9gJp/3qa0yfhNierMU1JfQ7ByQ2E7vrtvruPJhaar8bmedqOt8WleBnT
         tyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=50ycPeIKxWM32FP7lw0USVE+nCVaQdzyGR+eZye/qnI=;
        b=1GVAt5B++DvE8KXbbuF3tfrG1w3VRgxwfXKDNd3Db10/fxirQjx2vclMUyXSCmb1Qz
         t/f5Qwq4zRzxJ7zwMqXGkX+CxP/HHVHqyiIdvQUgvYxTbcsWGAx0psDbasvde/WYtPOo
         xYzHZBbob93F2h5qQU5wY6A0jOVSjCLHsXAsOlk+8FRSiSRtcSaUmVoX06/s89sPYXFZ
         lcN//+KDDa6+f40vl+wTkdB6WW75dwMcXuBWIw0O4cM8P7sK7vTUw1uLDlFW0K5Fmprl
         y4y83UyXGNyAHsGEESTxeshE2zIpcBh4WRk37T11jYxCKOmVbJaOwo+Bb9Qa+fk7kEaU
         UBiw==
X-Gm-Message-State: AOAM530Uc38q1+AyAYO4xm79eClvAs54TDwpx9O29snU0rQ65dq9zM+r
	RfqGRneq9uM/oX8BT1t8ibY=
X-Google-Smtp-Source: ABdhPJx9nveIZsagH/e3TUKfo2qZtbVPmU4K6vhna4zdaUPbtZqQnYoYqJuYm8u4A1+UUUOcRrzzKw==
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr3557430wmj.78.1631381965663;
        Sat, 11 Sep 2021 10:39:25 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id s24sm2026936wmh.34.2021.09.11.10.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 10:39:25 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: mripard@kernel.org,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@aosc.io>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] sunxi: call fdt_fixup_ethernet again to set macaddr for more aliases
Date: Sat, 11 Sep 2021 19:39:16 +0200
Message-Id: <20210911173916.615928-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Icenowy Zheng <icenowy@aosc.io>

Sometimes some ethernet aliases do not exist in U-Boot DT but they
exist in the DT used to boot the system (for example, modified via DT
overlays). In this situation setup_environment is called again in
ft_board_setup() to generate macaddr environment variable for them.
However now the call to fdt_fixup_ethernet() is moved before the call
of ft_board_setup().

Call fdt_fixup_ethernet() again to add MAC addresses for the extra
ethernet aliases.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
[updated commit message]
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---

Hi all,

this is effectively resend of:
https://patchwork.ozlabs.org/project/uboot/patch/20171027093439.12414-1-icenowy@aosc.io/

On at least one board, namely BananaPi M2 Zero, adding ethernet connector is
pretty popular after market modification. Since this is not something that is
already present on the board, ethernet node will never be part of upstream DT.
Thus, the only sensible solution is to use DT overlay, which adds node to DT
(maintaining patches is tedious). However, when overlays are used, U-Boot
misses injecting MAC address, as described in commit message.

Please reconsider this patch for inclusion in upstream.

Best regards,
Jernej

 board/sunxi/board.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 1a46100e408d..97554d4642ed 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -997,10 +997,12 @@ int ft_board_setup(void *blob, struct bd_info *bd)
 	int __maybe_unused r;
 
 	/*
-	 * Call setup_environment again in case the boot fdt has
-	 * ethernet aliases the u-boot copy does not have.
+	 * Call setup_environment and fdt_fixup_ethernet again
+	 * in case the boot fdt has ethernet aliases the u-boot
+	 * copy does not have.
 	 */
 	setup_environment(blob);
+	fdt_fixup_ethernet(blob);
 
 	bluetooth_dt_fixup(blob);
 
-- 
2.33.0

