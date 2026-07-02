Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FF739890A
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 21:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783028880; cv=none; b=dd7GH3sBROaotSvPZO8FXWkVDGX5dSmCcPgIdyXa+vqR2Lq1HizfeMiXpo+wCb2Cnd0ouP8XE3yuKAf5xsGHspfHRHtm9pMg5cZk1EJHOehV/Hs4NRMyrJ+T1PdwFggVV4fHIfLuLcaj75+UQCrSwckNhfNKtDXKV81Jiws7QcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783028880; c=relaxed/simple;
	bh=OyxQNflj8nYngatuVMplYZtDtpx74K4BynyzlTtiD3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uZLdfSVhPfNQ/Nbx9Eyv414Zgg4uYYHQkb7D+j9mwoDjXlU0xjOtuMx1kvggSuzTpVrQ4dvBIpXelIVJa3A8yIY/8cbWbQ6Tu56RoMyM4x4HDaAtjWwvgqEzQY/y6ndyAVgyLjt881augvQFFf0FOQfienX8ghIrb6unZn2Nfio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6gR6Xe6; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6gR6Xe6"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-664d530fcfdso2891609d50.2
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 14:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028878; x=1783633678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18nIAbqKxzsmmO3drAP1NepHg/ALBFCMR+9YkWtnWsM=;
        b=c6gR6Xe6keWIVkALhsx7CTLZXQ5lYhSxD0UWddUP7LcrC36TlHJS7CQkTq7z5HccGL
         mS0GMi3M4n9v41+e78gNZ1HHSqMiP6Y+Z+SRAW5TCBoelTKqQHCLsWzBCU8ZSkPYbzuf
         7bN1RDNBVpCPXLxlEf+LCigffgETiujeGUkIxiI+yfaCp4zTNkMT5NPOV03rRrGy6Puw
         eM74MKQYMw/HNcchn7H8wM/R++jbuW9CMpenBJNtS82eYeDXHw00Yx+k6xOBG7u0stCo
         7yfIIhR0ME8EffqB4ArdazONLg1h8lF4OtrgEqApfe6ulTX1FXo29o/40IGvOCe3UMEd
         zoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028878; x=1783633678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18nIAbqKxzsmmO3drAP1NepHg/ALBFCMR+9YkWtnWsM=;
        b=Jfiosak1tHOSPjoDhnGqtre1KW+DBZvg30TYGXWzRA+QMg/Wg+dRRqHblq2SCeNaPf
         ZggmgAoQQ7bAzsKcFx4koZ5Xbq1DziTe2zTwQaU09MkiBEHsXwoXwJoyagO6UbiwhESk
         MtCF06VA+fECVvXa9MnnlJiL1w9iur4qQARSigvp1XdnKNzQVSYneSJu2e4F8WthQRWW
         KhRPXHwq0v16ZJ3EmWyhlGtiHr8BYgdozh5GvgRFg71u7SrtYGngkd/GlBsqyC21kSql
         GAhLeozfeGKscFqNr2mQSm4Q1/W48OCO+bhTICGV9zwWzgr7XzVsxRaobR77npaKu0QQ
         dqpA==
X-Forwarded-Encrypted: i=1; AHgh+RreToEP9zDKZDuMeY8VTC0llCykNpA5oJcvSvcvQXFADdzaX7B5eFdJYnwMd7rBYvXCf4HUr9l6vyi4Kw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwM7QcuNKeih7GTi6tqSurM6s+oU7eesyLP+oxMf5Ef5zvFodHU
	/y0tyrFx0TLb1yWZ4MtNHeNSuU5plbipgCf7cHB9jjhtBJHHfOpMYXa7
X-Gm-Gg: AfdE7cmBx8xX0ItMUfV1YgQSnlRNDlPrhZMIFq72eeA9EE0n1PWCgoEYN2LqPXz4iBH
	u6W7PvAtA/LWGLa3HzOY1xjPhjFuXmKTyV8GcuHrQ/NoGK8vGpggJhSvZ0P+Pjxylv7CK6qVr3Q
	7jAY/jtQ5vMV3k2FubMETDm85GmIKMEY3rrzO9g+Jx7NzgD07de5UiIvjE6Nh77dy1UguSpk17r
	UI120IJ3nAYpOAy8ODKsIqoQLme0ovnIkOWsaJaF3zZF2AkpOFQQfmeFnPHWYDoSzHmH24qLlrs
	nm5gaV6zCjSWKuwLG/PZXoEy43dIV5PlpVEj3c4ZAA6Zon4L1JXhIFwyj3iUxLMMJ/zv9NZVpGd
	G7Kld/aQaqOMmYNzxvBerj/F0Dib1SS7/tGxIwWHsr643FdrNcQa0iS028CmG8tYffmULm5WfaS
	BADs2uRVDVExN9bZiBqdKaExY+hIVYOwaHEw2ntkHpFzCEI6I=
X-Received: by 2002:a53:d018:0:b0:664:f107:6cfc with SMTP id 956f58d0204a3-66521a8b7ecmr6972277d50.36.1783028877506;
        Thu, 02 Jul 2026 14:47:57 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:47:57 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Thu,  2 Jul 2026 17:47:46 -0400
Message-ID: <20260702214750.3428694-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the CIR receiver found in the Allwinner
A523/T527/H728 family (sun55i). The only board in this family that I
am in possession of that has the IR receiver is the x96qpro+, so it is
just enabled for that board. The Avaota A1 may have it, but I don't have
hardware to test, so it's just enabled on the x96qpro+ for now, but
left in the a523 DTSI for future use.

The sun55i family carries a newer revision of the sunxi CIR IP that is
not backwards-compatible with the prior hardware. So a new pulse
capture mode field in the control register resets to 0 by default,
which captures nothing, and the sample clock divider became selectable
instead of the fixed module clock / 64.

Solve this by adding the two new registers, enabling the setting of the
pulse capture mode register and the selection of the clock speed.

The new compatible is therefore added standalone, without the
usual sun6i-a31-ir fallback (it won't work).

Tested on an X96Q Pro+ (H728) TV box with the Google TV remote that
came in the box (using NEC keymap). Was able to press buttons and
get readings from lirc / ir-keytable.

The series is based on tag v7.2-rc1 on mainline.

Justin Suess (4):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  media: rc: sunxi-cir: add support for the A523
  arm64: dts: allwinner: a523: add IR receiver node
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 19 +++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  4 +
 drivers/media/rc/sunxi-cir.c                  | 76 +++++++++++++++----
 4 files changed, 87 insertions(+), 13 deletions(-)

-- 
2.54.0

