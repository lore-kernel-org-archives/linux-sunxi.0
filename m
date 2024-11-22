Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F18F1DFE00
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 22:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732313831; cv=none; b=sLDqHyUVV8hfQwszfK7+CoLKuXFhQMAX1K7q75hv/uAeQdVXEGfP8ifiVO7ZJlxctkFa3AQ25k07lrwF0QbPbF6/RJI8B6U+xlrwiyIABDDdK9R1YDHyJ7LmM29DnqAcpnzL8fFoaN838RuhbqQ81tXHfikEUHzMUBZsGg8A1ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732313831; c=relaxed/simple;
	bh=suvkAfBGBjUXa2245JmSbUdEzRQCqXoVi3fUmt5kocQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iB41oMMlj7gAoTUAEU5dXVm8MHdyLtBfC6oWMKVG3EqrcbHRrRCXdBnGOA3obOhBt8Ya1jK0cUG60cHWo3kTUSSsJkMBwIF/Cf7PacmodDE07FsHrGpEFkm5Cde7AG1axs5kU2MvXgvZQT3KTJbnHENftaKtTOV7Zz69KoZ3dVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GuTmgPFQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GuTmgPFQ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa5325af6a0so14355466b.2
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 14:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1732313826; x=1732918626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koSu2Qr3uUTmv0FA1/R7W/a8VprfWgcqXI/05k6MgFU=;
        b=GuTmgPFQRpld+PI0eua2P4zAEk9JL2sISuE+sYOctairL1KUWJKboArZwtKixNiwc3
         ctz9Rc7Az5y0sldzgYQAdlLc0hV6gN2IRrEVfGy28HwBzFa6125b/QtdOmae9NwIJH/+
         gf0i/UfJroQ3hsoEh1dPZ00aJkgQOkSpQm1MQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732313826; x=1732918626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koSu2Qr3uUTmv0FA1/R7W/a8VprfWgcqXI/05k6MgFU=;
        b=WaL4yG+Nc8hHHOfRPtVHHCFPInXN7R2zcZ8PD3IfJP3p2nZvhCSZ3iqmHajAoDvOJV
         xwyKtUtndO7j06moy5p0AdpKOBtBAqNqLSqhd1aDxXC5JVUOyj9+Y/0lCWTN5mmnN6Tg
         naCbPVxMhnALETJ4pijcaLtaD4E1P8SpwPyuN+YEjG/XqW0E6cp0n8TlD7fGr0Sftdpw
         O+HXpL29sZY6qLI5jbRvJTEEKE4d41uZmsCNRogaEHVfNu9vgwhk4CsqzfssPHq8O2or
         /DAM2Q5aKDAg7D/MRB2x37hEWiug9LvWoH5jJEBcRsOvaRlpZUBqKO+EnonPwRJubURY
         STfw==
X-Forwarded-Encrypted: i=1; AJvYcCXSzaaQZe75AyRrrqVlsKJG1/XMyEYR1VsHStvJYxN48Tz6td6qhLbXUNR4GtmLPSgSU5KNLrMt7r5XLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPl/euW2aXjDHQIUEZkW6zowGZx5+ps/SmzMw1XYrXMu11c0P7
	0O6VhuPt0Hj6DEl9WBHLQj1ZivTWw2YrimbHGaxyO0WtWEnke1gvyKzlOIbZeFc=
X-Gm-Gg: ASbGnctsNNMzipjAGIU1CYM/rk4zX2A8f/ccjQfvO6o/brKfpzT10j4kKCJrRPCDOQx
	6LgItYtFAZ6kuoC4H8vPUrcYw5PHQT3St/Icge6sC7t6cfd6grZ5rkZUse0dhumXmX7JViXXagN
	mOMgXiC5Hp9I4ZAadfeXPXoRfBDBEm7iHNAVuER1g/UXgADH13rY9D3GWz3zLIj+rNLIEnPCZuf
	JSZn8vQ1hDeYIiAx9sQMEm4zkXdyQ6sv1540g+MdPUEfxJc6Cwf9yvfB4edHhabK6lyKo+Pnvyq
	eY7i6Pe0M+0npHzzHtZMoFXDEw3NeX/9Y50z3CuU/awERnlHRmeN0F7540g3DscJVax/9VnIMhI
	M4DpOooWDegbYY165
X-Google-Smtp-Source: AGHT+IGzFnZJs4h2n/iV/ioahj7WXElDTwCpUUULB2OBEylU5ouM6Ybr9FJMu/M15S4g4KqefHT26Q==
X-Received: by 2002:a17:906:31da:b0:aa5:30c0:384b with SMTP id a640c23a62f3a-aa530c03aecmr47395466b.24.1732313826492;
        Fri, 22 Nov 2024 14:17:06 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52fcebsm148226466b.127.2024.11.22.14.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:17:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Gerhard Bertelsmann <info@gerhard-bertelsmann.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 10/12] can: sun4i_can: fix {rx,tx}_errors statistics
Date: Fri, 22 Nov 2024 23:15:51 +0100
Message-ID: <20241122221650.633981-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
References: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sun4i_can_err() function only incremented the receive error counter
and never the transmit error counter, even if the STA_ERR_DIR flag
reported that an error had occurred during transmission. Increment the
receive/transmit error counter based on the value of the STA_ERR_DIR
flag.

Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Kernel module")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Update statistics even if skb allocation fails

 drivers/net/can/sun4i_can.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 840b972498c1..5285bb0b7c69 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -579,7 +579,6 @@ static int sun4i_can_err(struct net_device *dev, u8 isrc, u8 status)
 		/* bus error interrupt */
 		netdev_dbg(dev, "bus error interrupt\n");
 		priv->can.can_stats.bus_error++;
-		stats->rx_errors++;
 
 		if (likely(skb)) {
 			ecc = readl(priv->base + SUN4I_REG_STA_ADDR);
@@ -601,9 +600,15 @@ static int sun4i_can_err(struct net_device *dev, u8 isrc, u8 status)
 					       >> 16;
 				break;
 			}
-			/* error occurred during transmission? */
-			if ((ecc & SUN4I_STA_ERR_DIR) == 0)
+		}
+
+		/* error occurred during transmission? */
+		if ((ecc & SUN4I_STA_ERR_DIR) == 0) {
+			if (likely(skb))
 				cf->data[2] |= CAN_ERR_PROT_TX;
+			stats->tx_errors++;
+		} else {
+			stats->rx_errors++;
 		}
 	}
 	if (isrc & SUN4I_INT_ERR_PASSIVE) {
-- 
2.43.0

