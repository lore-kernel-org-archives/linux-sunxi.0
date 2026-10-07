Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748248F85E
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Oct 2026 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791381693; cv=none; b=j7JFP6cjPiUz1U9w0TTrxEr4v0pu+9vzDRHpL2VgOQ3VHPwteuFzC4srDlwfdjlzAW0guWVb6nSvq50QjRy9B7v990eSEhRSG4j8vaI7tvGzc0LAl52tP1+hUYC8sz27en/6JeFr6W/9OrFM4SiCVonwv3qGD7bIeZPU7C6uKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791381693; c=relaxed/simple;
	bh=Bzonkp4Kl647I49nPKXVT8eFQsR7sFNTOnQ8eIGUtOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mFntDY45J12WsEMvBeDQcmGD2vw5PGgVNl0HxY2rygL2NmvYXERlHOHPb6QU/rVGoRKOR95xxKeKRTSBBSwHb+/EiC+JNpMLDhG+Cc1QmVtshMAce+eYg6pONHohHNz8On4us4UndpJ2oDNXvzCKseCmpxkW7Yeqnk8Sg+xmaj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IenNASEQ; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IenNASEQ"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-154e9d2d979so2290010c88.1
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Oct 2026 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791381681; x=1791986481; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdpieMb9IrqAZOHrmOFrCKGqCrPoDymISML061l9Fxk=;
        b=IenNASEQI2DdnmE4+WuueaAaS/+nOvJlLiFIWtkaR7oW4gpP5T1aGF8vN6kQ2XtfUl
         QDgOfipRJDk+2BT5ZRm52HtUL3P6UwgMNwjMLNFYPaAVMDggn+GrRJ+a4bpRT6s8GTC5
         0cF0QKF/UgblhrepO8OLNvisy8Hee7ATtY0978tow/BhJysx+lLSkU20gKPyUof8k7ic
         hv5UFDB3XjbCUox2dQJURWG5E2XqBGzMRirf6AUz+w2RvOzKL9kRWXRJ4AWTtbkO+Wl4
         yyJm3nxnMYlV/Lqm+nsRHCMJguWNdrco1m4UukWw13tTylRO71g8KsAxXNsPigtsEsVR
         Eevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791381681; x=1791986481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdpieMb9IrqAZOHrmOFrCKGqCrPoDymISML061l9Fxk=;
        b=Am9Ebr5es9g+tLN6fSnMF2XB8MYN+nwVe41zVcJTdelpc8DJGsJA2VM0FzC+cxBbJG
         GZrWs/4rMFYQLp2behu3J5zhqOmszqKcMU5fXtFodkVUjoHifJyb9t+eVip6/y2PMQhD
         B2JOMlq+/FIzf+xT9b7MYtLyRPr2phz+IFphdWruYPDTpgkWuQttVgeW6nROVdOTKEcU
         cRFw6WKyCMY9h1nqdek0MMq0S0B1lsfDJswUWFGY00QMlPCP0I3x45qPfUuymn4K/5AF
         EqtFHbwvxwZ5N3AJ9ReInFvn6KFXSePrO4gNXfyQ7TRfNgpx5tgh1WkUTWbGcAKIYfsd
         qxzA==
X-Forwarded-Encrypted: i=1; AKwUvBwe8P2fXDvVSf/mhljj1S0ectFZ+BAFa393aQR5Vb6IE4+qLMyTklOMyJeOhsMMUGua+AWiX+r2uaw7dw==@lists.linux.dev
X-Gm-Message-State: AFuF++lUYAFeKBtXZMUV26WIvnIvd0mUzsX0/PFTZ8c/PBHgVFaohtAw
	SANumE5Q+0fuqtTHX9xFVJhUtcOchJPS0T87seVr8iOcIookrMRuZeEK
X-Gm-Gg: AYBFou31gAeayYOykwC58VykwhvF2etQxP41b/ozeA1jNEdB5onzAgf1zrxuP9OVJvN
	aZbxWvGCIh66MF4qjz7yTQceKZ/envRw29xliwckkxszpAY3bEQxmETDAbesG03Q7im509IPI1t
	VlVRc6GRzbNR1v+5lWbLlSPFeg5ZyZNrLvNMQ+rxJEd/CrUbEHfNpwBjchiASpok+30sMFbnBjC
	VMI+mKJGG1NXA8mjBIkRoKAyPXpjiZo8Vp3wuldSwKlysI0t8J4TvyBlocnNRRSk0HjIB5fLcrj
	HK217A2TPYH1dDCujlg04zt+fRWBK1d1gXTdyt7JWhybzwhMPCytfJbnjBv6heUktS0Cu04KXSo
	gce+kcqmY5734RXCSCODuk2ZBCMYAvWVPrkd/PTXJpxyJKf9qqJHGp3vjrEoqsKoVej7KTmXfdx
	gMl76/TcuRiCMF2g6smDA2Yhp8fxDKk1ZRT3iwvrw2Qxh6LmRjjedS1UsJyzQN2iW8D4CRD20Ju
	O/enE4I/0rtvJ9eGSKR3tNtIcpvdA==
X-Received: by 2002:a05:7022:ea8b:b0:143:3769:c680 with SMTP id a92af1059eb24-15d3115a913mr6364429c88.25.1791381680555;
        Wed, 07 Oct 2026 07:01:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:65e4:8ceb:88c7:bff4:c488:f682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1630180f6a5sm4179461c88.22.2026.10.07.07.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:01:19 -0700 (PDT)
From: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
To: mripard@kernel.org,
	paulk@sys-base.io,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: [PATCH] media: cedrus: fix typo in comment
Date: Wed,  7 Oct 2026 11:00:56 -0300
Message-ID: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in a comment: Neightbor -> Neighbor.

Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..f57642c0d8fa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
 
-	/* Neightbor information address. */
+	/* Neighbor information address. */
 	reg = VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_info_buf_addr);
 	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
 
-- 
2.56.0

