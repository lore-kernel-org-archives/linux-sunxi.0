Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BD530DD2F
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786179695; cv=none; b=WiwuAYSfmR/NuFYhKqTek/5AXHcrURsKrpsL7vLS/GCaLB6JPtE/t+ix72pl4OiM8d51BAfoxoxGbIeyr30G6o2ZH0wnR9bsNaxWUCmg7Jiy2YK9EbtNXU2VjL58JehO8AqrVHig8QGfC9esOwngUr5SJI649he/Q1a7/34NObE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786179695; c=relaxed/simple;
	bh=k2o7RLdEaMQf8liSnLShdk2zw3dk1hd297iCbzakkMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V0enV5p+v6o23QOgJ/oyRBQ5aEvByy9Ah0/LeACvaxmjzzGH8z8gBvXcapZ+McqT832sipE1FmneOHMMffjYh5SU082ZwH8k0tl4tEc9FvhB26OPjbdnCtgC+VSX5vvRtVUxdaCXH/4Tou+vKFNvJcu8BS4IlxxdD0YStMXfG1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Py0+0CTA; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Py0+0CTA"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e7109321dso175703a91.3
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Aug 2026 02:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179693; x=1786784493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z8XEbNxmFITtGAeV3qoLd7HeCqmH9Ffgh8sG2RD/33I=;
        b=Py0+0CTAF+5lNd7OWBXOF0i3ihZBw+YXw6dF9AO7p+IUjZgrKSR/HqCl13nd9YGap4
         jop9Ah+eZezN7D52hBJz3OA4412crusBUZrz4/ZRHjCRxlc7I32e7tuf80tk4VpXuQfZ
         9iBuXy4gJcUH/eundeiEz4M1HZwlNmJWSUnFoEG8F7zSASycEcuYgk2dK4g0V98UEUO1
         hIVc7yQjwvuk52vpuQFl3qACNn5sPoNi8+sM7CJTqQ2krR6trbWkBBuJoZ2Xg/ZefH8h
         ye6oiK1XsSSi1iHpfnAnKt/LflF4nUUOA1EPPW344pkOQEnaAeIRMnedI3h0+3Yr1C8S
         kXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179693; x=1786784493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8XEbNxmFITtGAeV3qoLd7HeCqmH9Ffgh8sG2RD/33I=;
        b=esdgYaiD9xcK6SCljRvDL/xwTSZD5AgRjyYqJqNVwWkV19dYS9CFJnwWahDjDUL5Lb
         CH/gxyyFonVcDacHEh6ZlBXvZ4P+f8mbW7pRLIzxah5Sn1lWMAmoN7KjvxvgJdDGYZQr
         SfRH6hOYFbfxhn1K4A+3M0LJ4CkaqY5BWuyqzv3uFalC4794/jkY/rOKse+ErkkSN99Y
         ASUMAthnJefsE3gQexgGRpDv6uOl9Buud7Fab9aezcUnJKTCnxKucKfdMuTxCqXBV84a
         g/jiJA6rslN3UrN+jYAVeo4w/+v9uq1/zlsYu4WWcQMheEoGRAf09tW393SYuG5G4vjv
         cv5g==
X-Forwarded-Encrypted: i=1; AHgh+RpH/+v0U0Q7eyP+e31PU4AOjQR5n+DS1v6J/3mAUe07TWfVCJd8ojejbMNjGFAwtxlR3SXVAGMpLxONkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRiOieJiSaY/afdxETc56JB7Zfgv5sA0jQMl3AHert8Wc3BlzO
	eGysyuaT8zD6lYF028Uwe7GRu7tz3wygHkt/khnl/lqeMo2evL9i0wAW
X-Gm-Gg: AR+sD12SyJbgkTOYgnrx8GK26+6SDp6yosMg5NX/3/vMJloMcck6qXKg9BvBmrBRl2t
	Inao7pwhY9Wfa8kNGw0+vOEFPnogWY/6WZziKDpldfwOuXZ20OKhTWB8NU+p8BW3CRg0X5uMi8k
	oB2sqzPZAZT/8BKzdROCb3NjyPKytbyw/TEFaFI0LrljUbBUS7xRu3OKJBzVzqpBar6DFHEDKe9
	RlchNFlZPZT+mtPNKaI/628Fhm6D4wG909+Npyio9DZX5xgCtFxaXNBUOHngc9kaWfkUkcJyz1N
	u7Y8f1y3kK1cHRqx6q2AcVZ6KweZkhy4DiEX0AMpesfAlHAb07M2AwnZoKjE7R8qv79mg04p1RH
	iH923BM8757uDgX5pSOCzVTOhIf2uF2lK8XoxWz3/RBL5kTpKrSIdeLCe//TK/GMbCjz+y6cN38
	BJ7Tjv672G51p8+mjTkRmSIkGINt3UxPxC7mKiE5IddAVwIy2apu9DksyncXB8ESY/5f4E
X-Received: by 2002:a17:90b:582e:b0:38e:485c:ebd3 with SMTP id 98e67ed59e1d1-392823d97aamr5991393a91.15.1786179692981;
        Sat, 08 Aug 2026 02:01:32 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff24b91sm5349083a91.9.2026.08.08.02.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:01:32 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] crypto: sun8i-ss: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 17:01:21 +0800
Message-ID: <20260808090121.2718855-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun8i_ss_pm_init() calls pm_runtime_use_autosuspend(), but the
autosuspend setting is not undone if pm_runtime_set_suspended() fails
or when runtime PM is later torn down by sun8i_ss_pm_exit().

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Undo the autosuspend setting when pm_runtime_set_suspended() fails and
in sun8i_ss_pm_exit() before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: f08fcced6d00 ("crypto: allwinner - Add sun8i-ss cryptographic offloader")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
index 59c9bc45ec0f..775355ac9f9e 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
@@ -664,14 +664,18 @@ static int sun8i_ss_pm_init(struct sun8i_ss_dev *ss)
 	pm_runtime_set_autosuspend_delay(ss->dev, 2000);
 
 	err = pm_runtime_set_suspended(ss->dev);
-	if (err)
+	if (err) {
+		pm_runtime_dont_use_autosuspend(ss->dev);
 		return err;
+	}
+
 	pm_runtime_enable(ss->dev);
 	return err;
 }
 
 static void sun8i_ss_pm_exit(struct sun8i_ss_dev *ss)
 {
+	pm_runtime_dont_use_autosuspend(ss->dev);
 	pm_runtime_disable(ss->dev);
 }
 
-- 
2.43.0

