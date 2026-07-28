Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A122F7F12
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Jul 2026 02:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206967; cv=none; b=HhINUYCWssVLDVCz99WDOX2oI7Q5E6HjsaCBg05eGptYQ0gi3Rwz1M7rOMaoVi015zaK70Ta6MgfiB0O1YSsLd0gu2Ek8e891GkUo+qnSX4lPS+4Ld4RZ0eYqqg2BAgOBVzWAg1O3VpGGubTuIc4TunqVoHAQw07P/aXxqsIRd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206967; c=relaxed/simple;
	bh=es+rJotQRwyypM61fneWNzwmRxWIGX4iJwW6Sl/cW/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bqpj8pWA00ZuXeVvXgtMRpyuUPfTybPdvyvdl2RcUxeLmjlpA4DCSn9LONE71cIiY8GzHvdlUJBEVdinxho4MzkQct9m4ZwzTCDpVLRVixKfeFcZvaZFumTvEdg3OlZWR9HXMacu62kmH1wO10WOKxfmND6kFBSBbPphE/yaXdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asHgmK/5; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asHgmK/5"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-80bb41f7f3cso32915317b3.2
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 19:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206965; x=1785811765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6eNcf+AhwmRS6BoOkHO52GkK3UKWVS1XZpDCOhvYRA=;
        b=asHgmK/5yv6O/Ef+YEgYkjzSxEzxWeHYAtiTspmi4ESYg4LX0G9PycMu5i2oG2exSV
         J18mJhX1XbzJ6d6L4LAw0tX3eXmkUvK/uSrWhZeWDLJltavQRAHyS/R9ANZXOdQ0ALfh
         UZEMTW4+gym/s6iV+GVbZcIpdprwpKTDKULI+SGTG21XFomLSKr99tVdRQZv4LNuXM1Z
         /x/9DrONLYMu7Ie0SPzuIgFSS3o0i3kyhBxkHYHSDPPXV/yAOp3as7SELMZe/kIqTE6q
         cRO3rhfDXxnA+zc5N5Rs6vvOIJCh/qh7ojUFJbIOiCA42RqG4JzDCC7niiO6bSdZ4KEZ
         XeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206965; x=1785811765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6eNcf+AhwmRS6BoOkHO52GkK3UKWVS1XZpDCOhvYRA=;
        b=hQgoaL4kPIweRTz/pASeONub8BY6IkEFA6ETDZ4sAywDt+tStcBRzg6xB/a8AzK5Vf
         yzo7jR0prJkfXCvyfUkMyNeNuUGNoT14aQ+rc+HNOwvSK0IBZkfryQ7oBXTJn8ehRqZk
         YLsg3ZYBjJDBL5X6mmFobNtntnUUk7usk233UjNyMObrq5qq1w+HXr4UteF3hi53bgJW
         tuVT9H69OoQiI++B3c+iWgaCqnFWtX+mP/7nkUryDqToeHDkjGHFLjkdI8Q4orZ+mBy3
         YYAYfA3xyWmXvpsT4jKMJ1jP3/LhtF2s+UqpOBVwvh4T3t4axKjiIhmETXVxSOV/7k7d
         f4JQ==
X-Forwarded-Encrypted: i=1; AHgh+RpunpxgU3Nx3DASqbVNksZepbG7etp73pKqlY9imGtIqB0NMT3ejRf1JtI94U0ugtE1L+1X0u1EFnNNQw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+JbEnfaIIz2/42rFaBetkdkqvj/ul0TON/DXhIHjQ0aqTg4Uu
	6TFKKdMdAZHd+dbO0jhETS+hXuIzA4vrA652Jj5f3dGwyvzm+4RqAI01
X-Gm-Gg: AR+sD12ITiyjvnHP+lnjBLsiUW5J8X6gPUkK+e4b4BNKe8lOSM55f72X/wBj4BOE7NE
	RXamjO3Emc2hu+/C+ZE/+ORjKf5tkzEt9tSJYvzBe0aV7LnwnKIXdzvpR7jHJ8J7p0UVIFVMJB4
	qoy6gg4q5Nuwmx0TfhuEdRX1jxDejg/grmWG5BqgODH7QyoMiFtb+ZlsjtWBYR7dubHfOZZDaWF
	r8Jwoge+0EQqis9U9Kvdv15LJ0thJGQXtgCU476kM3+dpc8s7J+Swzbs4+YbBH5F2eFbRXWWrWr
	e9x911DwwFjjc2nSlDXGVW7Nj4iQ20tSslmtNvzRzkTLHDrwYouqC2ru8Z5WoJSInyyoDE+2ATO
	kM9Dq3cr58YPvjqZ5SRHoSAiGcgn48jp0zRWlVQis0xkYXbYurA1TcLp4XSS3AiOx4Dj4OgLiRW
	uLHTbgb3/3cZKTgxVaGehhA/Ur/juGrJilkiDq
X-Received: by 2002:a05:690c:4d84:b0:81e:d23b:f8d1 with SMTP id 00721157ae682-81f99368d13mr1674717b3.35.1785206964798;
        Mon, 27 Jul 2026 19:49:24 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:24 -0700 (PDT)
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
	Justin Suess <utilityemal77@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v4 3/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Mon, 27 Jul 2026 22:49:15 -0400
Message-ID: <20260728024916.993224-4-utilityemal77@gmail.com>
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

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver in the RTC power domain and mux its RX
signal to PL11.

Tested on an X96Q Pro+ with ir-keytable and nec keybindings with
the remote that it came with in the box.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..1eaee20acaab 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,12 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_ir_rx_pin>;
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0

