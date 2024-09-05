Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E6017ADE7
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509876; cv=none; b=YwYOdCvIaiW+aGMldu6vauB3HXHHGGDO+ZnjFqILzx40ckErpTOsAfdqf4+UHJie7vxRXUM+TWZSjL9cEc05JNLJX5Dyqc4Cud7WtEhRsfh+Afn7KAq5oKQsCp4UOCFaixgPx5jWPTXrMqwsDynxSrgcg+GvC2crrGtbW2TlGic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509876; c=relaxed/simple;
	bh=BenMc1sLXCG+5vmkHGPDz29enhWQ1tx8bPuULH06bMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SgZmuuOgLLG1gRNyirFC1pM/PfD2W4NS6i7rVkLUi+3BUlcTEydb3R9acruTwm9zERFoMMxrK6305GS7eGrfJdU1tf46z87u+m91AaS8vOICys8P3ZUlzyWqwddc9Xct3DDh/OHhnx6OC6dXLSzeF7VlrTORrlrjhRcdAxH2XEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsxpND98; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsxpND98"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5e017808428so224214eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509874; x=1726114674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8VPXswHBHTUlmDFHKrQ5BC1wv3BR4y3AP5bfe5KlEs=;
        b=NsxpND98azteG56B7yT+ZxUhICy6VsLN54kAo6sNY4msWr2lklW69xUvtsK9i3CWrg
         V1hDK1sNQOYih6Dh80yjV1ejU63NdfrhQmuk5JA+4S3oEnRxbWRmwsv83mH+65t/Sj5O
         neUtSEw83ByKOzSvlEstdu3SWQj6cXyckPFRyWWL9RIlTrkBz1H+fUqexhSfSfIpyjB2
         4MkI2q56XrJPKWFGYA0eJbTvx2MzNZf3xcVlpJ33UOjLdcMzz9HkXxjIz1+JQLtZ2npi
         W8ILA+OKsJbDXWSgTaGnLt+Yj57RM0tpJ7ox2Igq1rdSHNokYw7KZSwnj/v6s2yCLwY8
         WD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509874; x=1726114674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8VPXswHBHTUlmDFHKrQ5BC1wv3BR4y3AP5bfe5KlEs=;
        b=N5pUy7X9vAi2LsSRvnEuiUpJzmXQ88Y4janJpqdGHY4U6Bvh1+J5Zam2BneB3rZQFT
         a1sKcMoLh8ynD8obi/M6mGqaFXG8g/l39cFJBqAE7Z+Molz8xZEO3ZgCn0DZCDO1TbAV
         YOKrVwwctNqpT06S5P4iyElOcoE9awRtF8IylWIk5HEuL7V7b8y6SpqOaqCKhDNwTY9u
         j/FZcFdHBvYNLMevRelIeZuOqSwTdTuNlRlrADZBLkYwwSulY9J6h7rDrmmfXNSV0Geg
         85eDeFDscxHLQ5lPeeUGT+M9ugppJVgFSSI+zrUOlz10OCx368iftcPtpwHSJwzOQG07
         P3ww==
X-Forwarded-Encrypted: i=1; AJvYcCVOIhPomRwx7/pwy1B40GcIqN6i6tdC7nUWHDlWxAanABzYyeU2v284UfARNQIxZTQ73sWMx96LlpjuIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPQj83vSVUY1nrQ4hCPrzP8GesvEklmCQztzBLw5xhwWqViG+q
	gl04DmkHWlYYRMldRt973VP8UzIfbGOorokZVYFkwLcJ+ZPaGhpi
X-Google-Smtp-Source: AGHT+IGI2QjJK2UofL6z1AHMX7SrEpAd/PMAyIbsnSlBJf71WYXVl7JagSZR9Rgb4HVgwu3bRh55Vg==
X-Received: by 2002:a05:6358:898:b0:1b8:f18:3e53 with SMTP id e5c5f4694b2df-1b8117bcb29mr1047970355d.9.1725509874043;
        Wed, 04 Sep 2024 21:17:54 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:17:53 -0700 (PDT)
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
Subject: [PATCH 07/24] Input: sunkbd - use guard notation when pausing serio port
Date: Wed,  4 Sep 2024 21:17:12 -0700
Message-ID: <20240905041732.2034348-8-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/sunkbd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/sunkbd.c b/drivers/input/keyboard/sunkbd.c
index 72fb46029710..3299e1919b37 100644
--- a/drivers/input/keyboard/sunkbd.c
+++ b/drivers/input/keyboard/sunkbd.c
@@ -241,9 +241,8 @@ static void sunkbd_reinit(struct work_struct *work)
 
 static void sunkbd_enable(struct sunkbd *sunkbd, bool enable)
 {
-	serio_pause_rx(sunkbd->serio);
-	sunkbd->enabled = enable;
-	serio_continue_rx(sunkbd->serio);
+	scoped_guard(serio_pause_rx, sunkbd->serio)
+		sunkbd->enabled = enable;
 
 	if (!enable) {
 		wake_up_interruptible(&sunkbd->wait);
-- 
2.46.0.469.g59c65b2a67-goog

