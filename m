Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C42372
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Jun 2021 09:20:38 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.100])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 979E8200FE
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Jun 2021 09:20:36 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 97C013F1C5;
	Sat, 19 Jun 2021 09:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by filter1.mymailcheap.com (Postfix) with ESMTP id 8EBB42A0D2;
	Sat, 19 Jun 2021 05:20:28 -0400 (EDT)
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
	by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mn3B_j5TLIh0; Sat, 19 Jun 2021 05:20:27 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter1.mymailcheap.com (Postfix) with ESMTPS;
	Sat, 19 Jun 2021 05:20:27 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
	by mail20.mymailcheap.com (Postfix) with ESMTP id 9BACD412DB;
	Sat, 19 Jun 2021 09:20:26 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
	dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="oikFripG";
	dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.162.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id B6F1B412DB;
	Sat, 19 Jun 2021 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1624094419; bh=YTEVgCeYWAiAqScmS3ts7/L4CTjDbDMmKpe4/r8WXkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oikFripGRfTzN3rvM+ZVZcjist/+rqx1IT0k16B7NMXS3niyUeyf/mIZsZkrII2sq
	 lLFp2CBhBoyW9RN2i950fgIYdL9miiyksBTEEKU8EBA9VHwvbNENG97qUpE8lV3DU1
	 jZeEzdw6wllL7bfjiV7kOkGdM9p3f8B2PazkUe14=
From: Icenowy Zheng <icenowy@aosc.io>
To: Simon Glass <sjg@chromium.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 2/4] mkimage: sunxi_egon: refactor for multi-architecture support
Date: Sat, 19 Jun 2021 17:20:04 +0800
Message-Id: <20210619092006.646929-1-icenowy@aosc.io>
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
X-Rspamd-Queue-Id: 9BACD412DB
X-Rspamd-Server: mail20.mymailcheap.com

Refactor some functions in mkimage sunxi_egon type, in order to prepare
for adding support for more CPU architectures (e.g. RISC-V). In
addition, compatibility for operation w/o specified architecture is
kept, in this case the architecture is assumed as ARM.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v2:
- Merged fixes in the next patch in v1 (patch rebase issue).

 tools/sunxi_egon.c | 63 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/tools/sunxi_egon.c b/tools/sunxi_egon.c
index a5299eb6a1..062c9bc151 100644
--- a/tools/sunxi_egon.c
+++ b/tools/sunxi_egon.c
@@ -16,7 +16,25 @@
 
 static int egon_check_params(struct image_tool_params *params)
 {
-	/* We just need a binary image file. */
+	int arch;
+
+	/* Assume ARM when no architecture specified for compatibility */
+	if (params->Aflag)
+		arch = params->arch;
+	else
+		arch = IH_ARCH_ARM;
+
+	/*
+	 * Check whether the architecture is supported.
+	 */
+	switch (arch) {
+	case IH_ARCH_ARM:
+		break;
+	default:
+		return EXIT_FAILURE;
+	}
+
+	/* We need a binary image file. */
 	return !params->dflag;
 }
 
@@ -25,10 +43,26 @@ static int egon_verify_header(unsigned char *ptr, int image_size,
 {
 	const struct boot_file_head *header = (void *)ptr;
 	uint32_t length;
+	int arch;
 
-	/* First 4 bytes must be an ARM branch instruction. */
-	if ((le32_to_cpu(header->b_instruction) & 0xff000000) != 0xea000000)
-		return EXIT_FAILURE;
+	/* Assume ARM when no architecture specified for compatibility */
+	if (params->Aflag)
+		arch = params->arch;
+	else
+		arch = IH_ARCH_ARM;
+
+	/*
+	 * First 4 bytes must be a branch instruction of the corresponding
+	 * architecture.
+	 */
+	switch (arch) {
+	case IH_ARCH_ARM:
+		if ((le32_to_cpu(header->b_instruction) & 0xff000000) != 0xea000000)
+			return EXIT_FAILURE;
+		break;
+	default:
+		return EXIT_FAILURE; /* Unknown architecture */
+	}
 
 	if (memcmp(header->magic, BOOT0_MAGIC, sizeof(header->magic)))
 		return EXIT_FAILURE;
@@ -76,10 +110,25 @@ static void egon_set_header(void *buf, struct stat *sbuf, int infd,
 	uint32_t *buf32 = buf;
 	uint32_t checksum = 0, value;
 	int i;
+	int arch;
 
-	/* Generate an ARM branch instruction to jump over the header. */
-	value = 0xea000000 | (sizeof(struct boot_file_head) / 4 - 2);
-	header->b_instruction = cpu_to_le32(value);
+	/* Assume ARM when no architecture specified for compatibility */
+	if (params->Aflag)
+		arch = params->arch;
+	else
+		arch = IH_ARCH_ARM;
+
+	/*
+	 * Different architectures need different first instruction to
+	 * branch to the body.
+	 */
+	switch (arch) {
+	case IH_ARCH_ARM:
+		/* Generate an ARM branch instruction to jump over the header. */
+		value = 0xea000000 | (sizeof(struct boot_file_head) / 4 - 2);
+		header->b_instruction = cpu_to_le32(value);
+		break;
+	}
 
 	memcpy(header->magic, BOOT0_MAGIC, sizeof(header->magic));
 	header->check_sum = cpu_to_le32(BROM_STAMP_VALUE);
-- 
2.30.2
