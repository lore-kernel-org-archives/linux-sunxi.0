Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C31553B7
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509870; cv=none; b=QWX1R1DYtIeTUY3cixjxh4noOvleENS9odfMwIp4J+ep5z7AktcwvZ16guW7mjJVe9sO4QdDmWshEp8INvDCCwz7Pm1Aa04mln0wOjWjG2V6/fu2k45kZknXtsI+TBB0c/06pPsy6SOm/XyzFubY8Qv3AAOonGYHL65YTJ8R4o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509870; c=relaxed/simple;
	bh=z+lGZlowZLX9dvF58rYUpc9T2wArxI80gBzLlyOWaSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4e/BNTIwsXG9wbcZn0ZyY9kiCZJViGg4XG9q2CG1KK7LojuPhntPEiSHgvs8BdbsxY1Nlk0nULPh48KtomHaeAT23BUQsoo6CDFBGxzhqv8tRnLjprUGmpetfl+HoCQM2drKQoH23OmSujkrc3ZcNIv/X4BKC/4IykTW0E5heA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2XMWNG9; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2XMWNG9"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-70f6732a16dso268000a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509868; x=1726114668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOurL+niKTuTYRrWkCUZcFZDU3uO6ZkmtonuLPtkVjM=;
        b=O2XMWNG9kLcTZCVRTk5Ab4YK2bbIl9s8e04iAomMI3cq1KipD6yKQxVGGRnLnqZvuf
         wvo0NX054/ws1mu9vGUteQ4sEm7WoXSI8MdDvyyTReKHqooClFRW6HF2SVlsMDITB9Fi
         F7rBhFqFJBvXjb+XwrDmTYMDFCEHIneYrQ/MuBif7kbLJYpEdAEw/2R/rQmYJzsfdSK3
         tGXK8Znlt3FTfR4TNUwxcNGVZw56FfBFl9f1WS7IHAOB6PsGKHNwKO8896wsjNsKIeTJ
         cGrphaHET+VHANDyNhK761KcJVyCpOiQba4/MAeBuoBb+9V0fWR4u+9n2hiNWUjePdId
         tZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509868; x=1726114668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOurL+niKTuTYRrWkCUZcFZDU3uO6ZkmtonuLPtkVjM=;
        b=sVPgXJkN+wn//ybGZjiC9135Zt5N55yVykag5ydikFFqlfL2pfR/Edsid18m1rgEgU
         rUweiS49Fmavlsox3iZLTtovKuMmBLlzloinTF4RN6VnpybReNROzoyTfj/GVxZbUPAZ
         r8CZCXN2U8xcghwepfQZxunwGRunHml9B/YL+hKW8H/DZmBtwix0inGyN7DCAzvnVKpn
         dixr5Sgd4BwEy+CqzlJUUhYmvcVZaw3MqyMGVBqz5Qiv/lKZxuO32jPRawL8kmIivP9R
         ZsuXWV5ON4woJ/ccTjRAr/q1TPacXWRz38wmf6eShWq7c9y0olhJbSDZdDho9AqLJxh+
         5rVg==
X-Forwarded-Encrypted: i=1; AJvYcCUOrj1XScw9C47ApoEW+k8+fw0ZPpy6MhQcyiEJE/Gka0mriMXy/LFY0BKCWEgxzrLFvf9RdlaEy9wvzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUdUE0NA8Kxa5/VE4v5tRMlDsutWDhpjH8caBSL886NZes7SfJ
	9BXS1SDjhlJwlO5poXHqJeoT+vDouKm+eWN6FRDebRZFH3SeEzGl
X-Google-Smtp-Source: AGHT+IGv36a3rXrN6zFd3TS7W1uho2zPf6Uqpg1TIUhSE/xaGckBL/aTYfQZ78HZQTFPboprAViM+w==
X-Received: by 2002:a05:6830:268f:b0:70a:948c:6b3f with SMTP id 46e09a7af769-710aada57c6mr9102268a34.12.1725509868353;
        Wed, 04 Sep 2024 21:17:48 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:17:47 -0700 (PDT)
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
Subject: [PATCH 03/24] Input: alps - use guard notation when pausing serio port
Date: Wed,  4 Sep 2024 21:17:08 -0700
Message-ID: <20240905041732.2034348-4-dmitry.torokhov@gmail.com>
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
 drivers/input/mouse/alps.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 4e37fc3f1a9e..0728b5c08f02 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -1585,7 +1585,7 @@ static void alps_flush_packet(struct timer_list *t)
 	struct alps_data *priv = from_timer(priv, t, timer);
 	struct psmouse *psmouse = priv->psmouse;
 
-	serio_pause_rx(psmouse->ps2dev.serio);
+	guard(serio_pause_rx)(psmouse->ps2dev.serio);
 
 	if (psmouse->pktcnt == psmouse->pktsize) {
 
@@ -1605,8 +1605,6 @@ static void alps_flush_packet(struct timer_list *t)
 		}
 		psmouse->pktcnt = 0;
 	}
-
-	serio_continue_rx(psmouse->ps2dev.serio);
 }
 
 static psmouse_ret_t alps_process_byte(struct psmouse *psmouse)
-- 
2.46.0.469.g59c65b2a67-goog

