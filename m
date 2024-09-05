Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53550142E7C
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509866; cv=none; b=AY5GvqyaRZz+ARaCiV70pCnemdRzqvxIc1/76/b8pes19dYn9pVkfp9Z62TOy/4TMPIUUXs/rhDRrx8YidQJ+lmLH3XgMi4YY8vytxAtmWYyj2uG9djPNG/fdZe0jlyH5OUGE+R4oew4TyRdGu1vTSOWQYQe+BHbReyIxgHYvcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509866; c=relaxed/simple;
	bh=6p25Gf4otRQlWovvwdYJlg/QmPufJ3SpgDun2WG9K0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RS1xWPGNctBEqO5AqpqeQ7xmXJIZeUiHtZRstJD5D5rLlnCcKAWRD7W/429y0xeDwd8gy0SQ6El6B1uZBwE6BFoD+tBf5f4OInyRmEyRBeI3lw/OkopY3n2vBtrViOEaZsiAg5nOY5h0yOL6/0pS4YvhnMiZg5TqRe/r4x0KMgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uz/6xqCn; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uz/6xqCn"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3df09d398faso198837b6e.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509864; x=1726114664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSQ5nHDaIzTNEy48GC2iLuCGQVf+qFQuSKyHZ16Sx1U=;
        b=Uz/6xqCniJhKoLYzzAoCxZsKz4LO9ifc+rVtpBDSJI1RUldrQGlnLH4qS8PpaCmj7P
         2b+xH7t4OQSeBUv2PKM7RMChFdstM2Q223x6xvWmKbfuGdm2S43gSpCMzkvrt4mO04tK
         T8t+XqPyWl7H9jz6ch4+Lz0G4KSfCv7WeFcvJ2BfU76aAQ8Q+4IvB7AWX9MwVqUjgd2h
         D2ScMO4aIesl+XJKY53ztQcQ7yYoi7RzvLPCOYRGBjiYYDoNhcz4qyuhicJnRC4t740p
         QeFjXsicBj8RsZz45E99ULRgP82WGZZoGHmz3jbmMuwXMTEevC55XN/0uq59lp2iUcdT
         WuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509864; x=1726114664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSQ5nHDaIzTNEy48GC2iLuCGQVf+qFQuSKyHZ16Sx1U=;
        b=dhdsvvNNs+cyJ8wkFE/xQJqWi2NDsBWxrW2JjD1ZmuYFcvHSjYOmIUcNrsevJSPeb6
         2y/eIK3mBAh3cDKfy+tKke9WNTwrstOf2mNUPhv03+45V7ysxybcb2u8UpNlkS1L2RrI
         +SOlUpNO85VjDdqIbiFfdbK3s6LR/77KIQxtKdeJQ1P4GHodB5+oSQcT28pZw96zUXVr
         P9MyYlmplXjbuoMuxDOypB8hOyMcWdeALy5qawYmvCa0Ehi/DIRjmX4F7XBccPRZT7+d
         wGJUKT6wNWhJaoFeETvgq7b6mvz/LobnJm1Mfu1qH3eMM39wFcbcYV3fAnv9hR59ba4q
         +M7w==
X-Forwarded-Encrypted: i=1; AJvYcCX9U+OGBuehLOdRs2F+hjSWPrFL6UoAf/V1g+iDMnryzrdWaQ3pPTEwViSsmQiUpoN+jsJwLLDocnPyVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZnb5q/+Z9ZTsdcHn0YSQs13bw/3w3xbzZiza/MN0iGPeU+u0f
	aJjsye+yybGRYriyxsgIYPcRyHU6KAAcmXR9yM1kqLXXar/O/gbE
X-Google-Smtp-Source: AGHT+IFOWA+kffVJfvYihB03juJQybTpapwcpoQKqlaiy/ZyXN6NKX8+I0jp6NbDCWaxTJ0rpgLL2A==
X-Received: by 2002:a05:6808:10c3:b0:3d9:e109:a6d3 with SMTP id 5614622812f47-3df1c98f83dmr19335301b6e.26.1725509864123;
        Wed, 04 Sep 2024 21:17:44 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:17:43 -0700 (PDT)
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
Subject: [PATCH 01/24] Input: serio - define serio_pause_rx guard to pause and resume serio ports
Date: Wed,  4 Sep 2024 21:17:06 -0700
Message-ID: <20240905041732.2034348-2-dmitry.torokhov@gmail.com>
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

serio_pause_rx() and serio_continue_rx() are usually used together to
temporarily stop receiving interrupts/data for a given serio port.
Define "serio_pause_rx" guard for this so that the port is always
resumed once critical section is over.

Example:

	scoped_guard(serio_pause_rx, elo->serio) {
		elo->expected_packet = toupper(packet[0]);
		init_completion(&elo->cmd_done);
	}

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/serio.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/serio.h b/include/linux/serio.h
index 1911827bbe0d..f4ca0aa37553 100644
--- a/include/linux/serio.h
+++ b/include/linux/serio.h
@@ -6,6 +6,7 @@
 #define _SERIO_H
 
 
+#include <linux/cleanup.h>
 #include <linux/types.h>
 #include <linux/interrupt.h>
 #include <linux/list.h>
@@ -161,4 +162,6 @@ static inline void serio_continue_rx(struct serio *serio)
 	spin_unlock_irq(&serio->lock);
 }
 
+DEFINE_GUARD(serio_pause_rx, struct serio *, serio_pause_rx(_T), serio_continue_rx(_T))
+
 #endif
-- 
2.46.0.469.g59c65b2a67-goog

