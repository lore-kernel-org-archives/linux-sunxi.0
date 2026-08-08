Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4233130C14C
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786179576; cv=none; b=RdBwyHy85nGtXVcUQwTmUsy5RGf4SjKEmWqJvIt4gilt8REa/EzJdNPa4dpHYSzMo6OarXc7L0+D/MkoUsS998QQskfTzuXmXqEoY7ncDvuJYlN0CfebdLOlSrPuSaslo3gqNJOdBuFT4k9A8UWl2R073+yVf7dRcOl48xQqu+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786179576; c=relaxed/simple;
	bh=k1jte4S6kmlNkWiF/TPSrh2PJp0JqoJa7csBL3XZxhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FYs87s8uvKd8/Oz0qHQ4BDBFVcwoCbAlgXMFfcssuF828ewhaFXQnYmuJQBgEGPQ6UxoCEFkgwN2IrdoLotmu8CBLvnwTUZgyeDLgfrnv6rbCpGaQjD51xHWB2gl+zYFiqVfo1WvUtE/miWZ7V5LiEtW9KE2yWCAEvMJT3aeyf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVZg8/P2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVZg8/P2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cacf197759so6219005ad.2
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Aug 2026 01:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179574; x=1786784374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/y7c/4lG8eevhNAw7vtPbWQQOLv7HTFTCbAr3jVwm4=;
        b=TVZg8/P2cVuH+6qHFjSl2qTSGGuh5uLnv+5eB/OM5hdkb5Yea7ktO5sQa2KIyI0Wlv
         dewqyz1lhAK3D6VpjAHwN2MM18oqeGCXa2j8Wl79J1GgBqJH69wOHmjp9sLlSyXcoIN4
         gNqyo3dXIB24IA6yFbBn4mmqLE3yeXb3n77xXKZxmsKkcWHL2s+hKagwHUb/1ogBrurk
         OLL2e2/u9xcoCkBSR53cIQpHZC5CNTXeyUPQIwoOGkMQTRFaNZrJZVCvTD50Trp5JEZK
         bg0eh/MDJXRqLfAabHI/LCtPlnY8WZ5LiEhh7ihUkLzEfNqPl4gAaslCypb0IX+5TZnt
         V5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179574; x=1786784374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/y7c/4lG8eevhNAw7vtPbWQQOLv7HTFTCbAr3jVwm4=;
        b=Yzfo492XOZFQ89jgF4EDvFvajZUkRAh3ql0s/RqJgzKuiEIE7oOkOhQ5RHcIg4sAhA
         aAPGgcTuplwmGclINkHCG3Ede/Xb9RsPnRmlBxcLvaKrXNvXSJM5Jlx39/BwSpCybQ0N
         ow4R5e2X8CAT7q7YoMF0c/i5R/560ki5+WdXJirmjqMcEeZmw4IkLei8mZiRAAdWBHA3
         /u5wsNvOpsoi3k/CJqmV6dkFk6RV+DQAhJVaOAP8QPE7B55bDUYxljt1gq6FEQOCj1M+
         eX2FQi/IgkqdX98glc0SP9P0ardrDQsHWKxeYJ7C4+DC009Uves+cFO0gHurN6GoAJQ/
         vjSw==
X-Forwarded-Encrypted: i=1; AHgh+RpY+ADI75JqM99ZZKarSNNXc/BMIE/y5rElL+M2Qz7MNbqoGu6Js4YPBQYfeHlxTemwlUcUiM3nnxgEQg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/Hxnnm4I4Hgu7gulMJeBgWzYU5r14kShffJnijbfY7cSas6Yo
	V4wbi6LLJ1wEmV+z4TcqAq3HocdESnz5+7U5G5DCPDvrG70fhRqOyjzT
X-Gm-Gg: AR+sD12A/U5QDY+gb2kS4vbAPkI5RvxRSNbkV7IdUO/ZNWOGlkMMhvKPWWb42lql6sT
	JAXvvYs6zvrEIMBnQZ97gzMEVfFXdeoQ1XtDj1K9amQo4WDu8Um26+pKwpcXTP7NlUDdOuUN2TP
	mBlmjy0jR2z27JThBqc8UpTPPBdHKhSANnobuW00lKCMfONPw6MRXUMWQt93fvy2mJWRrUW5RwW
	U0II7yvNuhflkdFxhdgsyz+XTlEaJCEcChRN+/6tJDt+RiZf6YheycStTyGal0/XJZTnea9jsF6
	NgH4cUProyj+lMfszC6iH5zp7k9GVZlWkm5DumeTzOXC8r9I7p/BM8gUHaPPimyzUkWkalKI3Dl
	L+5a5Xl+KQeMwNMwdZH8zc4R5GYSRGcB8fgGbBb6V2t4o2I/dXWbUsNcGmTXSZMS7Sw/CgyEX2G
	kOEgSOtVNqN1EAmvYqfflsds+QIqgfIpFHrIdiFCA9F1k=
X-Received: by 2002:a17:903:37cd:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d294b4b5b1mr126407935ad.9.1786179574331;
        Sat, 08 Aug 2026 01:59:34 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4a6db2sm17431155ad.64.2026.08.08.01.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:59:33 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] crypto: sun4i-ss: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 16:53:37 +0800
Message-ID: <20260808085337.2715506-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4i_ss_pm_init() calls pm_runtime_use_autosuspend(), but the
autosuspend setting is not undone if pm_runtime_set_suspended() fails
or when runtime PM is later torn down by sun4i_ss_pm_exit().

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Undo the autosuspend setting when pm_runtime_set_suspended() fails and
in sun4i_ss_pm_exit() before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 554c42b4efd4 ("crypto: sun4i-ss - enable pm_runtime")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
index 35ef0930e77f..10c0f05994ed 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
@@ -304,14 +304,17 @@ static int sun4i_ss_pm_init(struct sun4i_ss_ctx *ss)
 	pm_runtime_set_autosuspend_delay(ss->dev, 2000);
 
 	err = pm_runtime_set_suspended(ss->dev);
-	if (err)
+	if (err) {
+		pm_runtime_dont_use_autosuspend(ss->dev);
 		return err;
+	}
 	pm_runtime_enable(ss->dev);
 	return err;
 }
 
 static void sun4i_ss_pm_exit(struct sun4i_ss_ctx *ss)
 {
+	pm_runtime_dont_use_autosuspend(ss->dev);
 	pm_runtime_disable(ss->dev);
 }
 
-- 
2.43.0

