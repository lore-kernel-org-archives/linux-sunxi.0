Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEA41BC06C
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 22:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732313822; cv=none; b=WK8uOpDqIFt4A3pW19plGfE4clSUDzkTQvuU0SR+XfobOMRCkH52zrL7155KmxWYNeGQCSkXTykSvKZ0JWlQ9AOuJworbCivP7Z7kPwlMKcUEimo3f6P2BKZlVpBOHO0XpVCObbyzVfE7nS4U5O1qbnMzH8ZbesgYPT7qOohjns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732313822; c=relaxed/simple;
	bh=bJ5akgXBwoiUhGjbtM87dqu6r2AImjKv44f50PKcNNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POwws5wMzNhbYzeGHo/qrYmTGCe5VLFbQVmUJ0Bab5vB38rQOtitXo646h1minvKTgm8o4cLr2KS1JOSntQX2GtNx5RURzJslFo2nsLdHIiXAwxVzrneYqzfgLDUWNDpCdlTBP8Z9NrtQqqDvODq+ymQytpvUpOUr0zAuupI6sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=NX5AdpJa; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NX5AdpJa"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so419673266b.0
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Nov 2024 14:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1732313818; x=1732918618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da17qF15VPZTU2YSYHqLzMcyFK3KqWPtGcD0XFwPoOY=;
        b=NX5AdpJaOa1NGjPoKTFY7WZDyQR75YI8/KYrpP4W60n23aTLKxjjHoXKRRZ96AMg9P
         LjBzzoFDgT3kFrw5CqFJQ8hdSxzDCVAWYPoS5sJPxXEXkROCKdyTpShqbCV8GXHGVptB
         QAXicDoWa5CTfMEJE4w/59z0Ds3PIQRn1uzaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732313818; x=1732918618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=da17qF15VPZTU2YSYHqLzMcyFK3KqWPtGcD0XFwPoOY=;
        b=K/qBe+y1vlB0viwS/e0TLNPPyLrOjOO5dsl0+jDcjReAE3/9ishetRBI8ka7X/CNm2
         og5zcCNZFQqOIY18bu9ufvPOfJjvAGlJermGr5D8munirzm/z/9QxGiJDp2ad0QTUj8k
         MC9iQIHr1zg/vaf5mx43d+ujTD0byyaIAVZG1u5pXcDxFpl/f1YwpeARwg7mXl/U0zDI
         qcK8jz/ned+GmFo2zxFarlIbF4wKWlwQyXZL2jwPxLVfGdFYsrQtwjAqZb8NhFlK2hQh
         CoqLYCeDu+ybXoduWx1yrcs8qBrx5N2DbosOCFyY8Z6X5hnPc5cCpA2dBHO+KRy/uLE6
         +4XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLM6BSiMtRU7O9KWhQ0KGOTq017CFLxeS6TxZffIH1g0ZTiNdQ29gm6NXGfWFUSOxtJjsCkoT8mkImNg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx70SEGqKsAv+TnD1UZVk6lnMT+tKrfBjAkJariSDPNKzDCaP9h
	wZ5MBo4Bcj0FxEPWUpbpaZOM3OqkidhCbf66WqsQJSaOCmKdx2knZtsesONk7Xo=
X-Gm-Gg: ASbGnctV5fXEu7Ywyqrs6Ln7p9ukI/3JZ8R16fVWTl/aR/oFiFBHNE3TU/UscFNxMGf
	wZc4vv2SP0aaLBYtz9GC/qRASKq01TNIlEK0JIg+bIcOzKibXvxRGzm9rGz+vM5gJK+URZC2IBI
	UccDc/vlj8e04kQWEA7oFEiHIFD5KyzAIec3t5w0n2vm3qHfiEebTVXr5ZJRV1emZKvyiR4/X+T
	2NJqobOdNK52cWYxrxjnN8shlW9YPXjCfovl3d9uMxbuE8Syj42Slf2bYNuB0Awj28moubKryYW
	ZRPsrOwfzHSGyq6knozgbfXYH+vNlc5ndt9yb066UvNE0+wEB62cIXthLsQHV8Tu3B+WiNVZfVM
	6+HNFqVNPkSuVeOZW
X-Google-Smtp-Source: AGHT+IFqavb84q465UWZ6gGwXgO+FxfrEo4gdscEtW86lZSTJTKpRR6rT4g7qMsIZYvAutdo4gpnMQ==
X-Received: by 2002:a17:906:4c9:b0:aa5:cec:2785 with SMTP id a640c23a62f3a-aa50cec28b3mr343858766b.25.1732313817919;
        Fri, 22 Nov 2024 14:16:57 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52fcebsm148226466b.127.2024.11.22.14.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:16:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 03/12] can: sun4i_can: continue to use likely() to check skb
Date: Fri, 22 Nov 2024 23:15:44 +0100
Message-ID: <20241122221650.633981-4-dario.binacchi@amarulasolutions.com>
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

Throughout the sun4i_can_err() function, the likely() macro is used to
check the skb buffer, except in one instance. This patch makes the code
consistent by using the macro in that case as well.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Added in v2

 drivers/net/can/sun4i_can.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 17f94cca93fb..840b972498c1 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -570,7 +570,7 @@ static int sun4i_can_err(struct net_device *dev, u8 isrc, u8 status)
 		else
 			state = CAN_STATE_ERROR_ACTIVE;
 	}
-	if (skb && state != CAN_STATE_BUS_OFF) {
+	if (likely(skb) && state != CAN_STATE_BUS_OFF) {
 		cf->can_id |= CAN_ERR_CNT;
 		cf->data[6] = txerr;
 		cf->data[7] = rxerr;
-- 
2.43.0

