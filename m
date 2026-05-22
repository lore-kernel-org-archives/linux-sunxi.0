Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F7E3C4572
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443677; cv=none; b=DniAwfps1BQ6d0MjTywsQIY4PLq1335cFRmyirC+JDs9Zq7+AoKAeW4ZCrPpB+j3i7IiV82p6CIS4Zzx0zBSTzo2EBaK3neCi7ZbmUHvfyk+qVU9YI4MSkb15AJBsZaw4YwMBCfqY4Ku1EW2TwI4V1JPPEpFTlaVY3X+EiezBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443677; c=relaxed/simple;
	bh=qbDGhHNnk9OCLZQ1PGxrrKjrGTP1fFlGw+ruMcn44HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fqw/6theIKMVR/+TiA9J4/BLhnYFeXlt6Z2xaIL3OsgC5B9x0YmzBBQR1k9MK5dWXleblzUY7QPpOWVMnYCTPdutOpVkLT3mSxE/q0CqKYry7zUSyszsDTCbKilOH0Yh1av6Cd8nfn9HuA45uN3ymLTWfLtxxs1JShjNB1mgzAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3vz9O+K; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3vz9O+K"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so3327705b3a.1
        for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443674; x=1780048474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZzUxIkdaJ6gBxa9mowChRFjkNJFrAHd972GUGZ8zKk=;
        b=m3vz9O+KzpIGoC8nrzwg0BrIBZBJou5Ys66qkHFPM7/5gxoXDEW5+wf3sCtctTfajL
         eG4hQhGgroGnMy8p+KpLRkhY5ab188lMm1mtoPQinRFn3HRZKmWvxQUOzCIND2oAfMzP
         /HvHJrNNWEjHgg+Bv7NSkRvw7ksVYdjkve3sDRXiov+QBMvatpTypskbckVD5sUzf9L/
         Vz+X24TQl4pDCk2+L4rw5/rKb7KoSK5J3OCuitjBcMp6qtP/HxtfA/2AaSWikBHWubAX
         MojYnqHrBBvqGvlx+f/+UpXU6EMGg428+H6iYfrJxLtVXJ7Z9OEGEyUJpwvAeGhIdCle
         Qcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443674; x=1780048474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZzUxIkdaJ6gBxa9mowChRFjkNJFrAHd972GUGZ8zKk=;
        b=NNk5YgZ0tvkkUJME8bTzCbfjN8loi3XLKo/jl3uSDpi8zGid1lV0PwARnAknT0PUzs
         fToNbI2Bk+Dxv5kVdLh4A0/dG0PAYJURzlLuwUBSMfq8g7Egf+WJEipRxnr27hezPrJF
         IjKOUllfxp90JSkb2qYXI0o+tT155M1s4U2fcTvST92GZJTAYAHTj2POuWZ5FGBLT7IL
         bjXOkyvsRTswlPj97l5bwqHnN5Hp8dJk6gUzLrtwjUAUVgdbXosS0qH7vQPmbQNdf/u0
         Tc2Q1Me2pOMJCOmpJtbpNQrShcKUCxA/HFqXlxHx39km2QyLXMWIfzsT5MbNfErdHveK
         pvgg==
X-Forwarded-Encrypted: i=1; AFNElJ/G430Bdr+MQORM5sln2IGCwZlUODEwkzebuLundo5xUvIO3V/vFq2cD6m7pCbinEfl7lEOf2N2aK+Q1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxATvmvBvlH3iIkiP73MEUUzNxItWhzD7EAyjrwJmWk1v4HPnM6
	NEy+sbWHFT1E6R4nnbLGQlNVQVE2T6/Dht/mhG0zsqnXvllEd563ATkW
X-Gm-Gg: Acq92OG8uU5JDs8NKD+hwkZ9aYrtx+CyXNETGGULmEK+eqx0OWhJekgbhM8Sq1OaBPq
	+J5MBhS5mFEUZrwuruq/F2GBDcPwofoHtbP6Yge9MhPjObI3X0rzg+o9qeLWHjbgqg8b6iu2K0Q
	YU3EURcTtr7rw3/7g6RxPzt8be/cPp8FF7jtkAEKz3VbPINnG516/XE+qKo7L7SRAzRLSdm/OOw
	EmtlAdff/lQhM1cC4Zxu6RIQv4lLro2mdLo503bDqc+CXrLFb+pywPG7jaNo7Sh8jsW2pGMGNLh
	I1Ne5pJ70L563qsYNKIQNiFclJ4Gxhk6e7osLacTRx0rm3s7KVIeIsGeKXxUDOfY6RGoy4cdSET
	MPhIqdbwUc5Kj2SwCWJOphDDFklySPoVDJtvCfh74QlNxT6ykRN0tsMc877qUWe/tnjAgp3zr0f
	sPC5My0vG2MXehmXAOaDY//Xh+UxH+J/3XYNvYcpgbAg/UO15M5B2KW8I4ZQ==
X-Received: by 2002:a05:6a00:17a4:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-8415f3f68ccmr3185755b3a.49.1779443674325;
        Fri, 22 May 2026 02:54:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aed7c9sm1757366b3a.13.2026.05.22.02.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:54:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: codekipper@gmail.com,
	jernej.skrabec@gmail.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	nichen@iscas.ac.cn,
	perex@perex.cz,
	samuel@sholland.org,
	tiwai@suse.com,
	wens@kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
Date: Fri, 22 May 2026 16:54:01 +0700
Message-ID: <20260522095401.72915-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522095401.72915-1-phucduc.bui@gmail.com>
References: <20260522095401.72915-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the APB bus clock before the SPDIF module clock
during runtime resume, as register accesses depend on the
bus clock being enabled first.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index f54eb14c9ed8..102db1a2afbb 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -643,15 +643,15 @@ static int sun4i_spdif_runtime_suspend(struct device *dev)
 
 static int sun4i_spdif_runtime_resume(struct device *dev)
 {
-	struct sun4i_spdif_dev *host  = dev_get_drvdata(dev);
+	struct sun4i_spdif_dev *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(host->spdif_clk);
+	ret = clk_prepare_enable(host->apb_clk);
 	if (ret)
 		return ret;
-	ret = clk_prepare_enable(host->apb_clk);
+	ret = clk_prepare_enable(host->spdif_clk);
 	if (ret)
-		clk_disable_unprepare(host->spdif_clk);
+		clk_disable_unprepare(host->apb_clk);
 
 	return ret;
 }
-- 
2.43.0

