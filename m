Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826563;
	b=vwOuAopY2fOE6gcM9P94cazhPvXvP477N+JVhgoJgn/46ltLywgLXjCMtvQu9nHSZkqQ
	 wt3TLFX9j3s2/9+0oNWY0qtjTQf+Or/GWsGwzVozSceN8Y51VHfkHpDo/pBxGS3QvGumS
	 gTeJlP1d6e5GlkGGefANwoh28KhIRM5kEMVhAT8Ctk9xYLFTtc+oqOhFPy0yqo+Ig58xF
	 NQIorTg1zl4w8hHFAQ1LXUAAbok6NzbM10VsZuEhLw64igGuF6FHHm00LEqj1OqrQ8SMy
	 k+jpviJucjHFk3k+J6tcv0sdMQoehmuvDyN+tyzuG1KJn5m6UF38PV1xRHzEaejAOKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EJkLT5+FbYsBkV6aiXjOdMACJbaO9v6pAiv+btB2ar8=;
	b=mznap+4Rd+Fsv12TwpX3Kr+sISH8My7b+YUx0B2h7uCHY0fHk/sc5cvyeMymZTDao8TL
	 9LaYWOlCAeL57pkQV9ZZhHG8eoCFR3s7rFu5+rDGWRVJYm/fkTWIlCihu4KItG6fxPt4v
	 Fvo8LyABtDlzid0PwmFoRPPkBUKBA7XDDcssSo1Bzx9KqonNRp7Tde5XAzWvqEGpBkXxC
	 4XIZ6TJ8hjLWwvY/T55/EbCvut/1luwKqRuVDj5Jhjisfa8MQVBTKKH3GFzVndB6l8TPw
	 HNXO8hwtS9im4ROJYzq1JQCulxhGkz4DFy61wRQBSZBr5QGeu0DynFyeGO12KR4OWiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aSwixBmv;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C40606A323
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 10:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C40606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aSwixBmv
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4b2bf375fso10012397b3.0
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 02:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826562; x=1795431362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJkLT5+FbYsBkV6aiXjOdMACJbaO9v6pAiv+btB2ar8=;
        b=aSwixBmvGkZRdqXyMwHbmTQP4VE2Lq4xI0Qx6GzOmQyfmBig6UXtjZWc8txrVfzFEf
         KLBtJXifzgwusTq45LEGxYeN8IVH6L7l/I8mMdIkgUoGa8J9R9F2A9Tu2qj71OXng34U
         JKet4qYlCVofOJ6UWD0ECVOEMctOmYDzHIcIGgE4b4fdNQjYEZdPd/8geRsG2ZGIUF6c
         whQVgROp/0M3QI4du2+wNvr8O5m3NMa3sPby9RQ50DGnvU+KCqNYNano62hXyhxmi4uo
         VReP9B+QZ3mkt0DKgL3NQ1bCzLx/hnPf7bcOzzA3CSMahLi8cysxOpLDpSBgAVXruX/z
         +eHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826562; x=1795431362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJkLT5+FbYsBkV6aiXjOdMACJbaO9v6pAiv+btB2ar8=;
        b=oGDhNVVZ0NYv4L0zAmf9bc7WI8rDYJ6j1yMp3zpAlXXvmToJ4Wc51TxonsNFoZKgr6
         vc7Vldvtza+cUe/FBbkfW5zxPvFBTGZw/bUw3aDlxKoP/5i3X+2VmPnn7NHGG5Kmf28u
         7RvCYueXLrustjTwbmP05tLeLVBMxh7napxC26bhd5HLECuVWvZwnekiR0hfif7/GHsB
         kPMimFerxxKrC2Z7UhNPaEeAZP9A1H0mNXriA1/9ypu21pYBoXzWs6+vQnfGBpz/KGi/
         7amfJ+B4PtrRLfITnH1az6NPKYEejeyyaFRHC0F77o3uPh65NrLZA6uY+GWcSzfECRfa
         rR6w==
X-Forwarded-Encrypted: i=1; AL+hErG3EDbDcFoVn/OuINalI86G0BZTw0BmA2ukUMjbk5ozqExWEFeULu0zYiLftmx+HHL/OI5Xya/iFGmt3w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/6ojqkTIkHj7USfaQKIFCbKdwqm0+V6F2Zcb1L/4QbIFRnu0QH
	wh6cP0t3T2JEsg9jsBd0gHaDuOeK1aFg0+AZJHvvDYAfcJj/rODrzbfS
X-Gm-Gg: AZFdTZf1fnhjDwdv3+9gLYunZ0Chmsi5Emwk3gSbgOO9T5v3Foi3SrL9dTgSLOfrc4N
	desSVv98NkcLA8k8qoRUpr2xxIAn5zq39pSN64RL3ui5Jr0X1eZm3aPi46X287yaidTeb2ZmBSF
	btyUN8j9RTpBeKoXQ9wxiz3gEpKeDeZ01KEHP2gYAijbXzWhuZ+xfc+twgPvK43rn5FxxhaU00b
	AH+oYNNGvTr+pZp2D6UpxQLMwyeVEAbU+FBDRMo4Vx7GDyZ6L07aSmQthtaXCax+onUC9CXa8HW
	C4Bn/6mfIE7taxDzbK4KwBlWLQAAVS4XeasbSp0wdNMRu5/EDbiHobo0Pb7ZsPrpdPgsq8Sl8P/
	HytDdRSYdCwSOi28X1cRFSRaGS77KuQesNCC+IqcotUA0XCfOuRVCrTwX/E+mL//JQke5cSpQeP
	me6IL54TVlxXBl+0MQpK8/K3KXcgw78ikfvDsoAtayJaN6dlVQNeZLSFPtRqnz8/0y4X4DABgLC
	BECE48KE6JbRKwpjlhZU7bTPYQoQ61z8bFNHBptK7I0KfosWJsGGhp1ASe04pVIj9yy1y97vSRZ
	VT5JgSA501YMNyRNgQUwOpW2d0Lpqj00U9x6AHKWpAs1On01Lmc7NvMpiFs6pFW1ePvWUkOcV7z
	T5H6uKbYdixskau4YUiPxVWkHbYUVguOfiSx41/IVAeeCjyg52yFbQ/74QA==
X-Received: by 2002:a05:690c:34c9:b0:8b4:c9b1:ba6b with SMTP id 00721157ae682-8b4c9b1c520mr26140997b3.23.1794826561834;
        Mon, 16 Nov 2026 02:56:01 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa41:8a69:2b8b:32cb:351d:f30d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm82274987b3.1.2026.11.16.02.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:56:01 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] phy: sun4i-usb: add the Allwinner A733 USB PHY
Date: Mon, 16 Nov 2026 07:55:42 -0300
Message-ID: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the A733 to the sun4i-usb PHY driver. It works with the D1
settings, except that the A733 gets SIDDQ cleared before the PHY reset
is released (patch 2). That made an intermittent USB1 enumeration
failure go away on my board.

I only have one Cubie A7Z, running a local DT, since there's no A733
dtsi upstream yet. Only USB1 is enabled in it, so PHY0 (the OTG port)
never went through the new order. The boots ran the same reorder on
top of 7.3-rc6, before I turned it into a per-SoC flag.

The numbers are in patch 2. The comparison inside the last run alone
(1/31 vs 0/60) isn't statistically significant, so it leans on the
earlier 3/40 too.

One question. The vendor BSP uses this order in common code, for every
SoC. I kept it per SoC because I can't test the others and the manual
says nothing about the order. Would you prefer it for all the SoCs that
clear PHY_CTL_SIDDQ (D1, H616, and A100/A523 through the D1 fallback),
or is a per-SoC flag fine?

Changes in v2:
- Reword the binding commit message into a single paragraph (Krzysztof)
- Rebase on phy/next and drop the dependency on Xu Rao's "phy:
  allwinner: sun4i-usb: disable the PHY2 PMU clock after SIDDQ setup".
  Patch 2 only overlaps with it in context.

v1: https://lore.kernel.org/all/20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com/

Vinicius

Vinicius Pedrosa (2):
  dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
  phy: sun4i-usb: clear SIDDQ before the PHY reset on A733

 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  1 +
 drivers/phy/allwinner/phy-sun4i-usb.c         | 35 ++++++++++++++++---
 2 files changed, 31 insertions(+), 5 deletions(-)


base-commit: 6bdfbe223ed4735073c299a6645ebd3faac3f51f
-- 
2.43.0

