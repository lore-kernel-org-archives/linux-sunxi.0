Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A678A70
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 18:49:35 +0000 (UTC)
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 90232200FD
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 18:49:33 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id D71632000B;
	Thu, 17 Jun 2021 18:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by filter1.mymailcheap.com (Postfix) with ESMTP id 281FD2A0D2;
	Thu, 17 Jun 2021 14:49:25 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
	s=default; t=1623955765;
	bh=dXUXlGwx5KwPDmrmTL59eH+RHJSa6gzKWAsSZiL4dJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RlhhjWW7ZA16VS6MdAB/xJuOujQ5lJZPXyTT/Yf9yQ5V6oyly0L3xFirSsI+dEckm
	 ZWI0XOuy0yqv4w5DBbop7RUZbKQWjFxmtTX7pcRb9Gs8DKSmYbg0TZamlvuZFKxtHK
	 NPQKaGZjVwPlu73vaD890FQqnG/qTbysft1lW0Tw=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
	by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pjXfTk8Q3kyC; Thu, 17 Jun 2021 14:49:23 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter1.mymailcheap.com (Postfix) with ESMTPS;
	Thu, 17 Jun 2021 14:49:23 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
	by mail20.mymailcheap.com (Postfix) with ESMTP id 4577340C1C;
	Thu, 17 Jun 2021 18:49:22 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
	dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="V09Q3BmG";
	dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.162.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 6234B40CA9;
	Thu, 17 Jun 2021 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1623955754; bh=dXUXlGwx5KwPDmrmTL59eH+RHJSa6gzKWAsSZiL4dJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V09Q3BmG1wOqzG2k4jqMX8PXGwLzv+4LAMQ1DvSYaO6h3LK/9yYFg0x+qb/zZnHiN
	 662t6BTY4rziEfwApZgZ4BHtkDi6ZCjhZpFZvuaOuDQgAtEu2TrH9iuY/ODfD5Chfs
	 iHIAJf+8l94SJp4uMBwi58kRj+0mylfpO3G9QUu0=
From: Icenowy Zheng <icenowy@aosc.io>
To: Simon Glass <sjg@chromium.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [RFC PATCH 4/4] sunxi: specify architecture when generating SPL boot image
Date: Fri, 18 Jun 2021 02:48:41 +0800
Message-Id: <20210617184841.4083646-1-icenowy@aosc.io>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617184621.4083311-1-icenowy@aosc.io>
References: <20210617184621.4083311-1-icenowy@aosc.io>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [4.90 / 20.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(0.00)[aosc.io:s=default];
	 RECEIVED_SPAMHAUS_PBL(0.00)[59.41.162.158:received];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DMARC_NA(0.00)[aosc.io];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_SPF_SOFTFAIL(0.00)[~all:c];
	 ML_SERVERS(-3.10)[213.133.102.83];
	 DKIM_TRACE(0.00)[aosc.io:+];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
	 RCVD_COUNT_TWO(0.00)[2];
	 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: 4577340C1C

As mkimage -T sunxi_egon now gains support for -A parameter, specify the
architecture when generating SPL boot image for sunxi.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 scripts/Makefile.spl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.spl b/scripts/Makefile.spl
index 5be1a9ba1b..c13a41a243 100644
--- a/scripts/Makefile.spl
+++ b/scripts/Makefile.spl
@@ -414,7 +414,7 @@ endif
 $(obj)/$(SPL_BIN).sfp: $(obj)/$(SPL_BIN).bin FORCE
 	$(call if_changed,mkimage)
 
-MKIMAGEFLAGS_sunxi-spl.bin = -T sunxi_egon \
+MKIMAGEFLAGS_sunxi-spl.bin = -A $(ARCH) -T sunxi_egon \
 	-n $(CONFIG_DEFAULT_DEVICE_TREE)
 
 OBJCOPYFLAGS_u-boot-spl-dtb.hex := -I binary -O ihex --change-address=$(CONFIG_SPL_TEXT_BASE)
-- 
2.30.2
