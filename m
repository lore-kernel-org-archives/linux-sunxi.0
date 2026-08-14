Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1E43F8C9
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714168; cv=none; b=lgxPFjO3BujipG4tTVOeSyCSqcZ3j34RiECD/T2E7ZTNv6K7hLuSUI85mJvdAp5VCLxXb+hZAZS2Fb7DsVqDKOnGeHTbypJ7eLkqFnz9dSrGaHnUU3XQE8aQ7MeC65PFfmh2yrh8cgZFrVf6qIZfsHaa2hg5lwmZQpWR9sucm2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714168; c=relaxed/simple;
	bh=cByUVjkJel3B1ybJsMmIYMaJI3DegLh80XKJ7Li8vFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ln332oi1GYq0pC2DrEyUpQv8bhKMdHLigSZcocmaseEIt7NOENrPrsKliC12ow6PZqd9KkHBn1UVMRzjRk7br34/hmsfbEb5JEhMPjnhZUdnkqw+QxxVqu8pG0PphAfQJYSkQEyZyNUY3mjaBbF5sFvJtmU3BZsR+Vd6z0zwjAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=ScGaNym/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="ScGaNym/"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a09571dd5cso134814a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786714164; x=1787318964; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PU9G4zdXRl0NI31/rfDwJrFlwhd8fgXP9fxLHMqe2k8=;
        b=ScGaNym/EmaDglrJ3p74TdoHncvo/0WnfKjGNN6szVILKBp2pEVg3rE8T/++fUyn4r
         JfIwJJUD6EJ3/kDurAYHt/zL486ZRkClUEM5/4Cq+wPtqTcMTtTzutplF+AiGgdOeBdn
         xuykvAY1pH2Eb1lsjcioNlEpCNxe6+4VFSDW0Vn8YPwZa9q9YrbhMY8RRYadXQJAYvWG
         jYa6Au6C1sFR2BNvtMPeReChWSnCsUIMtb11J2fEHljuXa9jDNdyT3xSUdpiYqusslIo
         jpnVtw524JTMO/eFt0eqA31Dp7iCgFLH8/CqMCki/aAzxFlG6KAfTQ2037X5UVmKJKpj
         6HEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714164; x=1787318964;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PU9G4zdXRl0NI31/rfDwJrFlwhd8fgXP9fxLHMqe2k8=;
        b=EpoK42mvS3wVgSl8bHwjt19agBjzGmrIvhEFQYmgveWhX47Ozr8eBXg+ETZhnCyNWz
         KYdAvzbF/kj3BL+kgEiKdRDRzhpEzrLyVHX4Y54rC5DhkbTF11AJiE1Qn6n90grHyIsl
         zj6bNcMOZY7OD22o579KozbujzXX2FYFEZeBoDPWR38oLFf9+sed7KyhiJ7r4vGxXDce
         5TSmQrpJAaU9NxPpUo78J/TV0IfYEpvNb9v5YeyPd/JMFhacsZyXJSOq96cmsnSxPGF4
         m0joNZZUA/EtOb0/XW3U8pQK4BSvejmyirmCaV3ZmLdxO4QOLFPMNoX6INiJwS4vBbDd
         fjKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnuRQ3dkiMh0HA23nFpjwuD318HkBmVWsWl92OER0n3bAwZqjX7MQUJdYxHGj2UinUlHMwamxIkFGkbA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/HbWK2tLMzTyzFF4DqTeIlx+Fl/XykFpCpYtOuuu+NAK09OYx
	4I38QLyq+ed7GRGh+GLNUAO1kAjVYH0+T7HXFeeMe3yqFZPUXmXY7pPOoDx/We2JgnU=
X-Gm-Gg: AR+sD10VXWr3KixGAPCzeNMCE2gEmYwYy8p3T7Y/rnLVhgDUP3t4D5oLanTtKof8ofO
	30dCi/Z0cvG9C+ybi7wSpjpv/XscaISNSanusKIx4OudlTOuUXqdfuE7CRx+alX552LGlFI4tlW
	fBCvimSav/ZQi33/VHkl95qzirLumbfkAlpN7/s4FCoAd9Mog/hF3PR+yqRE5UP1V/i6r99iwqw
	gGZS3uyeh5pUbnpHNIhSd59gXplGe4QRAumbsasjYjee2p2fIYjaWCH1r7YVQn+3tVfs1mhk8Sn
	y1PjPgrrf983jaxay1hO71YDdYewhF3tBi5Jg4hJ75QgaSKFR5b+WpocGAnYErFNScbjIAzAk4b
	Xh4XiFI5gle5fllN3JiQghlu+lSosNCN2kMWGj0lCBK60S1V33wNo93hwlMiIqK9NJGfCOGbnn/
	zn9ZrWPJr5CLsAUCMW6DF+11DrC4a3ox3MQC0H1SG98VJ65PkudYogIQK6CqX8E2kYJkdwW0qVD
	w4q9grFQgIrxLN30LQgGGS4zV6XSZVdTHj2ZQ6xLSflNW6H2sWGxDyaog==
X-Received: by 2002:a05:6402:3509:b0:6a3:72bc:7bca with SMTP id 4fb4d7f45d1cf-6a38a98619emr1635185a12.3.1786714164235;
        Fri, 14 Aug 2026 06:29:24 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38c9d5eb2sm841941a12.5.2026.08.14.06.29.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 06:29:23 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>
Subject: [PATCH 0/2] dmaengine: sun6i: Fix two bugs in the DMA status path
Date: Fri, 14 Aug 2026 15:28:28 +0200
Message-ID: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes two bugs in the sun6i DMA driver's tx_status path.

The first patch fixes a non-atomic read of DMA_CHAN_LLI_ADDR and
DMA_CHAN_CUR_CNT in sun6i_get_chan_size(), introduced when cyclic DMA
support was added. The race causes spurious ALSA xruns on Allwinner H3
(Barix IPAM400), confirmed by observation on kernel 6.12.

The second patch fixes a null pointer dereference in sun6i_dma_tx_status()
where to_sun6i_desc() was called unconditionally on the return value of
vchan_find_desc() before the NULL check, present since the driver was
first introduced.

Both patches are candidates for stable backport.

Christian Lugnberg (2):
  dmaengine: sun6i: fix non-atomic read of DMA position registers
  dmaengine: sun6i: fix null pointer dereference in sun6i_dma_tx_status

 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.54.0 (Apple Git-156)

