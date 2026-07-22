Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF2535C183
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 21:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754079; cv=none; b=eBUIYu6qqOmJS31kjysWOEF9KOPp/BPpC3C6feNupZj9zZyPuq0ssGX3jiPhWi6Pw9nxdRNUCbz+M75jEYeb/3rvb+Rxg/R4QNcc/AJNlzjMK8oRlzA4vPQjJ+Pq1oWd81et/JIQ4mSI0RiLpruoBqnO+QLvfWMiaizVhMBKYqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754079; c=relaxed/simple;
	bh=H7gc8EHhrE54TIGFPE01knw9jDcZnFRii3hzkCBNdj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k2B73kyYNxU4RZgcv9LNobDWB+evG9tsj73PIQnKIcfRWMjECpSGA+nRLzW+trA5VS4IIzfi5Xh3oe41qDTmQhWl7sGm1XUTTCJI3fU9P0wQdXsYJrlicVByU8ltB138B7c2X++JQ7iUUuWb6B1feZqf47tW8+j+luktoeXzTvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNap4FpH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNap4FpH"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso8568153f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784754076; x=1785358876; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xSx084TFnzGFnpguxyZxDPEBlEGv6khf3RChBzg4a7A=;
        b=fNap4FpHKY62j5aywzMipunGz/cU4tVTgbzbIUFM6dq0woK0JZlsLSk+lSNDaKnI0v
         N4EQ+mEGAE5q24GYrUpyJ//w8XtBZdKvDWyJym4Tor7UTb4bPgJ4XHQiqzlPwtCbnojK
         VetZ8XxZ9unqT7MxZNjtdA+GN92Zx3WBYWl7yr5yUD9qbowoibR0WmFSXwuRFQ3/oJNP
         2ltdCyRGmEblHIJSOROE8GReq6ZjWnBxVYl7RXQ4IKQkdQoQUW/NtbfC04jxNVXusAXl
         wNx5CgA1pvm8OF1fpdUQFBqOrzcuT4SuMsVo+bXsbVyKe9QRboHGcFaOLnBXnvM2aGBC
         62Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754076; x=1785358876;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSx084TFnzGFnpguxyZxDPEBlEGv6khf3RChBzg4a7A=;
        b=fm4ignkmyePwTYJigp15m8X063Lxov2p3/wxqCdac6el0Ja9R9lzbbBnO+pHy/ZoqY
         Y95ql5+z6xT63AjR0+DjSKpvxzVKBWabzTL1vuCNDsNN+MV0OiTMETDdB0bHy69uoTUW
         7Yr4ToEV9PbVpm38bnJModzKv+UYLmzqsOAzWcKFFVG9pCEp7GzW/RORe8myBB8kCFG8
         REhiXGKODBU1vdrjFJ0TJLocnqqb3vyPaP6KJsC//b80hOtDa7vL9zpH/UFmVaFJwcyt
         jsrDwhmNorJ+EztHCCrCNFsnLEmgIMgP4goIUA2WMWmG5pf+181BfJ4c4EbKVulvp5CF
         rGRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDqJO9H+SGghjF1+cB2lJxKZAYCtvU47DrJSrmXl39Hd5cl0RcdJLspbDyi8nUZbjUgQHfn397Maghfg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzgk5reFNWdzlnXgFvnIpA36sHuKfSedhgyBwo08+K6LG3vL9xQ
	FkiEsvomqdBPsGMS+VIvMZuBBN+dR9jonU+WwzyDpos5cGSdriWdO5kZ
X-Gm-Gg: AR+sD128c3P/VTgSXNpiO7eepOvgGUZjC0YRP6bS4AkZRGHYWR2x7kn7G2xbhlhOg7C
	6kTMJ7txxMv4/6eNBw3Y9RZu+ZDTV7FsSSq3OZ+78xkzCy5c0qEmpXwtoF+N2VU49t5W7mGX6x6
	mK+GpfFCO7dgA9FnNzCMenkYwJupkDGWvVbQ1rotCsv3k0D7Fro6CMs0pHL5pnrVKpG3n3s1E2/
	XCbXh4RZU8Fge9aAGbcy91X8W8xe4gRoHR/b+XAbYwJ1xmvsmvMPFffwh/C5J2pRU/2tiZvQU1Z
	eePo2MtEXNzD/ePTwnVRY26Y0m7OdsnaipdxN6uEkCRyb2whzPPnQMqwSHcGp42FtCIoifCxiE1
	H6vZq7/5/nrGfm6jVrLCrNjtOI2pKi1mRv+xnzHTqmAsRYFTJKq+gMRcFisPjhtJwkQuLCbjXaa
	sLlOovnOZRf5/KxEY1o8PAvnOm
X-Received: by 2002:a05:6000:4282:b0:462:ce05:c5e4 with SMTP id ffacd0b85a97d-47f8d755525mr573989f8f.37.1784754075574;
        Wed, 22 Jul 2026 14:01:15 -0700 (PDT)
Received: from coolemuke.fritz.box ([2a00:6020:b320:1a00:c256:1463:a40b:d8c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm8610812f8f.29.2026.07.22.14.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:01:15 -0700 (PDT)
From: "=?UTF-8?q?S=C3=B6ren=20Hantel?=" <fugininsane@gmail.com>
X-Google-Original-From: =?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>
To: linux-pm@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Rossak <embed3d@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?S=C3=B6ren=20Hantel?= <fugininsane@googlemail.com>,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH v2 1/3] dt-bindings: thermal: sun8i: Add binding for the A80 THS controller
Date: Wed, 22 Jul 2026 23:00:44 +0200
Message-ID: <20260722210046.2932498-2-fugininsane@googlemail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722210046.2932498-1-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
 <20260722210046.2932498-1-fugininsane@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Allwinner A80 has a thermal sensor with four channels which shares
its MMIO block, bus gate, module clock and reset line with the GPADC.
Register-wise it is an early version of the THS found in the A83T and
later SoCs, with the THS registers starting at offset 0x40 of the
shared block.

Add the compatible to the sun8i THS binding. The A80 takes a bus and a
module clock plus a reset line, so the existing conditionals already
describe it correctly.

Co-authored-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Sören Hantel <fugininsane@googlemail.com>
---
 .../devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 3e61689..718c44d 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -18,6 +18,7 @@ properties:
       - allwinner,sun8i-a83t-ths
       - allwinner,sun8i-h3-ths
       - allwinner,sun8i-r40-ths
+      - allwinner,sun9i-a80-ths
       - allwinner,sun20i-d1-ths
       - allwinner,sun50i-a64-ths
       - allwinner,sun50i-a100-ths
-- 
2.43.0

