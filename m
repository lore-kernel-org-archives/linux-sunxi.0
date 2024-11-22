Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530D618A6AA
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 22:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732313820; cv=none; b=GMczYPKIgd+7Sm8h7H/ADsSUCGjmHVkpkbNE/YirwZHAS9zoA2iRbDEQoClOgbeIM3+rhAbjeT6E86HplmAt1gmqGE323K9GXV86cTzMu9WtpvjPY57nrj21WmvduuOQZ61i3QD6P5AfX1KWxiGLKObhEGQXpaoZQd5VTdYPl1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732313820; c=relaxed/simple;
	bh=cfN/Sqofe2yynbRgQXfBL6ERxMwzjmzkAWAp/j8LOdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1D8iLssP1MWJBX/uqWXRppTQomC7UcX3MUkkaZr9yCmxefHtABv4/oJyhW1t/AjkyVpiIvAIZXPAfTOqPMvRRUaSWveDUf8XYYR07/N7QxTDmtXXaC/oK8dnBR14i/pE9ijSjFYQDU1vTrXY9LDxQRtMVS3GHRp527s6KxmZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=BdMur4zh; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BdMur4zh"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa52edbcb63so51199966b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 14:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1732313817; x=1732918617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HrdX116se3rn9QRZsQ51ceQKyywuhiVyeVP2xiWD4c=;
        b=BdMur4zh5lFVOUBVe1qOvSmaqoHNzt66gQyqb3kvUmhS3aN4fuiPvxOj+x0w6QqIBV
         BgwWU2TlieTxcZztBMxm9cXh1uSYm0uMW6mamHkcBF6Kou19YRZu++pbUCfAASVyzapK
         Qk95xm/mft7FDpq3VNZzE24pkyE3fY0Oxg18g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732313817; x=1732918617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HrdX116se3rn9QRZsQ51ceQKyywuhiVyeVP2xiWD4c=;
        b=ABZVh6n9rKKTeHjU5maQlKxAQJmvLvIcFkbmWkQb+mlKXyOZnL4zCN9ZmITjWrHvDJ
         1n3th1edJ6wA8kOpK5KvRc0wBzbTl9zo6Dbl4IlINwBTxZsOqNsAOuQwUPPsdylG0RU1
         wbOEHbYnHnmFcKsn6CBgQqpT8gRqRPQ3r0oiujPpsSy80Lo/BFdvrAd9RYqUSLel7Nv6
         JZpTMmIFjNLr7NruC46euI+HBrSzW+KtpApafoiUxl53by+qeWxKRPNgQzCzcr2M1Bpv
         m+0ImonWc5uRPl+dWcnZ3s5rzqfCDWQkbx3AYg/9xN1FqvzdJA9E+lzxafC+mixivYYa
         9Vpw==
X-Forwarded-Encrypted: i=1; AJvYcCWAOVki4RkDCW7083UeAu/xLr0B+L6A4d1hGA5XgoCJQBDJHiLgEqZDY5xgqznyVZd3s2uGJJ/QK30GUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeT6Gz7EV77pB7SGRf5LaoT6/tp0W3pzKrUQ1Eh+HBkXb/Um0x
	VEebLzsPBMYlaCU8or6ShyXOA4Pabp3EGf8Oj/dUfQxrclK5mK1s0lah1jBQL30=
X-Gm-Gg: ASbGncucq6p9bmWzanP+h0BpEHg7LJWFcan1MgbKeqv1zzjy/D3og73LB4SFZ1NzAb3
	ZXwmKO+6hKWZ0gzoCx5mnODXd42D2ca+4N/BhCS6nQuNGF+yQS1jC37iNIpOpyyuQlPHacldLMK
	y8LnEmSunFWWSmydvLPbksPB2Sp3+tQmA5Auj+957PAphEqAHLfN2888Ucg8g4Ku7i+HoQ5MOel
	xBE4JQgLh+Zhw89/5KqmKyVT6lHlpqDfpa9M+Bpz1PV1JD77OMoMys/hl+yr00vKyBrdaPK5DgD
	Y4uCKjs0KcBz3V92wn8fR7p18EqrV1W8S6GPurnOz5is3nf/9GAo/dUti0jZ+XCULLyLb2Sm6eO
	Qlwkes8eWhDAtehDs
X-Google-Smtp-Source: AGHT+IHRSafR/Hd70o+h3rYpO/7VHYMjBwxEdj1MERjp9IAi6352iOe+u8OcuPheRZbM1LDn8364LQ==
X-Received: by 2002:a17:906:31c1:b0:aa5:24df:ca8 with SMTP id a640c23a62f3a-aa524df1311mr297959966b.18.1732313816670;
        Fri, 22 Nov 2024 14:16:56 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52fcebsm148226466b.127.2024.11.22.14.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:16:56 -0800 (PST)
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
Subject: [PATCH v2 02/12] can: sun4i_can: call can_change_state() even if cf is NULL
Date: Fri, 22 Nov 2024 23:15:43 +0100
Message-ID: <20241122221650.633981-3-dario.binacchi@amarulasolutions.com>
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

The function can_change_state() can also be called if the allocation
of the skb fails, as it handles the cf parameter when it is null.
Additionally, this ensures that the statistics related to state error
counters (i. e. warning, passive, and bus-off) are updated.

Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Kernel module")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Added in v2

 drivers/net/can/sun4i_can.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 360158c295d3..17f94cca93fb 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -629,10 +629,10 @@ static int sun4i_can_err(struct net_device *dev, u8 isrc, u8 status)
 		tx_state = txerr >= rxerr ? state : 0;
 		rx_state = txerr <= rxerr ? state : 0;
 
-		if (likely(skb))
-			can_change_state(dev, cf, tx_state, rx_state);
-		else
-			priv->can.state = state;
+		/* The skb allocation might fail, but can_change_state()
+		 * handles cf == NULL.
+		 */
+		can_change_state(dev, cf, tx_state, rx_state);
 		if (state == CAN_STATE_BUS_OFF)
 			can_bus_off(dev);
 	}
-- 
2.43.0

