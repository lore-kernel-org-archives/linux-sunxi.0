Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BCF72
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Jun 2021 09:19:13 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id E874C20013;
	Sat, 19 Jun 2021 09:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by filter1.mymailcheap.com (Postfix) with ESMTP id 3378A2A0D2;
	Sat, 19 Jun 2021 05:19:11 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
	s=default; t=1624094351;
	bh=4UXHgKFvzJ9H3TXK7kxS/Zm66bT5TLHMvrrYNdkChec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MT6j8cjhQMyCf38VM0/uGIePCwCZZY/Fmju8UHyJvsu62cRhISMKwu4Bj2BqefrbR
	 c7AX7lvUH1vD3+avRjXrJRfG9rt/9iIo4rT5xQYCoVPkjm/ub95iagbPX8AFWDW3L1
	 iRUJ3yACZhN1EHRanwAUSrv2HiK62aMKv29HFOW8=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
	by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1JjyBVvXaoWr; Sat, 19 Jun 2021 05:19:10 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter1.mymailcheap.com (Postfix) with ESMTPS;
	Sat, 19 Jun 2021 05:19:10 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
	by mail20.mymailcheap.com (Postfix) with ESMTP id 52EF3412DB;
	Sat, 19 Jun 2021 09:19:09 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
	dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="HqCikq8a";
	dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.162.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 43A0D412DB;
	Sat, 19 Jun 2021 09:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1624094341; bh=4UXHgKFvzJ9H3TXK7kxS/Zm66bT5TLHMvrrYNdkChec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HqCikq8a4z/cdGQ4zMBRbxqR6NrDi6/Amx78nAXfK2xxGK5uSBwH55wpFmfVeVB9c
	 2wWgk3dI/KG/kA4xib57fpqotzmiRPNIjA4IxEu7sIhXxaXuWPAC36yzJOLmMOJu8i
	 TXuH60Px4ZX9nDCTGDzNO8pSEZUtn8iQZemDLTvc=
From: Icenowy Zheng <icenowy@aosc.io>
To: Simon Glass <sjg@chromium.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 1/4] mkimage: add a flag to describe whether -A is specified
Date: Sat, 19 Jun 2021 17:18:35 +0800
Message-Id: <20210619091838.646779-2-icenowy@aosc.io>
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
X-Rspamd-Queue-Id: 52EF3412DB
X-Rspamd-Server: mail20.mymailcheap.com

The sunxi_egon type used to take no -A argument (because we assume sunxi
targets are all ARM). However, as Allwinner D1 appears as the first
RISC-V sunxi target, we need to support -A; in addition, as external
projects rely on U-Boot mkimage to generate sunxi eGON.BT0 header, we
need to keep compatibility with command line without -A.

As the default value of arch in mkimage is not proper (IH_ARCH_PPC
instead of IH_ARCH_INVALID), to keep more compatibility, add an Aflag
field to image parameters to describe whether an architecture is
explicitly specified.

Reviewed-by: Tom Rini <trini@konsulko.com>
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v2:
- Added Tom Rini's Review tag.

 tools/imagetool.h | 1 +
 tools/mkimage.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/imagetool.h b/tools/imagetool.h
index e229a34ffc..5dc28312c2 100644
--- a/tools/imagetool.h
+++ b/tools/imagetool.h
@@ -51,6 +51,7 @@ struct image_tool_params {
 	int pflag;
 	int vflag;
 	int xflag;
+	int Aflag;
 	int skipcpy;
 	int os;
 	int arch;
diff --git a/tools/mkimage.c b/tools/mkimage.c
index cc7b242faf..54d8e3835a 100644
--- a/tools/mkimage.c
+++ b/tools/mkimage.c
@@ -168,6 +168,7 @@ static void process_args(int argc, char **argv)
 				show_valid_options(IH_ARCH);
 				usage("Invalid architecture");
 			}
+			params.Aflag = 1;
 			break;
 		case 'b':
 			if (add_content(IH_TYPE_FLATDT, optarg)) {
-- 
2.30.2
