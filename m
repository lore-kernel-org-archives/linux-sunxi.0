Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4772
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Jun 2021 09:20:44 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id B2B88260EB
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Jun 2021 09:20:42 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 9AA243ECDA;
	Sat, 19 Jun 2021 11:20:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by filter2.mymailcheap.com (Postfix) with ESMTP id 7AB5E2A8AA;
	Sat, 19 Jun 2021 11:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
	s=default; t=1624094435;
	bh=y1Wjki0JeDTYf9Igk8dpuuTgz693bmQNGymPoybR7uI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CbBz5e9WtnBTw1DmVZgmYfXAC6Cb3SAhjD+8/2uhKrKWLzEPEcG23kVC0VA1cB8gY
	 YhSkl+5hb4t9Wo3uTp5u6CQRLs1GgIOchYXI9YzNdiGYbA0xYln/YnWpCpUkTZm7k7
	 QiQuQt3CCLDH4wvQeSY7G8DdM8IQx39sZYz7unnc=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
	by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HHqtNw0naP70; Sat, 19 Jun 2021 11:20:34 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter2.mymailcheap.com (Postfix) with ESMTPS;
	Sat, 19 Jun 2021 11:20:34 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
	by mail20.mymailcheap.com (Postfix) with ESMTP id CDB33412DB;
	Sat, 19 Jun 2021 09:20:33 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
	dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="IAkUIhD3";
	dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.162.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id D4D00412DB;
	Sat, 19 Jun 2021 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1624094425; bh=y1Wjki0JeDTYf9Igk8dpuuTgz693bmQNGymPoybR7uI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IAkUIhD3Sdb3wExv7I4UmR/pc2NoSVffoR4i4w9ehrc/FHVjNcLOC9nUqYvs0XxLk
	 hfsmbJNpQs7UGxqsQQQFQyrRNbblQWnJfoIHmAjS89IO/OYMoeiniXFfJbh/y6FcWd
	 ndCsj+Nxhegy8kOZSni/KJDEGaIbPDxLkC9plMW0=
From: Icenowy Zheng <icenowy@aosc.io>
To: Simon Glass <sjg@chromium.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 3/4] mkimage: sunxi_egon: add support for riscv
Date: Sat, 19 Jun 2021 17:20:05 +0800
Message-Id: <20210619092006.646929-2-icenowy@aosc.io>
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
X-Rspamd-Queue-Id: CDB33412DB
X-Rspamd-Server: mail20.mymailcheap.com

There's now a sun20i family in sunxi, which uses RISC-V CPU.

Add support for making eGON.BT0 image for RISC-V.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v2:
- Removed changes that should belong to the previous patch in v1.

 tools/sunxi_egon.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/sunxi_egon.c b/tools/sunxi_egon.c
index 062c9bc151..836e99a6e6 100644
--- a/tools/sunxi_egon.c
+++ b/tools/sunxi_egon.c
@@ -29,6 +29,7 @@ static int egon_check_params(struct image_tool_params *params)
 	 */
 	switch (arch) {
 	case IH_ARCH_ARM:
+	case IH_ARCH_RISCV:
 		break;
 	default:
 		return EXIT_FAILURE;
@@ -60,6 +61,10 @@ static int egon_verify_header(unsigned char *ptr, int image_size,
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
@@ -128,6 +133,24 @@ static void egon_set_header(void *buf, struct stat *sbuf, int infd,
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
