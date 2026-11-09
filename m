Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246678;
	b=QFb22aYGtVEZ+w6gBp57UiIbAY8FKHmgIAtUi12W+Scaejymbz99YK1PGJks7oEMD5ti
	 w0MK5mCQuFA76I5sBwAqQp2b454ixQ4CWKN2p4GbP22vZOcpCcIfNOc75tjX9xgK8VKw3
	 D31G1AzYDEG64urLhRM/CuMNP/uTnFBHunOEs1pE/W121SN9sk2dNe+uZfK7FDrR+DypR
	 Nmw2LgLXiluEgH1yak701E6DS695TfVepfaXutk2G6okR7Gp8QVLcjOOLr48jRj/zomLo
	 8BlPpOib2NKH1RstdMYGJQvdSmLctOUmfkgJHQ2EfW7IqZ1qArD1OX6lHsR7VdmAi1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
	b=tY8VXC4JQT1Ooa6cBPiz2/mSUZobIX8SOm+2GaILtlgUekeMK/2uS9gKk44nMIwFtBNu
	 UgunFcx+9+Qofu6c5z9Q7QUYGS5NCd3Wk1sR7fYkQEVtMdTBiGGj3VPARUHzyhkQo68ID
	 whZHyb9p+SPo5rFb9u5ZoRKzE0iibsxcjk9yRZ73pWzhZzrTlWlqmkaI3eK1cqn08Gjwv
	 zoUAfv2AdjlrYuJQe+V4Nzwb/MzozsZ4oH8D87ANvqLbymEphNUJQvSyLEggZeWpAqY0N
	 YZ6UXxoxTrpaln9D1MGIlffP9M5evZR+ANBgVpzvg6By3ct7FCkseV74ULOXrkjc3PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XJi/MBXn";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77E860A5BE9
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 17:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A77E860A5BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJi/MBXn
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso609540f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246676; x=1794851476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
        b=XJi/MBXnGCe40GQl48RSrpO7F+Ao8+HVX7X8VYpD/kxJBcmUZXQjg8fts+tCZL4b38
         qj0kkC5SdPKkxI7QKbNJMGFPaWfglIZDp/oWZpe9hvN5iIz6dS4R24CBRw4xPm8F3Vev
         Wge1et6miKlDeSj/x2q6/qtcZY9HXwmxyeQ0mTvPd5rKALTPb/JIVXJzAmUnz8YG7D8U
         hY7DcFMwqYr//BbyRz/wVjHfALn2ufWXbGCbjp5V31pF0lo+v+Q7b/5s+fFYDtKMH7vK
         WacitKxJLb6Kp34q+nYQUUnQ07TiCXopWrgo4z0w9G/s8VccolN337mp7+oJlHpjncKV
         gunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246676; x=1794851476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFzABPh/i3DTYACKwlsIa8uWdbyDlbj1NiTPGOeH3RM=;
        b=hPUZ9rUIul8AdP9M/s2qW3aMJjPy8HR6MBMnNMx9/G0unLifTG3DbEP6iNXI8SaefI
         +tzdx0X4V7Zp5IWHgsutDksptY+NFpyjVZ7Il1zKP1QFkYlePNyfQrxRbzdDnBsJEyd8
         sl1eHYc6S4+y6L29bxYol5jvzrln0ak1Jn509c6MTPryJGRrE40HLcv64LjscBoaxutX
         ExBHK1vleDiaEZtEmBWdGhTbTJ7ysZJuIMgMbQJ6YJ17lk8I1yjDmcfumiLcCKNISSWo
         6wtOFhMjxoKyMpXqn9qt6GGH3/GL5+xCqljY1l1tyLCoVzd+6Dp0h03Fb7muFKLU4qlY
         Bi7Q==
X-Forwarded-Encrypted: i=1; AL+hErGGNUbiOq8H/3ppAxpmDlxkn70+xZuO6AVPkwds/D8vqkd6kJJeSccXRr0KSAOzakRNdVBPCC5NIX+erQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8YxaakcYxgrNzrvpTQuUUWQf31U57A30HpgikHVEwAup0K1Miv
	ykD7s/YVjk3Twg+o/8SZVz/XjVpDw8CXd8ihK/aUW4Lh4kUaUSBy7xpGaDSkBA==
X-Gm-Gg: AYBFou19dpEI4TZaoW4eAI50YvmKY61JO6gpL0MZ/mOSjA5TMMvuq+ONn3ipU2c613l
	vJRbJ7iqD1dVUagJNwGLkNJU9J8WfO5JMb2hrTCZR4B086YRVhtP43XI+SruaqNxMPP5iXe+Wiu
	3z7fnNa76R0UGYp+ZcNYzvJVkRdRJD+ZSFXJEu3IcxIroepnp2W6FXJz5cvwpZNGdNCAGQFFid0
	ySHNoAOy1879dBlXM6d8g9BW0ZKG1lvTK9iQCYYUmHGChCD5DUb+gnmLlkE3Qyos7T3CUciaxVV
	tex3UGxpJAdwGdqaQgiluBDloiIwRxF1/qeJoyypeX424ThaS38/R6orvCOmbpmO7POxUpW2jLD
	4OhFPX1KaK+o2o4LJ8S9MLvlq5ebW3ru/Tk/oCJIoUbUntJt36fEyGOk/6d3KSRMhrqr1+kdx6e
	CX1O5vrD+Az6X+z4omBKGF6i2QgR2oxtePjcykEhgaMT/pzQ576XCUhbGwuqt7l30cklqf1RSNZ
	Syu3pcqLP+6Z2z2UVB8b6iJHrrqANNSnRQroOGwkjviDOOkeD/d3lm15QA6hu/mcdlufH1RxZgW
	wVy6yxRRus5pTjA9wekU1EhbCxBbewMZHyKJY4F9tWVq3EZFqy0EtTs85wKTCRBSiaJ4n7RsX5J
	JLoyl1r+CiCcRs3dCyYhaKpYKaDQfSqnpyZBZfxBmtwlUfUeVTpfrr5OU/KXK2EJ23RbEJKAU61
	yxJpcfxPhjgrk9FMSDSBbE6q7CQFEosVmF1VZqdZSYyTI14gZdWge0d5IkfXeYdcAa3qBzR0SEr
	eJ5OosvLEqbiR695zI3FbNytiop7U3deJ+e/qn5VF7Lqgh97IU=
X-Received: by 2002:a05:6000:29d9:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4982fd3e550mr237732f8f.26.1794246675934;
        Mon, 09 Nov 2026 09:51:15 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:15 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 08/11] staging: media: cedrus: vp8: use the vendor probability table size
Date: Mon,  9 Nov 2026 18:50:13 +0100
Message-ID: <20261109175016.42061-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver allocates the VP8 probability table with 0x2400 bytes, which
is the size the old Allwinner A10 library uses. All newer vendor
libraries allocate 0x5400 bytes and never write the area past 0x11b0
from the CPU. The hardware uses that area as scratch space, most likely
for the segment map, and its usage grows with the frame size: a
3840x2160 stream makes the hardware access memory past 0x2400 and
causes IOMMU page faults.

Allocate the table with 0x5400 bytes, like the vendor libraries do.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index fecca343bd92..84bf18fd231d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -25,7 +25,7 @@
 #include "cedrus_hw.h"
 #include "cedrus_regs.h"
 
-#define CEDRUS_ENTROPY_PROBS_SIZE 0x2400
+#define CEDRUS_ENTROPY_PROBS_SIZE 0x5400
 #define VP8_PROB_HALF 128
 #define QUANT_DELTA_COUNT 5
 
-- 
2.43.0

