Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111389;
	b=Vyvt8nmhHf/bnywpKyNn9CvfqL+LBOc/DrWT+DB4MHLqkbmEqXqdVNzuW/I75BieWd6R
	 uOLTjiPUHjbPFZqKenCFc1wFus8NmB+K7/8bdqqXziGoLj3gpLnVITyWDRXvY+RNiTn0a
	 hatGlz/bU2r07d9GHlNyojkXUKRHwRS9uG1fTJUJCkN6D6bnsxhJEy7uEMTb9A2a3Nd9n
	 1YrIbvkfrDbLVN3BCyA47dSzn/Ntm1/0cszYejGTkk9M+7iRoYYfzJouUBG2MnslVRHHu
	 3Zrq/6jYcb/EqHzoPl2x5r4WtgL7ZDW1+hOUnK5K2saFS68iZAu3gS866ws5yZBXtpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=I06+c10KQYGyPd16B/H1g1q5/WZ+PHIJV96gXM/5eoY=;
	b=lBNYxiqpzK/eMPbGZxZM8bc9/h/39UvwQXYVbXDft9GDS17489TFUE4lkgHGQFIECXcq
	 RFGMnPQLXkQIgSSp+zNmOz30ouf1j+3ATe+OyuiysBM4AVgLnGdtDi++gBCMMgowcYYZ2
	 o/0s85MzOQ3b4skQ9ERsPZMuKIBt9FcKCRG1U1L/HtIM8ZMA17RWjGQgnndhIzgCbPVXa
	 rd9ZnnHsfkv++u50uUhOHmTk0YQX7QNjsr27HfJ0Ve66cs1ile8kti+JgQcU/FB7Eob36
	 LBNd/xtpV6NWwJ4tp7tTM34mGveGUA9lFMSEGqiIFLRDNLe41YtneNFo/HFk9IKTakg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HQTsml4/";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEF6606A334
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 18:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCEF6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQTsml4/
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71aed54d4c5so14426eaf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 10:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111388; x=1795716188; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I06+c10KQYGyPd16B/H1g1q5/WZ+PHIJV96gXM/5eoY=;
        b=HQTsml4/H/RJdBGsa9M8rDPOzA3KA+mSl3laQbD2ordKQux2e4v+nLQ0InF3ZwQQaA
         43TZSPSA5OndHR8/0T7e7BkgTKUEfNew9Gp7mdCUI9WnmRtIJRYyhcmlpT6Tg4lFX4Wr
         rhPRc+IIxd2DBe+HLstDLDLqRIw6NSVRQSO8nxCb4FiaqGrycCOzG7oA1TNxIFkEMmPG
         AQTyyvXhzVi/0ZQS5lj9B3iqldwMjp3FSmzOsDDnI7mkz48ULRvNY1uFzUUnNsPVQpDN
         uULBjW/VP0PPEaA4bT5dHUrELbB1KQygRuA0meucyk8DTkcrcpZyOP4RifSb7q9gpcIq
         5ExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111388; x=1795716188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I06+c10KQYGyPd16B/H1g1q5/WZ+PHIJV96gXM/5eoY=;
        b=tvcQd3rXQsGAXtsyPr1i6lKaAMJs2WdvT1olO1VZvroJHwBc6qcDAJvKhbvNPVmyzF
         N7q0lHSzZRF2Rn8m3DcG6jmbyV8UZ4FZVvZIBuTBODej/KpGNMf22RJxWbluRui60rC1
         OhjY/6y4vSNV26rV6L0EGxJjZqxOxhK+5m0x/4XI9cxounHNiDVp+hZWF+njWs7sJm52
         Yl/8vR5QFyuQphEscudDlKLiyWHgmSm3oJah3xpI+iiLEEi4oTb5PC/urBQeBPVS1ciY
         B9zRHCEsBTNrchizJ2Dec/s0D7ryeWrGEzBySRegDQso28NMjNb/PpZQI4xV175s2DZo
         YHEQ==
X-Forwarded-Encrypted: i=1; AL+hErHHw4ZEDSBZMb6vmU1g7edTyLJMwBNQFbFkijLseBxCPuX5GGnP5u9SUeulIpCGTF6le6StwhfZloINHg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8FWkioVDCz4sB9uiGoi7KDvZTnsMeQO/6lyjpaIsJCsPRw6BEe
	PrunSKo5QUL6U2zbVYVe4cO191WKJHAjS7mCUGiH2XWCTSw6pPqtZHvM
X-Gm-Gg: AYBFou23d0p85Hfqyb9fpZ/b5q0ptKSwoxzvu/RxQRy4mBLlzZ9X+ioFIg6RYif6GzQ
	Dv5GFMx/ts4ILhpfDcxUEqDgMIbj2EwTf7n4OSy/b/yb/m3BD3zKLyTYtzz6CCwzYMS8nWoXV+G
	2bfJ4US2uppiIOKzisuqDU4D7fXRWrwDKCSJil3rWrzm7KCPqHyEb9NBhV4k0e2DJvqSd18r4GC
	MS3sBkGIDAbQOkeFj/qdxLx+7m6Zx3PYP5eTdZD/rvtJrO7aI2GcWr9RxFhF5zLjTbFxuc+TH1M
	X7c9K7ENmxNhpoaFOJ2f7BdwR6qkKkXPzAqLRnNDk5zfYq2z9PM8lRYzkNo2QU4o6SOODUZY1IW
	idIe6sZGGUNSrJ3xYJmrm+24yuMQzOcMaXYRXiI6z4CUaSQdmjtGQSQwjXTXJSDPwz0bzU6V3ho
	oLoTMZy/titQ/MfcaEAZ+l7EoZ6okCl1KRCDLZRiiK+BajuExpmZTAx/X3AUkilt7xZ/Fou9qX3
	0NiIU5ZnvEMf8sGexQxS795kPMqs8RZjxXZUebYe8u38Rt4TiAAmG0hHMr7FccY1Si4bd9s6K9R
	QQathUBjK80ALdDGFLl1d8qAw6SowmJaDHQKtS6Hza9JRE0nZSijmWWkI3xMMbWr4KPuijiS5U0
	vtelxWVgXL9VEhff1GWEaJPz7j/rNgo4cgR84YztjqExcgerT0+EISvjTbSIXoGCklgQ355t3QJ
	E2XsNQ60WOl6Sbre8tBQ65zPHyLmkLaiv450wtofXdiYzpeW+PF1Cf
X-Received: by 2002:a05:6820:340a:10b0:716:db9f:682c with SMTP id 006d021491bc7-71b3960e47cmr234297eaf.69.1795111387559;
        Thu, 19 Nov 2026 10:03:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 11:02:21 -0700
Subject: [PATCH v3 1/3] dmaengine: virt-dma: share deferred descriptor
 retirement
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-1-3935aef58db9@gmail.com>
References: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
In-Reply-To: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

A cyclic callback can retain its descriptor after the tasklet drops the
virtual-channel lock. Collecting and freeing descriptors during atomic
termination does not wait for that callback, and clearing vc->cyclic alone
only cancels a callback which has not started.

Provide vchan_terminate_all() to clear the pending cyclic callback and
move submitted, issued and completed descriptors to desc_terminated. A
cyclic descriptor moved to the completed list by an error path is still
retained; completed descriptors already detached by the tasklet remain
its responsibility.

Leave prepared descriptors on desc_allocated: the client still owns them
and may submit them after terminating earlier work. Freeing channel
resources, unlike termination, still releases these descriptors.

vchan_synchronize() drains callbacks before freeing or recycling retired
descriptors. Repeated termination leaves them on the terminated list.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/virt-dma.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index abf2ae737c30..f753c6b62d6b 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -199,6 +199,25 @@ static inline void vchan_get_all_descriptors(struct virt_dma_chan *vc,
 	list_splice_tail_init(&vc->desc_terminated, head);
 }
 
+/**
+ * vchan_terminate_all - retire descriptors until callbacks have drained
+ * @vc: virtual channel to terminate
+ *
+ * The caller must hold vc.lock and prevent further callback publication.
+ * Submitted, issued and completed descriptors stay on desc_terminated until
+ * vchan_synchronize() drains callbacks. Prepared descriptors remain available
+ * for submission. The completion tasklet owns descriptors it already detached.
+ */
+static inline void vchan_terminate_all(struct virt_dma_chan *vc)
+{
+	lockdep_assert_held(&vc->lock);
+
+	vc->cyclic = NULL;
+	list_splice_tail_init(&vc->desc_submitted, &vc->desc_terminated);
+	list_splice_tail_init(&vc->desc_issued, &vc->desc_terminated);
+	list_splice_tail_init(&vc->desc_completed, &vc->desc_terminated);
+}
+
 static inline void vchan_free_chan_resources(struct virt_dma_chan *vc)
 {
 	struct virt_dma_desc *vd;
@@ -232,7 +251,7 @@ static inline const char *vchan_chan_name(struct virt_dma_chan *vc)
  * Makes sure that all scheduled or active callbacks have finished running. For
  * proper operation the caller has to ensure that no new callbacks are scheduled
  * after the invocation of this function started.
- * Free up the terminated cyclic descriptor to prevent memory leakage.
+ * Free or recycle terminated descriptors after their callbacks have drained.
  */
 static inline void vchan_synchronize(struct virt_dma_chan *vc)
 {

-- 
2.53.0

