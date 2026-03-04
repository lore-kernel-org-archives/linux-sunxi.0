Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125E4308F1D
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Mar 2026 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772609681; cv=none; b=Is48d8/c79pskmAhOi0lAJifKrjGf9+JS0gxhEsRKHPLV/D9u0NtjyObEFVmApgvMjaH9oQH2fWv37CrO8NHwYcgxSE7XJh59g9MEb9GcOVsY9nCrUoQlTPrWqaG2mf9MHP2fpuEUz7RyPnztQwZ510Qxl+FvHzFsxyS4re09H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772609681; c=relaxed/simple;
	bh=Xip/xnIBurHNGa8DC9JrXbPzuPJDjalxUb2F2V63Qzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ze5JnfV5EXkdNqYOUClmaLmH5qgATkLnxlN41DWk+fG4N1H2un7HLSAW+yvmQx3zvfHsHPi0s6vREgksWzm4GGooDXx8YPkGkiAjAOykpIGiZV+tRJFI2cBfXZWMF/4MlYmEz2+7u0cPcsIUuSH2TXFg22xtgnP785h35RSsnjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPkW+s55; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPkW+s55"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2be06c02f66so1005335eec.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Mar 2026 23:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772609679; x=1773214479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7iFL26EEL+uhHsr6lC8kD5Eo0jyC6G0H13gfofhU64=;
        b=KPkW+s550WJ9/sMhpnopo638FmQAvUC5FwwJvG6GhGTo+WYkNCsQlHYSHUmvzGNq1Q
         PAS37/QdbFym4fR2hJOwQ/4JOZLPYfx8xxQNSLO9+AfntWEfGW7DqBkVdG5pgnu4u9m6
         1skDXOpQVAFx5L9ysYVRLNT5sCBCpMv4jQ87vPJ9YzLW72MK9+YAyg/BCSzKE93zv9Nb
         H1L3aFTY6JPZ86/k+FQ8QlppIPk5CUaFWZPomwn+1YfWHGs8o5/n+vHf75u/EJWS/0VE
         TsYuto7oLm26K4krd839TSFlcn43UsfkU/VQpQ0ai7PfT3qCghnAwloSDtZ8/XvcGzqM
         6L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772609679; x=1773214479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7iFL26EEL+uhHsr6lC8kD5Eo0jyC6G0H13gfofhU64=;
        b=DMLVZvxvC6kuL15ZINkTFAsibxTYtY8P6hziKKo6dI72BvF5/oldwsR3TEE/m9kU05
         +r2eBSOhOdHhwtKqVIlMJ83UdwHhUD9efUCTR76/5RU3atUudpwYw9EuQRd9IM4Dn3Am
         +pcznV8L0KuBM5tqVm1/2n4oQysEjSZRFIM4LXFFryGxh2rctcKhEVASSAEQyGDZ78h5
         2RcORBv7P9+rJJBgpnWNzu3//NI9n54Xyd2buOVqFwAFxTbA8Tsg/LK8WM1Zfvb22wsw
         tQjrCpX5V+b6jpGLl5mKowwEwyADZRn3B1nHTHp9gnHkJPjP7Wi+FTq9kJTfb8iUbwkd
         b/Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUjssNZTWgol3lWvVzIxkQSHT5FDkR+9bf3BEu/RoH1lWrG8u9+CJOtrxLE+NaiFfelvv+TVl8+QLZKGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzllnEultsqbC4Dy3cVEH7MTxL29AOQwSkMyEkmDf0FZIY1XPsv
	M/v+Lji7MX6ouAGOou+hYCr77Si1AATDf1wpgEAMlRBay7cLxABhHchk
X-Gm-Gg: ATEYQzyvJ0iTYDkd6gtpLaCgxDTecHQShyaBWMD3lZ7ou5aR1I/BwRdVUhuc9H3Lqyd
	lczpSS2gVE8ivSz4k8rkkGSr4VxPApT/8z5Q4zX3CRwFOLk6P3RDFlVa0RL/HpKD3djjzKP1gJN
	tdWUmSW02npM/BMPI4ONXsWBxIfX8GShTP4rPKl5q1aHhPWvc2XN0hTZmdME3m0XCN3+BsHRLXA
	eHLF94Gfeap+2nCH1/kgy0YXo7c4/U+2STVWHKd/6a9EYDAdWEifG5iVrk4U7VybIHnTuywh1ld
	vCCZtEQWHnodVSD+oYXynpeXepmvejaJKM4yngXl60Wh2scvCxzYINXSxyOgfUDn1kuZm44bsxT
	stqPiTNmwSgmUtTh4juV1PjVHWnQjiCxt5q9DpW1r/hVQeEvqMds7OxjMHqt/vNG3RdqSatrSuH
	yB8Dvk0+RpvwqqtF0Jwr6h
X-Received: by 2002:a05:7300:e61a:b0:2a4:3593:645b with SMTP id 5a478bee46e88-2be30ff3b4amr448852eec.11.1772609679022;
        Tue, 03 Mar 2026 23:34:39 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2056acd1sm3457123eec.22.2026.03.03.23.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:34:38 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	andre.przywara@arm.com,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v4 0/3] board: sunxi: Add TaiqiCat (TQC) A01
Date: Wed,  4 Mar 2026 15:34:27 +0800
Message-ID: <20260304073430.438835-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds support for the TaiqiCat (TQC) A01 —
a set-top box based on the Allwinner H6 SoC.
Originally released by Ultrapower(UQSoft) as a blockchain terminal,
the device has been discontinued and is no longer officially
supported.

  https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html

Changes in v4:
- Rename Wifi ethernet0 to ethernet1.
- Link to v3: https://lore.kernel.org/all/20260302020956.96424-1-jerrysteve1101@gmail.com/

Changes in v3:
- Drop the serial1 alias.
- Add an ethernet0 alias for WiFi.
- Link to v2: https://lore.kernel.org/all/20260227155801.211376-1-jerrysteve1101@gmail.com

Changes in v2:
- Replace "UQSoft" with "Ultrapower", and add relevant explanations.
- Link to v1: https://lore.kernel.org/all/20260226084850.417731-1-jerrysteve1101@gmail.com

Jun Yan (3):
  dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co.,
    Ltd.
  dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
  arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
 4 files changed, 369 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts

-- 
2.53.0

