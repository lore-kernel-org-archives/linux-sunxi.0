Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF144A73D
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207890; cv=none; b=Ih9EDyQbc1g12K6NXIA2Y4rDdGybUMad4laQPW3koNOTVIbEn6KR6KKuYJh6F6pfs349H8+DE6mQYfHtvFfwSvQh9aBxQDvQlkoRLSXL9NO8g/wppddWnsvOngnH/i2YFSUd+mqZP5S9vcvaZE35a6gxv5Oxr+h3/sjqYUzToqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207890; c=relaxed/simple;
	bh=TbBP9grD2lO5XRRFzFMkfJi/a5DkJVdR2lfW1DXwdLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uPvgcYkzgI2roKotGEC2IyIvGfuH7JzcJccXRG75yyGuZHVRhvKtQIZvXeTe2lRgN5y1x5yM2V9VG5umgUmFg9/+6HeXU6MliVVqeyvWbEO/eag7+uBeJnN+lXU24mjH89haOy9LcVr4dm+qZPO/XNs+kyGBMNEMDLkAqjjLt1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vh5GRHKE; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vh5GRHKE"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba895adfeaso2114271eec.0
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 07:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772207888; x=1772812688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kwbnfNOHC2589geLnERLCn6Au69Eq2BR8V45ix5tXE=;
        b=Vh5GRHKEa4/A08CqcP0RJj0qlqdeY2IwM+zJ6bZTUS+eoEqYz6dpsPmY9mIehYTSnZ
         MhzPEURYV7uWg7Foo4Keumghcmu+Wk0iBWDp1UJLIADQA6cbnebKM1vtHXAtoJNkpnhG
         Ewjg3v3ExHjRYttL1nlc/GcDBDKcWJrnj8lliNqxUKdlpxS3H2ozwxHbQId/dhXTwtFU
         9APtzjeT/grnlQICMtWjNoqwLyGv0Z5E7++ogsOkGl8PBazVNsWvHhTCV8Hx4N9z7YQH
         Bde4F9nJfRBBGlFEiceEIWIzTKzarcu7F2k/ZTIRN0jHjlunBeA7he9mVFuzaDyr4LXI
         ej0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207888; x=1772812688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kwbnfNOHC2589geLnERLCn6Au69Eq2BR8V45ix5tXE=;
        b=myXR9Ml9KSoMJOVuCwqU++SIfDNVPVuiiwb+YvuwtqEEIQHIii9WrgH78OFLKsUx1w
         5eYYZlMReeintho3BdavaRKMZaB/6J1EBsoMBB+Doiz0wfKUXl6ymLTBeJ9VUxw7em5F
         hsO6CC8qM4fUr/GrBZFpD1JNys6M1K9cHwDWrrV7tjeKFr+aQA23jAdAMs2HWuhY4gGU
         Bs3AVeaJTG4HwuHaIuvQllD0R/6sUS+eS5j6yOFY2hgxqIgyhSVaeSByb0YsNCSEDlmD
         iJ12heRc5SMkCYwE3zs1hLCiXBPqUfSHELw5+3N/GMwJ4x/GZ/E7ubQWYqa/39up+a+T
         aLNA==
X-Forwarded-Encrypted: i=1; AJvYcCV2byN3fGECt4IzGE14VKbC9IWoR1GJc6z3WWTNbce6CPwfqQTAFo9c2L5/ITsk9c2dgOMD7GSulfOg5w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yym9EOrdSx7UrfddL+C3rf5JyJZPoil33MVqYMt1tSTR1AklX46
	wBeUZVxPI1C395Lvdoku5oAHbGU2VbyIHjjCb4g/2IvZh2q8vHLQoAZN
X-Gm-Gg: ATEYQzysBcXnclvVqAD8YIojhn/WSzugHFSzK2IvRowdg4OLHicnRfreH4395xWCc7y
	Umer9rC6gm+04wSVd+6QinX6m1AprK3dS7pxE0dxirqOhOaHgJ3H0VqoKRpUCP/oh9g3yeB7xSz
	PNJtyr45q3j1u2O5kADoO8HfFQ61+a4Dgy3kayY0awjoXURliQLH2hPcFyx70PGmO9amIApPqIP
	HTeaexeku00vt+tN0Uk/putkJnisfk6PYxiLWuxs77A5/6yRV71eJnyKZAm0yH4MbUH3vWCkZT9
	Con/PzzfXVu1+N30olmcS+e2gMacXIW9EO0ruhFver1kKRLAq129ovyOwwjvcdtGt6QDLl6ORC0
	t54Caoxacc5JavMPDyBoW610N34I9K63z6M3I8/vCCLP3QHPq5g8ATuhLr2Ed/UUUStMfLdTUHo
	aXpz5CLf1AJuYVGdWwSzcL+Gx5ObJvPG4JlHR6zAt2qTuL5Bj7xnf2AZ1Nc7C1eBZpGD6f9BLR
X-Received: by 2002:a05:693c:290d:b0:2bd:d04c:a433 with SMTP id 5a478bee46e88-2bde1c94f64mr1123968eec.15.1772207888214;
        Fri, 27 Feb 2026 07:58:08 -0800 (PST)
Received: from arch.localdomain ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cf0115sm3833508eec.8.2026.02.27.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:58:07 -0800 (PST)
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
Subject: [PATCH v2 0/3] board: sunxi: Add TaiqiCat (TQC) A01
Date: Fri, 27 Feb 2026 23:57:57 +0800
Message-ID: <20260227155801.211376-1-jerrysteve1101@gmail.com>
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

