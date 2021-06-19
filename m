Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEC972
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Jun 2021 09:21:40 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 9A4323EDFC;
	Sat, 19 Jun 2021 11:21:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by filter2.mymailcheap.com (Postfix) with ESMTP id 782E52A916;
	Sat, 19 Jun 2021 11:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
	s=default; t=1624094498;
	bh=qjFi+Uz27Fb6CUYFL04jiPR+5P23k7FvRCRiT1KDE9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZjzaLBcqDJ0mbHBj5mwcpJxrJgKrDDJ1WtTvJBc00JEzbUtlGh/LDCa1c2a2Q+0Q5
	 yXUVb+CuoCvnDtuRUbNf6rPVZa+L54Bwu8Yk+kk2NIh3wKIjsNmmpgIfXlepidwsyA
	 BS+nONOVxvVuF+gmZq4Zg3AHCux9JQwiVePY79Qc=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
	by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgXZ_L-ehe10; Sat, 19 Jun 2021 11:21:37 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter2.mymailcheap.com (Postfix) with ESMTPS;
	Sat, 19 Jun 2021 11:21:37 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
	by mail20.mymailcheap.com (Postfix) with ESMTP id E46B940C4F;
	Sat, 19 Jun 2021 09:21:36 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
	dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="Q6M4y95c";
	dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.162.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 04C7E40C4F;
	Sat, 19 Jun 2021 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1624094488; bh=qjFi+Uz27Fb6CUYFL04jiPR+5P23k7FvRCRiT1KDE9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q6M4y95c1XJ3M7aQLbBv625W1ZzGKLp/khVsFM0KwYE6fto8GjkOEBEIzdauRkmYS
	 JYIC7qdDLoAoJMoaEUvPGHtrcWTGz8PVkPtdeI//vmJMX6VajmCXvbgooxmY1uyX0s
	 eVrgojbtBILk46ss8wRSeEMRsDzwU7ZmoIGC7mls=
From: Icenowy Zheng <icenowy@aosc.io>
To: Simon Glass <sjg@chromium.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 4/4] sunxi: specify architecture when generating SPL boot image
Date: Sat, 19 Jun 2021 17:21:11 +0800
Message-Id: <20210619092111.647081-1-icenowy@aosc.io>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210619091838.646779-1-icenowy@aosc.io>
References: <20210619091838.646779-1-icenowy@aosc.io>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [4.90 / 20.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(0.00)[aosc.io:s=default];
	 RECEIVED_SPAMHAUS_PBL(0.00)[59.41.162.69:received];
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
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
	 RCVD_COUNT_TWO(0.00)[2];
	 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: E46B940C4F
X-Rspamd-Server: mail20.mymailcheap.com

As mkimage -T sunxi_egon now gains support for -A parameter, specify the
architecture when generating SPL boot image for sunxi.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
No changes in v2.

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
