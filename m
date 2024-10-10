Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2846FB66C
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 09:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551658; cv=none; b=Vh42idDZMwgEvqTsC6zK5TqcrcOAlYAzl1IQxCmJAYBuj0HXK80TlGHn2I/+VuuuWE/yhRBbx9ZAEmRdcEUrHRiSecTDP/WQEMfzgurW4ppxRq8Fyc9q2Tu1CqIlWWxnJOLb1RTvkIApGslBCZvLFP+H9fgQQ46flZLJg9f4wqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551658; c=relaxed/simple;
	bh=7B20H6vzZwQe2Z6A8FZLKo4P5HOumDTuAH51dHchgrc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bqRv5aUGHrha3f2uOwW04jnVAze56Wy2qkM0LZMjC77EXiBUyy5qaoy4BLMk2p9mNjJaSMOEe/xZ+gYazImHLcqbDvrEFC2xWD22qLYK2gNunssAA8rSWnlMmHTEzXjND0mXuxThDGnIwQezPMPlrGOQtzHD5z2u9xplpcsXEF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4teCbEW; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4teCbEW"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5399675e14cso869660e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 02:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728551655; x=1729156455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iS1oowt3gWPxEnT3I7D8ZHwjyqV0wJkTaD5F8v/SXSs=;
        b=J4teCbEWOn5n+3M1wmn9Zw3Bo+WwFKSKPgc4YOrAwjBRBXYyZw5lAK77847hPnyuIb
         s3ShcyMPQ0Qy7RbJeIBbbK5bC8EkilJIczPkk7Xo2gF6Z+WTottCoqcEpnrSJoBeCk/k
         3LWWGOD2SANTvWTHS3aiD7mZzyUo8tSUuygtX/W9fGkpc2Tga+X+ToABvZHaZEZOOlvU
         8Z31TW7k5mxLbEsdpfmLEODQES0HEr5SN9o+gbOknuVum7E+OKvEXEgkKXGmZAsjtCTL
         RH7bLe3YB6b0GlrH1mDOFCTEH0HiWLzE43E3V/rxWABHlXzdL+Pc1cyI6QNwVhEblMMt
         3vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728551655; x=1729156455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS1oowt3gWPxEnT3I7D8ZHwjyqV0wJkTaD5F8v/SXSs=;
        b=oWpB8hruZW7mjTa5bMphtWTSYeU/yzztFPLx25OT+Ejo1ciJN20EN+ijPMjtazfDpo
         zgGPQuXNQaMnoSwFDQaq8Q3YZWrtnoCM+nFDo04IjkRzbcnPT/k8tfijTmwHMfiSWhZE
         B3bOxzFhnfDTweWwhOYftFoS2sxFkiZIKci7/bRI5ne4nIFIbosdnehbwJhRXrclp5xB
         FEli0iZqYEylqatHKZVHdWQ8a77x+ybm0TfhUXXpSI1TLS5QLv5zW4Gxd5qY90UqJPQA
         ywYZYROgA153JyQg95pbCQRantqMu6aNII2ViIIJ827IEUjGAfVThn9Sd46oPvtqnybx
         h1JA==
X-Forwarded-Encrypted: i=1; AJvYcCXeP7JA2oembQ0VxjErl+pZuIyJENuirTchjHWUYXZIAAEon2lIKGaPqFAorSjH6vyJ2uJsudA1JmpQIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKArMaWZC9hePzARFfPw2mHn4jjeJz3WevgzIxkRVz3C7ojjsQ
	tpQmMQazRqXBq7VBGrYGCDXrzIq1+xL4ZhsFQ3ixsPZfwVAbBRK8
X-Google-Smtp-Source: AGHT+IEabdPS/80LwHHvN4O9JjXcErRt0X3jKi/SEPXwMmL1sjvbwwX0uamKQJdfuWuquTPkH2rYfw==
X-Received: by 2002:a05:6512:104d:b0:535:6cde:5c4d with SMTP id 2adb3069b0e04-539c48926bamr3578673e87.3.1728551654907;
        Thu, 10 Oct 2024 02:14:14 -0700 (PDT)
Received: from void.void ([94.230.83.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d748f0a5sm42337895e9.48.2024.10.10.02.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:14:14 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>
Subject: [PATCH] phy: sun4i-usb: Fix a typo
Date: Thu, 10 Oct 2024 12:13:55 +0300
Message-Id: <20241010091355.8271-1-algonell@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in comments: wether -> whether.

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 include/linux/phy/phy-sun4i-usb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/phy/phy-sun4i-usb.h b/include/linux/phy/phy-sun4i-usb.h
index 91eb755ee73b..f3e7b13608e4 100644
--- a/include/linux/phy/phy-sun4i-usb.h
+++ b/include/linux/phy/phy-sun4i-usb.h
@@ -11,7 +11,7 @@
 /**
  * sun4i_usb_phy_set_squelch_detect() - Enable/disable squelch detect
  * @phy: reference to a sun4i usb phy
- * @enabled: wether to enable or disable squelch detect
+ * @enabled: whether to enable or disable squelch detect
  */
 void sun4i_usb_phy_set_squelch_detect(struct phy *phy, bool enabled);
 
-- 
2.39.5

