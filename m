Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727342F8EB1
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Jul 2026 02:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206968; cv=none; b=miSPLMZPn6YE5E9O6T6iW2KqO2fixRgk15w1JdgF+w209IbL9kcryExCIt80TedpQb/dXjZpF/URt9J6CQJnVw33b+FEUHrh3LkaAvHO18EFkFjwemkrD4uxdMz+jOiGqe+HmqmNsxW/aeq8SpC1ljlHJSqNJ4tiomXZq4v6o6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206968; c=relaxed/simple;
	bh=eMDL6R7A88J0Kxgo7GwZVeOD6SjDV3c9R/PY3h9YVK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kD5UdxJIxausWbP2qYroUgzQ99TXpnLAv2d+zQ1lW+N1rrNx9C9W7T7DUF++m+5HRbgVCgxalSHveO9BMfujdI3BoPOCtYxwUTfEmnVw+KINABCmPF1qrzIaXlWSMWagDr+08w3BqJCyqrk0BUKfPXfu3qaWdEOI7qDlHhBwuKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhReW7PN; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhReW7PN"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81eff3ddba4so43355687b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 19:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206966; x=1785811766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMrIwKP808Rw4T3v4dtu26EGLZbL2Ysq//n5nDtGcIw=;
        b=OhReW7PNF+rYbeflaV1RYrW9OA1M3fS/w8TW8BJ5vCIJWnmdw5URFwLsAFWX4puUPF
         6tng3vz+6xMVJMWHKybXeZAixcdxsQMro0KgNqIkXQ9/0xJdbt9Bq1teSPIvgu8RECM7
         4VUhAyDWADeXidupwqBXt+aQ3G9tv7QT1rkI1eVrFy0lEYDReiud3t0d7lLKcPm6/1fB
         VPtZxyEmyJlKjnB2REnll1C9HokkvDdU+kMt+OvE+KjmPkz8bxVJUe7yKIQO+GMI9fjr
         OnYqeDOfu30Oq28uXY4FysR897IB9DCzXKJFHgN5yv4FWFJVd+QQ5p5v0wQB/RVOARVh
         +C8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206966; x=1785811766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMrIwKP808Rw4T3v4dtu26EGLZbL2Ysq//n5nDtGcIw=;
        b=RWpYuu3P5sbNX8GhCiGe0E2EfZ/ZaRs3+vWPLWOuLW2tvC0BUJqPWOql7qEoogx1MG
         Xq22LhBsEMQ+wDmw0F9qJytQrEbj8aZ7NGHNQJpipplAVwZq6cAqNTspNa4OGoKHeNIa
         ILsq5LG9CcqL+1AXrhl08NQuvZS3q9j7QCNan+zB71OHzWfBryhqXE1CAY8osrKBzHqI
         /ftyiUQ6p+0IXzgz25K1mEO3PcZQJ9hs4VdH9JVbFSuSioPVbRHcH6SIOSS3/Dq5DkXf
         5SrCAySUZMDywvanvmxihn3bY992+X7NdWE/z65pc9FKhNPrh6er8OPs5s+XrB6+9lnO
         weKw==
X-Forwarded-Encrypted: i=1; AHgh+Roc2TdvnOF98aZeLoQImgfp7w5ow/4kozpMrNMpz/cEkTu0OAvXAcEnPZFVDFRXhyhkAtjJOqrw1dGppQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQPT+9sjDKKwwXzOhNLOPMGP7VCjoCyVmzFy0Lx7BNUIfa30J2
	K4X+RaWoaS/BOmDfukw6oyqFOXZFBGdrzk1rED7HCzqmcHom2tP2d6e/
X-Gm-Gg: AR+sD13rkQPYukAnodUuF9gDwuv0w11aMwbOQrFG0wOf0ry9FIPoC85EUxSTZk84wfL
	rRwfbZf+s7DmkqKcFA7A4IFoRlvoFQ21IE0nMKoI4zicy8GBud3vL1mj+EmA+6G4IldWmCSJsEm
	42RyiFLgfzn6DWdiML2pmw+tK2W0kSwg41r7MTURkR2OIcYAbY1ZZbb2fqlKUJwQew2oZjLuYBh
	StuUa7GR6ZJwsfnEnfTAa9cEzqGWpOxzWRLtzWNm1TgrVgXhvl5KVat1PJjA1NEIPIjXUw9aR89
	i0v6dub/NYuJcTfUTNOOzA0SvhrwyCrr24Foe2ampyP9dyAfc6XAyP+qGoIUsMrQwr27gabis0+
	FnqYszkSWVrVkRN29lp14pxrZVYh8IMWsgTMleVyGZFyIgRt4BNfrmWUJ5DX7QujZ3fOjjoQNyj
	gMB+KHbHTyK4eajqHLwJwj5JeZ7NxPn6PbwYDR
X-Received: by 2002:a05:690c:9b0c:b0:81e:695b:585c with SMTP id 00721157ae682-81f990e2287mr1923257b3.4.1785206966382;
        Mon, 27 Jul 2026 19:49:26 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:25 -0700 (PDT)
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
	Andre Przywara <andre.przywara@arm.com>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v4 4/4] arm64: dts: allwinner: a523: enable IR on the Avaota A1
Date: Mon, 27 Jul 2026 22:49:16 -0400
Message-ID: <20260728024916.993224-5-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andre Przywara <andre.przywara@arm.com>

The Avaota A1 board has an IR receiver chip on the PCB (next to the
Ethernet jacks), wired to the PI8 pin on the SoC.

Enable the CIR receiver in the main power domain.

Tested on the board with evtest and some random TV remote control.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
[justin: move the PI8 pinmux node into the dtsi patch]
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:

v4:
    - move the PI8 pinmux node into the dtsi patch (Chen-Yu)
    - add my Signed-off-by (Chen-Yu, Andre)

 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 474354fbfcec..994f1e4f0ce7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -100,6 +100,12 @@ &gpu {
 	status = "okay";
 };
 
+&ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir_rx_pin>;
+	status = "okay";
+};
+
 &ledc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ledc_ph_pin>;
-- 
2.54.0

