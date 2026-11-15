Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733613;
	b=Y8/h4vW4U5kjzSBmPtB+qmiHY/6REZx0l+CIdYeLEVy8IaZnxbPMOL8AnToGrtpLPMDN
	 gBK9HxDfcq8DdHKoFv+2ugSa24u0BqIFK2SJzXzIRqJX+IHsP9DsTCNKNnmrFseEOlN6d
	 ec43Bqn6j1pIgj311rMRJO2lx87utfNFBVApo5kDbhJO+7KY7BX0oDU9R1IlgTP+3Q7OW
	 QLifJc1pJWrRFp+SlGDkZ857PQLRJHbgAmcoY+c8kqlrXQx8OgAn0nvsGeG6QzrHuMdLV
	 Np7L+GWGF4nj6IVE8levneoTT/4c7foEkm0O4x5nX8I6SUpTYw4BpszKDM6h1uQLIdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WVskqBN7adAe0blUmUVhbRXdugopDwsXLNQtgww94JA=;
	b=ATPjVoG7cvKMy4pFVMY2y1JMeOCvoJMJgtgKGY2WK3P0g5FKKyg2l9eojrWlHr90BY88
	 s7l9cCLmTUOe0iJaJ/zQi3wOmdti/FEYuP7Vg9fbKbp33RQpV8KBRXnBJjaZgf9dUCONN
	 EaWMHbxdpY51nYELspmjkKvWFzraGKszeQqjNnvgdfByKKa1FZFpxErSiDVNxNwqL+CZc
	 5gDgN53xWpenk4Jd86nnZCHE6DU7Z/u96BbyCBXnjWUrwx3lEaB/iYHwNtmMqXXM+8pBK
	 jy+M1e+ILHB2oVwa6hUUqAgaxx12pPIPFqFohUZVSXFDXl08mkhykfUqCC6lsHaTRbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uqjiT/sV";
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FE6606A32D
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FE6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqjiT/sV
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-70b875f6f1fso2970617eaf.2
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 01:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733611; x=1795338411; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVskqBN7adAe0blUmUVhbRXdugopDwsXLNQtgww94JA=;
        b=uqjiT/sV/AfVnrLy2gRBMHu2DK1jfgf9sls8k9UgASIhr88Ug7DVLVnEJxcZKWFLyk
         Ssqqw7B5503hg1N1v1w6JmXfbO0N6Z4MB2K5Y5dWNBlYTRSDu4fq5wqTsQL2bS+I4pQv
         Vz+TmcLKUg7zlEFQogNZreFy/MJSOK3pX/cyMiTVBCF9Z94BNc6KEQoGyTe3Nd//YQxd
         D7R3CI/4dSev8AcIemFtJKKuwhcGPod66qegPqJWmpyF7jfrNz3pmo299Xu7QYQYKwiB
         c0ALMz+5it0P191y7NgNuilMN7WK4YFxyFjeoMHbh/3UUxwnsUqoVpMgZ3N2v4hHSIKL
         ZQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733611; x=1795338411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVskqBN7adAe0blUmUVhbRXdugopDwsXLNQtgww94JA=;
        b=OcSJ1ghe+uuSU3cHy+wPEPte59I7PulPDP0HesArkC8wuPqFaZSGLVjcKL9tH+Tdnq
         /qTQBBsug3+PibVH/nsaYx4DSXXXcvlW2lviqBNsqYNtozWVohMZpO99OozLoowUHdGt
         whjnEVS06nMamOBclO+tWED4fIfHoKWZfNQxSsIocRWRK6+yXbGpeAFT/cATW+f7E8lf
         6dmNgBh4iLhJs/cLkEb/dbECpz2Z/IJGNgSXD6gTSbD2I1/uU4Mob7F+Cn7vsyIbujls
         bXNdQn1drGeJzzYu8Iim3/NVAurGJCNpgYUZD4vgkScYYrlMon76uJ2ylaoFqSkjE37m
         CTaw==
X-Forwarded-Encrypted: i=1; AL+hErFqbSGnNrtAhEu7qdKFiDovTGKKoPmp2vdzw9qk9Nyk8I2MP1MWWTw7fai+PPPdFfO0fC5rqLj7cfkkjQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9E/imZXBdaHuuKkHBQZ3yG1OKXpprwDiKajAfeL78sUXJhpLGR
	thZdtg8S+HpcslWHgZ46Kpar248AjUveKxjJnVORlx9MjjTnUclbRQpw
X-Gm-Gg: AYBFou1EHleWohNcA3ho8jmT4w7+GMyU/sFqhiu7IKZvrv58X2rONC4oZHgEa8WGs46
	T6OjKP6cgneWgXnWZ1X8euMZ9BZULY5Qhpx4G8azaY+RmqxRDbiZdtMHkr3fgaTHM7eGcfOtdCg
	qCOKwsJeDg+j+WJ+Vl4+eDcirV9C7zPKXmGtt43YrCXbDCFGC7hMZA603llg7Wpnr+AgYnb+L8r
	oc7bACjItHRwAeEUVktuqnHWFV4P3+3OqQC1WTK4eh8dTcL81X29NJxD3TmMck6rhSzDvCXM3ew
	KzzDCdNUfFdWJ5h6zDulGgoCIBHKnlrO48uRNPDtzV+OzVc0VuTqQa67u3JWtmG7kw6dC897+sb
	+GIUNmgxR8Drs6fXNXJKNMLrYnFpq++4uWjlzM89t2dJIZ34GsOTAUxE9qMXA6bFm63V/vPa3Lm
	iWaq2D9kKfatHKx17qLjkntd3VDTV6HEvldZ2l848aUHyzj+xB+IdLZacGrd7UvdUdHfystXSEI
	7+z9d1g9W/pWSySyDePWh2SFsTqi8rM94IkG+Zsrqgl7K1h2JMyBLX2YtDm+MSBCrl79uonq6Re
	zkh7xnMDErUDNKA9lysNR4CEGD9/gkKkwpmmAvw/ZkJcSXGuXk/jh5IDL4aaOgetGTvP24Zje88
	pekSfhvnS2l/7O0dzt9DijZLYbgHakOly3cKcSJLNMoJsr7pzOfh+jz6Vdgl/A1V2iT1nWYPBSh
	wPygcUrCzscmofDVIf34wfcsMCQNTL6mQVuJ13IGx9GtTVXYMBv3tx
X-Received: by 2002:a05:6820:418b:b0:716:c34d:c2aa with SMTP id 006d021491bc7-71ab509ed1amr5396398eaf.37.1794733611590;
        Sun, 15 Nov 2026 01:06:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:06:34 -0700
Subject: [PATCH v2 1/3] dmaengine: virt-dma: share deferred descriptor
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
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-1-fb7d258702f8@gmail.com>
References: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
In-Reply-To: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

A cyclic callback can retain its descriptor after the tasklet drops the
virtual-channel lock. Collecting and freeing descriptors during atomic
termination does not wait for that callback, and clearing vc->cyclic alone
only cancels a callback which has not started.

Provide vchan_terminate_all() to clear the pending cyclic callback and
move all channel-owned descriptors to desc_terminated. This also retains
a cyclic descriptor moved to the completed list by an error path, without
requiring provider-specific descriptor-type checks. Already detached
completed descriptors remain owned by the tasklet.

vchan_synchronize() drains callbacks before freeing or recycling the
retired descriptors. Repeated termination leaves them on the terminated
list until that synchronization occurs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/virt-dma.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index abf2ae737c30..d3057fc85a9b 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -199,6 +199,24 @@ static inline void vchan_get_all_descriptors(struct virt_dma_chan *vc,
 	list_splice_tail_init(&vc->desc_terminated, head);
 }
 
+/**
+ * vchan_terminate_all - retire descriptors until callbacks have drained
+ * @vc: virtual channel to terminate
+ *
+ * The caller must hold vc.lock and prevent further callback publication.
+ * Descriptors detached by the completion tasklet remain owned by that tasklet.
+ * All other descriptors are retained until vchan_synchronize(), including any
+ * descriptor still referenced by an executing cyclic callback.
+ */
+static inline void vchan_terminate_all(struct virt_dma_chan *vc)
+{
+	LIST_HEAD(head);
+
+	vchan_get_all_descriptors(vc, &head);
+	vc->cyclic = NULL;
+	list_splice_tail_init(&head, &vc->desc_terminated);
+}
+
 static inline void vchan_free_chan_resources(struct virt_dma_chan *vc)
 {
 	struct virt_dma_desc *vd;
@@ -232,7 +250,7 @@ static inline const char *vchan_chan_name(struct virt_dma_chan *vc)
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

