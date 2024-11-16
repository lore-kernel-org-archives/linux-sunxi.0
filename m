Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C215F1917FD
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Nov 2024 18:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731780200; cv=none; b=It3y0/y6qPV0RrsIfcPSxMRxRyk7l5QWIG/OBDtQP2MYaSXKdzHWq5RoE8K00DU8CTENoaI0Y0KltgndBqwnful2s8luT7+hsG4R+iXtZCPdFUr8snBnzjR52cJRHJXZhPENKBRBdX00ipxWPAWQnw7bDXWeilNv0fy9XmASnCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731780200; c=relaxed/simple;
	bh=0jjERzUdBGaOyD8hozmGujUsFYfwS4ojvocwRF0u2o4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGtXIj+ob325VYnM8/YIxdvEZc89czMNn2pOA90lnCtNmxhAWHSAPjF3UWYxM90JjfW444SDauuJPlCOu/33e4sDykpzujgN3QY+CifzMSe1ZMHD2+nlemCr2gDmGdkM3NeXbU5kvIxfxBqoMDQmsC3zCOxrKyyDG9kgY407m9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AJJCkp2r; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AJJCkp2r"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso544128466b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Nov 2024 10:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1731780197; x=1732384997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZp2LLELhHXaHE6P8yqyIkdBBd7fnVylmpcd4GsYhTg=;
        b=AJJCkp2rj9HzBz6XQMFjUUp6qRueVPZHSa1BVf5CD2fgm0v8h0m3QjOkwiFqVt3yPU
         GULzzED0EZ2IFPD+zF61AhNpS1bRsqM64H5+0ISyDDiWnQtAMp+aM3PICekSEXNjEQuW
         yS3HJgKtRlWe/Dl76U6hZ4vbHCAXINrBIkwmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731780197; x=1732384997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZp2LLELhHXaHE6P8yqyIkdBBd7fnVylmpcd4GsYhTg=;
        b=gkpzEytkPLzHvmMo1Gg238AGtKJwd6xSpxIQ8whES9BQdCoZKD7wF6ZQoINszpiR/B
         z5ypJT2ZfZ9HwlTZfJz1K56XFjK8a+kpK0TQE3flwmnyY3XwePIDafbASHXWhUlFi7vF
         8hHAf+8jR0Vvtu3BZSslJVovXPpKcFhecr++r/Vd5iv4oEZ2OoQOuM5tsioEzr12E9Vm
         TJYWgfYneXuVlb6SUMoj7FknTXovWcv6sSIeJGzxUU79jqm8Pezs1y9j2jJytpU6sNri
         HpRgcszV46aRUM4izUAZ203mTOecPqLqLfVN9vJ5y34yVOAqVPw8dvXfeM2uYo32wfrJ
         e4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9DmikFOsNU+uuu8W3vNNa0hhJekW9poRDjTpXKsN3xIXuSe1/jZNweOIZdN6xat6tH+NRs47NL8Kfew==@lists.linux.dev
X-Gm-Message-State: AOJu0YxloHOIEedLV6OFTHEK1m3yIlyUCOxP7r3DLu4LIvpqyi+ddie+
	kYPtmks+pVvHGxxpbmxgAnhmFruzspTxZZBvwKKAqF2jkpjNcW8EkKTqLOEoths=
X-Google-Smtp-Source: AGHT+IHco/HhB19U8GRhXEYmlvtasr6hZ6h72SXfmIX9BAE4Ibve8haYdY+6mq7whoM3rHFNs0pSVA==
X-Received: by 2002:a17:907:d24:b0:a9a:bbcd:e63 with SMTP id a640c23a62f3a-aa483421c58mr612801466b.14.1731780196892;
        Sat, 16 Nov 2024 10:03:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dc6d364sm329549066b.0.2024.11.16.10.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 10:03:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gerhard Bertelsmann <info@gerhard-bertelsmann.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH 5/7] can: sun4i_can: fix {rx,tx}_errors statistics
Date: Sat, 16 Nov 2024 19:02:34 +0100
Message-ID: <20241116180301.3935879-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241116180301.3935879-1-dario.binacchi@amarulasolutions.com>
References: <20241116180301.3935879-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sun4i_can_err() function only incremented the receive error counter
and never the transmit error counter, even if the STA_ERR_DIR flag
reported that an error had occurred during transmission. The patch
increments the receive/transmit error counter based on the value of the
STA_ERR_DIR flag.

Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Kernel module")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/net/can/sun4i_can.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 360158c295d3..40939141749d 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -579,7 +579,6 @@ static int sun4i_can_err(struct net_device *dev, u8 isrc, u8 status)
 		/* bus error interrupt */
 		netdev_dbg(dev, "bus error interrupt\n");
 		priv->can.can_stats.bus_error++;
-		stats->rx_errors++;
 
 		if (likely(skb)) {
 			ecc = readl(priv->base + SUN4I_REG_STA_ADDR);
@@ -602,8 +601,12 @@ static int sun4i_can_err(struct net_device *dev, u8 isrc, u8 status)
 				break;
 			}
 			/* error occurred during transmission? */
-			if ((ecc & SUN4I_STA_ERR_DIR) == 0)
+			if ((ecc & SUN4I_STA_ERR_DIR) == 0) {
 				cf->data[2] |= CAN_ERR_PROT_TX;
+				stats->tx_errors++;
+			} else {
+				stats->rx_errors++;
+			}
 		}
 	}
 	if (isrc & SUN4I_INT_ERR_PASSIVE) {
-- 
2.43.0

