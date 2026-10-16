Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F042931EF
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 11:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150691; cv=none; b=HWdNEJ4EUXD/M2j27dsoVrFiMNPlTyXOhsOREVKmiaj0wZ0obwdXYxJ7hcTpW+M/cruIg1L4J9QlMiOs32yNuiyM8CeMW7ucJWvaWXZq6amtBtA3QKNuf6xluTSCQpcplpAlffV9Y/vDuNWpAek3eh+jl/x8Us8JeHmYHpbgbns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150691; c=relaxed/simple;
	bh=sKGg1tN9Cccwb6abvyttzA3Koepl4cYM98WljAGJmw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MT7zCfMdXq8vWBW0ZXjkmF8k9RixTrQ/vaX7/rtdHI4poekjdgdHWQqwyDXHFJIN5yRCYFUrtMqt0TyvNxEnYuRwHgjHUlezS4OIgcbzt6pm/jrtBrQmN7b3x49v9+JUnhV8mYJNpn1TfbQ1cniHwyp4Q8PsejKC83Wofroya7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=su9mJ2FY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="su9mJ2FY"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1350044f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 04:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150688; x=1792755488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2to3/HS5QrqXW5ag9oyRzHLN+O7mWCd99D09pX0/80=;
        b=su9mJ2FYwU0Ac1wobJGlgbjDrmCVO7HKra3gC6jFJDPu5Md6j/IqE45YfPab0Cq7pU
         3Yaye93O/jmytMYvFaCbdtLVIi8jeKY7jgFXZcKtyOnMkQVo9Nubv57NDqPnvRAmVCx1
         G+prjfgWaOpd7fSXUs8Lw9btqb800CbrLVW0ivwxbIWlpAl0pUzfjOkcJRJ71M0whhX+
         TDfFUNPHRdqf+3CySO0cQVDzXc/qrXDam3q9zcqCDXEvbBMhjoOCk+WzSoH8qZJQLX+w
         3dNOBZU/y4J9vO+jFS7BsiWxxq1dhaI+UYVUvqQm8opDKfkzCFNPeuhjlsmbbLACSi7u
         9AnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150688; x=1792755488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2to3/HS5QrqXW5ag9oyRzHLN+O7mWCd99D09pX0/80=;
        b=0DNAK+2DGuERjZPw4vjZPbhC9BQIlk6hltcS2TKjZWD+fg/4VyjAEc93FRZhTGwjkL
         qI/YwzhW/S3YEQ9AcnCy/TgQ7qOAh2b7FelUuL5moaVNcE3cysZztva+G0RPNdWueuAQ
         TM3LL/XgXx06qcm7EDqBiDxr3ML0eReSB2EOQJT34X9o7g0nfjm/vaR/ota2zynTrZv9
         wRT4Zzm8ZbqSN9HrAXTVr+Keco0xRhSTITbB1BxDrYwIQv//S55TtjQkrhnYY9TQHM8b
         iRAbSrGD+c68PzwsuaO0MBpoWXg6KrxzhW1XXgjJ3JNlWEgjITQ+cfD1MmjSgnofhZ2L
         h4+w==
X-Forwarded-Encrypted: i=1; AKwUvBwk9oWpQMyNFsPWfnPzYgrpf4eYD2C7vWNu1xjWqTGg4mHoHggd2dTVazdRbdTLqOjylFIKtYcvaknUrg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJsLcOSKUvnTysQ2PmQ6H3rEmbEca+zkDStz85eX2tDQE0XVndL
	53o+qyp7/7KrjKAUaZzuFI/8hMrK6NnCXqi1hHZRksrdgyL0aUhxFnQv
X-Gm-Gg: AYBFou1+2kbdhWkEk7+ZHuXHxZFFjZI1mBk/KH7Vu5Yl793yJSalc0LGNQGNnxsV5HL
	GqskWmL0GYKVQKcjv/wmycZvyfQ0ZcG4eH0xwZo+hxLtB5XgfavwYaWdm6/mv/5sdy3Cu5pvBFP
	zGm86RrahFtPs8bHC1w4H9pnvL84ctndA/7gj7iYfNMSG6AcW5EIl1Kl2r0hL7zX6YB6wqrOd/U
	sBrYoCDV6NqZGj8kIlGT8LROq9Sj77aMlrXYm0sYqF9/zJPE2ZChvToOb52n2SERU4x7Anq9WtC
	xInQuL32u8PJfoDuw3IBRk5zcFtsiSVlTdyDHj2g2fbjydzBCYWsArRDAqDUkp/j8+FIRGjXteN
	O7LZ3SqH54DazGP/84KA+J8x80VltleOEWM0nv/+yJfxUKLxOE+YtQ6LASnV9MEBWQLHo0tGvJa
	JU+KxpKWujybXAZ5B/tuIgzOwyS215k4DOGzYw9gFU4LqerrgNY0SWVWQdes/Tv79We6JvF3ubA
	n7JZP7jrdhPzf9dElWJsliPEuuHT+iexqQIKik5AIKKkkoW0eby2Gmh2g==
X-Received: by 2002:a05:600c:3b2a:b0:4a1:d248:25b5 with SMTP id 5b1f17b1804b1-4a1d2482659mr19130645e9.24.1792150687905;
        Fri, 16 Oct 2026 04:38:07 -0700 (PDT)
Received: from thinkpad ([2.176.196.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm156650875e9.9.2026.10.16.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:38:06 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 0/3] media: sun6i-csi: Improve capture and bridge
Date: Fri, 16 Oct 2026 15:08:43 +0330
Message-Id: <20261016113846.8602-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series improves sun6i-csi capture and bridge.

Patch 1 fixes sun6i_csi_capture_format_prepare() to align both width
and height to 16 for NV12_16L16, as its 16x16 tiles require.

Patch 2 adds vidioc_enum_framesizes() to sun6i-csi-capture, using the
same alignment.

Patch 3 removes duplicated mbus codes from sun6i-csi-bridge. It was
posted earlier and carries Paul's Reviewed-by.
Link: https://patchwork.linuxtv.org/project/linux-media/patch/20260527124552.33815-1-arash.golgol@gmail.com/

Tested on LicheePi Zero Dock (Allwinner V3s) with:
  ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture

As ov5647 only outputs Bayer, streaming HM12/NV12 is not possible on
this setup, so I did not test real streaming. I checked that
v4l2-ctl --try-fmt-video, --set-fmt-video, --get-fmt-video and
--list-framesizes report the expected sizes for HM12 (16 aligned) and
NV12 (2 aligned).

Arash Golgol (3):
  media: sun6i-csi: capture: Align size to 16 for NV12_16L16
  media: sun6i-csi: capture: Add enum_framesizes support
  media: sun6i-csi: bridge: Remove duplicate mbus format entries

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 12 -----
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 45 ++++++++++++++++---
 2 files changed, 39 insertions(+), 18 deletions(-)

-- 
2.34.1

