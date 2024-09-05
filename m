Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE5017623F
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509874; cv=none; b=Q+0XVwhHFQTVWgHqngoA82VJJMJbFueBUEnj7NK6fK1G59VtkLxYplvzBQYOrzwqD2IZIGIsg/BZvsnGW56WHuvPRJYpLkX6vD0gMfOPpwvLhBsFK/oOOkIc7mLzVAZ+9WWLRuQBik5jWPFAVWotibClNMGw5nBrnlpvZw7DGac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509874; c=relaxed/simple;
	bh=K3lNfpiPv/q6z+V6V8RF6mvsiNWEY/iFwwY6BFi6TGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1/TqFGRgx6ep/MKLJaTnP7wqDEEb2s/eKPs4KCiHRCuAJGD2hj4fcQZ89h2+2zRVhpLzT+/8yCK6hpEI8umVkevzaLrjhzWMsiqtFoH0A7UT4c5HdWYG9PDtT1+waeMgQwvpHjEc8EyGiBsMZUJAe9Z5fQq8BEIKv8lz3nuYNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3UjO1mv; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3UjO1mv"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7cd830e0711so220029a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509873; x=1726114673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7/TrOieKDmokvB+76CstcAo/MHXLXuZvmD2LpyYQbI=;
        b=j3UjO1mv9Pdo6dJrR/TuBDJ2T6V0P7/gpRWQgD1CsJRJ+jCDBRR5t2XfPcqUOGx9L9
         UC44jlFnGA4FVRs+TUfdOIN7/k2+bCks6VGhYq9ltGsqckDTpVo1cRfjC+AKz1w9OOUu
         eA7CIDRlcJZ2d/sWJL0tGEr4ndU9PDYHR71Xz4hQdGpjBevc+4Vl5PbskPI94/E1PfRG
         XLKnVxsqfljMAJOa3W5Kne8pvpuCfjYAQilVFWyzXqAgIaTxeh9mt6fLZ5oXtVmNbKUl
         uQnzK8m8uAbccTkx3LOvBHh58or1KibcsFmytehZCN6/viPDw87MSf3o+HqFyLCmDaCJ
         elmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509873; x=1726114673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7/TrOieKDmokvB+76CstcAo/MHXLXuZvmD2LpyYQbI=;
        b=vPOLKn+yDRQL1PtWCEdCYxgH2Lwn2uZJXtshzX/wJedw0k5QtrqGA5gkKNeSs4lypQ
         G3wpW2hUvu+UHpubr/At97Jp49VUfNvCelhVDLIXpov/iyjMyovAJCMa4uffHtKdB1gE
         8LlPH70lSkNs2sVP0Vs+5Pb0hyjuqjQzYhRB+p1mAuHclLmE2QAXZwp5llDdmGKSlxML
         wDA88OYOx75KgQLhzMxoVeP40TExClWjn9tMp4KzNaG/DDYwH2aAOG4MqSol4zGCh93S
         9ytQ7drPXOFauozNboMUkaImMwiJkbs0E9mNv9yXCemG11z0meg0M+93SBbFTkhUa3o7
         rG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9VfjI1TWrGd8uyT8tin5jEzaCmqL46z6TA7aP5CRHqjsVJUbU4b7+wqe8vpVHWgB+P+WmzTSuruDy2w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzi1Ew0vrk8nV1d+zELALQHdm8+dzjjIPl+laTT6xrEhqJYsFv
	hZIFNIPYlMq3iY5cXlZUCSpDR1gyHWYrIgNVcPLbMHxoHSeJc4a3
X-Google-Smtp-Source: AGHT+IEVTNgBOGvJQB0FLDExyZ1paUWKmbJHsocyoE4L6WqC4aDyBtqt1vWJsKWhqiIBmoYibKVEkg==
X-Received: by 2002:a17:902:e5ce:b0:206:a6fe:2343 with SMTP id d9443c01a7336-206b7d0aaf2mr83347615ad.8.1725509872338;
        Wed, 04 Sep 2024 21:17:52 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:17:52 -0700 (PDT)
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
Subject: [PATCH 06/24] Input: atkbd - use guard notation when pausing serio port
Date: Wed,  4 Sep 2024 21:17:11 -0700
Message-ID: <20240905041732.2034348-7-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/atkbd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 5855d4fc6e6a..ec94fcfa4cde 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -713,9 +713,9 @@ static int atkbd_event(struct input_dev *dev,
 
 static inline void atkbd_enable(struct atkbd *atkbd)
 {
-	serio_pause_rx(atkbd->ps2dev.serio);
+	guard(serio_pause_rx)(atkbd->ps2dev.serio);
+
 	atkbd->enabled = true;
-	serio_continue_rx(atkbd->ps2dev.serio);
 }
 
 /*
@@ -725,9 +725,9 @@ static inline void atkbd_enable(struct atkbd *atkbd)
 
 static inline void atkbd_disable(struct atkbd *atkbd)
 {
-	serio_pause_rx(atkbd->ps2dev.serio);
+	guard(serio_pause_rx)(atkbd->ps2dev.serio);
+
 	atkbd->enabled = false;
-	serio_continue_rx(atkbd->ps2dev.serio);
 }
 
 static int atkbd_activate(struct atkbd *atkbd)
-- 
2.46.0.469.g59c65b2a67-goog

