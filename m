Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9547E2D7DFE
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784309668; cv=none; b=m8I0sjXzbAVP4xhj74/CWultWlTjlStt6T4aVG5GKTfYVpoVPUR5OJvkvcqCEqRkD7wFPeBpCC9M1WHFNgb1vn7LJxi5jrU5nRVb4zdTCR0GQOpJZuM9ng/LuCcT8bvFOSj2vHzYWOBSTTdC4H6Raugt8MX2cAQQIDrWpMxovt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784309668; c=relaxed/simple;
	bh=8mTcF3LrBHm9pBuVinQPgEuDDUBku44k3jODpXxKvUU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZmiQi9W+cjgCfpWBQnACP0BsnkAH+4k3HCcYX9YgDDF+aYGRVICM7LWzLC53/3CLPa83N0j94FQ5OY5zFc2+XwOxak86SUjHl0qzpUR10T4kUsHXU6QH4sq1oYpLPH6O/cyBGmtcrFFPisxBl7Xl3SU/bSYXZeEZ006p2Oxwh2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgSwFGCU; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgSwFGCU"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so4356159a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 17 Jul 2026 10:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784309665; x=1784914465; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BLtDXAflMK2OGRvVokloY5BLx70bkl08IwDveQGG/q4=;
        b=MgSwFGCUXJdPJ+sbumk9WWQvIdWuvOg2fL9Nnqcqn9X0Tl5RNZnoYGMgUjk7sco+bt
         3RaMo7T59snkoVJUA/otWTfKI55dZtYSMoY/KavvtRupNUX2TN5Wup9u64GPXstN9INe
         Wo98fGNXMbemPQo4/1wxp/SuPwy00AOuq6V/U3Ve03+gHZr1syY/MKmL2JNJ5CV6whMp
         lLkRsPu9qhiiRloXDmcS4pxubaaXrAHR15XEroMBGykAFCn+BScCFnIyofQsxReVkQav
         5vdhA470SdcUUFqtFOtlJuJyXnzQICFzjf39jtO0+d37UezXkO9qmceCxm79CMelYRka
         67Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784309665; x=1784914465;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BLtDXAflMK2OGRvVokloY5BLx70bkl08IwDveQGG/q4=;
        b=NuCutuViLk9eqvRya8/gvJNFxFXiFA3vYXCbAwG5y+NEvAHFJNOPaEGuZ3agZPj4Of
         K1JJMDhoxPlgPiQs2RAnJEWahqUrWN2hvtSo7+jZSOVXlp3xJ3u54dI1vDzE5T8+r73g
         N/YzTs7MWKDwbe51jNEi/9drxEQkIELYPIajsXHUAPv+dMhBicbPfLj6a+R2cls6V57E
         3blGUpFcrI3fXbLH6l6xe/cU0xfs51jAhGH2zaWkqOn+b5nxcBFnTAwU+KWINJY4HTgk
         lSMUl1LjZGj90qXklSXQFVeVgsXqcRMMmUHDVcZG+N1F3QaSHh/OdStWvfQkf8S5WULD
         FjCA==
X-Forwarded-Encrypted: i=1; AHgh+RpBRnZ/NBtzl4UfV7ZAKSvnxDim2ZRQEXGjclFD7ops6zPiZnUbXAgkeZm2FMhabWA/769vfx0BmpoHOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvjYXm6m6nsJyxn8c+ylYF05bIHtFgoO2+/H7VdyLXaUAD5rF3
	Jf84HgpfK0SsT4+YIjua+E1NRXb075dKbfqJNGFXdi2R+u9y0rbxbRW2
X-Gm-Gg: AfdE7cmEmH9FAxGzmnOsYCjsajQ35WRDzE6+GduYXwquZkC42pNO3GpkCcAij2FpqYP
	L+jLcDLkpfS8BUj5WEVBOFelXJlhXxyLVMqXqxPS+IqzxWG6Xwz6EPaHRixBwuxtgunx3aXkugW
	/fkwRSjFeePS8tiqaXI3WJ1fzQYLbbyoYKmrRTNUm/Y1rDZcoKIDRg/OotiFg8GabLDtRnNhIdX
	YzBFAfCbD8LgMflxUWJ2yaoFkMR0WQLVNRO0KulIXZWD9oSg7dDXwJilPPaWXEMUQg41tj5C2PQ
	Y4ZqYx0ku4KVyw0tLna7tMGaKoI5Tv5qm5W1eYKbQOScP8EwiwUj0bd9Qqpr7gUspOCtY2XTHGU
	YCgQLeOuHh3XYaXAqZHZtqJrEVh1Q06LCrDkbBcZN1veuvlulZ5EoNQHU1q5bYCeN2uqBLS/rYV
	kjNV1DNEK9k2bmp2c2cYHHx1c7sXBt3tkq16lg6Q4HDTo9vMFCPG6L0UU6lFMKkluARsXWNL7oH
	oEnar2PKODxCWwZcLIkqPEwm3urGlbSkl7pMgBBgLcucxniNQcK9w==
X-Received: by 2002:a05:6830:2e02:b0:7e6:f7fb:9678 with SMTP id 46e09a7af769-7ed9aa576f9mr2021902a34.1.1784309665179;
        Fri, 17 Jul 2026 10:34:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad965130sm1677212a34.11.2026.07.17.10.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:34:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
Date: Fri, 17 Jul 2026 11:33:56 -0600
Message-Id: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0QqDMAxFf0XyvIAWael+Zeyhs5lmYDaaOgTx3
 40bXDicl3M3UCpMCtdmg0JfVn6Libs0MExJRkLO5uBa59vQBdTlMXM1yMooSTJO3tZ5rDyzjIo
 h9snF2DsfMljnU+jJ6+/jdv+7RV401DMM+34AvMI2ZIUAAAA=
X-Change-ID: 20260717-submit-sunxi-nand-h6-h616-timings-794a2994267d
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The sunxi NAND timing solver currently applies the original A10 NDFC
timing characteristics to every supported controller. The H6/H616 NDFC
uses two internal cycles for several setup and hold intervals and has
different delay-field encodings, so the resulting clock and timing
register values do not match the hardware.

Prepare for per-controller timing data in two behaviorally focused
patches, then add and select the H616 characteristics in the final fix.
Legacy controllers retain their existing setup-cycle behavior and delay
encodings.

Tested on an H616 board with Toshiba TC58NVG1S3H NAND.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Split legacy timing setup from the H616 fix  (suggested by Miquel)
  - Move tADL/tWHR encodings to a separate patch  (suggested by Miquel)
  - Keep the timing lookup helper unchanged  (suggested by Miquel)
  - Drop the minimum-period helper  (suggested by Miquel)
  - Align H616 timing-data and capability names  (suggested by Miquel)
  - Add Cc: stable to all three patches  (suggested by Miquel)

---
James Hilliard (3):
      mtd: rawnand: sunxi: group controller delay tables
      mtd: rawnand: sunxi: describe tADL and tWHR delays
      mtd: rawnand: sunxi: fix H6/H616 controller timings

 drivers/mtd/nand/raw/sunxi_nand.c | 119 +++++++++++++++++++++++++++-----------
 1 file changed, 86 insertions(+), 33 deletions(-)
---
base-commit: 6f5156d7a31a8c3b0f34af4675c9299c8f877cbe
change-id: 20260717-submit-sunxi-nand-h6-h616-timings-794a2994267d

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

