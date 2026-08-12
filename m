Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE04383C66
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 20:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786565708; cv=none; b=reVdExHgGNOJypSmN0n7z/LPk6GmhoEWEGAmHI0JqhtdrnuxEkPiPEoV5HfbSa1geKJpX6N560JNHVCKS7zvRqgMGwXXug2pL2qN4WT+0jzwyCvAx8GKU9zk/MKIjUlzFZ2Z/2P+3xzEz0PLx/wvERonmbW55dI+z6Q+hIwnbo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786565708; c=relaxed/simple;
	bh=ZzzMUPtD2agEDVD+V4pqZV+58Sk+VvWYf9jduKlg61M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oITCifQUxjek5jljW1e6++LRehR38RO45Tls9WMdl20NxT1M2I9GMPselYUx4Dsz+awkN1Tu1uIOCTRb3kpXzqCAUM9PUPu00BagTEzS5AdaXYT9DKF2Ok4PlFPEHVWbbtgTA1VNfmsALDiR3sh51RSmrUyBEVzUJjxzL/wcSrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJnMg8W4; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJnMg8W4"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so845972a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 13:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786565706; x=1787170506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+us5LkeXEHXP7Bo8YO3vnlZ8f5jwklcgg3vudwCzrL8=;
        b=sJnMg8W4QLwKNonXER873iXnioYNSiAB/y7tEOwOPfyBjEe7UXGeCv8vLrXvPTrbN7
         Xmn6xRWMIalY8W69/6+SplYmfDZE3dhIxGNdAVDZCpK0lj0jsAg56vlsFhOFxKxl8s21
         wfWLEOgpiqfd3pmKKQJbEJjw2oR2qx69GLYsIHyr/61TzEyQFOn95uE/ekXyhLpGVnNE
         +iISAjgk3x5ax9z5nWwvo1zRZ+oWx2GDk/DlvDzcKfYPHqrn4uvb78BfHAQinu/kdpf2
         ljxyK8zvtFFNnwf+hdRM8GOTmfUbSuf1mo2H7ppajP3Px2I2HxP0xvLWzouKLnXRLct9
         ocOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786565706; x=1787170506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+us5LkeXEHXP7Bo8YO3vnlZ8f5jwklcgg3vudwCzrL8=;
        b=j3pKKLPfwM1QQ145Lnv4XkGZ+riF6q/NdbLsMgCzSPJnhZIn8LQk5jmW2iDWhSv36B
         QLM3x/0uKa8rxfw5nR7RwaETL6mYnKhrhzfnZnTY25LOL0ga87W7ygg4F2mL1lVMb54y
         OCyvMGDGgyfn4qbWzM9n5a1me/Q0FcOLKU5yBTcojHs7w7P/9hZWiieMaFD0nuX/X0+D
         zsuH3oZf465SqwzFfErstrDs/DGQOoFVMMAGhQsE0Hx2w2Ien/7uAhX6Nn61ZmxdZfkw
         K31Pg/nrCsBN4aVVYWIRe4H8u9jWF1mHQfYvvMiDHdEYOtTtKMmRfJDll+PW+fY0Mffd
         p6yA==
X-Forwarded-Encrypted: i=1; AHgh+Rrxm14gHOg4cloHYG1SpBq+159Wi4Yi8o6M3oQVC/wGmb2ZruSQla20N7ffAxfImdi8evIMjNlrbdovBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJc8GL6tOA8FQq88XcpQ1fmByrLxFJxZt3bJwiObfwxs/ib4t1
	4t8P3aEPenPID6aoP16IlV2gUNgoe16Gm2cRKINoz4iEyyrTHLmh6PnJ
X-Gm-Gg: AR+sD106mkRKGBUtLUCwSVwYrhryWWsc+DqniwlsjTiIxibl9/DqVO3DYAWlSILWwMC
	UIk5sQbGzlCGT0ABvkbUUwNR7vaEGmX4FF54SIckkFTKLCjFJPltL9z4NQbAbUjngrL5Jn9Ai3G
	AjGGlUAVjpL5IscOGhTBp3WtC2Sx3ReBzAw4mooNwyEdBA4V6ie5m7CjuDzWeLyVb07wN51qDsQ
	7aJUwv+/lzwitbB2+prjCOyHuWCe3dQy3nyagatjsr739f3OdQ+f/aS0KnKKhCJKnZKcA3Dk0VP
	GqohgIW3Ln0IbCVKZj5t43qoehbVYMA0SVWBaThwRP/iz1Ykhqm/JjW02YJ0tm22xLiMLd5jovU
	ZpGJyzH4ZrVXqmAGzfPJ+dAUxPYfCDSch3nGB6EdLlmx1YT9nlT7Ykpb6S/owe41kPiPkGalucy
	g65zYp/ExXRRHKKQczyUkty46rRr1a32T0cMEOz30mp5QWWdxmbsJleUH6r5qO14D/8DM5eryA2
	JibJpqcUDHTt3tgEOOzfA0OeW327rrS37nJIEBQ
X-Received: by 2002:a05:6830:828a:b0:7e9:c102:333d with SMTP id 46e09a7af769-7f3ca8b718amr328737a34.9.1786565705503;
        Wed, 12 Aug 2026 13:15:05 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3c9cf3b0csm256006a34.21.2026.08.12.13.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:15:04 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH RFT 0/2] clk: sunxi-ng: fix A523/T527 single-divider clocks
Date: Wed, 12 Aug 2026 16:15:00 -0400
Message-ID: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723004856.55158e84@ryzen.lan>
References: <20260723004856.55158e84@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andre asked whether we would post the A523/T527 conversions for the clocks
whose ccu_mp descriptors declare one divider field with width zero. This
series implements those conversions.

Patch 1 adds a feature-aware M-divider helper so M-only clocks can retain
the CCU update-bit handling. Patch 2 converts MBUS, IOMMU, and DRAM to that
M-only class and converts HSTIMER0-5 and R-TIMER0-2 to the existing P-only
class.

I do not have matching A523/T527 hardware, so this is deliberately an RFT
series and carries no Tested-by claim. The series has passed semantic and
register-bit preservation models, KUnit tests, strict checkpatch, sparse,
GCC and Clang builds, full arm64 Image/modules/DTB builds, reproducibility
checks, and hostile review. It also applies and builds cleanly together
with the current A523/T527 GPU clock-model v2 series.

not tested on A523/T527 hardware; testing on actual hardware is needed.

In particular, testing of clock rate changes and affected users of MBUS,
IOMMU, DRAM, HSTIMER0-5, and R-TIMER0-2 would be appreciated.

---

Enzo Adriano (2):
  clk: sunxi-ng: add feature-aware M divider helper
  clk: sunxi-ng: a523: use single-divider clock helpers

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c |  37 +++---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c   | 136 +++++++++++------------
 drivers/clk/sunxi-ng/ccu_div.h           |  18 ++-
 3 files changed, 96 insertions(+), 95 deletions(-)


base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.53.0
