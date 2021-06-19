Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9D472
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Jun 2021 09:19:18 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id E8C8E200FE
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Jun 2021 09:19:10 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id F11903F15F;
	Sat, 19 Jun 2021 11:19:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by filter1.mymailcheap.com (Postfix) with ESMTP id 3B4782A0D2;
	Sat, 19 Jun 2021 05:19:02 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
	s=default; t=1624094342;
	bh=sk875WbrD3n/RTXenys3tkWTFkYb2eqnax0eI2zBCt8=;
	h=From:To:Cc:Subject:Date:From;
	b=qUXlo7T5kbpWO5AHrdNRxr7WwDu+0jUxBZFY7Iu1FpDQAsY6Lr4ruO0hs6COCnskx
	 FJXSNtIiapLVvCE2JNr/ClLDt4Q7323+1yMHMKCh/JsxHG+Rf3H8TP/wWAH59urJy7
	 BE0qPvs+2RlNOuAtYn/OitpS4DvUbKNjfQ4Zo1Oc=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
	by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLwKlg7Tn7Mc; Sat, 19 Jun 2021 05:19:01 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter1.mymailcheap.com (Postfix) with ESMTPS;
	Sat, 19 Jun 2021 05:19:01 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
	by mail20.mymailcheap.com (Postfix) with ESMTP id 5725A42568;
	Sat, 19 Jun 2021 09:18:59 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
	dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="EeEwojkv";
	dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.162.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 23D44412DB;
	Sat, 19 Jun 2021 09:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1624094335; bh=sk875WbrD3n/RTXenys3tkWTFkYb2eqnax0eI2zBCt8=;
	h=From:To:Cc:Subject:Date:From;
	b=EeEwojkvwd7/cowyi5WdE8v5gvYZ+wdBvhezLSW7jUCLtexrWKTiNLqh/S9IJ1WH/
	 DhzUocoWxMjSNMMKCmsdDRX7JqOLxubeQusMyamHsTuBWmtqJw0KAp7WM3l1tKOaIf
	 FW8C+ny+vmVLGVi7ETt2YDXffVyX2j1A2q96bBlY=
From: Icenowy Zheng <icenowy@aosc.io>
To: Simon Glass <sjg@chromium.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 0/4] mkimage: sunxi_egon: add riscv support
Date: Sat, 19 Jun 2021 17:18:34 +0800
Message-Id: <20210619091838.646779-1-icenowy@aosc.io>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [4.90 / 20.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(0.00)[aosc.io:s=default];
	 RECEIVED_SPAMHAUS_PBL(0.00)[59.41.162.69:received];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DMARC_NA(0.00)[aosc.io];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_SPF_SOFTFAIL(0.00)[~all];
	 ML_SERVERS(-3.10)[148.251.23.173];
	 DKIM_TRACE(0.00)[aosc.io:+];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
	 RCVD_COUNT_TWO(0.00)[2];
	 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: 5725A42568
X-Rspamd-Server: mail20.mymailcheap.com

This patchset tries to make mkimage -T sunxi_egon to be able to generate
an eGON.BT0 image for Allwinner RISC-V SoCs (e.g. D1).

In addition, to keep the compatibility, it will still consider the
architecture to be ARM when no architecture is specified.

Icenowy Zheng (4):
  mkimage: add a flag to describe whether -A is specified
  mkimage: sunxi_egon: refactor for multi-architecture support
  mkimage: sunxi_egon: add support for riscv
  sunxi: specify architecture when generating SPL boot image

 scripts/Makefile.spl |  2 +-
 tools/imagetool.h    |  1 +
 tools/mkimage.c      |  1 +
 tools/sunxi_egon.c   | 86 ++++++++++++++++++++++++++++++++++++++++----
 4 files changed, 82 insertions(+), 8 deletions(-)

-- 
2.30.2
