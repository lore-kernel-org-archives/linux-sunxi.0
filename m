Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3920156883
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509872; cv=none; b=f8raxnuQqbAK1St1ipeTZPXAAvyGv5nZ8dyWU+7YYxV6Wm/MVqB5EaSkBCoaqs2Z1MpNpZltAhHJzy/Sng8izTMbNRUw3TPuZ8xAoRkrh4dQWBvL3wE+a5xzjSbluow5Ao0eDNsLQUimQRVlWfsTyeiyyv//DUg1h1ZP6voIYwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509872; c=relaxed/simple;
	bh=jD9Ue/cXOL5pkFXSYKDYrZ35NLToW/Fmj0WfDt8SVLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9pm8WvMdh1rHTVZPAJoIqQoEepEB/QNkqjrGJdDFDa8o+ia8Remvhhsqn0q+3wCYq80UqfCBBwOTp+k/rQX26TCqMKCdKkS4UJFYEzJB6/RuEY50wuqcwVlQvLT0+VkO5O56e/+5o8BD0/1oDN8WNdJtvYJDSv2p+ex1lVHQJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZMWiqlX; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZMWiqlX"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-70f79f75da6so241683a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509870; x=1726114670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RnFN3EVlk3VoY/i2sKWDmOIShT35NS9PrPlyqQEJBY=;
        b=SZMWiqlXRiBIFX0frMGEg2mON3lx0r+7Thl+MEsOAicqrRbgPHzHgDM6cz2TbMO+jl
         eDkxMpitcgRsEZMuKvwSq2sLk5zmk7SQFcMc6SVT8XF4ASsHOqQ+jZZxEZppaIEpvGw+
         4pU2jIep3yp56ZL0R1IgYHQkFl5iTrjgkKPQxtBcj1RNxApaxaVGeApwg14DgRT2fx4f
         8Dg0RJeMnN3y6S+Ou04kVbw4x9JVKzB/PGEYRRpQC4KE86G6/bFra1pzwEi80uEep2t7
         v5WYteoQICIycwzTh6OaaHgEWrZX9RWNKx6N+kYE5FmaqW7TwBB6yIfjvu4wNcEw8YBZ
         J3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509870; x=1726114670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RnFN3EVlk3VoY/i2sKWDmOIShT35NS9PrPlyqQEJBY=;
        b=OuNYt0dvgywnqbgyOl3+HOHgmJcpd6uAI6tFyPNrPxz1GQuMRMLrun0PeTucx8Kyqz
         VCLu9jyOIsPHp/93wxqjjRQs601E3Mo8Bs2fpruBbBTaeiP4WsWGA1LV0Ne9n9TKRJk1
         A5mntOltwYfJy1OHkq3smmdFxEHgG/OQ+9ooD7zBtzz8ROzldTQgjA5fDhe4Q1toQR7S
         OwMYBH7CxTFulZ1ZXnKS+Ar35nPZeC5wb0aF72Gt2UTKNYvkKAhRodPboNigfQUCepXZ
         /cjEGNrynpvXG3XcZvDbEHbCvrSE+Vo0tomHsgm5UHKdU21DNyKU+CWFMtm8+mtCOX6q
         54ow==
X-Forwarded-Encrypted: i=1; AJvYcCXFLbEbCA/4pSKd5my7X4ydZT6eSj3/+KK4oQ5PK90Vcyqw4ImxW0De0gcJ9xPCFT5sN1CD7ZRhJW5e8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMmDyZUQrBFUn0O0oicGjxHSpF297DtPXsssY1WhMKah/zm3zw
	XUh5ysMAgfVpfN4bs7YlqmRneyX8z7IEzcEJlNBDNe+h12lzfOw+
X-Google-Smtp-Source: AGHT+IErwMioNhwmn1dsG6jz5WUbE6Tfb09I0yh8Z59wc3+setGX3kYdpiz4wU4pA3/BcQ951wC+fg==
X-Received: by 2002:a05:6830:2709:b0:70d:f448:575c with SMTP id 46e09a7af769-70f706e362amr17541035a34.7.1725509869713;
        Wed, 04 Sep 2024 21:17:49 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:17:49 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Helge Deller <deller@gmx.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Samuel Holland <samuel@sholland.org>,
	Lyude Paul <thatslyude@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 04/24] Input: byd - use guard notation when pausing serio port
Date: Wed,  4 Sep 2024 21:17:09 -0700
Message-ID: <20240905041732.2034348-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240905041732.2034348-1-dmitry.torokhov@gmail.com>
References: <20240905041732.2034348-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that serio ports are resumed in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/byd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/byd.c b/drivers/input/mouse/byd.c
index 221a553f45cd..654b38d249f3 100644
--- a/drivers/input/mouse/byd.c
+++ b/drivers/input/mouse/byd.c
@@ -254,13 +254,12 @@ static void byd_clear_touch(struct timer_list *t)
 	struct byd_data *priv = from_timer(priv, t, timer);
 	struct psmouse *psmouse = priv->psmouse;
 
-	serio_pause_rx(psmouse->ps2dev.serio);
+	guard(serio_pause_rx)(psmouse->ps2dev.serio);
+
 	priv->touch = false;
 
 	byd_report_input(psmouse);
 
-	serio_continue_rx(psmouse->ps2dev.serio);
-
 	/*
 	 * Move cursor back to center of pad when we lose touch - this
 	 * specifically improves user experience when moving cursor with one
-- 
2.46.0.469.g59c65b2a67-goog

