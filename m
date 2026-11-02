Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638996;
	b=crSf55CRT5swVNdkkO9MsxMvtQRKXmxwFEaQ3OfzjPFYrhxLMOXk+uI62hDpknTLUq2+
	 3+jj5Xd9PQ21hBDt7nUGpSkeE5DzL+z9bjEP0A1y5hGTwBQkGkUQMLgS2GBZtq9UkKlre
	 GWo+uFRi/VY5qnDw57kxBCgtKYXXCp0zUMJn1+bu9TlDfeOAKANaFEmObCCaf2A0EWwQX
	 ChsYscGCWAVXVZ5m+R3LQv3EmITpFazRs8Wct7aCshWAHUKHjXmGYHRT/8kfh4XMMA6Wq
	 oZnzkOT7hTmYCFaO57BCuMz45efCDDCLKv8YEiNQ04kk+PMEvrdMt8gfp6g/uV1lHJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
	b=Jpym2U3oJvoqe/outbAkKhd2QA0JxSIVd3M3wB2hGUfuOvIASyS5lTa41xWpRv3As+Pr
	 mTuS6lrR+foERp9gyJwMzzXgA289EauL+wL5+oKhcec7L4U+9dkcOvfpi+tdCIBjcCvAV
	 uefEwmJEWYWe6fKLDD6RC9kh7yh4BRHY7Hm5lKN05Sc/ItlFCoxNizRYcN3Y/iDx64qsH
	 seW45HiBn2oXlIwskoOXg4Bfy+LbCknFphWnuJIndZ3Yg30STB5+dudvp4Emu+gMplYuS
	 gAJsf1UalLrBPFl1+t/vkJGqBtxQGDm/m/fZ7DP9+OU81N+s4iagfKA0Em68r0kREfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6GcWqVv;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB0C606A5A6
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 17:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB0C606A5A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6GcWqVv
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c247f6687dcso567035466b.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638994; x=1794243794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
        b=b6GcWqVviwPkNc2hUrUD7vnf5jp98+FptutNIuktSeE9uphenyTkiWTokZ1KVN3WTW
         694cI3NoSs8OjOSdRMCgmujneuC+YE2Q3mCeCXKWux8qfPRtVC9s+e4pO2Q6lmKYlKRI
         dXYj6eFAf3TOwsAU34sQkrMiYQ0HffhZUdEx3MLpepzyl7oFeCdfOgLa1W7BxFnTeHmD
         raTffUowLfXR57P95555hRZN6ATtywy/5cwAoPZ+fPGrGNc+os5zhic2Een+ytA97tMo
         yf62njGDz48YUJKsCOR8Ctmz9fVO9cLSIZLJNiDmoMHNEN7DVo9XNP/rJg+dI+WX1WJs
         x+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638994; x=1794243794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
        b=tBV1P6oHAM65wcudXFw1u3eZIA9bluvePaaH7HFarjBkvaUI+R0N4R/8ROUiTRKtKE
         Qnkpp0G4ZznQLfPiAWLazcQ+FMarkB+eBUk97RUe3YBjYqO+35U/fASrxovOwdzo3mkv
         PgELek+fdLhAwahsErxZCdMmvpjI/lBK5VV1ucyCDmqYAyJGzV7awC/1bDbzaydtkUee
         sbDLniqZKWNn40t+uWNW7xPMsetFBSAsZSVpm+cV5RBSfbixo1SsWA0Ixc0LXqNY2FCy
         J5gvtPDQCgEfvO27gZf3IaoEGcQ556fWtfr+xpQQdfICPoW2xbQL8quhVO/OiGTwJINl
         q1jA==
X-Forwarded-Encrypted: i=1; AKwUvByAoyKV0d/+T9yQMvURIgP/UXNHTvhZ+oiRx7744foP/b/II09B8PhMmyqlg7070TOVVBHlMmI9CG4VBQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKianMbL2wIIRQvqbmqkqBnkfiIE6b9XvbMB2Sf5hpgXKXAvWUF
	X51fTVVthnoAF+3rRr3JFTlp4kNFT97FyEWRVaYp+s7UiLCmTEPc+tKJqWyxdg==
X-Gm-Gg: AYBFou1EQiP1ahENyPU3hbLtyDgpyphSPSPhlcQOLeSa8Q+CwI4vMvge8e0mD02l2J4
	Lo91BbhK0RLeagPs6ZIRBDH/QMo0PoHIzeXzJbEepm21g9phmuHKvK1nO4eUTjE7rf/KiAGiIhz
	VptEMR2p/7zKfM0OfE1CGGk3gC9gRSBxKedooiZEnHoma0D8d6ZW3Xijkv/ukbBo0EH6FhJgbvq
	Uymno1JJpnQEPyHl5Ndt+EBbJVNabFCJ0z4L2uVNUaVtnjuLUNpmqGHzxySsyXDKARVOKP759cr
	oDjAbzvDPdHIfmOyojtyk0HPku8SDKqdTwcd+rDozbrFfz9AW7jvhuObw+n+N9Wej25IwraVxVZ
	1oQ0RsLyyVsmMgm4ScnQHpdYUwLw7YE9hNk6pFSFVZqm1nB8fW7zWY6/FaggnCgVJBIZ36f5WWY
	AGvIC0KC4PhGo9dya7Y1M3eMfZYexbA9NIjnBfftcjmHSNEGV3HVsMQUPtMKm15O701ny8a7rCH
	6oA/+QaQ0+Ab/708JyzX9TwUg0DAmbLMfa/7HX8ZlKAmiFFUZNPxNoBi1c21IBv+/c40GTmNc6S
	x3j8o/n+KMBECt8GxkVUNq7J9YghNlUHseHPUGzjDQBtiZIOG1wUe7Mz7xcHVawLi+EKZycovdw
	XXWrnvj1NXViFZLJB1nhYexo5BZdf5ZcLpXTDXsKztQNG4PxcTrX6znDn3wb43cQVMgMFML1ma4
	5Xh3nsNBQ4/GPn9JuUIvQs/NoGc+Nfsidcmh0B+yU2fUhZJPNvsWwvDhYGcIIcUgMcWVXI/4MSS
	wa+11SkoQepkUM2ektOTdYDgXd5O0bj/B+KCv5AaBNyUvZZHw==
X-Received: by 2002:a17:907:e8f:b0:c41:64c1:cc2d with SMTP id a640c23a62f3a-c4ca79353a4mr832997366b.2.1793638993799;
        Mon, 02 Nov 2026 09:03:13 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:12 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 00/10] staging: media: cedrus: assorted fixes and VP8 4K support
Date: Mon,  2 Nov 2026 18:02:53 +0100
Message-ID: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series fixes a number of bugs in the Cedrus driver, found while
running the conformance suites and comparing with the vendor library,
mostly on H616.

Patches 1-9 are fixes:
- patch 1 fixes MV-col buffer leak when the file handle is closed
  without STREAMOFF,
- patches 2 and 7 validate H.264/HEVC SPS and VP8 frame size against
  the hardware limits and allocated capture buffers, preventing memory
  overruns and hardware hangs,
- patch 3 marks H.264 long-term references, which fixes MR8_BT_B and
  MR9_BT_B conformance samples,
- patches 4-6 fix MPEG-2 field picture decoding (field height, field
  order detection and references of the second field),
- patch 8 enlarges VP8 probability table to the size used by the vendor
  libraries, since the hardware uses the area past it as scratch space,
- patch 9 switches H616 to the 256-bit DDR mode, which fixes corrupted
  reference chroma in H.264 and VP8.

Patch 10 is new functionality: VP8 decoding of frames wider than 2048
pixels.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (10):
  staging: media: cedrus: free MV-col buffers in buf_cleanup
  staging: media: cedrus: reject too large H.264/HEVC SPS
  staging: media: cedrus: h264: mark long-term references in the frame
    info
  staging: media: cedrus: mpeg2: use the field height for field pictures
  staging: media: cedrus: mpeg2: derive the field order of field
    pictures
  staging: media: cedrus: mpeg2: fix the references of field pictures
  staging: media: cedrus: validate VP8 frame size
  staging: media: cedrus: vp8: use the vendor probability table size
  staging: media: cedrus: h616: use the 256-bit DDR mode
  staging: media: cedrus: vp8: support frames wider than 2048 pixels

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 60 +++++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 15 ++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 40 +++++++----
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 28 ++++----
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 14 ++--
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 72 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 +++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 15 ++--
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 66 ++++++++++++++++-
 10 files changed, 276 insertions(+), 47 deletions(-)


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.43.0

