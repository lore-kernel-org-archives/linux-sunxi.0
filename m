Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847A670
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 18:48:29 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id A615F2015B
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 18:48:28 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.119.157])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id AEC52200FD
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 18:48:19 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id 4B53F3F15F;
	Thu, 17 Jun 2021 20:48:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by filter2.mymailcheap.com (Postfix) with ESMTP id 2A5B02A8AA;
	Thu, 17 Jun 2021 20:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
	s=default; t=1623955692;
	bh=nEj+FxOXS4fFpJxqepGg4VZJjm83FcgoqECmzWq6dEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MPCGKvWMbsLvogbO3miAaKU1AxUBka87+sCTE+ZxCPbAn7JqB7UBD8MYKACVqu/E2
	 OFs1W3oUkIa5MibBsgUxUZYbvVJtf3+6y/L/gaMdvlZohjyghPKa6gv/SxJoBINq6H
	 AclKTnhrQH7pZZrRqyiim7wOfmBSlL6C7vMaDK2M=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
	by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ed6cZUHtHwvU; Thu, 17 Jun 2021 20:48:10 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter2.mymailcheap.com (Postfix) with ESMTPS;
	Thu, 17 Jun 2021 20:48:10 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
	by mail20.mymailcheap.com (Postfix) with ESMTP id DD4B94279B;
	Thu, 17 Jun 2021 18:48:09 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
	dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="WdvKei/1";
	dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.162.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id C9E5A40C1C;
	Thu, 17 Jun 2021 18:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1623955682; bh=nEj+FxOXS4fFpJxqepGg4VZJjm83FcgoqECmzWq6dEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WdvKei/1PIDa3BhOKUx8TWxX3gI6eULixdnVO7l0qReVoYmEpClLkHFLqhBn/MlvW
	 OG00RJdH0UANfWeJeh7iC567iPuzaqD5Z87tqxJWrjUUeCLjY0mLa4J/3jUSwhGqHJ
	 7vi8X5Bok9CS8AvaFRnJflZIBKz9EdBj3Acr/Jck=
From: Icenowy Zheng <icenowy@aosc.io>
To: Simon Glass <sjg@chromium.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [RFC PATCH 2/4] mkimage: sunxi_egon: refactor for multi-architecture support
Date: Fri, 18 Jun 2021 02:47:49 +0800
Message-Id: <20210617184751.4083469-1-icenowy@aosc.io>
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
X-Rspamd-Queue-Id: DD4B94279B

Refactor some functions in mkimage sunxi_egon type, in order to prepare
for adding support for more CPU architectures (e.g. RISC-V). In
addition, compatibility for operation w/o specified architecture is
kept, in this case the architecture is assumed as ARM.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 tools/sunxi_egon.c | 63 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/tools/sunxi_egon.c b/tools/sunxi_egon.c
index a5299eb6a1..af649c392e 100644
--- a/tools/sunxi_egon.c
+++ b/tools/sunxi_egon.c
@@ -16,7 +16,25 @@
 
 static int egon_check_params(struct image_tool_params *params)
 {
-	/* We just need a binary image file. */
+	int arch;
+
+	/* Assume ARM when no architecture specified for compatibility */
+	if (params->Aflags)
+		arch = params->arch;
+	else
+		arch = IH_ARCH_ARM;
+
+	/*
+	 * Check whether the architecture is supported.
+	 */
+	switch(params->arch) {
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
+	if (params->Aflags)
+		arch = params->arch;
+	else
+		arch = IH_ARCH_ARM;
+
+	/*
+	 * First 4 bytes must be a branch instruction of the corresponding
+	 * architecture.
+	 */
+	switch(params->arch) {
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
+	if (params->Aflags)
+		arch = params->arch;
+	else
+		arch = IH_ARCH_ARM;
+
+	/*
+	 * Different architectures need different first instruction to
+	 * branch to the body.
+	 */
+	switch (params->arch) {
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
