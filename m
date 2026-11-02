Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639012;
	b=pbOBem01SCYrzlTGhe3iX0VbqaBfODpRACBLDqiUxdn2eoDH66sklNXnGPhGmQKkAWQV
	 kgISwJfJI6ryTxHyZeY5PL9k6rv3GZaPB3giPR4/NS2NiTh67jt18IoJs8gjH+qlUSxTR
	 5EO2Ct96u2wTgTwcEXYj7PUU9+cvifayyB6m143BetiKu/Y7H0UW37UyXY3xB4DJK/3gT
	 4O4JCMINRZrFe8qrxXmbMkHMWiWM5yBAr6zZFvfy0OcKLHQz2T47ry6jO6fsAJkgTm+gZ
	 5olnp3KdwDsw8SyZzSxAFWb0rrNCMz5NAUULOqVnueqDoFHMBxRlPDBLYKtnRLWaQzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
	b=I3+qYIu895oEVK/WmIoPEiYiMDBIx435UFW6lpgk3W+I1+tdwjsb4bq6ubC1tJ/QxtKe
	 dnp98dY3BmTdj5d+i+3ERcaUGapDcTznwe7moRzc4Qg86IbxLFLZg9skgoQNJ4BOPMNZu
	 TokQJBlI6GJveeKp46/JccPcwP9cblFSd9soEbxNVjWvHpqyosaFsWpVX4aNtOjTjRnya
	 G4QuY38MoLzGlbyhNN3iIQmhGN/qXNZRaBDqdqT6WSVLCiZ/foFf14wDPbK2QoQ1w+RuR
	 Me1MKO/ZqHkn48wU4V8W05Q2TB7VCp2OrLdBWp7b7jJizarDGe8EJCTjF18GiBBoX1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AuMz+6kZ;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2B4607BDEA
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 17:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD2B4607BDEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AuMz+6kZ
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e4831c028so2890098f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 09:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639010; x=1794243810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
        b=AuMz+6kZt6Nf+EqDUIPuiKslI4znqLXhigvuaKxkb8u2kwH1LoUkWbPlsZvPgzeQJy
         QPDwUOB9m129XNyM/kMQgmJFrfoyGzlc+vW9Jk9G3x+OT4FOy4r7cgvl1h+2umoGA0Bs
         f8P3p4tAE0t4uzt/YYny4oEQ11UxNTCsURILzmMTSvnUsj4NgrMGsOqR4x7zloHLiIC1
         yJUdAgnZPo9vDyf+fbh/U7VoAMWkrl3Lyfe3d03XfBTnnCwNnI1nBR1vuoQfrmJn+i74
         s90wn3ETqxq/KzsbaSpsgClXpp5N1IMDL6kxg86ATGFv3bPi265kggbsmES94C8Ly4wE
         xMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639010; x=1794243810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpcL+5FZ6JwacURdTFeKF8QF98yJT0GN7XGRkPS3N44=;
        b=zGR32SMo2ZoSqFp5qGv0GUbnX6/jdm8HRGtiPTQp1Uqhh+FU+EuylC9PEVqqqVnQgi
         6GOKA/DpmisFEDu10qBEW/mKdzg9QnpR+tzWtLF5Rn8hfeGB67DmKX6lTenfVH/cZ5zp
         8YxSjOuDwOk7nGQGFDA0MBNMABvOGoXMMzDlWs32NWIqBR5bzVQyNlosAyIlfaocTd2H
         AO1bdSk17KfBjv3TuV7v7rWrF6cgFN+X/EALJE1m3wMNuQ0I6bin+Fo2gRYMW5/BWiYP
         BJk+nicYJFLvqrscQ3AT0jG8yTWQgbe3j37aIB+QpexCUwnsDnkbDL4blUK2xgGdPWJ6
         WCkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1fD/Sh+lFINPsue00oLbYYrzhg5E+Uflj1oChYhbMRDqCb2djltHBhkptRcJC1/4s1UQ8uNSqIkD6cA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+MrU1BjhUdF6MQXB9Y/oHdzB4+n9T2+RkhrxgN5VMq3t0FFu1O
	VMR00jX6oOU3bma526vTSaN8bRQ0IXAPJAyHgDhDBHOSce/e46NhNAC/
X-Gm-Gg: AYBFou24HKNyIqfJG0KP/D3KRUS3P2QT+kGwZ9rCw0ktX2vaJKdXFJia/ZOdRYXqfN7
	Di8WEATzne5Xis9hRIzgr4Cd/31ihI6Fd3d4ywuDU63gF6O6dz8k8xv2hrYUohshYmS5mmTHtKn
	0yQG1WFCiuxXNLys1579JubyiCN1OMHV2JgjcQbCvG3vSZOMCh3+hi5YGFrf4J9dTdkA4/iv6FF
	3k2h3pWr9J1K6Q6ljXyzlp3TRViUSY5KFSpMmudYpkeSWW+y/I8T5QINUI+EX0iC0znPBhMMvH+
	kK2VtdAv4XZky2bMme1rYcG8DIvZJts18pMD0NoYXpkYjjcZWGthy79vnme+24/3O3WxcGPMOnj
	FxUUSEaEZuhJPvGaJVfQ7+UotFYezT4QRoohcqrdTrodBYjMK0beFVyZtYIqFSiwdtcuBFvGe9j
	ahfBjvjlOg00XGZrsClDLQQbjlTQhgrcAUAe8N4AwBlsL/r1MkpXSQdFtxG1WB4/0ak7HJIDv5K
	eJ7z9cA4nBhN2jp+yF5o0LTFs3YsjrKGKMTGRQqgY0/NhsocuId2Hi7vnCqqNXYiKOpW0FMNEP2
	wL+bVdXZkBCS7hRWm6dgS+UDmGPbdyofwXq+RvcU7LUWipj/FElGZ1UHN7aeQOIKPFiu5Z9Eaho
	6sFgxxKPWEii3L71b1h5zFuzbuut8SPAgxMPI4DoOPP6+uwVh8+HHV6rNlV3GZ/grbhH23KgYcO
	6Esx4TVIBzQ5NNsQFTFk1Ni07aoZur6Lu0pEfsBSUfOSmj9HLc1CzA8EQ3pgXcwvhbFcUonVJKq
	Le7HEb5R8kdRJvlxwkE8b/9SqIOxbO+D5XeAC6i9xAWV8wE/Q==
X-Received: by 2002:a05:6000:4b08:b0:48e:7508:bc20 with SMTP id ffacd0b85a97d-48e7508be83mr18919618f8f.2.1793639009894;
        Mon, 02 Nov 2026 09:03:29 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:29 -0800 (PST)
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
Subject: [PATCH 08/10] staging: media: cedrus: vp8: use the vendor probability table size
Date: Mon,  2 Nov 2026 18:03:01 +0100
Message-ID: <20261102170303.1973892-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 969677a3bbf9..6b00efa77c22 100644
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

