Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719EB3B14B7
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Jun 2026 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788917; cv=none; b=mqOOnwQqjBwWAQjmj7tLHhfudXpNlorfOG0hI0gQTPC//2he4dogLhMvXM7i6ntGbSc1NN4KyZQBhkw61H9RFKUpQkUZsAyChDLMGZDO2DZbsjyC8YB7egAA/jZ8klJa6zLaqebOG74FjOXAPKK8yDBlxdMZ6UCZAHEgjXJEwWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788917; c=relaxed/simple;
	bh=44O5xzVX89ZE0VHmF+rs/KTPfz/ziGKAGmb4RhPOxz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lVIGRLHE2LZ//TkZjSWCXbCuY6ZGj8qpXwCEcAiK2V55o050O2gjAGjfYDBc7pHAUFFMFnUD2CgCQM7ESleMU+ilfNxlloiL1tkOYGq2PNYKO6/aVuIBWg9NUbpcUezbNTCSL4Q9u+GajoQRzEMaPiI32cyQeGXammD3dW8mQHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWTC4Lvk; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWTC4Lvk"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so464870a12.3
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Jun 2026 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781788908; x=1782393708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tT13A6NAYZuTx/YyXo5jPcQ9raZMcUWUjalNNtxI2PQ=;
        b=fWTC4Lvkp3aNuojvKwGqLJydKsoyypFk023qlSgnORKCDfMszbTn1Tlrk/nrATNsiD
         CuB0wZJzVS3AfMWdIUJ0j0jYOJcqltQaK+y24Z+lzefrXJiQp2LvVtiTdzWAgco1hyOZ
         vCdjfkkcm9art0wD5HFAUKp5QcUZ9EReHG2CK3pTDTvoTKtbV7Ea6pLlOheXvDoggqtJ
         zDNMIPM5aO9HcvN7g7jZajBoRXBo7uG3/wyNC09abKbAUGOfHA1cPfFd+RjLrreQesKH
         8qqrcy+GA3SXOtPfFQrN38wRXuEU/hL5YxZ+VSSwPkHhfY0zqIbkozrjNbcCxl/mI0zi
         xjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781788908; x=1782393708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tT13A6NAYZuTx/YyXo5jPcQ9raZMcUWUjalNNtxI2PQ=;
        b=PqEC0b1HfMNEtPc3371z2SH3VhkktkBRLnqZTLI5v15exQ16QP017vArTtiM13D/dv
         KgUMm0MlHdqOYAKOcdoZeBgcQdyo9ylIJKFUP5Yo8D0Ff9v6N+s7n3G6t94YIrtb2grg
         p88pjkTPcihpIKxtYP6WZJYwu/fsL4ZIOSaMqLTBV6G0JXdXjjz6Ic3i0r5pjCvxRizL
         6fSt65kATaV1KcIaPEwRYUUn14G9kD7FWHYrNWQIsqblAms4NF5MTVHZNfDzBL+nvELE
         6rkpP8c20oz4Bs1ho5oif+eL9eBUjK/NxqEASRtczkNHeV4sLsU59lG9P6L80VKnQzmq
         JBIw==
X-Forwarded-Encrypted: i=1; AFNElJ8Uw+bhaTsWDjX3iSZ3QMieqgL5R87Jlir4c1WHU040BNTQiiThlmjT9YZATe3bZegy4wz0X/bC/CK85w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyI7JQzzsb3MLhGjiCJDIBKkEo7NTDAgoEAgKt4Ph9gYMm4BWLc
	XVLljHeWQrJwNr1zDpIvwDsOwYI85JyL3PTRcI0nU7rsumiHpH6Cm5fp
X-Gm-Gg: AfdE7ck7/TmrIBdp3nZ8jpBBDb2yKGGrgygE9oRWUEYUdocOT/494TTj7akq2/RvslX
	knES55xQiaYXyRZTYOx8aaoH5Ajsfob3CdHFDImQs1cboknUHmPIdU6ZmhzSn42i1xOGBmMmZM6
	j9etiktrvHnKGzZtNmi/GXcmcEedGXZiAp7hXqaWkrlxx86qiUeeYffzx0mHyqplOckkLqS5BiO
	vj4w84tiEozK7LSDihn9HQAVepu1Cs2EDGr4J9/XAFwHf7xIGqz81QnalGQ48QNwJVRDAeYMfbP
	KP6/0Z7jnwGV2TqBRmtiG9iel4OppbXD50+M4zWbn/95ttKd2SxoJS2PAI7lpd067IEZC0Slvy+
	q4AQqElz4hf8KI8+LZcXxiAjQOvrYc7PhI+HIiuEug8nJV6F3UuvAagtbFau4C0gnLiEN37j7OD
	pnP0V1fezmIW4V/KHg/jGdypZ9CJ1aQIU0bIrJkuxC
X-Received: by 2002:a05:6a21:a89:b0:3b4:6265:3788 with SMTP id adf61e73a8af0-3b9e7bdf93cmr5194540637.21.1781788908183;
        Thu, 18 Jun 2026 06:21:48 -0700 (PDT)
Received: from steellegend.taila75641.ts.net ([2401:4900:1c19:e45:6f99:fe25:8bbb:3a22])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5ccafsm17676098a12.2.2026.06.18.06.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 06:21:47 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: andi.shyti@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH 2/4] i2c: sun6i-p2wi: Fix device node reference leak in p2wi_probe
Date: Thu, 18 Jun 2026 18:51:39 +0530
Message-ID: <20260618132139.11114-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In p2wi_probe(), the device node reference obtained via
of_get_next_available_child() is stored in childnp. This reference is
never released via of_node_put() - neither on the error path when
of_property_read_u32() fails to read the 'reg' property, nor on the
success path after the target address has been read.

Fix this by calling of_node_put(childnp) on both the error and success
paths.

Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index dffbe776a195..1ef0e82eeb63 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -220,10 +220,13 @@ static int p2wi_probe(struct platform_device *pdev)
 	childnp = of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
-		if (ret)
-			return dev_err_probe(dev, -EINVAL,
-					     "invalid target address on node %pOF\n", childnp);
-
+		if (ret) {
+			ret = dev_err_probe(dev, -EINVAL,
+					    "invalid target address on node %pOF\n", childnp);
+			of_node_put(childnp);
+			return ret;
+		}
+		of_node_put(childnp);
 		p2wi->target_addr = target_addr;
 	}
 
-- 
2.54.0

