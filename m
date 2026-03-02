Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0016284669
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Mar 2026 02:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772417431; cv=none; b=YXeaHvUG4DDk0l7KnmuqPTcBE+8JPePlzgW4leZbRS7aM4ShwUJCgz8GhEWEvUIbxTY4dO8PJA/wCX7dhS9sEA2tzPpjQLe6rHTgkxYEvsn2/CKX2izvgmaYEx2K7GHXLJBrg6s7vtssPJsa6ngCNsve2KU0rUFUFzgQAXgVvX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772417431; c=relaxed/simple;
	bh=W3+F///ytck2u0HUfIs3x6u2P642DxB32BYcOXGdTfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SrvNY3hV6WRb0aB5H3PQNyhGeb+mOsprXP1Jrw7GUveTJZrMfG7mewUpvoRmq3kXsdh6RBiQFcPeitMv0M2zL1xFZ2pVobmsdrHIPFgJW6UIHt46LMEk9/HLKKeLZRHBxFBcgdeCtxQLh/1zgh3qoS9vEiaWnK8drzRrpCju04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfAMHtiM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfAMHtiM"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b2965d4bso741819f8f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Mar 2026 18:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772417428; x=1773022228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DDgIClsU9tFXtpNwdi4WbXldTo4bd/zYzYnfaln1CME=;
        b=LfAMHtiMdZ6t5OPP1pfhjKP1NXf0RPksaSgTOT6KBJiGnSHo2NkWX5VKjuxhWIa5N0
         mUC8VGU915zdtDWifn6kiutvLIqi6jTh/j9zomYiBKWJxWPxtKLL2qtI0uMunT+B+FSg
         xaCAlrMjnSNiwmmk4C9CGV07QFbGG5e/XnAqXUOSzjfR3fkLW44zV7v3hDJWu53+SNZo
         J2ofwYz+V3ULpw4srJN4Va5x8ksz0Owa5XgmXZvXKSrowP/ypuuhhSF62jp1HfcJBCe/
         I3qBgK07VtHnW222Nu0oQ0qFJ73yS6lv8gli5FZNAo4JfHXh9xxoN6qBjfszY8O1fIdy
         u0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772417428; x=1773022228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDgIClsU9tFXtpNwdi4WbXldTo4bd/zYzYnfaln1CME=;
        b=XS+sXrc1r2/WVzUB+sZbewZBQKZ6RbdK+GbhnLcHSunk0rGL4b9b0i7eUWcVBuHSxU
         ETgMqVk0gvfLWjypyu/RM8O7Q2WRCoyhXnrnDuTGeWrKsNRN0/K/faRakkqrdWWP7FhF
         +ebAcVmDaRbUEEdM5ixDQZyVS93gnNXTlSi71PO9Is+1/o7UP/DZmxeMwEqpH7IgaoY0
         +q2KGMW1EO74az5Vd+eEqahq287ho429wlDUlkkqYlpGIYsOBQcQgEIlw1vwhFltcQK4
         XAs4jVUlL6i2rAp3QXrU5WCN4ZZQmusGgcF1kFUDRV9u+3JHON7tP754yJxl2L3tadZx
         Gxjw==
X-Forwarded-Encrypted: i=1; AJvYcCVIKyntyrHjeDMz74fcKxQwPJLuSmrPmIAvtBBLFFszE8neV7BQFyfOd79rGyG3ZbWbORqu7UtXvmR5aA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5lTv5RKjD0H8a+iK1vMDReCP7GfZMDlz7f0WZWr9hJL154PtH
	kGJ5w89mwAgQfdoxrojcLBN12cZeBi+Qz1RJ7mnb6Rppo3nMqkwJMT0P
X-Gm-Gg: ATEYQzxC7ZHw03vWXjS/+2qk2nuFrUToxS7t5pKKTZsicAG30YSX6jIcKt5EYFMk4aK
	lHjXkO2UPXAu26rIvMB+RVItL+hzMgiF0AoRA1FCasBfTa4gN3/O3fPe0G2nYCZ2oNI8E9uS8j3
	0YOS7P51qFzHKDaRKc65x4YiegGeN68BllSkmRlg8tY7498H72F6EO3IzbbGQMxSo5cgeSMrRIm
	3UT8MGd4gkeg8g49n+FjjCQiJ3LSlndHRxI4jZ2NZjAGa2YP57o5itb5+mPd9VSsFD0/Py2VgGP
	S9H3tIvA8zHbjtM9CtRlJAhMFzQ6BstNSQEHrKqU9ydKjpF9EW16U8JZv5fV7IEzmjkO81J6FEm
	RqrALNJxm7UISRwxF2JfrPQYlfS6IuFwypf9jo+dxN7eouUZTftjXVOIzYWUgWjSO8BPJUo8Cmf
	PeqZ4njGmkCw+V1D57Wyh7
X-Received: by 2002:a05:600c:a085:b0:483:badb:618f with SMTP id 5b1f17b1804b1-483c9bc5b7dmr176920225e9.25.1772417427953;
        Sun, 01 Mar 2026 18:10:27 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb9b97sm194451105e9.7.2026.03.01.18.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 18:10:27 -0800 (PST)
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
Subject: [PATCH v3 0/3] board: sunxi: Add TaiqiCat (TQC) A01
Date: Mon,  2 Mar 2026 10:09:53 +0800
Message-ID: <20260302020956.96424-1-jerrysteve1101@gmail.com>
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

