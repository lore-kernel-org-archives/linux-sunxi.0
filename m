Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B2230F7FB
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Aug 2026 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828471; cv=none; b=pVZ1RKNcTlmH6s5SAc32cCGigFV7tLgYlpcy9XL7Y1aQf8ugYYaVCq/Ga8B8Oi5zNWYPLq91T9T2D9Ny3SVn5T+kpPgQDXwseKYSaruUfOSUWQvYX4ETUyFlDX46oCqblf+xHFrGD0zLrz9wALtTPRKyHXKGpzDPEZErdVnGTMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828471; c=relaxed/simple;
	bh=AC3t7RrMCN/mfJez24cFUMl9bHT8KsQ/M3uZVTgVTu8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G5clIdTpaE6hJGHmJfEPM0TUQNhfCujN2oL+VFYU51Wq6il3kuTebZ32zq5XDggsXWa/0bnfkT8KZq5OR5yQ8+XIIBtRlMWHCpzbIvv8rJnvPcKPpHZenIew6mPxrpGuyVFx+92JANiDHYQ2102QIJYWe54oguAyRO02QSRrD4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGon60l0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGon60l0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-472326ca506so2918090f8f.2
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Aug 2026 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785828468; x=1786433268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHEypZX+49feTAVjHCZcGseNbVTzVI574zRhpWtGRxY=;
        b=nGon60l03AHlimQVUfDmW+eCWjEmpd9OeaD6YDIImUtfyDytU2/xzKMdAQgUEi16Lx
         VeF4POqwVH7WIWimlbOnBhpRYozwaJ0FGGqRYd4w+PgOea3Fh6vqkK57yvRz1TvpVmqB
         j4ilYnLRZI+AR4dDrq/SXKjlTJbxMrKwQ+oR6e8uU5Jz7D6OLT+Smc9Yn+6IPHIqHyhp
         cXrsf1htvJ36080lm3L+sbqx6lHnUuaYIv2v6mfPi5UbfL/mqTbMG5R2h2dmZ9IgwT7b
         ELX4v+aJUe7cJb0J/1GzuTF5inhu2WVT8hirbSLO//afCtgIs3fla+orvNFI8s4sI3i6
         mm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785828468; x=1786433268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHEypZX+49feTAVjHCZcGseNbVTzVI574zRhpWtGRxY=;
        b=jftNq/n5M/MsQQ4C8FeNelZE/KhxNF7Wz1SJcFxG5XKpQcW1Lnxt8terM/OQINOTlA
         3jkkRe7kMXBdXV9CTC3x7xsl4G0RKx2iDU0A2iGB2t1jdEadWpJ/3SCoIY+JA1Mm9rRC
         eNun19fryLdRObj+/nDPvs1M4JfnIFMkuwOtHDqWPy+Mq0Fpgk9YEnATt5Y1zwI0haqh
         6O+Se5nsAtHsrVyW6IoJF1nk0FsoQtIlqwFlfZgVk1Wu/TtR0mYA+kEklQMhPXee68Ym
         RUP3Wfq9gLGXsxnF5TtHYsTMUDl0ISX08gs8fo5kcwBsOCc5abHEBojh8uwyj9KDIg8l
         w2aQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4CbblCEqxBFeJP47+Z9HkmLlDKGWv9NpmS5mQKn8y+XbmZhAbIeCCsnNRKMrrBiYAV+tDe4/6ySUk5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwewgLt26M+f+5RfSUx3sezFja+VuQKQ2Yh52kNDVqLIuWn+1Ou
	QXfu6sgwxlthMea2pwEgshySIXtA8a+Q2BvImIHHz2n/mSDog18y7XPb
X-Gm-Gg: AR+sD10mBLIaViT+sLmD4Zu5dzUCScAk9DVdwFWYOUCK83t3iSQ6tK2QJSb+ayr5uQr
	xudQPIQSEHTlcRAXfUTMjX4cNRKlU9UKmNk5cPkJHtqFNmE0wjGzmzZiSTI2OARAssNn7CiNhB3
	GB8knEEObv/TpyATtIy6cYIx5Cp2upa833pvPTFtE0vXn3VGvkyBrmH3kjzbgFT/5UK/tSCX7XK
	wchPD7wWCCUjnEd4/vhMA+WJIV5wno9T+OTW96ZQerPKLbQTsSQO+zA3+Ln9Na4QyG1VoTwOqId
	yn3sw0IojfaxW4/LOHBunouU9xAslrx0xxTV0g101gBewWDt2TN+jNTl2S60ZywggkuzkB/V0xz
	I7Ck47T5ALhpCOUEydTDxDLwWrPf7XPrcCXzPJ7c+mL5BcvC3cOHbl1IAlE2qlbH3dHpo2tCJXc
	XO8b+L1Aw2BxVQfIpkpVt92GIoCsazp017nUGPIc665OgHrf9Qo+J3p80Vp9H4RXnvks92RFcex
	14lwKHt7QrVBrYpOv9uqwa5fdv2uVAVh8JDe/0N+TWbXjvr1rsSrhaX
X-Received: by 2002:a05:6000:24c7:b0:47f:8fc9:6eaa with SMTP id ffacd0b85a97d-47fd72ba6fcmr34214693f8f.8.1785828467494;
        Tue, 04 Aug 2026 00:27:47 -0700 (PDT)
Received: from thinkpad ([2.176.232.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b05fsm42422253f8f.28.2026.08.04.00.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:27:47 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
Date: Tue,  4 Aug 2026 10:56:27 +0330
Message-Id: <20260804072630.28745-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-csi2,
and sun6i-csi bridge drivers to use the V4L2 subdev active state API.

Each patch has already received review and testing individually in
previous postings (see the changelog and links within each patch for
that history), but none have been picked up and none currently have
a delegate on patchwork. Resending together to make it easier to
review and apply as a group.

No code changes since the last posted version of each patch.

Arash Golgol (3):
  media: sun6i-mipi-csi2: Use V4L2 subdev active state
  media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
  media: sun6i-csi: bridge: Use V4L2 subdev active state

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
 .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
 .../sun8i_a83t_mipi_csi2.h                    |   2 -
 7 files changed, 194 insertions(+), 220 deletions(-)

-- 
2.34.1

