Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615BE70
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 18:48:21 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.113.132])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id AE253260EC
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 18:48:19 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 9BF203ECDA;
	Thu, 17 Jun 2021 20:48:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by filter2.mymailcheap.com (Postfix) with ESMTP id 7F9E22A8AA;
	Thu, 17 Jun 2021 20:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
	s=default; t=1623955692;
	bh=rJed4yGXHM5RMlxhQbCOUTHtgfw3f4IqURvx38kBX5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZdGSIRnnUq7vrdjDyqQEhTBZhZAoeJt3IR33JvBfrJb+90fKW68F3MQLUATmBqoWu
	 wWF+OIHuotaqeReQlGCrzCAD3/ggn/qfENhM5PsfwbYm8/q3vbq7kJNNYHrwEdWC6o
	 nCAOIidstOyc8bS0AzwGoTYM8VoOUS/4Q1DT7gew=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
	by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9zJNlu5zQkN; Thu, 17 Jun 2021 20:48:11 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter2.mymailcheap.com (Postfix) with ESMTPS;
	Thu, 17 Jun 2021 20:48:11 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
	by mail20.mymailcheap.com (Postfix) with ESMTP id EA9694292C;
	Thu, 17 Jun 2021 18:48:10 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
	dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="T4t9qRp/";
	dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.162.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 82F0B40C1C;
	Thu, 17 Jun 2021 18:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1623955686; bh=rJed4yGXHM5RMlxhQbCOUTHtgfw3f4IqURvx38kBX5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T4t9qRp/hqmLijyocQcs8FjRURPrVxBhADDFKEhmOr1NphFq9E/DBmjmvDtJWa4D4
	 Bi+sQ/WNZDVAQowcsKGipE2sywt03fwgbEfxucV4vKvbws+qmBceLk+t9ivAYPjmJv
	 mB0UeUODZipl8BOXMuYEN9QKS6yGgoZ3PMWqmnx8=
From: Icenowy Zheng <icenowy@aosc.io>
To: Simon Glass <sjg@chromium.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [RFC PATCH 3/4] mkimage: sunxi_egon: add support for riscv
Date: Fri, 18 Jun 2021 02:47:50 +0800
Message-Id: <20210617184751.4083469-2-icenowy@aosc.io>
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
X-Rspamd-Queue-Id: EA9694292C

There's now a sun20i family in sunxi, which uses RISC-V CPU.

Add support for making eGON.BT0 image for RISC-V.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 tools/sunxi_egon.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/tools/sunxi_egon.c b/tools/sunxi_egon.c
index af649c392e..0fff25843f 100644
--- a/tools/sunxi_egon.c
+++ b/tools/sunxi_egon.c
@@ -19,7 +19,7 @@ static int egon_check_params(struct image_tool_params *params)
 	int arch;
 
 	/* Assume ARM when no architecture specified for compatibility */
-	if (params->Aflags)
+	if (params->Aflag)
 		arch = params->arch;
 	else
 		arch = IH_ARCH_ARM;
@@ -27,8 +27,9 @@ static int egon_check_params(struct image_tool_params *params)
 	/*
 	 * Check whether the architecture is supported.
 	 */
-	switch(params->arch) {
+	switch(arch) {
 	case IH_ARCH_ARM:
+	case IH_ARCH_RISCV:
 		break;
 	default:
 		return EXIT_FAILURE;
@@ -46,7 +47,7 @@ static int egon_verify_header(unsigned char *ptr, int image_size,
 	int arch;
 
 	/* Assume ARM when no architecture specified for compatibility */
-	if (params->Aflags)
+	if (params->Aflag)
 		arch = params->arch;
 	else
 		arch = IH_ARCH_ARM;
@@ -55,11 +56,15 @@ static int egon_verify_header(unsigned char *ptr, int image_size,
 	 * First 4 bytes must be a branch instruction of the corresponding
 	 * architecture.
 	 */
-	switch(params->arch) {
+	switch(arch) {
 	case IH_ARCH_ARM:
 		if ((le32_to_cpu(header->b_instruction) & 0xff000000) != 0xea000000)
 			return EXIT_FAILURE;
 		break;
+	case IH_ARCH_RISCV:
+		if ((le32_to_cpu(header->b_instruction) & 0x00000fff) != 0x0000006f)
+			return EXIT_FAILURE;
+		break;
 	default:
 		return EXIT_FAILURE; /* Unknown architecture */
 	}
@@ -113,7 +118,7 @@ static void egon_set_header(void *buf, struct stat *sbuf, int infd,
 	int arch;
 
 	/* Assume ARM when no architecture specified for compatibility */
-	if (params->Aflags)
+	if (params->Aflag)
 		arch = params->arch;
 	else
 		arch = IH_ARCH_ARM;
@@ -122,12 +127,30 @@ static void egon_set_header(void *buf, struct stat *sbuf, int infd,
 	 * Different architectures need different first instruction to
 	 * branch to the body.
 	 */
-	switch (params->arch) {
+	switch (arch) {
 	case IH_ARCH_ARM:
 		/* Generate an ARM branch instruction to jump over the header. */
 		value = 0xea000000 | (sizeof(struct boot_file_head) / 4 - 2);
 		header->b_instruction = cpu_to_le32(value);
 		break;
+	case IH_ARCH_RISCV:
+		/*
+		 * Generate a RISC-V JAL instruction with rd=x0
+		 * (pseudo instruction J, jump without side effects).
+		 *
+		 * The following weird bit operation maps imm[20]
+		 * to inst[31], imm[10:1] to inst[30:21],
+		 * imm[11] to inst[20], imm[19:12] to inst[19:12],
+		 * and imm[0] is dropped (because 1-byte RISC-V instruction
+		 * is not allowed).
+		 */
+		value = 0x0000006f |
+			((sizeof(struct boot_file_head) & 0x00100000) << 11) |
+			((sizeof(struct boot_file_head) & 0x000007fe) << 20) |
+			((sizeof(struct boot_file_head) & 0x00000800) << 9) |
+			((sizeof(struct boot_file_head) & 0x000ff000) << 0);
+		header->b_instruction = cpu_to_le32(value);
+		break;
 	}
 
 	memcpy(header->magic, BOOT0_MAGIC, sizeof(header->magic));
-- 
2.30.2
