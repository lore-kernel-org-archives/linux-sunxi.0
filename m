Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC833D331E
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184652; cv=none; b=u7uc8eDWZDcjNHQe7D6RCloNuFwq3K7Rv60F3vp7BuBVge4PYymci1bsD7pdBYfxrCW4ZTi9jLNiH4TdqO3OgUO5WDJhfgo+Xu1B1u2/1PimHXt6Ijgx2OsjzQXr5wBDTUKGRDwcGh1iRy1NG/EkZgiOpSMX7E4WKorMtjsZlK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184652; c=relaxed/simple;
	bh=as2uxtCX7qs4PDPkqSWMGU871k2muPPEc2yUiG+20Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lx+8eT/JyBBE4DDNu0do1j3DYvu0EjCkDjw4L7y9enY10koyM5hllIj6/XcEbp0ZHMmf5jGaAipABmqDkZiDRdjLKlVkGoCVvvLLGHOUkwlwKGnBKOvUncw3c1FIb9cfgvBVgdOsCf7O96W2hWGj2V6/HV0bP3FU1mb77nuAriQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtO4gNpb; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtO4gNpb"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848743155bcso1179131b3a.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184650; x=1785789450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLfj4e7PYbv17pgcUAJcNclY2K/xl/o48sCMhXJ1vaY=;
        b=OtO4gNpboEHfdkrIA58snNrCSkthtoaxoATjpzeCDKQOLRMzb8aQ/pYppiAg9O+7p1
         UPjXdIxKiiyAjnBTVwq4bUyBS7M7az1yU/yoLqrxDiE0r70c+QKZCDBaVd+5fUqAKP0L
         ltozwr109snb3F/hwt2CcHpE/mwqQr6Vie2sX3q11rvvr+c6MR3tYeIRVH8hXP3H6LrU
         ed88PjIzh4QP+fdKtVWq47uwv2B1neoB7hcsS4A6zt7ECkwssEb74hcaWbXKXqGbWCFH
         DV5KOKQQsZIjrx/7zOym+QyZFevFs62D1r/QzduQ6Eo+aIA/4MQmjoN1ZvgAHrMIlMZw
         JahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184650; x=1785789450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PLfj4e7PYbv17pgcUAJcNclY2K/xl/o48sCMhXJ1vaY=;
        b=OlNJ6PzmagPkByQ7lpaUCuNn8vWxtyWU26Dq401nKALqpIJ9BBm3JWvC78KeziRqmp
         FpJbUxSpEdWAOSfso880ic6BfXtPJ6qqENKBOWYjPfpM/1sg+ST3ksm7jCYrOtr7DI4c
         vQUePPbhCxvqG9Qbj2Tu8ShU9PzjbpdaGnRNIjaqReVQq0CLbidCc6DtuAoUici7mnx+
         C9DzLab8jRhQz5SdEjGh/C2DXFFHOoyL8DyByZmHhWqUGulnasDrG2fFGNKV1I1nWIJb
         epUoSqyaFeIq2mRYWptn6v4igtYB+TaYR3FGQhtAZwAx4SEGtf5aDtDWlu5rT2BqUCV9
         ACug==
X-Forwarded-Encrypted: i=1; AHgh+RqZXFHTYqY64ttHBsnJ2ljhhH8wN9Mq09zsYpBNTCD2XBe02VwCE6RSLTZhDo0Z3zUyO4rOD16VOqGduA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCZAaJ6o7bTUjQMwEuYirMLV6kzOCkVuI05wjtZ9zLo3kjHhCR
	eNc12mnbiQZ1qgwMfcabe3S4NGcJJiZb+4muhX91t2aQVolfWtQDf5ri
X-Gm-Gg: AR+sD11sWrbFh5DvkwcfDnyfphSt6t91bghcKbEwNJTt8uAOVwTt15v7DvZxSa/8Qrf
	KebfSmr6HLYfmqc2+JOD0nQ9jriIkeTVvMZ0UB5C9Y9Xm1nsv+pZVrjpLE5QGF3dGfUoeX0C/8S
	zjiDLMyc6eIf6su7xrO3MUfK/QP16MDMj/LJEuiIijOc3bJWSwoS9TosLx/Q1vuObpnvCPbaUrL
	wm8JmG6zLgkqTQHBo+9WwvVu39+qsHr/SnXpXl4d9HMIRoFd9EdZXGNqbW3iqQypqOA2FTCacLc
	Cs8kZtkTkHLQhRBkwlM1OqSvjrrxIVuYz3yqOxy9jTsi8j0y8rJm7L4cClBU1cwdCtjUjlaz0Q9
	+eGIjpwE+sdCpcLYN5UPyXqey1HrBGloHWjsUXclVFLTRPikw9IBfaQcxlmDWaMMkOaHOMNhCbe
	Z2IjHm
X-Received: by 2002:aa7:8888:0:b0:84e:456d:aa5b with SMTP id d2e1a72fcca58-84e595f7ed2mr8128845b3a.72.1785184650522;
        Mon, 27 Jul 2026 13:37:30 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5327f116sm3507549b3a.16.2026.07.27.13.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:37:30 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 33/64] dmaengine: sun6i: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:36:10 -0700
Message-ID: <176cf55cdf7e686ba064befa2b257f3ae76696ab.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dma_chan_kill_bh() for virt-dma channel cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a9a254dbf8cb..9289c24dfcfa 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -1097,7 +1097,7 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 		struct sun6i_vchan *vchan = &sdev->vchans[i];
 
 		list_del(&vchan->vc.chan.device_node);
-		tasklet_kill(&vchan->vc.task);
+		dma_chan_kill_bh(&vchan->vc.chan);
 	}
 }
 
-- 
2.43.0

