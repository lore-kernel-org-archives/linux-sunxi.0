Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755144;
	b=BfqQGEjPl+mbF+AnYeLwMIqQnDKliLBw7+pxDuUUPVrLf7mnx7qgm+/kSkual2+htJJn
	 w6OaRvJ4yul2VctgCXnZUQnamlEUxUgRF6YhBGszhBgs3Wa0RtVb+gYTfudo6FgDBCFZQ
	 EJvzB8OU1qJ6vCAf8lXW8ZdAmeXik9cp3bv0rWJR9ArgxDVX0qG2IppFWqxwlEOXxH1wu
	 tlZQP61INHPeDsXPHM7u9oao9EUjhG23HHZXaE3XjdVbL5kC3dOA4CwpXzQN2GlPWFNwb
	 9t2pYjBqA9WvxGWs6lhqsQwBeFJLX95FxwfBI0PVmY/9bMFLTVjDwGOcXDz9GV4JA7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LNKJPtzHb1J7PqtXpGxzA28qSovY5i1QlYlXq6WtWl8=;
	b=Jel6nROwvaQvdOa+yJYbdtRTciGMHbWpFOAu457mVfZmPp/QdlvIG/7hG1hYFhaEwsf0
	 Clx8Xi4jSIoD6CezIAyaXrTdoF+6djG2zxHs1d2C0jKo+b4NhTF2K9wcKNtZNYqxPCO3c
	 L5cxu3kpnkrYOIGAGVUIIV3BesRvtH0i5/X2IwSAFWtGDuJslOjxqJ4XpICntGpmW5os6
	 qWH6a6Y8ldyJgXM1TU0zN/0Njm6KI58r7lDAfPt2TGUH9DGVYn5FlgeT81s8Xft8N4KAv
	 yRBi41cGD9cvKv/wdFhGWLHFqYH1HOG4jRg2dlRbxkArdwwVh0eeFN8oSz67BwDHwAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B6L9Sd51;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3457E606A31A
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 15:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3457E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B6L9Sd51
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so2883685e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794755142; x=1795359942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNKJPtzHb1J7PqtXpGxzA28qSovY5i1QlYlXq6WtWl8=;
        b=B6L9Sd51Hrd/ZlcUmLSVKUOTmf32Lq4gzp73POWxWzVpxYuxX0qKj4GYxUcX7Cr4/b
         DOlIJ+J0ttp3bX3KCAUIDqmT2C9DA5QulrDpCPhBYgpsag0THUc7CsiRHnUasnPWXAzX
         gaCaz8zIpT5SQO3EFAwJqRL25oSLI6p2OeJCwvZ2Co3yuRanOgo26Dyrs/S8rP0YB1NW
         cwSzk31EPTBJaqbQoSBTF4LmzO6gMKWULHn0EkJzkcjsySaVKT5KsSxSvGri4SyYeVVk
         qE/UPTF+5tAe9zOcip+JVdxgK48SWCY8wJ0t2EJbWGDaN+4y/Ee/ew0O+MUMwH43wbYx
         b18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794755142; x=1795359942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNKJPtzHb1J7PqtXpGxzA28qSovY5i1QlYlXq6WtWl8=;
        b=QRVC3maOc0WaFELzuX5c6NwMtnUvVR6MIa3h/71MYcvMmy68GmtkFSN2Ie8V7d/HaZ
         SrouXcbjeKK02BwwvuOC9RL1jgStCH9jMupSQNSzfSfDXBwX8PBZ8omZ/Z7jJ7L/LDqP
         I5r3g5On3AdxS05xuaXXZsywcrmBr/YO6ka5+UcqFHZ7r5qN2IYKLXEyKCpcDEl4f3Ko
         pvUR/skzIteZFrS0V7v0zMjZEZJO/vFs6bG24s95iJ7ww+knIGuTnHCJpwSbmFkEJuI7
         RbmVlX5YgbxQrCIiGqmf4T0eiglnUGAqL3gP+jf80V027JbL4f1hwkB5c4o/OJZ7b490
         5HZg==
X-Forwarded-Encrypted: i=1; AL+hErGzwBcFpaO1Rb5rz7APUPdvNFv0L9Y+YVw7K9a54uaQ9KTLovpzjfkGvMWu0vNGNI3gLbF764CfYV8zmQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8lDKYiMTgJNykL1Px6Vnu9NPGjOZjLdlqF0gFk8jO91N6HpYHr
	lnJ2ZUU27SXUEWcfpwT55uPg34Ce2Md3YxTLDoi39srvQE9Ap84yitVN
X-Gm-Gg: AYBFou0NrRZpRXODzApcM6Bu560ll7p96tHni62Vq/1GTCvHbOvNkCkHkbTKga4AmdP
	WG0Yi/V5YVb/kxerDbQpboLvhJfiJ3HHx2duGN2F1yazc3QOgCZJgIcFUg8DkrqxpdkRweEZfTi
	t8V9vglHvrXgZGjHx7NFTj5pv/uSTzRF8dVE+9JkOnKgHAko2fjEIGHS0RCIGNpLpPHR2im5bPn
	exObnLm20WANwY7MhaHcsN8vlvKMykenUYbA79YfIdN2SIisyAwdyncCEhKOyN2rJXDPAP1fitv
	fEWQOFT3xJzsa9AFIKJsjz6HNO8N8916AkwZgqEIHR+ROLIwJ3kTkOTE9aP8mO9foi3RIzUpXxm
	jo2I5lpIP9/3PyZ8G00qgple5d9BR0Fa7HAY9BKXwDAl+teaTqSwpinp/uFB2CQnRDroBCu5Cy+
	T5DNyqaYH437x+QItDmL0gGNONWhVPU1uaZlVHnU93Wqmh1rYK2g1nOfStByHF6A6MAN9hNvaMZ
	S3ukDkH5O37FX33uEbwsSe6JMBvrxWfezp37kms0g84T0iVWKcBAlv1sCViZ52k/xivxm4Ffo2e
	YAOaA1zX2DdKDPpHvoYN661PvBd83o2akrz//h14iTENGBgto3wa1ffRbk5uDTzovVcjz7rQKqD
	U2n7ram/pa8UZGLKoV5B2ns4pAusSSYzN/gXshy6ICmK9wEJOJSDVlBnJ+/JzsYpTeR2Kl6FWXc
	KLuAWe009H9e2w7FXLvj0T+KD6eivSSW59X6bptHND8ZRVL0t9kLyldFwgaWix6EHyh+xSUY7Uo
	8d9CsgLTtT9Klk=
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb55a5de41mr169387015e9.21.1794755142424;
        Sun, 15 Nov 2026 07:05:42 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e293540sm313567485e9.8.2026.11.15.07.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:05:41 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: yuzukihd-chameleon: Enable the GPU
Date: Sun, 15 Nov 2026 16:05:36 +0100
Message-ID: <20261115150536.16212-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The Mali GPU is supplied by DCDC1, like on other AXP313A based H618
boards. Enable it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
index eae56908b9b4..9e275f0217ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
@@ -68,6 +68,11 @@ &ehci3 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc1>;
+	status = "okay";
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

