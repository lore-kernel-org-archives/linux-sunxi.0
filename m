Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A891230F957
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Dec 2025 20:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765572676; cv=none; b=OnpIiZzKRa+HRbux9XD3T8klfsCcaAR+baTSoyod7rTFgi7jwB0oOzJGc0aT12o1Q0bbksae+ce7+3Ov9xLv0F7YzeXWhFgvwIz+V/ctL449veGWeyPMhbEzt2HNQPVz2kMSvrM/9u9OlNFgfmeDAs79b0EYpeKAHFW1Od+Xc7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765572676; c=relaxed/simple;
	bh=HZElLVOBo++aUOfBn0dfeQ9TDOuzLpu6pDq8v/AVPfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kOXj7u6jlXFcHl2n5wBKa67BBGm6uJZGAVQTbbN5K3V/i9y95kL+9knw25dBnVDb7uGtpOvhfWd+JSVlV6suLlcN/ghDtmk7NNHnUmsRSD2faEldgzGaaZ8pcwojZcj5RP4SH5z79ifeNf7dZXXi5pALa8KKrb4+e8XNF53gOWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvXNn5Si; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvXNn5Si"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7636c96b9aso268894766b.2
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Dec 2025 12:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765572673; x=1766177473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjtjqxP7XdUENHCexmCRFp1dqpJh3fEH6pKkpxM/TLo=;
        b=ZvXNn5SiNOUzWt7p6ph3lPN92YaOzJGkGTctasM9QWRFWQpn/CktzY5cQqDYI7aEOR
         hurQd7nTbJMqzhqKVeL4fdSLFbaAEWJnA/MLXmA3V4m+2seVO76ByOdA77Sifo2YkwOt
         SR3YJ+NRBpOHGw6u0QslMgEP30SuwbKw2RoDdjgiLret8HECZ+1qioiw6m+Oz9MGTC8w
         Bl1sVJiE6EOcKWjIWjlukKXg/3epKIuTvm+0mmoTMqscJDj24lD4tuU/tk/cXRpmuCT3
         BpJGSL/RQziGDd9Id6YTQFukrXmUyuqVVvBux3/Vo94CLeW9sLGlKAjSD8gBqkt5BQeZ
         pdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765572673; x=1766177473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjtjqxP7XdUENHCexmCRFp1dqpJh3fEH6pKkpxM/TLo=;
        b=ELf4aAtiDr8IPQcqleIL9gMdj96SIBdNaDdg6wb8EKXjQLXobooXbmo8nmvk6v8YRh
         YK+JH+Thwdf2t766t106gMqxrNCq9QuVfqYJ8msHHDt9+D1Dpk8LTfB8jro0PvxNP10E
         gwYliayEzb58DmrEYiBo02yir03Dsh3ZVwx/wTVGqImqHn4RtpKoAYIXuM5y2Nh949Pd
         i6lWQsDQ2f/G+rSivU4kWk85th1J9hFKggMTqtlrFZ9myvY7ZYW05Y4pHpqLWTFfeHFd
         ANSy5+Di7IL8yZqxGnBnGEc8uGLVmbzcTrXE8+SSwWCy+2ZBYV/S+QZ+YRJqS3wKDr37
         eFqA==
X-Forwarded-Encrypted: i=1; AJvYcCWxtrEAyxipOFMcuTr6Q/jLQ0PPDyAR0K9BRFm0heMK/3se6Gw6cZV9lWNA0sLcHQ7Ks4ahmpoBaHXQSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJzAaQOfVp1hvcCwKdCACKeGzSmcO88EUmwsIO5mFOlKkTGVn0
	WHtgMngKbZx3vj5unNdUkfg9stnJiy3c9pUfGiF74RRRNGFfgDGiDn7v
X-Gm-Gg: AY/fxX7DNTe8sAb/37lhHxLDiKYmXTiEC1XrAGInnA1+gIJHSZltuNrzDCoXe4LBUnt
	w9vrj+ZjfLRe143LQj4dgeCJ9fgIu/Dn9qGNH9bV7zKpw7R+A9mHrldjQBlASYUFjeWR4X3eJl9
	ZMvCtFYO9J/E5aE2FzauUsXrRNLSZdwhhHzFo0EJa96c9x2bkpdrDMejsEK8vFlDRAdIMG2YFF5
	gAwAz6S4ajEB76whiV4ICcdbpV2jklMSN+59bgwGR4JLzWFpSA3EuobqzEcTg7o3kjXD20n1Tvg
	vvQJhxTOPC1HU8wKwbmm9j5MoplfwB5NXFumaNpY2Bf0/DqF2L0f1USiH/5/fpWdDweE9cCU47e
	3u4KG32MlO4x8YGYcrE9WA+cdREdnkKTbsetvyVQll9h29XghBM33PLZbX73dVdH2pSvke0PQ3i
	ouArEeRRhyJNRU4dU=
X-Google-Smtp-Source: AGHT+IH0G8rGAjvaE42wch55hSIA5VimrXWt5TN/hh537MIqh383tSvfDzdlGbn8S/gXANm16as6JQ==
X-Received: by 2002:a17:907:2d93:b0:b73:7158:d9cd with SMTP id a640c23a62f3a-b7d23a22af7mr366919966b.52.1765572672256;
        Fri, 12 Dec 2025 12:51:12 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:1401:37b6:6a29:b0c5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa570167sm656400366b.57.2025.12.12.12.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 12:51:11 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] dmaengine: sun4i: fix resource leak on promise allocation failure
Date: Fri, 12 Dec 2025 21:50:22 +0100
Message-ID: <20251212205022.83482-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When promise allocation fails in sun4i_dma_prep_dma_cyclic() or
sun4i_dma_prep_slave_sg(), the contract and already-allocated promises
are not freed, causing a resource leak.

Fix this by calling sun4i_dma_free_contract() to properly clean up
all resources before returning NULL on allocation failure.

This addresses the TODO comments that asked whether we should free
everything on error.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/dma/sun4i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 00d2fd38d17f..d81e705ae91f 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -861,7 +861,7 @@ sun4i_dma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf, size_t len,
 							plength, sconfig, dir);
 
 		if (!promise) {
-			/* TODO: should we free everything? */
+			sun4i_dma_free_contract(&contract->vd);
 			return NULL;
 		}
 		promise->cfg |= endpoints;
@@ -954,8 +954,10 @@ sun4i_dma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 							sg_dma_len(sg),
 							sconfig, dir);
 
-		if (!promise)
-			return NULL; /* TODO: should we free everything? */
+		if (!promise) {
+			sun4i_dma_free_contract(&contract->vd);
+			return NULL;
+		}
 
 		promise->cfg |= endpoints;
 		promise->para = para;
-- 
2.43.0

