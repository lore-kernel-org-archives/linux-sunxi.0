Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F265E70
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 18:52:47 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 7E1CB20164
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 18:46:56 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.102])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 78321260EC
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 18:46:47 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id BA5263F1C5;
	Thu, 17 Jun 2021 18:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by filter1.mymailcheap.com (Postfix) with ESMTP id 9EA372A0D2;
	Thu, 17 Jun 2021 14:46:40 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
	s=default; t=1623955600;
	bh=4gkLi/3IFEA67/QLHoK4G32AIEp2qJ9pWDtfs8DhElo=;
	h=From:To:Cc:Subject:Date:From;
	b=SHJhvRWPFzlmD0GssmQ3fc7YVaMAjdxjfZ4fFy+ZtbF4pFS5xKZXK5/Dp5vGie8tr
	 aa0qzWZWGTdxJE5Gqsl8aiEihmef/g4cfP/uxyRTPwQumUT2Jhm+qxD6h2WBNzpMcF
	 V9ROIw5E2pFsrNJqpE/g+xo3EhQPKNIScxlPthDs=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
	by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FrXThCCueyA7; Thu, 17 Jun 2021 14:46:39 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter1.mymailcheap.com (Postfix) with ESMTPS;
	Thu, 17 Jun 2021 14:46:39 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
	by mail20.mymailcheap.com (Postfix) with ESMTP id 739FB40CA9;
	Thu, 17 Jun 2021 18:46:38 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
	dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="tcxM+t0h";
	dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.162.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 6B579422ED;
	Thu, 17 Jun 2021 18:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1623955590; bh=4gkLi/3IFEA67/QLHoK4G32AIEp2qJ9pWDtfs8DhElo=;
	h=From:To:Cc:Subject:Date:From;
	b=tcxM+t0hK4j8SWEtzhgQ2mYQXg6gx/gqFZ4uoBOueDr2nkK7YOvXsnojs5abmt8Uf
	 CB+GWDYAETwor04vJ1GtXv8YKDJnbXgt9NrAL+PXGIfqUadaWt1JCVvswj135PJj7c
	 QZ4hhejWHRt9wEgjM2L0YNeoMpR3kERXMGZ12cwM=
From: Icenowy Zheng <icenowy@aosc.io>
To: Simon Glass <sjg@chromium.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [RFC PATCH 0/4] mkimage: sunxi_egon: add riscv support
Date: Fri, 18 Jun 2021 02:46:17 +0800
Message-Id: <20210617184621.4083311-1-icenowy@aosc.io>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [4.90 / 20.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(0.00)[aosc.io:s=default];
	 RECEIVED_SPAMHAUS_PBL(0.00)[59.41.162.158:received];
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
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
	 RCVD_COUNT_TWO(0.00)[2];
	 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: 739FB40CA9

This patchset tries to make mkimage -T sunxi_egon to be able to generate
an eGON.BT0 image for Allwinner RISC-V SoCs (e.g. D1).

In addition, to keep the compatibility, it will still consider the
architecture to be ARM when no architecture is specified.

This patchset is RFC because I have no idea whether the change to
mkimage common code is proper (maybe we should just change default value
to IH_ARCH_INVALID?).

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
