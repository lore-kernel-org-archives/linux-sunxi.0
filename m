Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126FF79DC
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Jan 2023 23:04:28 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso1148622wmq.5
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Jan 2023 15:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdVquD9u0NlEIO5cxWzYGboFvm6XlfypUwKZRUXYZtU=;
        b=Sm9E8gs8hjOMEkBjEH8SiQK6HB1Pg74vnMqjGhwc8mhvKNPIvRqzqQYwt2xSF6VHKC
         Js6NIpcPf3k+9A9SEvyhRJtmn16QdBUuaek1SZbQUUfLOYkRcKoKYhuK68oRincqS7oy
         TPfKH6FMpvD61/rdUxN3pE/QsxNWftr/e90/yDvQt5lrNxYPG/NXhYzWGxJVJRY4VVW9
         uNm43uSJ3UaHSenG3juhn3L5lH3FnG4bS+Qbt2if7Rzg99Yu22MDl72wFpcpoArZJqiR
         Lw+O7hIpijwqybvKATWNkZFGBm8Iw49HoPaZpOVjMprh0Ij0wiJKL777QBD9FOt4HY1m
         iapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdVquD9u0NlEIO5cxWzYGboFvm6XlfypUwKZRUXYZtU=;
        b=shAUbs67nUeA4Mh9NSCw8Tri983BwH5UHxVjzn+KIuJCoDmjyL1pg6tDCG0GyB+Rw9
         j0KW2gi6WIT3DrUqspiAJvHqgKRut+QJWs2qHzovFi2RMfTztlB4qb6atD2O2vfP3VtH
         IltRh4opkBu+BNy5YcpV88Q/Foxv2LHcnWJl+suYJYAu9OxRCob0Iwwn5S9s94fVLprX
         CmmAwfKhizMzGVWUF8qcR2XICJxP104Xlbav998ctK7t74ULNR4sAv++TtNTCKnD22mo
         AYCMqQBfQs0ZIzlneH2wHaIB8ohW4B1aoWzRGBNRDh7LyPqqfAAxrbbC2ZVH35Wo4It2
         LgjQ==
X-Gm-Message-State: AFqh2kr/gxGmJrQsPGYEzfu0XP/lmjnNgVjcZ9fpurPr2Ql/fogdtdUu
	gALBy5ZxWaOxNebn8jToXfFkkszUCi1nWA65
X-Google-Smtp-Source: AMrXdXvbGJ9u2q+SZPhf5sOM6tVLv6nSoLpDEyC3UaL6ha+NwHD2966GBjROJX23QYHvcuXzivpQCA==
X-Received: by 2002:a05:600c:a690:b0:3d5:64bf:ccb8 with SMTP id ip16-20020a05600ca69000b003d564bfccb8mr999617wmb.12.1673910267014;
        Mon, 16 Jan 2023 15:04:27 -0800 (PST)
Received: from localhost.localdomain (mm-88-61-120-178.brest.dynamic.pppoe.byfly.by. [178.120.61.88])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c4f8700b003c6bd12ac27sm39136685wmq.37.2023.01.16.15.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 15:04:26 -0800 (PST)
From: Oleg Verych <olecom@gmail.com>
To: linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Cc: Oleg Verych <olecom@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	linux-media@vger.kernel.org (open list:ALLWINNER A10 CSI DRIVER),
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: [PATCH] media: sun4i-csi: Use CSI_INT_STA_REG name, fix typo in a comment
Date: Tue, 17 Jan 2023 02:03:23 +0300
Message-Id: <20230116230323.4718-1-olecom@gmail.com>
X-Mailer: git-send-email 2.35.1.windows.2
In-Reply-To: <Y8WgY74zWjF3kvln@valkosipuli.retiisi.eu>
References: <Y8WgY74zWjF3kvln@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix interrupt status register offset usage to be a defined name
CSI_INT_STA_REG (= 0x34) instead of a plain number.

Additionally fix a typo in a comment of the same file.

Signed-off-by: Oleg Verych <olecom@gmail.com>

---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index a3e826a75..95b5633b7 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -245,7 +245,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	 * We need a scratch buffer in case where we'll not have any
 	 * more buffer queued so that we don't error out. One of those
 	 * cases is when you end up at the last frame to capture, you
-	 * don't havea any buffer queued any more, and yet it doesn't
+	 * don't have any buffer queued any more, and yet it doesn't
 	 * really matter since you'll never reach the next buffer.
 	 *
 	 * Since we support the multi-planar API, we need to have a
@@ -311,7 +311,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	writel(CSI_BUF_CTRL_DBE, csi->regs + CSI_BUF_CTRL_REG);
 
 	/* Clear the pending interrupts */
-	writel(CSI_INT_FRM_DONE, csi->regs + 0x34);
+	writel(CSI_INT_FRM_DONE, csi->regs + CSI_INT_STA_REG);
 
 	/* Enable frame done interrupt */
 	writel(CSI_INT_FRM_DONE, csi->regs + CSI_INT_EN_REG);
-- 
2.20.1

