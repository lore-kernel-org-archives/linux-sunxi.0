Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0BE4434
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Aug 2023 09:36:36 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4RKB682fjfz9sqc;
	Mon,  7 Aug 2023 11:36:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1691400992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kZpxdp3WWrr68mqrd9vM4xeTDmgXtm3KexoKUIzHbkI=;
	b=fkdPRm4TNu3wr+E8D6PfuCvJIg7gHvuQwksCCOcW8F9IZ09vG7kZFxy+i/rPxPtOdFRgVM
	5uBXNCtO6s01bqrL6bpWib+nYV99229QzJ4JS7sBJm+ZJtpn6yUBogL3kJtLID7415kE2Y
	0AhJA8uqnj+L6ZkyZPhgfYE2cWi7CCXaOZwV2i+d94nrTkP4mze4b7iTr0W5FTygrZ3CtD
	9RJKsqoOxiMrJ2jP087wiOBCA7T4d+h1nHL3rQcUeiQ3qpvTxX+i2FARkwxmjP0oCHLrp5
	35lPm3Nei7no5UmFmfwsTvo57w/pJ1R3hleEgDMl4qpDEocoyQRGi68VtfUVkQ==
From: Frank Oltmanns <frank@oltmanns.dev>
Subject: [PATCH 0/3] pll-video0 notifier for v6.5+
Date: Mon, 07 Aug 2023 11:36:01 +0200
Message-Id: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAG70GQC/x3MQQqAIBBA0avErBM0paKrREjaVAOhoSGBePek5
 Vv8nyFiIIwwNRkCJorkXYVoG7Dn6g5ktFVDxzvJRz6wtVf6vi6daEPPtfMP7YSBiV5ZY4fRSCW
 g1nfAnd7/PC+lfID2kKtpAAAA
To: Icenowy Zheng <uwu@icenowy.me>
Cc: =?utf-8?q?Ond=C5=99ej_Jirman?= <x@xnux.eu>, linux-sunxi@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Frank Oltmanns <frank@oltmanns.dev>, 
 Icenowy Zheng <icenowy@aosc.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=nROP7YwIq8z+AbK2M57i28CNGajVkLEvqKGf+Qa+z+g=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBk0Lsel5t0vFMa3FpDdYJNYlKBTD4f2MSyVUVnO
 DqAEyQ7LESJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZNC7HgAKCRCaaaIIlErT
 x/wcC/4rVzHTyaruPSCt+z70dYHY1fAt0kST9cIhJhQEKa3gZaVA7eIWKgnUwyEHSkLLwU/Y2ME
 aXJmrAYgHWtCbci6OE8aZqdQPKTttbqQw/Uza2Hsi+qj5j691Xo5PX3SzE7/Jc3i6YMqku+7djy
 lDktVFeAN0JmPdneMv58PIuzs1z+4tFIFUqgQ2H+JSzX9LB7wLRlifMWJkVKw/1NO5cUBlRMNde
 ErqV5OzvOPChDX88dG5cxO1c3j09etPnbyrvZ+c3Ftyeqd+ICMFU9bTu5THbhBzEDc9TBWioLGs
 WoAZCR1wXsKdpIa10tvsww2KhzI7R/9RNhLucP8NigPKOp8/JeBe0ukLIP8v7WtaDMv6dgBZLFy
 vMydaNtI0pg/YZyOQG8lSqSDhuXQ0IE8Dlml5QWII5aI/5uGSqjCQZa8/KBa4NZFEAJW7CUhzHP
 Lrl8gPN12Ohl+urVisUNxXrSUs4mmbgV7ittNf0uPNueK1kBd33OVyZl/swsZZ7LlffKM=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7

Hi Icenowy,

it is my understanding that you are the original author of the following
patches are in Ondřej's 6.4 branch [1] [2] [3] but not in his 6.5
branch. I assume it is because of merge conflicts as the part about
setting the parent has already been fixed in the 6.5 release candidates.

Therefore I've removed those parts and adopted the commit message of
PATCH 2. I've removed your SoB, because I think you'd need to sign of
the revised version. Especially patch 2 has become a bit simpler and I'm
wondering if it makes sense to try to upstream the three patches now.
What do you think?

Thank you for your amazing work!

Best regards,
  Frank

[1]: https://github.com/megous/linux/commit/2cd3d57adf83e2d091baed77e1aafc01d545d123
[2]: https://github.com/megous/linux/commit/c9c7bfe22f0fefdfc1dc2ce84b452964112399d7
[3]: https://github.com/megous/linux/commit/e19ccee10a8492535b6cda1ba97cccc2074d6e65

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
Icenowy Zheng (3):
      clk: sunxi-ng: add support for rate resetting notifier
      clk: sunxi-ng: a64: keep tcon0 clock rate when pll-video0's rate changes
      drm/sun4i: tcon: hand over the duty to keep TCON0 clock to CCU on A64

 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 15 +++++++++++++++
 drivers/clk/sunxi-ng/ccu_common.c     | 22 ++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_common.h     | 12 ++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.c    | 15 +++++++++++++--
 drivers/gpu/drm/sun4i/sun4i_tcon.h    |  1 +
 5 files changed, 63 insertions(+), 2 deletions(-)
---
base-commit: 1cf5c37ee3c2334a964c65e52b4e0c59b4332d7c
change-id: 20230807-a64_pll_video0_notifier-164cbc78b341

Best regards,
-- 
Frank Oltmanns <frank@oltmanns.dev>

