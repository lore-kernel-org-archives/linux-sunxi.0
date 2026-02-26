Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F407A39526D
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095742; cv=none; b=SnCC1u6SV2QZO+4/MsaYBch65tBJAWbGiw/K42smTep41GWLBNE0Dw6C3LI6bjFGKcP0dYZTPvHINSMytNFG2weIEl9A5ng1dthyb1vohgaUCWZrx0dAoLYY19Imo1HmRx10wZXKMTAQ/JAGPMKYb9OVqLk6LjM866bvu5P8xis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095742; c=relaxed/simple;
	bh=ajmqkuqn821wRP8biL6ZENRUK6iDiFbyJK2m1b+fh4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i6E6nS0ADwimxBMCSRnH8VSBk00wVB+b56AGSk2/39I2i9poelNSdj6blc1QGOgcLQHdbs73XFzUhTXybymgkG988xZeH4F0vZPkb74amQiru57C8R7RDzVZhK99DtdSdL/PKHo7Y5vJBYgpjpxku2l8nABYNo7sEEZ7US/54cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YadxKgIR; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YadxKgIR"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-824a9348603so241740b3a.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 00:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772095738; x=1772700538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wTIDqyg2XC0iHi1WCfQ6EE8S6g1mAh63E4xVMCnsuto=;
        b=YadxKgIREkZG6u3BKhT8V4RM9ssz3ULv04FkMjjlOOMQ/m4Aae0B6ID/iITL4pMcb2
         dsEl4xE9+pX+R7Apyc2J+1jqGRVrB1BoD0Otace9s+73uVfuR1K5xvRngFZWir/ZHMA5
         sGKejKSKFhlrvL8WS65fKRzBRjIZAJNc7C957HYJRbgjODfqWduBlUNWhI87bUOiQOgt
         GipBuab6sqfyCbjqqxXQLuJNW6Qbk58MNYYLdqYX7SxC3cjoAv0voWWFL7eEercQBRr/
         4gwBwOojabuQnO5OfEoHRhlYnV6V4wdU8ZbsWeHCciovkHlX/pJevChtIJBe47jmcpGV
         mwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772095738; x=1772700538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTIDqyg2XC0iHi1WCfQ6EE8S6g1mAh63E4xVMCnsuto=;
        b=k3Hqeauyu8lpr/PPZ5qXe1YzIwVDMFXmmFBDHe84CpECU2LVO3d9GU005z64XwSCCg
         C/lLwfwHo9ZJJKr5YQEEe/FV1Cv0qzF6OPiEIC60txuQ98L4dr5dN4aUgg/IvbupqglZ
         mU6AP1mqEbd1mzH5k1ptSVb71+H7owZ4UJ8OWPicgQqJL1ecuv60CM363hWVkef4c5oR
         c9U4VNFiyxQ4ChgvzjnTkJrpVy1P43KI2M/CPljD+PpArCZHoxgPkZp1J1zkXEOEZd5q
         Eu4ZLrALgNC02BFKhVnn6lHB+OnIn2F73YQR8wG1K5miIGf+ZRgdA423g46ZtQxrSNQj
         9y8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeWVDQ4mfIkzWHZ0OZgabo4lYWxX/LvzUafNgIAoZJ0Xe4/o4h3Cys72m4bP2Zxdae7VvCh3spit2BPw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd1q0xOomtqunAOw/+O8v33B6mgNn6zGwNBxPXLogLpzxErnjk
	sq8tLdDbF/Uak6aY6fGDn9v9Hu1CgJ7/jFENMcEWlElCOgURlDiN1Owi
X-Gm-Gg: ATEYQzwKd/m+rg0ahQn6aXxTVVrvmqDzTZykIfPYEF1BoX9pyRWWi5mr2fBIsA5Ye/a
	hZrZYiwuElc18W2RooTdhM+mMMnmSar1W8dwdCfDyyIQFdJbCkaiBDRoEcVn0GnQ5hR2xrB+ct0
	UbcwclBg8tCfrY9DU6CJQ2SNe6uJcrTxVxHNMoHufcQmvVQCRtThb7IId9vvgVFMRvbl1898MPe
	ilhkvJae1CUWXTuNXoH74NFMVqiqHoN+xIIgW4Die8bQKRXYUW4wKoS/69zlcSqY1lP8yc4Ht8h
	eRynWEVlUecO0JgXRbz6269+98+DbD8vzGhm5t2wB4eMbjALgeF1QbTKfSJyl+c/mKTDy92O3WE
	3mvEvEaqa55vkTzYQnaghZNsVVm1DmNNhC2r4EusXGPRSfWiCaBAbDdRFhfPFLXoT/QGXMi6eXM
	uLbgisdhpWs1Py/oEGld55W6AWZbvfUipIp19f
X-Received: by 2002:a05:6a20:9e4d:b0:366:581e:19f6 with SMTP id adf61e73a8af0-39545ed4a2amr17383051637.23.1772095737809;
        Thu, 26 Feb 2026 00:48:57 -0800 (PST)
Received: from arch.localdomain ([117.147.91.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm1342441a12.30.2026.02.26.00.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:48:57 -0800 (PST)
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
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 0/3] board: sunxi: Add TaiqiCat A01
Date: Thu, 26 Feb 2026 16:48:44 +0800
Message-ID: <20260226084850.417731-1-jerrysteve1101@gmail.com>
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
Originally released by UQsoft as a blockchain terminal, 
the device has been discontinued and is no longer officially
supported.
  
  https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html

Jun Yan (3):
  dt-bindings: vendor-prefixes: Add Beijing UQ Interactive Co.,Ltd.
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

