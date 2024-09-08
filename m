Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F6F1C01
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Sep 2024 21:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725832076; cv=none; b=NMecGrpXpRrQExvTIFvWjTLo4TKmRE5DUsQHst50x1UgGDjZsaIolzXUY2oyc65CSh7OQvq1WPAnAIB+GnzgCZ95ngqEbRTl/n7yOsJsI9yGSRZQqnpan0yf1kbXKldswgztPpDfZRozvykpv2dGaVnLcfy3+NA9yvZAJVl5NKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725832076; c=relaxed/simple;
	bh=XJ4CSrhgxMN9+EF0tqC13ww61yxAj9wlkBh9vifA1Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wav9K/orVQc9rU7YpUI/XNzvPvYsriwWTjHRNlAwEdgcIWEvQTC46HaM4OU971w2YTmUAvsn4R3t2+JRYSNTsmok0P2Jda+JPAahQgebLJAUW7ttBq4GE0f5ScphQsvf4tWH0IGGN60VKjPMPKzCxDRCNGN8a8si8u0EwgqC01k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlIHsnlk; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlIHsnlk"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f74e468baeso42573521fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Sep 2024 14:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725832073; x=1726436873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MWck7tjojIGtA3jbkTcAOWGGnySDnERm4jXqJmtrvo4=;
        b=RlIHsnlkjzqNHkFV3rzNE13106kcJWa3yglCdoJIXo0mAqSsaxUCcJFR6Wy/92ihpu
         jZDIudujUzCns5sJoKeLPN4iuvbZSe00mWFkxfhySmy2WAA6DJDsBYvZ5nYq5R+FS99J
         j+PidBaG5U7uFiloAK1Lc+5u5DgBYX8EJMJHqb+aEYHHRMXr8Pfe9Dto0lPl7B3lKleF
         WAJ+mLCG+aWulcoar4UbVmIQRVDnG7bVFVI6cpPT7i6oTpAQbYEmn1WVkLiv96Rx2Zi7
         MWdTGQmNw8+UQZbGz+sZD5MoOJ50WxnEKxOTYuRzUmAclGgCkW0N0OkOywJG4qbcgfSM
         2ttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725832073; x=1726436873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWck7tjojIGtA3jbkTcAOWGGnySDnERm4jXqJmtrvo4=;
        b=X9fNDRb96QStZYq1M7p+NoGtE5v19SEXFp5OiL5k7Gst/AwkumiCiF+LVxniAW7X3v
         EkqfeRxRQe2a2C021FaJLxiiJBRJdfVHUvTqr8DLPaUj3RwfEj+khypwaogrpyrM+6Cq
         646mpq8l+i6XNjMxIUTmGiiE0mmxq3n3E/fZeo0Pay/7BbEhuYV3/ddcl5pacnjdjGib
         RUSo7ntmjGe7cuPrUF5ndc0JLRYF930iM3SmCeZJU7R4MhQMKh5pcUb0KMOA23b5t10N
         f4ztgoBIJV55LB2+y1X1WLl23BVWxgU8BXqChSXLwURI1H6D3FY4FzxKlskPBE3HUCmr
         z6dw==
X-Forwarded-Encrypted: i=1; AJvYcCVt+Sbjc8aL84zDxq11FJftMigIM+6lHSHTwYOPl6tWlR4MtRo2n3WCd+rQWu210FYZg7iol/5WWHmeQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzryKehTDh+OD13fsST3goXBx5P/y88XxgRgNaFKpIH3um4bgtp
	LqtKYuzFcPiTLZzZRtgvC1+8zFsk420InxiTJIcF0RU2/+nFfVUX
X-Google-Smtp-Source: AGHT+IHH5LDq+cJeQo9Iu/YbHJ4F6xDRCHMrQ5Oe3uoIDa6QEvOqs9sr+epk1Zv6hklICrrZK9RnRg==
X-Received: by 2002:a2e:910a:0:b0:2f1:a30c:cd15 with SMTP id 38308e7fff4ca-2f75b930786mr28087061fa.36.1725832071787;
        Sun, 08 Sep 2024 14:47:51 -0700 (PDT)
Received: from localhost.localdomain ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c009a5dsm6094001fa.72.2024.09.08.14.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 14:47:51 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shoji Keita <awaittrot@shjk.jp>,
	Icenowy Zheng <icenowy@aosc.io>,
	Andre Przywara <andre.przywara@arm.com>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH 0/2] Fix magnetometers on PinePhone
Date: Mon,  9 Sep 2024 00:47:16 +0300
Message-ID: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce support for alternative magnetometer (AF8133J) used on new
batches of PinePhones and define mount-matrix for both magnetometers.

Icenowy Zheng (1):
  arm64: dts: sun50i-a64-pinephone: Add AF8133J to PinePhone

Shoji Keita (1):
  arm64: dts: sun50i-a64-pinephone: Add mount-matrix for PinePhone
    magnetometers

 .../dts/allwinner/sun50i-a64-pinephone.dtsi    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.45.2

